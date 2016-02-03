//
//  SearchHistoryOpenCell.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

//协议
protocol SearchHistoryOpenCellDelegate: NSObjectProtocol {
    // 展开搜索历史
    func openHistoryKeyCell()
}


class SearchHistoryOpenCell: UITableViewCell {
    //防止循环引用
    weak var delegate: SearchHistoryOpenCellDelegate!
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
        btn.setTitle("更多搜索历史", forState: UIControlState.Normal)
        btn.setTitleColor(RGBColor(51, g: 51, b: 51), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        btn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        contentView.addSubview(btn)
        
        let icon = UIImageView(image: UIImage(named: "searchmore"))
        icon.x = ScreenWidth / 2 + 42
        icon.centerY = btn.height / 2
        btn.addSubview(icon)
    }
    
    //btn Click
    func btnClick() {
        self.delegate?.openHistoryKeyCell()
    }


}
