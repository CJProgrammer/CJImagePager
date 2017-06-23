//
//  ImagePageCell.swift
//  CJImagePager
//
//  Created by CJ on 2017/6/22.
//  Copyright © 2017年 CJ. All rights reserved.
//

import UIKit

class ImagePageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

    var imageUrl:String? {
        didSet {
            imageView.image = UIImage.init(named: "\(imageUrl!).jpg")
        }
    }
}
