//
//  MiCelda2.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 7/5/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class MiCelda2: UICollectionViewCell{
   
    
    
    @IBOutlet var lblCelda2:UILabel?
    
    @IBOutlet var imgCelda2:UIImageView?
    
    var ImagenDescargada2:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
  
    func descargarImagenes(uri:String){
        
        self.imgCelda2?.image = nil
        
        let Imgdes = DataHolder.sharedInstance.HMImg[uri]
        
        if(Imgdes != nil){
            
            self.ImagenDescargada2 = Imgdes
            self.imgCelda2?.image = self.ImagenDescargada2
            
            
        }else{
        
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                
            } else {
                
                self.ImagenDescargada2 = UIImage(data: data!)
                self.imgCelda2?.image = self.ImagenDescargada2
            }
            // Create a reference to the file you want to download
            DataHolder.sharedInstance.HMImg[uri] = Imgdes
        }
        }
        //}
        
    }
    
}
