//
//  ViewController.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 10/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController, DataHolderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var lbloginuser:UITextField?
    @IBOutlet var lbloginpass:UITextField?
    
    @IBOutlet var btnlogin:UIButton?
    
   @IBOutlet var btnregis:UIButton?
    
    @IBAction func accionlogin(){
        
       DataHolder.sharedInstance.DescargarLogin(delegate: self, lbloginuser: lbloginuser?.text, lbloginpass: lbloginpass?.text)
       print("El boton funciona")
    
    
}
    
    func DHDdescargarLogin(blFin: Bool) {
        if blFin{
        self.performSegue(withIdentifier: "trlogin", sender:self)
            print("el otro boton funciona")
    
    }
    }
    
    

}

