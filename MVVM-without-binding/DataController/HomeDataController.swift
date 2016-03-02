//
//  HomeDataController.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import Foundation

class HomeDataController
{
    func homeInfoData() -> String {
        var infoString = "I'm info "
        let infoNum = random()
        infoString += "\(infoNum)"
        
        return infoString
    }
}