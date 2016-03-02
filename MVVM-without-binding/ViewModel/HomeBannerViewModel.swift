//
//  HomeBannerViewModel.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class HomeBannerViewModel
{
    var image: UIImage
    var text: String
    var textColor: UIColor
    var font: UIFont
    
    init() {
        image = UIImage(named: "banner")!
        text = "I'm a banner."
        textColor = UIColor.blackColor()
        font = UIFont.systemFontOfSize(18)
    }
}