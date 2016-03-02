//
//  HomeListViewModel.swift
//  MVVM-without-binding
//
//  Created by DcBunny on 16/3/2.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class HomeListViewModel
{
    var listCellViewModels: [ListCellViewModel]
    
    init() {
        listCellViewModels = [ListCellViewModel]()
        for var i = 0; i < 3; ++i {
            let viewModel = ListCellViewModel.viewModelWithTitle(String(i))
            listCellViewModels.append(viewModel)
        }
    }
}