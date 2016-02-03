//
//  SearchHistoryClearCell.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

//协议
protocol SearchHistoryClearCellDelegate: NSObjectProtocol {
    // 清空所有搜索历史
    func clearAllHistoryKeys()
}

class SearchHistoryClearCell: UITableViewCell {
    //防止循环引用
    weak var delegate: SearchHistoryClearCellDelegate!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //UI
    func setupViews() {
        let btn = UIButton(frame: contentView.bounds)
        btn.setTitle("清空搜索历史", forState: UIControlState.Normal)
        btn.setTitleColor(RGBColor(255, g: 60, b: 60), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        btn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        contentView.addSubview(btn)
    }
    
    //btn Click
    func btnClick() {
        self.delegate?.clearAllHistoryKeys()
    }

}
