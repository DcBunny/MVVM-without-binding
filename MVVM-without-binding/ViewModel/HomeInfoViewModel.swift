//
//  HomeInfoViewModel.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class HomeInfoViewModel
{
    var backgroundColor: UIColor
    
    var text: String
    var textColor: UIColor
    var font: UIFont
    
    var btnTitle: String
    var btnColor: UIColor
    
    init() {
        backgroundColor = UIColor.grayColor()
        
        text = "I'm info."
        textColor = UIColor.blackColor()
        font = UIFont.systemFontOfSize(18)
        
        btnTitle = "click me!"
        btnColor = UIColor.blueColor()
    }
}