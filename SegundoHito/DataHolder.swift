//
//  DataHolder.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 10/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage


class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder = DataHolder()
    
    
    

    var firestoreDB:Firestore?
    var firStorage:Storage?
    var miPerfil:Perfiles = Perfiles()
    var arCoches:[Coches] = []

    
    func initFirebase(){
        FirebaseApp.configure()
        firestoreDB=Firestore.firestore()
        firStorage = Storage.storage()
    }
    
    func DescargarCoches(delegate:DataHolderDelegate){
        var blFin:Bool = false
        DataHolder.sharedInstance.firestoreDB?.collection("Coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                blFin = false
                delegate.DHDdescargaCiudadesComplete!(blFin: blFin)
            } else {
                self.arCoches = []
                for document in querySnapshot!.documents {
                    
                    let c:Coches = Coches()
                    c.sID = document.documentID
                    c.setMap(valores: document.data())
                    self.arCoches.append(c)
                    print("\(document.documentID) => \(document.data())")
                    
                    
                }
                print("---------->",self.arCoches.count)
                blFin = true
                delegate.DHDdescargaCiudadesComplete!(blFin: blFin)
                
            }
            
        }
        
    }
    

}



@objc protocol DataHolderDelegate{
    
    @objc optional func DHDdescargaCiudadesComplete(blFin:Bool)
}


