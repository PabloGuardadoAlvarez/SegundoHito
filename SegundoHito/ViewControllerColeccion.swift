//
//  ViewControllerColeccion.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 7/5/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class ViewControllerColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataHolderDelegate {
    
    
   
    
    
    @IBOutlet var coleccionPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return DataHolder.sharedInstance.arCoches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda1:MiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "segundacelda", for: indexPath) as! MiCelda2
        
        celda1.lblCelda2?.text = DataHolder.sharedInstance.arCoches[indexPath.row].smodelo
        celda1.descargarImagenes(uri: DataHolder.sharedInstance.arCoches[indexPath.row].sfoto!)
        
        
        return celda1
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
