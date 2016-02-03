//
//  SearchResultCell.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    var imgView: UIImageView!
    var nameLabel: UILabel!
    var nameRect: CGRect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //UI
        let width = contentView.width
        imgView = UIImageView(frame: CGRectMake(0, 0, width, width * 0.56))
        contentView.addSubview(imgView)
        
        nameRect = CGRectMake(6, width * 0.56, width - 12, 46)
        nameLabel = UILabel(frame: CGRectMake(6, width * 0.56, width - 12, 46))
        nameLabel.textColor = RGBColor(51, g: 51, b: 51)
        nameLabel.font = UIFont.systemFontOfSize(14)
        nameLabel.numberOfLines = 2
        contentView.addSubview(nameLabel)
        contentView.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //暴漏方法
    func configCell(imgUrl: String, videoName: String) {
        imgView.sd_setImageWithURL(NSURL(string: imgUrl))
        nameLabel.text = videoName
        setNeedsLayout()
    }
    
    //重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        let str = NSString(string: nameLabel.text!)
        let size = str.sizeWithAttributes([NSFontAttributeName: nameLabel.font])
        if size.width > nameRect.width {
            nameLabel.frame = nameRect
        } else {
            nameLabel.frame = CGRectMake(6, 0, size.width, size.height)
            nameLabel.centerY = contentView.width * 0.56 + 14
        }
    }

}
