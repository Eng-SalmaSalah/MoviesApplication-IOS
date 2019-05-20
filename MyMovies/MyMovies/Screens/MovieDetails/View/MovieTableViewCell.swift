//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Aya Mohamed Abdo on 5/20/19.
//  Copyright © 2019 AyaAndSalma. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var trailerNameLabel: UILabel!
    @IBOutlet weak var trailerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
