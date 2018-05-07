//
//  ViewControllerTabla.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 17/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class ViewControllerTabla: UIViewController, UITableViewDelegate, UITableViewDataSource , DataHolderDelegate{

    
    @IBOutlet var tabla:UITableView?
 
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.DescargarCoches(delegate: self)
        print(DataHolder.sharedInstance.miPerfil)
        
    }
    
    func DHDdescargaCiudadesComplete(blFin: Bool) {
        if blFin{
            
            self.tabla?.reloadData()
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arCoches.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "primeracelda") as! MiCelda1
        
        celda.lblCelda1?.text = DataHolder.sharedInstance.arCoches[indexPath.row].smodelo
        celda.descargarImagenes(uri: DataHolder.sharedInstance.arCoches[indexPath.row].sfoto!)
        
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


