//
//  HomeTableCell.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/11/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
extension HomeTableCell {
    func loadCellData(_ getRoomsAPI: RoomsAPI) {
        titleLabel.text = getRoomsAPI.title
        placeLabel.text = getRoomsAPI.place
        priceLabel.text = getRoomsAPI.price
    }
}
