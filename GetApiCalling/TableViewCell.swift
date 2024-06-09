//
//  TableViewCell.swift
//  GetApiCalling
//
//  Created by Arpit Dhameliya on 14/03/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userid: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
