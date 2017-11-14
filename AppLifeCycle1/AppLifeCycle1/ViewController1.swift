//
//  ViewController.swift
//  AppLifeCycle1
//
//  Created by 刘振兴 on 2017/11/13.
//  Copyright © 2017年 zone. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openApp(_ sender: Any) {
        UIApplication.shared.open(URL(string:"myAppLifeCycle://o.o2oa.iOS.m.AppLifeCycle")!) { (result) in
            print(result)
        }
    }
    
}

