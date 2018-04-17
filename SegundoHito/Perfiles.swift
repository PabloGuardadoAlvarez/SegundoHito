//
//  Perfiles.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 17/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class Perfiles: NSObject {
    
    
    var sNombre:String?
    var sCoche:String?
    
    
    func SetMap(valores:[String:Any]){
        sNombre=valores["Nombre"] as? String
        sCoche=valores["Coche"] as? String
        
    }
    
    func getMap() -> [String:Any]{
        
        var mapTemp:[String:Any] = [:]
        
        mapTemp["Nombre"] = sNombre as Any
        mapTemp["Coche"] = sCoche as Any
        
        return mapTemp
    }

}

