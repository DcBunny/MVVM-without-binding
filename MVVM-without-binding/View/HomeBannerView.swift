//
//  HomeBannerSubview.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class HomeBannerView: UIView
{
    var bannerImage = UIImageView()
    var bannerTitle = UILabel()
    
    var viewModel: HomeBannerViewModel?
    
    func setupContentView() {
        addSubview(bannerImage)
        addSubview(bannerTitle)
    }
    
    func layoutContentView() {
        bannerImage.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(self)
        }
        
        bannerTitle.snp_makeConstraints { (make) -> Void in
            make.bottom.right.equalTo(self).offset(-10)
        }
    }
    
    func bindDataWithViewModel(viewModel: HomeBannerViewModel) {
        self.viewModel = viewModel
        
        setupContentView()
        layoutContentView()
        
        bannerImage.image = self.viewModel!.image
        bannerTitle.text = self.viewModel!.text
        bannerTitle.textColor = self.viewModel!.textColor
        bannerTitle.font = self.viewModel!.font
    }
}
