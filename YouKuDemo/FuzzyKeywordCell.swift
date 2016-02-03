//
//  FuzzyKeywordCell.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

class FuzzyKeywordCell: UITableViewCell {

    var nameLabel: UILabel!
    var bottomLine: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    func setupViews() {
        nameLabel = UILabel(frame: CGRectMake(16, 0, ScreenWidth - 32, 45))
        nameLabel.font = UIFont.systemFontOfSize(14)
        nameLabel.textColor = RGBColor(102, g: 102, b: 102)
        contentView.addSubview(nameLabel)
        
        bottomLine = UIView(frame: CGRectMake(9, 44.5, ScreenWidth - 18, 0.5))
        bottomLine.backgroundColor = GlobalLineColor
        contentView.addSubview(bottomLine)
    }
    
    //暴漏接口
    func configCell(name: String) {
        nameLabel.text = name
    }
    func hideBottmLine(hide: Bool) {
        bottomLine.hidden = hide
    }


}
