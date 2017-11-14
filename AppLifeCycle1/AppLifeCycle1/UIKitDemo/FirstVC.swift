//
//  FirstVC.swift
//  AppLifeCycle1
//
//  Created by 刘振兴 on 2017/11/14.
//  Copyright © 2017年 zone. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(_ sender: Any) {
        self.performSegue(withIdentifier: "first", sender: nil)
    }
    
    @IBAction func unwindFromViewController(sender:UIStoryboardSegue){
        
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.isKind(of: LLCustomSegue.self) {
            (segue as! LLCustomSegue).animationType = .SwipeDown
        }
    }
    

}
