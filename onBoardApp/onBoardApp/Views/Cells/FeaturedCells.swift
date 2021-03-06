//
//  FeaturedCells.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/24/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    static var identifier: String = "FeaturedCell"
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var titlelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup(){
        imgView.layer.cornerRadius = 10
        titlelabel.textColor = .white
    }
}
