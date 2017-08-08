//
//  ScaleCell.swift
//  Circle of Fifths
//
//  Created by Ben Zacharia on 8/8/17.
//  Copyright © 2017 Ben Zacharia. All rights reserved.
//

import Foundation
import UIKit

class ScaleCell: UITableViewCell {
    
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleAudioButton: UIButton!
    @IBOutlet weak var scaleArrow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
