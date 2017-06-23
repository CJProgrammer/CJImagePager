//
//  ViewController.swift
//  CJImagePager
//
//  Created by CJ on 2017/6/22.
//  Copyright © 2017年 CJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imagePager = CJImagePager.init(frame: CGRect.init(x: 0, y: 100, width: view.frame.width, height: 400))
        imagePager.imageUrls = ["1","2","3","4","5","6","7","8","9","10","11","12"]
        imagePager.leftRightMargin = 30
        imagePager.imageMargin = 15
        view.addSubview(imagePager)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

