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

class ViewController: UIViewController {

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
        
        Auth.auth().signIn(withEmail:(lbloginuser?.text)!, password:(lbloginpass?.text)!) { (user, error) in
            
            if user != nil {
                
                let refPerfil =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                refPerfil?.getDocument{ (document, error) in
                if document != nil {
                    print(document?.data())
                    self.performSegue(withIdentifier: "trlogin", sender:self)
                    
                }
                else{
                    print(error!)
                }
            }
            
        }
    }
        
    
        
}

}

