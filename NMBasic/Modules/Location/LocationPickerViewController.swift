//
//  LocationPickerViewCntroller.swift
//  Q8ForSale
//
//  Created by Nahla Mortada on 11/10/16.
//  Copyright © 2016 Technivance. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import MapKit


public typealias LocationPickerClosureType = (_ cllocation: CLLocation?, _ region:MKCoordinateRegion?, _ locationString: String) -> Void

open class LocationPickerViewController: BasicUIViewController, MKMapViewDelegate {
    
    //"choose-location-hint"
    
    open var location: CLLocation?
    
    @IBOutlet weak private var locationNameLabel: NMTintedUILabel!
    @IBOutlet weak private var locationHintLabel: NMTintedUILabel!
    @IBOutlet weak private var mapView: MKMapView!
    @IBOutlet weak private var currentLocationButton: TintedUIButton!
    
    private(set) open var region:MKCoordinateRegion?
    private(set) open var locationString: String = ""
    
    open var updateBlock: LocationPickerClosureType?
    
    
    open class func getStoryboard() -> UIStoryboard {
        let bundle = Bundle.init(for: LocationPickerViewController.classForCoder())
        let storyboard = UIStoryboard(name: "LocationPicker", bundle: bundle)
        return storyboard
    }
    
    open class func show(location: CLLocation? , navigation: UINavigationController?, updateBlock: LocationPickerClosureType?)    {
        
        let storyboard = getStoryboard()
        if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
            if let controller = navigationController.viewControllers[0] as? LocationPickerViewController    {
                controller.location = location
                controller.updateBlock = updateBlock
                navigation?.pushViewController(controller, animated: true)
            }
        }
    }
    
    
    open class func showModally(location: CLLocation? , navigation: UINavigationController?, updateBlock: LocationPickerClosureType?)    {
        
        let storyboard = getStoryboard()
        if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
            if let controller = navigationController.viewControllers[0] as? LocationPickerViewController    {
                controller.location = location
                controller.updateBlock = updateBlock
                navigation?.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    
    open class func showModally(navigation: UINavigationController?, updateBlock: LocationPickerClosureType?)    {
        showModally(location: nil, navigation: navigation, updateBlock: updateBlock)
    }
    
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setInitalUIStrings()
        let panRec = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap))
        panRec.delegate = self
        self.mapView?.addGestureRecognizer(panRec)
        
        if self.location == nil {
            self.location = BasicLocationManager.sharedInstance.location
            self.region = BasicLocationManager.sharedInstance.region
            self.locationString = BasicLocationManager.sharedInstance.locationString
            BasicLocationManager.sharedInstance.updateBlock = {(status , cllocation) in
                self.location = cllocation
                if cllocation != nil {
                    self.mapView?.centerCoordinate = cllocation!.coordinate
                    self.region = MKCoordinateRegionMakeWithDistance(cllocation!.coordinate, 200, 200)
                    self.manageMapView()
                }
                
                self.setLocation()
                self.setLocationString()
            }
        }else {
            self.setLocation()
        }
        
        self.manageMapView()
    }
    
    @objc private func manageMapView()   {
        
        self.locationNameLabel.text = "\(String.localized(key: NMBasicManager.Strings.Location.LocationStringPrefix))\(locationString)"
        if let region = self.region   {
            self.mapView.setRegion(region, animated: true)
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @objc func didDragMap(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            locationChanged()
        }
        else if gestureRecognizer.state == .began {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.manageMapView), object: nil)
        }
    }
    
    
    private func locationChanged(newLocation: CLLocation? = nil)  {
        
        if let  center = mapView?.centerCoordinate  {
            if newLocation == nil {
                location = CLLocation(latitude: center.latitude, longitude: center.longitude)
            }else {
                self.location = newLocation
            }
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            self.region = MKCoordinateRegion(center: self.location!.coordinate, span: span)
            location?.reverseGeocodeLocation(handler: { (address) in
                if address != nil {
                    self.locationString = address!
                }
                self.locationNameLabel.text = "\(String.localized(key: NMBasicManager.Strings.Location.LocationStringPrefix))\(self.locationString)"
            })
        }
    }
    
    
    private func setLocationString()    {
        self.location?.reverseGeocodeLocation(handler: { (address) in
            if address != nil {
                self.locationString = address!
            }
            self.locationNameLabel.text = "\(String.localized(key: NMBasicManager.Strings.Location.LocationStringPrefix))\(self.locationString)"
        })
    }
    
    private func setLocation()  {
        if self.location != nil  {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            self.region = MKCoordinateRegion(center: self.location!.coordinate, span: span)
            self.location?.reverseGeocodeLocation(handler: { (address) in
                if address != nil {
                    self.locationString = address!
                }
            })
            BasicLocationManager.getAdress(cllocation: location!, completion: { (result) in
                print(result)
                if let city = result["City"] as? String {
                    print(city)
                }
            })
        }
    }
    
    @IBAction open func goToCurrentLocation(_ sender: AnyObject) {
        
        locationChanged(newLocation: self.mapView.userLocation.location)
    }
    
    
    @IBAction open func done(_ sender: AnyObject) {
        
        updateBlock?(location, region, locationString)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction open func cancel(_ sender: AnyObject) {
        if self.navigationController?.popViewController(animated: true) == nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override open func setInitalUIStrings() {
        super.setInitalUIStrings()
        self.title = String.localized(key: NMBasicManager.Strings.Location.LocationPickerTitle)
        self.locationHintLabel?.text = String.localized(key: NMBasicManager.Strings.Location.LocationChooseHint)
    }
}
