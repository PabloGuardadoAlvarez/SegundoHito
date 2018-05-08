//
//  MapaViewController.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 19/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase

class MapaViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,DataHolderDelegate {
    
    @IBOutlet var mimapa:MKMapView?

    var locationManager:CLLocationManager?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
           self.agregarpin(titulo: "Prueba", latitude: 42, logitud: -3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let miSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        
        let tempRegion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: miSpan)
        mimapa?.setRegion(tempRegion, animated: true)
        
    }
    
    func agregarpin(titulo:String, latitude lat:Double , logitud lon:Double){
        let miannotation:MKPointAnnotation = MKPointAnnotation()
        miannotation.coordinate.latitude = lat
        miannotation.coordinate.longitude = lon
        
        miannotation.title = titulo
        
        mimapa?.addAnnotation(miannotation)
    }
        
    
}


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


