//
//  ViewControllerTabla.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 17/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class ViewControllerTabla: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet var tabla:UITableView?
    var arCoches:[Coches] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.firestoreDB?.collection("Coches").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arCoches = []
                    for document in querySnapshot!.documents {
                        let coches:Coches = Coches()
                        coches.sID = document.documentID
                        coches.setMap(valores: document.data())
                        self.arCoches.append(coches)
                        print("\(document.documentID) => \(document.data())")
                
                    }
                    print("---------->",self.arCoches.count)
                    self.tabla?.reloadData()
                }
            
        }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arCoches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "primeracelda") as! MiCelda1
        
        celda.lblCelda1?.text = self.arCoches[indexPath.row].smodelo
        celda.descargarImagenes(uri: self.arCoches[indexPath.row].sfoto!)
        
        return celda
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


