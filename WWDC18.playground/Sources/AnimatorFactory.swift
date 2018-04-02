//
//  AnimatorFactory.swift
//  CreationPlayground
//
//  Created by Weslie on 3/21/18.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

public enum LockScreenAnimatorDirection: String {
    case up = "up"
    case down = "down"
}

public func delay(seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

public class AnimatorFactory {
    
    // MARK:- add iPhone screen to main view with rotate animation
    public static func showMainScreenFromRotation() -> CASpringAnimation {
        
        let animation = CASpringAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = CGFloat.pi / 2
        animation.toValue = 0
        animation.duration = animation.settlingDuration
        animation.damping = 4
        animation.stiffness = 40
        animation.initialVelocity = 5
        animation.fillMode = kCAFillModeBoth
        
        return animation
    }
    
    // MARK:- set 'slide to unlock' to the mask and add flash light animation
    public static func gradientAnimationForSlideToUnlock() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.25]
        animation.toValue = [0.75, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        
        return animation
    }
    
    // MARK:- pull down lock screen header animation
    public static func lockScreenAnimate(view: UIView, direction: LockScreenAnimatorDirection) -> UIViewPropertyAnimator {
        var animtor = UIViewPropertyAnimator()
        if direction == .down {
            let spring = UISpringTimingParameters(dampingRatio: 0.4)
            let anim = UIViewPropertyAnimator(duration: 1.0, timingParameters: spring)
            anim.addAnimations {
                view.frame.origin.y += 50
                view.alpha = 1.0
            }
            animtor = anim
        } else if direction == .up {
            let spring = UISpringTimingParameters(dampingRatio: 0.35)
            let anim = UIViewPropertyAnimator(duration: 1.0, timingParameters: spring)
            anim.addAnimations {
                view.frame.origin.y -= 144
                view.alpha = 1.0
            }
            animtor = anim
        }
        return animtor
    }
    
    // MARK:- hide fake slide
    public static func hideFakeSlide(view: UIView, coverButton: UIButton) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 1.8, curve: .easeIn) {
            view.alpha = 0.0
            view.frame.origin.x -= 310
            coverButton.removeFromSuperview()
        }
        
        return anim
    }
    
    // MARK:- spring back time label and real slide
    public static func springBack(_ view: UIView) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
            view.frame.origin.x = 75
        }
        
        return anim
    }
    
    // MARK:- scale the app icon to the whole screen together with fade out
    public static func scaleToFade(_ icon: UIImageView) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 0.15, curve: .linear) {
            icon.transform = CGAffineTransform(scaleX: 5.35, y: 5.35)
            icon.alpha = 0
            icon.frame.origin.x = 0
            icon.frame.origin.y = 144
        }
        anim.addCompletion { (_) in
            icon.removeFromSuperview()
        }
        return anim
    }
    
    // MARK:- remove the label
    public static func changeLabelText(from aLabel: UILabel) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
            aLabel.frame.origin.x += 150
            aLabel.alpha = 0.0
        }
        anim.addCompletion { (_) in
            aLabel.removeFromSuperview()
        }
        return anim
    }
    
    // MARK:- add label 'I Love Apple'
    public static func easeInFromEdge(with aLbel: UILabel) -> UIViewPropertyAnimator {
        let anim = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            aLbel.frame.origin.x = 145
            aLbel.alpha = 1.0
        }
        return anim
    }
    
    // MARK:- spring the label from top left to the middle
    public static func spingLabel(_ label: UILabel) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
//            label.frame.origin.x = 120
//            label.frame.origin.y = 100
            label.bounds = CGRect(x: 0, y: 0, width: 220, height: 53)
            label.center = CGPoint(x: (label.superview?.center.x)!, y: 80)
            label.font = UIFont.systemFont(ofSize: 48, weight: .ultraLight)
            label.sizeToFit()

        }) { (_) in
            
        }
    }
    
    // MARK:- add clicke me button with bounce
    public static func wobbleButton(_ button: UIButton) {
        
        let wobble = CAKeyframeAnimation(keyPath: "transform.rotation")
        wobble.duration = 0.5
        wobble.values = [0.0, -.pi/4.0, 0.0, .pi/4.0, 0.0]
        wobble.keyTimes = [0.0, 0.125, 0.25, 0.375, 0.5]
        button.layer.add(wobble, forKey: nil)
        
        let scale = CAKeyframeAnimation(keyPath: "transform.scale")
        scale.duration = 0.5
        scale.values = [1.0, 1.4, 1.0]
        scale.keyTimes = [0.0, 0.25, 0.5]
        button.layer.add(scale, forKey: nil)
    }
    
    // MARK:- animate apple logo
    public static func scaleLogo(_ image: UIImageView) {
        
        let scale = CABasicAnimation.init(keyPath: "transform.scale")
        scale.fromValue = 4.0
        scale.toValue = 1.0
        scale.duration = 0.3
        
//        let grow = CABasicAnimation.init(keyPath: "opacity")
//        grow.fromValue = 0.0
//        grow.toValue = 0.25
//        grow.duration = 0.3
        
        image.layer.add(scale, forKey: nil)
//        image.layer.add(grow, forKey: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [], animations: {
            image.alpha = 1.0
        }) { (_) in
            image.removeFromSuperview()
        }
        
    }
    
    // MARK:- spring the slider 
    public static func showSliderFromMiddle(_ slider: UISlider) {
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 0.3
        
        let drop = CASpringAnimation.init(keyPath: "position.y")
        drop.fromValue = 320
        drop.toValue = 385
        drop.damping = 10
        
        let grow = CASpringAnimation.init(keyPath: "opacity")
        grow.fromValue = 0.0
        grow.toValue = 1.0
        grow.damping = 20
        
        let pulse = CASpringAnimation.init(keyPath: "transform.scale")
        pulse.fromValue = 0.75
        pulse.toValue = 1.0
        pulse.damping = 5
        
        animGroup.animations = [drop, grow, pulse]
        
        slider.layer.add(animGroup, forKey: nil)
        
    }
    
    public static func springSwitchFromButton(_ aSwitch: UISwitch) {
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            aSwitch.frame.origin.y -= 130
            aSwitch.alpha = 1.0
        }) { (_) in
            aSwitch.setOn(true, animated: true)
        }
    }
 
}
