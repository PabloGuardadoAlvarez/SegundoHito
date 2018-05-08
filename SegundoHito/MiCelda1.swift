//
//  MiCelda1.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 24/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell {
    
    @IBOutlet var lblCelda1:UILabel?
    
    @IBOutlet var imgCelda1:UIImageView?
    
    var ImagenDescargada:UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func descargarImagenes(uri:String){
        self.imgCelda1?.image = nil
        
        //if ImagenDescargada == nil{
        
        let Imgdes = DataHolder.sharedInstance.HMImg[uri]
        
        if(Imgdes != nil){
            
            self.ImagenDescargada = Imgdes
            self.imgCelda1?.image = self.ImagenDescargada
            
            
        }else{
            
            
            
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    
                } else {
                    
                    self.ImagenDescargada = UIImage(data: data!)
                    self.imgCelda1?.image = self.ImagenDescargada
                }
                
                DataHolder.sharedInstance.HMImg[uri] = self.imgCelda1?.image
                
            }
            
        }
            
        
    }
    

}
