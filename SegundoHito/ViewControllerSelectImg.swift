//
//  ViewControllerSelectImg.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 9/5/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewControllerSelectImg: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, DataHolderDelegate  {
    
    @IBOutlet var ImgView:UIImageView?
    let imagePicker = UIImagePickerController()
    var ImgData:Data?
    
    @IBOutlet var btnCancelar:UIButton?
    
    
    @IBAction func btnImgGaleria(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func btnImgCamara(){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func BtnSubir(){
            
            let  tiempoMilis:Int = Int(Date().timeIntervalSince1970*1000.0.rounded())
            
            let ruta:String = String(format: "CochesUsuario//Imagen%d.jpg",tiempoMilis)
            
            let ImageRef = DataHolder.sharedInstance.StorageRef?.child(ruta)
            
            let metadata = StorageMetadata()
            
            metadata.contentType = "image/jpeg"
            
            let uploadTask = ImageRef?.putData(ImgData!,metadata:nil){ (metadata,error)
                in
                guard let metadata = metadata else{
                    return
                }
                let downloadURL = metadata.downloadURL
            }
        
        
            
        }
        
      
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        ImgView?.image = img
        self.dismiss(animated: true, completion: nil)
        ImgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
