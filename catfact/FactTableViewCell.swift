//
//  FactTableViewCell.swift
//  catfact
//
//  Created by subrata Samartha on 27/04/23.
//

import UIKit

class FactTableViewCell: UITableViewCell {

    @IBOutlet weak var factStringLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
