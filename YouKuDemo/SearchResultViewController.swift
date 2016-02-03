//
//  SearchResultViewController.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

import Alamofire

protocol SearchResultViewControllerDelegate: NSObjectProtocol {
    func hideKeyboard()
}


private let reuseIdentifier = "SearchResultCell"

class SearchResultViewController: UICollectionViewController {

    weak var delegate: SearchResultViewControllerDelegate!
    var data: NSMutableArray! = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.collectionView?.backgroundColor = GlobalBackgroundColor
        self.collectionView!.registerClass(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func search(keyword: String) {
        // 搜索视频
        let param = [ClientIdKey: ClientIdValue, "keyword": keyword, "count": "30"]
        Alamofire.request(.GET, API_SearchVideo, parameters: param).responseJSON { response in
            if let json = response.result.value {
                let dict = json as! NSDictionary
                if dict["error"] == nil {
                    self.data = dict["videos"] as! NSMutableArray
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SearchResultCell
        let dic = self.data[indexPath.row] as! NSDictionary
        cell.configCell(dic["thumbnail"] as! String, videoName: dic["title"] as! String)
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.delegate?.hideKeyboard()
    }
    


}
