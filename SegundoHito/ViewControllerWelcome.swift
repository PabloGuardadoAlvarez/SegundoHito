//
//  ViewControllerWelcome.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 10/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewControllerWelcome: UIViewController,DataHolderDelegate {
    
    @IBOutlet var lbnombre:UILabel?
    @IBOutlet var lbaux:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        lbnombre?.text = String(format: "Hola %@",DataHolder.sharedInstance.miPerfil.sNombre!)
        print(DataHolder.sharedInstance.miPerfil.sCoche)
        lbaux?.text = String(format: "tu coche favorito es %@", DataHolder.sharedInstance.miPerfil.sCoche!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
