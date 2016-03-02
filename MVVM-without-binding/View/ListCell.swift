//
//  ListCell.swift
//  MVVM-without-binding
//
//  Created by DcBunny on 16/3/2.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell
{
    var infoLabel = UILabel()
    
    var viewModel: ListCellViewModel?
    
    //MARK: - life methods
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addCellSubviews()
        layoutCellSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup page subviews
    func addCellSubviews() {
        contentView.addSubview(infoLabel)
    }
    
    func layoutCellSubviews() {
        infoLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(20)
        }
    }
    
    func bindDataWithViewModel(viewModel: ListCellViewModel) {
        self.viewModel = viewModel
        infoLabel.text = self.viewModel?.title
    }
}
