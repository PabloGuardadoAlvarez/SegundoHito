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
    var HMImg:[String:UIImage] = [:]
    var StorageRef:StorageReference?
    
    
    func initFirebase(){
        FirebaseApp.configure()
        firestoreDB=Firestore.firestore()
        firStorage = Storage.storage()
        StorageRef = firStorage?.reference()
        
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
    
    func DescargarPerfiles(delegate:DataHolderDelegate,regisemail:String?,regispass:String?,regisuser:String?,regiscoche:String?){
        
        Auth.auth().createUser(withEmail: (regisemail)!, password: (regispass)!){
            (user, error) in
            
            if (user != nil){
                
                DataHolder.sharedInstance.miPerfil.sNombre=regisuser
                DataHolder.sharedInstance.miPerfil.sCoche=regiscoche
                DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap()) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        delegate.DHDdescargaPerfiles!(blFin: true)
                        print("Document added with ID: ")
                    }
                }
            }
            else{
                print(error!)
            }
        }
            }
    
    
    
    
    func DescargarLogin(delegate:DataHolderDelegate,lbloginuser:String?,lbloginpass:String?){
        
        Auth.auth().signIn(withEmail:(lbloginuser)!, password:(lbloginpass)!) { (user, error) in
            
            if user != nil {
                
                let refPerfil =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                refPerfil?.getDocument{ (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.SetMap(valores:(document?.data())!)
                        delegate.DHDdescargarLogin!(blFin: true)
                        
                        
                    }
                    else{
                        print(error!)
                    }
                }
                
            }else{
                
                print(error!)
            }
        }
        
    }
    
    
    


    
    
    }


@objc protocol DataHolderDelegate{
    
    @objc optional func DHDdescargaCiudadesComplete(blFin:Bool)
    @objc optional func DHDdescargaPerfiles(blFin:Bool)
    @objc optional func DHDdescargarLogin(blFin:Bool)

}
