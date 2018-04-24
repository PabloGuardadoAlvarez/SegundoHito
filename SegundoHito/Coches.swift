//
//  Coches.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 24/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class Coches: NSObject {
    
    let IDmarca = "marca"
    let IDmodelo = "modelo"
    let IDaño = "año"
    let IDfoto = "foto"
    let IDlat = "lat"
    let IDlon = "lon"
    
    var sID:String?
    var saño:String?
    var smarca:String?
    var smodelo:String?
    var sfoto:String?
    var slat:Int?
    var slon:Int?
    
    func setMap (valores:[String:Any]){
        saño = valores[IDaño] as? String
        smarca = valores[IDmarca] as? String
        smodelo = valores[IDmodelo] as? String
        sfoto = valores[IDfoto] as? String
        slat = valores[IDlat]as? Int
        slon = valores[IDlon]as? Int
        
    }
    
    func getMap () ->[String:Any]{
        return
            [
                IDmarca:smarca as Any,
                IDmodelo:smodelo as Any,
                IDaño:saño as Any,
                IDfoto:sfoto as Any,
                IDlat:slat as Any,
                IDlon:slon as Any,
        
        ]
        
    }
}
