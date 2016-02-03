//
//  YouKuTabBarController.swift
//  YouKuDemo
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

import UIKit

class YouKuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC(HomeViewController(style:UITableViewStyle.Grouped), title: "首页", normalImage: "navbar_icon_home_normal", selectedImage: "navbar_icon_home_selected")
        addChildVC(ChannelViewController(), title: "频道", normalImage: "navbar_icon_channel_normal", selectedImage: "navbar_icon_channel_selected")
        addChildVC(SubscribeViewController(), title: "订阅", normalImage: "navbar_icon_subscribe_normal", selectedImage: "navbar_icon_subscribe_selected")
        addChildVC(MineViewController(),  title: "我的", normalImage: "navbar_icon_user_normal", selectedImage: "navbar_icon_user_selected")
    }
    //自定义方法
    func addChildVC(vc: UIViewController,title:String, normalImage:String, selectedImage:String) {
        let navC = UINavigationController(rootViewController: vc)
        navC.tabBarItem = UITabBarItem(title: title, image: UIImage(named: normalImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        addChildViewController(navC)
    }


}
