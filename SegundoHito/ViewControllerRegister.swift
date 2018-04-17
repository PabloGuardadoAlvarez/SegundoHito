//
//  ViewControllerRegister.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 10/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewControllerRegister: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var regisuser:UITextField?
    @IBOutlet var regispass:UITextField?
    @IBOutlet var regipassc:UITextField?
    @IBOutlet var regisemail:UITextField?
    @IBOutlet var regiscoche:UITextField?
    @IBOutlet var regiserror:UILabel?
    
    
    @IBOutlet var btnregiscancel:UIButton?
    
    @IBOutlet var btnregisregis:UIButton?
    
    @IBAction func accionRegistrar(){
        
        
        
        if (!((regisuser?.text?.isEmpty)! || (regisemail?.text?.isEmpty)! || (regispass?.text?.isEmpty)! || (regipassc?.text?.isEmpty)! || (regiscoche?.text?.isEmpty)! )){
            
            if (regispass?.text==regipassc?.text){
        
        Auth.auth().createUser(withEmail: (regisemail?.text)!, password: (regispass?.text)!){
            (user, error) in
            
            if (user != nil){
                
                DataHolder.sharedInstance.miPerfil.sNombre=self.regisuser?.text
                DataHolder.sharedInstance.miPerfil.sCoche=self.regiscoche?.text
    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap()) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: ")
                    }
                }
                
                self.performSegue(withIdentifier: "trregis", sender:self)
            }
            else{
                print(error!)
            }
            }
            }else{
                regiserror?.text="Password no coincide"
            }
        }else if (regisuser?.text?.isEmpty)! {
            regiserror?.text="Falta usuario"
        }else if (regisemail?.text?.isEmpty)!{
            regiserror?.text="Falta Email"
        }else if (regispass?.text?.isEmpty)!{
            regiserror?.text="Falta Password"
        }else if (regiscoche?.text?.isEmpty)!{
            regiserror?.text="Falta Coche"
        }else if (regipassc?.text?.isEmpty)!{
            regiserror?.text="Falta Confimar Password"
        }
    
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
