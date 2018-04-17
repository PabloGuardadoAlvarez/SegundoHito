//
//  TableViewCellPrimeraCelda.swift
//  SegundoHito
//
//  Created by PABLO GUARDADO ALVAREZ on 17/4/18.
//  Copyright © 2018 PABLO GUARDADO ALVAREZ. All rights reserved.
//

import UIKit

class TableViewCellPrimeraCelda: UITableViewCell {
    
    @IBOutlet var lbnombre:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        lbnombre?.text = DataHolder.sharedInstance.miPerfil.sCoche
    }

}
