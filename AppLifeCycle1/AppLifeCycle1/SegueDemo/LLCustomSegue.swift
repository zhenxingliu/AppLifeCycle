//
//  LLCustomSegue.swift
//  AppLifeCycle1
//
//  Created by 刘振兴 on 2017/11/14.
//  Copyright © 2017年 zone. All rights reserved.
//

import UIKit
import QuartzCore
import CoreGraphics

enum LLCustomSegueAnimation {
    case Push
    case SwipeDown
    case GrowScale
    case CornerRotate
}

class LLCustomSegue: UIStoryboardSegue {
    var animationType = LLCustomSegueAnimation.Push
    
    override func perform() {
        switch animationType {
        case .Push:
            animatePush()
        case .SwipeDown:
            animateSwipeDown()
        case .GrowScale:
            animateGrowScale()
        case .CornerRotate:
            animateCornerRoate()
        }
    }
    
    private func animatePush(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let screenBounds = UIScreen.main.bounds
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: -screenBounds.size.width, dy: 0)
        toVC.view.frame = finalToFrame.offsetBy(dx: screenBounds.size.width, dy: 0)
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.frame = finalToFrame
            fromVC.view.frame = finalFromFrame
        }) { (finished) in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        }
    }
    
    private func animateSwipeDown(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let screenBounds = UIScreen.main.bounds
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx:0, dy: screenBounds.size.height)
        toVC.view.frame = finalToFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.frame = finalToFrame
            fromVC.view.frame = finalFromFrame
        }) { (finished) in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        }
    }
    
    private func animateGrowScale(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let originalCenter = fromVC.view.center
        toVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVC.view.center = originalCenter
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
           toVC.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (finished) in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        }
    }
    
    private func animateCornerRoate(){
        let toVC = destination
        let fromVC = source
        
        toVC.view.layer.anchorPoint = .zero
        fromVC.view.layer.anchorPoint = .zero
        toVC.view.layer.position = .zero
        fromVC.view.layer.position = .zero
        
        let containerView = fromVC.view.superview
        toVC.view.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
           fromVC.view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
           toVC.view.transform = CGAffineTransform.identity
        }) { (finished) in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        }
    }
}

class LLCustomUnwindSegue: UIStoryboardSegue {
    var animationType = LLCustomSegueAnimation.Push
    
    override func perform() {
        switch animationType {
        case .Push:
            animatePush()
        case .SwipeDown:
            animateSwipeDown()
        case .GrowScale:
            animateGrowScale()
        case .CornerRotate:
            animateCornerRoate()
        }
    }
    
    private func animatePush(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let screenBounds = UIScreen.main.bounds
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: -screenBounds.size.width, dy: 0)
        toVC.view.frame = finalToFrame.offsetBy(dx: screenBounds.size.width, dy: 0)
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.frame = finalToFrame
            fromVC.view.frame = finalFromFrame
        }) { (finished) in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        }
    }
    
    private func animateSwipeDown(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let screenBounds = UIScreen.main.bounds
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx:0, dy: screenBounds.size.height)
        toVC.view.frame = finalToFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.frame = finalToFrame
            fromVC.view.frame = finalFromFrame
        }) { (finished) in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        }
    }
    
    private func animateGrowScale(){
        let toVC = destination
        let fromVC = source
        let containerView = fromVC.view.superview
        let originalCenter = fromVC.view.center
        toVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVC.view.center = originalCenter
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (finished) in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        }
    }
    
    private func animateCornerRoate(){
        let toVC = destination
        let fromVC = source
        
        toVC.view.layer.anchorPoint = .zero
        fromVC.view.layer.anchorPoint = .zero
        toVC.view.layer.position = .zero
        fromVC.view.layer.position = .zero
        
        let containerView = fromVC.view.superview
        toVC.view.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, animations: {
            fromVC.view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
            toVC.view.transform = CGAffineTransform.identity
        }) { (finished) in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        }
    }
}
