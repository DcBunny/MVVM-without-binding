//
//  HomeListSubview.swift
//  test
//
//  Created by DcBunny on 16/3/1.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

protocol HomeListViewDelegate
{
    func homeList(homeList: HomeListView, didSelectRowAtIndexPath indexPath: NSIndexPath)
}

class HomeListView: UIView, UITableViewDataSource, UITableViewDelegate
{
    var listTable = UITableView()
    
    var viewModel: HomeListViewModel?
    
    var delegate: HomeListViewDelegate?
    
    func setupContentView() {
        addSubview(listTable)
        listTable.registerClass(ListCell.self, forCellReuseIdentifier: "ListCell")
        listTable.separatorStyle = UITableViewCellSeparatorStyle.None
        listTable.showsVerticalScrollIndicator = false
        listTable.dataSource = self
        listTable.delegate = self
    }
    
    func layoutContentView() {
        listTable.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(self)
        }
    }
    
    func bindDataWithViewModel(viewModel: HomeListViewModel) {
        self.viewModel = viewModel
        
        setupContentView()
        layoutContentView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.listCellViewModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "ListCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! ListCell
        
        cell.bindDataWithViewModel(viewModel!.listCellViewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.homeList(self, didSelectRowAtIndexPath: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}