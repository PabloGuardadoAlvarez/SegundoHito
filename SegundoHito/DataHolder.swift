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
    
    var Coches :[Coches] = []
    var firestoreDB:Firestore?
    var firStorage:Storage?
    var miPerfil:Perfiles = Perfiles()
    
    func initFirebase(){
        FirebaseApp.configure()
        firestoreDB=Firestore.firestore()
        firStorage = Storage.storage()
    }
}


