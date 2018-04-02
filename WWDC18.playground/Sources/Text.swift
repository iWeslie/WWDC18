//
//  Text.swift
//  CreationPlayground
//
//  Created by Weslie on 25/03/2018.
//  Copyright © 2018 weslie. All rights reserved.
//

var aText =
"""
/// Hey. My name's Chen Yongkang, a student from China.
///
/// I'm keen on iOS development.
///
/// I also try my best to create an iOS app on my own.
/// Dreaming to be a UI/UX Designer, who create amazing
///interfaces, animations and interactions.
/// Dreaming to be an AI Engineer, who pushes the boundaries
/// of the technology.
///

///
/// I recreate APIs in UIKit
///
/// I'm here to show you the charm of coding.
///

/// Let's begin! What about some basic things... Okay, you know

import UIKit

/// This doesn't do anything, you may think.
/// And...
/// What about define a class?

public class AmazingView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 800, height: 500)
        backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/// That's done. We created an amazing class.
/// Just... Wait a second!!
/// Do you think the black and white text is so boring?
/// Let's color it

let plainText = UIColor(red:0.88, green:0.89, blue:0.90,
alpha:1.00)
let markup = UIColor(red:0.25, green:0.80, blue:0.27,
alpha:1.00)
let strings = UIColor(red:1.00, green:0.17, blue:0.22,
alpha:1.00)
let charAndNum = UIColor(red:0.47, green:0.43, blue:1.00,
alpha:1.00)
let keyWords = UIColor(red:0.83, green:0.09, blue:0.58,
alpha:1.00)
let custom = UIColor(red:0.14, green:1.00, blue:0.51,
alpha:1.00)
let system = UIColor(red:0.00, green:0.63, blue:1.00,
alpha:1.00)

// TODO:- make the code world colorful
/// Now, it's much better to read.
/// Cheers...🎉🎉
/// However, there is still nothing to show except code.
/// Okay. What about make a screen on the right side?

let myScreen = AmazingView()
myScreen.backgroundColor = UIColor.white

/// It looks especially like iPhone you used several years ago,
/// doesn't it?
/// Now, slide to unlock.....
/// Hahaha...
/// ...
/// ...
/// ...
/// It's a trick just now.
/// ...
/// Hold on!!!
/// Don't leave me here. Please.......
/// I'm so sorry. This time it will be true.
/// So, slide it again.....
/// Oops, it is fake iPhone Home Screen.
/// There is an app on the home screen and I call it Demo.
/// Let's launch it...
/// Okay.But, there is nothing here, it is empty at all.
/// Don't worry,
/// And, here it comes.
/// I hope you will enjoy this.

// MARK:- add some functions into myScreen
/**
 * checking files...
 * initializing...
 * loading functions...
 * functions load completed...
 - And, we should add these functions to the app.
 - Alright. Are you ready?
 - 3...
 - 2...
 - 1...
 - Here we go.
 */

/// Well, there are so much code that may shock you.
/// So, we have done everything now.
/// And how about take at look at how the code works?
/// First...
let label = UILabel()
/// Oh, a label appears on the screen.
/// But, we don't need this.
label.text = "I Love Apple"
label.frame = CGRect(x: 78, y: 54, width: 230, height: 58)
label.font = UIFont.systemFont(ofSize: 48, weight: .ultraLight)

/// You can not click a label, it is only for show some text.
/// In addition, there are also something you can click.
/// A button.
let button = UIButton()
button.frame = CGRect(x: 100, y: 150, width: 175, height: 60)
button.setTitle("Click Me", for: .normal)
/// The most important thing for a button, I think,
/// is that you can click it and somethings happens.
/// So, this will be interesting...
button.addTarget(self, action: #selector(wobbleButton), for: .touchUpInside)
/// And now, try to click it.
/// Amazing, it is so interesting, right?
///
/// By far, we know label and button can show text.
/// Did you think something can be changed as your wish?
/// I also prepared this for you.
/// You will love it.
let appleLogo = UIImage(named: "AppleLogo")
let slider = UISlider()
/// Now you can see a blue apple.
/// Is it only blue?
/// Not necessarily...
/// Try to move the white dot on the slider.
/// .....
/// Aha, it is a rainbow apple.
/// So, pick a color you like on the apple.
///
/// Okay...
/// Time is up.
/// And it is time to say goodbye now.
///
/// At last, there is also a switch for you to shut down the app.
let powerSwitch = UISwitch()
/// I hope you enjoy my work.
/// I'm extremely grateful for your watching. Thank you.




"""

var codeText =
"""
import UIKit

public enum LockScreenAnimatorDirection: String {
    case up = "up"
    case down = "down"
}

public func delay(seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

public class AnimatorFactory {
    
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
    
    public static func gradientAnimationForSlideToUnlock() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.25]
        animation.toValue = [0.75, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        
        return animation
    }
    
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
    
    public static func hideFakeSlide(view: UIView, coverButton: UIButton) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 1.8, curve: .easeIn) {
            view.alpha = 0.0
            view.frame.origin.x -= 310
            coverButton.removeFromSuperview()
        }
        
        return anim
    }
    
    public static func springBack(_ view: UIView) -> UIViewPropertyAnimator {
        
        let anim = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
            view.frame.origin.x = 75
        }
        
        return anim
    }
    
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
    
    public static func easeInFromEdge(with aLbel: UILabel) -> UIViewPropertyAnimator {
        let anim = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            aLbel.frame.origin.x = 145
            aLbel.alpha = 1.0
        }
        return anim
    }
    
    public static func spingLabel(_ label: UILabel) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            label.bounds = CGRect(x: 0, y: 0, width: 220, height: 53)
            label.center = CGPoint(x: (label.superview?.center.x)!, y: 80)
            label.font = UIFont.systemFont(ofSize: 48, weight: .ultraLight)
            label.sizeToFit()
            
        }) { (_) in
            
        }
    }
    
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
    
    public static func scaleLogo(_ image: UIImageView) {
        
        let scale = CABasicAnimation.init(keyPath: "transform.scale")
        scale.fromValue = 4.0
        scale.toValue = 1.0
        scale.duration = 0.3
        
        image.layer.add(scale, forKey: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [], animations: {
            image.alpha = 1.0
        }) { (_) in
            image.removeFromSuperview()
        }
        
    }
    
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

public class DemoAppView: UIView {
    
    let gradientLayer: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let rainbow: [CGColor] = [UIColor(red:0.99, green:0.24, blue:0.22, alpha:1.00).cgColor,
                                  UIColor(red:0.99, green:0.58, blue:0.15, alpha:1.00).cgColor,
                                  UIColor(red:1.00, green:0.80, blue:0.18, alpha:1.00).cgColor,
                                  UIColor(red:0.33, green:0.84, blue:0.41, alpha:1.00).cgColor,
                                  UIColor(red:0.38, green:0.79, blue:0.97, alpha:1.00).cgColor,
                                  UIColor(red:0.08, green:0.49, blue:0.98, alpha:1.00).cgColor,
                                  UIColor(red:0.35, green:0.35, blue:0.83, alpha:1.00).cgColor,
                                  UIColor(red:0.99, green:0.19, blue:0.35, alpha:1.00).cgColor]
        gradientLayer.colors = rainbow
        
        let locations: [NSNumber] = [0.0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1.0]
        gradientLayer.locations = locations
        
        return gradientLayer
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        alpha = 0
        appIconCoverFade()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func appIconCoverFade() {
        let appIcon = UIImageView.init(frame: CGRect.init(x: 20, y: 30, width: 70, height: 70))
        appIcon.image = UIImage.init(named: "AppIcon")
        appIcon.contentMode = .scaleToFill
        appIcon.backgroundColor = UIColor.white
        self.addSubview(appIcon)
        
        AnimatorFactory.scaleToFade(appIcon).startAnimation()
        UIView.animate(withDuration: 0.15, delay: 0, options: [], animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    @objc public func addLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 169, y: 322, width: 50, height: 20)
        label.text = "Label"
        self.addSubview(label)
        self.label = label
    }
    
    
    @objc func labelFadeAway() {
        AnimatorFactory.changeLabelText(from: label).startAnimation()
    }
    
    @objc func bounceLabel() {
        AnimatorFactory.spingLabel(appleLabel)
    }
    
    @objc public func addAnotherLabel() {
        let label = UILabel()
        label.frame = CGRect(x: -120, y: 322, width: 100, height: 20)
        label.text = "I Love Apple"
        self.addSubview(label)
        self.appleLabel = label
        label.alpha = 0
        AnimatorFactory.easeInFromEdge(with: label).startAnimation()
    }
    
    @objc public func addClickMeButtonWithBounce() {
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 150, width: 175, height: 60))
        button.setTitle("Click Me", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .ultraLight)
        button.setTitleColor(UIColor(red:0.18, green:0.49, blue:0.96, alpha:1.00), for: .normal)
        self.addSubview(button)
        self.button = button
        button.alpha = 0.0
        UIView.animate(withDuration: 1.0) {
            button.alpha = 1.0
        }
        button.addTarget(self, action: #selector(shakeButton(_:)), for: .touchUpInside)
    }
    
    @objc public func shakeButton(_ sender: UIButton) {
        AnimatorFactory.wobbleButton(sender)
    }
    
    @objc public func addAppleLogoAndSlider() {
        
        let logo = UIImageView.init(frame: CGRect.init(x: 156, y: 255, width: 65, height: 80))
        logo.image = UIImage.init(named: "AppleLogo_Black")
        
        let whiteLogo = UIImageView.init(frame: CGRect.init(x: 156, y: 294, width: 65, height: 80))
        whiteLogo.image = UIImage.init(named: "AppleLogo_White")
        self.whiteLogo = whiteLogo
        
        logo.layer.addSublayer(gradientLayer)
        addSubview(logo)
        logo.alpha = 0.3
        self.logoImage = logo
        
        AnimatorFactory.scaleLogo(logo)
        
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = logo.bounds.offsetBy(dx: 701, dy: 0)
        maskLayer.contents = logo.image?.cgImage
        self.maskLayer = maskLayer
        
        gradientLayer.frame = CGRect.init(x: -701 + 156, y: 255, width: 1200, height: 80)
        gradientLayer.mask = maskLayer
        
        self.layer.addSublayer(gradientLayer)
        
        
        let slide = UISlider.init(frame: CGRect.init(x: 67, y: 385, width: 242, height: 28))
        slide.value = 0.618
        self.addSubview(slide)
        self.slider = slide
        
        slide.addTarget(self, action: #selector(observeSlide(_:)), for: .valueChanged)
        
        AnimatorFactory.showSliderFromMiddle(slide)
    }
    
    @objc public func observeSlide(_ sender: UISlider) {
        let slideValue: CGFloat = CGFloat(sender.value)
        
        let positionX = -slideValue * 1135.0
        gradientLayer.frame.origin.x = positionX + 156
        maskLayer.frame = logoImage.bounds.offsetBy(dx: -positionX, dy: 0)
        
    }
    
    @objc public func addSwitch() {
        let aSwitch = UISwitch.init(frame: CGRect.init(x: 162, y: 667, width: 0, height: 0))
        aSwitch.alpha = 0.0
        self.addSubview(aSwitch)
        aSwitch.addTarget(self, action: #selector(shutDownScreen(_:)), for: .valueChanged)
        
        AnimatorFactory.springSwitchFromButton(aSwitch)
    }
    
    @objc public func shutDownScreen(_ sender: UISwitch) {
        if !sender.isOn {
            UIView.animate(withDuration: 1.0, delay: 0, options: [], animations: {
                self.appleLabel.alpha = 0.0
                self.button.alpha = 0.0
                self.maskLayer.opacity = 0.0
                self.gradientLayer.opacity = 0.0
                self.slider.alpha = 0.0
                sender.alpha = 0.0
                UIView.animate(withDuration: 1.0, animations: {
                    self.backgroundColor = UIColor.black
                })
            }, completion: { (_) in
                
                self.appleLabel.removeFromSuperview()
                self.button.removeFromSuperview()
                self.maskLayer.removeFromSuperlayer()
                self.gradientLayer.removeFromSuperlayer()
                self.slider.removeFromSuperview()
                sender.removeFromSuperview()
                
                delay(seconds: 2, completion: {
                    self.addSubview(self.whiteLogo)
                })
                
            })
        }
    }
    
}




"""
