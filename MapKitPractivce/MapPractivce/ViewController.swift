//
//  ViewController.swift
//  MapPractivce
//
//  Created by Mobarak on 10/26/21.
//
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController {

  private  let mapView : MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    var previousLocation: CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.delegate = self
        
        title = "Home"
        LocationManager.shared.getUserLocation{[weak self]location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                strongSelf.previousLocation = location
                strongSelf.addMapPin(with: location)
                
            }
            
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds

    }
    
    func addMapPin(with location:CLLocation) {
        
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        self.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)) ,animated: true)
        
        self.mapView.addAnnotation(pin)
        
        LocationManager.shared.resolveLocationName(with: location,completion: {[weak self] locationName in
            self?.title = locationName
            
        })
    }
}

extension ViewController : MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = LocationManager.shared.getLocationFromMap(with: mapView)
        
        print(center)
        
        guard (previousLocation != nil), center.distance(from: previousLocation!)>50 else {
            return
        }
        addMapPin(with: center)
        
    }
}
