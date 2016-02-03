//
//  SearchHistoryCell.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

//协议
protocol SearchHistoryCellDelegate: NSObjectProtocol{
    // 删除历史搜索关键字
    func deleteHistoryKey(key: String)
    // 点击历史搜索关键字
    func clickHistoryKey(key: String)
}


class SearchHistoryCell: UITableViewCell {

    var keyLabel: UILabel!
    //防止循环引用
    weak var delegate: SearchHistoryCellDelegate!
    var line: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    func setupViews() {
        let icon = UIImageView(image: UIImage(named: "search_smalltime"))
        icon.x = 13.5
        icon.centerY = 22.5
        self.contentView.addSubview(icon)
        
        keyLabel = UILabel(frame: CGRectMake(34, 0, ScreenWidth - 68, 45))
        keyLabel.textColor = RGBColor(102, g: 102, b: 102)
        keyLabel.font = UIFont.systemFontOfSize(14)
        let gesture = UITapGestureRecognizer(target: self, action: "tapKeyLabel")
        keyLabel.addGestureRecognizer(gesture)
        keyLabel.userInteractionEnabled = true
        self.contentView.addSubview(keyLabel)
        
        let deleteBtn = UIButton(frame: CGRectMake(0, 0, 45, 45))
        deleteBtn.center = CGPointMake(ScreenWidth - icon.centerX, 22.5)
        deleteBtn.setImage(UIImage(named: "search_smalldelete"), forState: UIControlState.Normal)
        deleteBtn.addTarget(self, action: "deleteBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(deleteBtn)
        
        line = UIView(frame: CGRectMake(9, 44.5, ScreenWidth - 18, 0.5))
        line.backgroundColor = GlobalLineColor
        self.contentView.addSubview(line)
    }
    
  
    
    //delete Btn Click
    func deleteBtnClick() {
        self.delegate.deleteHistoryKey(keyLabel.text!)
    }
    
    //tap Key Label
    func tapKeyLabel() {
        self.delegate.clickHistoryKey(keyLabel.text!)
    }
    
    //暴漏方法
    func configKeyLabel(text: String) {
        keyLabel.text = text
    }
    
    func showBottomLine(show: Bool) {
        line.hidden = !show
    }


}
