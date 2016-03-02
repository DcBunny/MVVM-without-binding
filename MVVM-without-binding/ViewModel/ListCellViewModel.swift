//
//  ListCellViewModel.swift
//  MVVM-without-binding
//
//  Created by DcBunny on 16/3/2.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class ListCellViewModel
{
    var title: String?
    
    class func viewModelWithTitle(title: String) -> ListCellViewModel {
        let viewModel = ListCellViewModel()
        viewModel.title = title
        
        return viewModel
    }
}