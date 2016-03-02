//
//  HomeInfoSubview.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class HomeInfoView: UIView
{
    var infoLabel = UILabel()
    var changeBtn = UIButton()
    
    var viewModel: HomeInfoViewModel?
    
    var eventMethod: (() -> ())?
    
    func setupContentView() {
        addSubview(infoLabel)
        addSubview(changeBtn)
    }
    
    func layoutContentView() {
        infoLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(20)
        }
        
        changeBtn.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-20)
            make.size.equalTo(CGSizeMake(80, 30))
        }
    }
    
    func setupEventResponse() {
        changeBtn.addTarget(self, action: "changeInfo", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func changeInfo() {
        if eventMethod != nil {
            eventMethod!()
        }
    }
    
    func bindDataWithViewModel(viewModel: HomeInfoViewModel) {
        self.viewModel = viewModel
        
        setupContentView()
        layoutContentView()
        setupEventResponse()
        
        backgroundColor = self.viewModel!.backgroundColor
        
        infoLabel.text = self.viewModel!.text
        infoLabel.textColor = self.viewModel!.textColor
        infoLabel.font = self.viewModel!.font
        
        changeBtn.setTitle(self.viewModel!.btnTitle, forState: UIControlState.Normal)
        changeBtn.backgroundColor = self.viewModel!.btnColor
    }
    
    func updateInfoData() {
        infoLabel.text = viewModel!.text
    }
}
