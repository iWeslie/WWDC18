//
//  DemoAppView.swift
//  CreationPlayground
//
//  Created by Weslie on 3/22/18.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

public class DemoAppView: UIView {

    let gradientLayer: CAGradientLayer = {
        
        // create gradient layer
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
    
    var label = UILabel()
    var appleLabel = UILabel()
    var button = UIButton()
    var maskLayer = CALayer()
    var logoImage = UIImageView()
    var whiteLogo = UIImageView()
    var slider = UISlider()

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
        // show the demo screen and hide the background logo
        UIView.animate(withDuration: 0.15, delay: 0, options: [], animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    // MARK:- let label
    public func addLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 169, y: 322, width: 50, height: 20)
        label.text = "Label"
        self.addSubview(label)
        self.label = label
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
        }
    }
    
    
    public func labelFadeAway() {
        AnimatorFactory.changeLabelText(from: label).startAnimation()
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
        }
        
    }
    
    public func bounceLabel() {
        AnimatorFactory.spingLabel(appleLabel)
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
        }
        
    }
    
    public func addAnotherLabel() {
        let label = UILabel()
        label.frame = CGRect(x: -120, y: 322, width: 100, height: 20)
        label.text = "I Love Apple"
        self.addSubview(label)
        self.appleLabel = label
        label.alpha = 0
        AnimatorFactory.easeInFromEdge(with: label).startAnimation()
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
        }
    }
    
    public func addClickMeButtonWithBounce() {
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
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }
        
    }
    
    @objc public func shakeButton(_ sender: UIButton) {
        AnimatorFactory.wobbleButton(sender)
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }
    }
    
    public func addAppleLogoAndSlider() {
        
        let logo = UIImageView.init(frame: CGRect.init(x: 156, y: 255, width: 65, height: 80))
        logo.image = UIImage.init(named: "AppleLogo_Black")
        
        let whiteLogo = UIImageView.init(frame: CGRect.init(x: 156, y: 294, width: 65, height: 80))
        whiteLogo.image = UIImage.init(named: "AppleLogo_White")
        self.whiteLogo = whiteLogo
        
        // add gradient layer to slide image view
        logo.layer.addSublayer(gradientLayer)
        addSubview(logo)
        logo.alpha = 0.3
        self.logoImage = logo
        
        AnimatorFactory.scaleLogo(logo)
        
        // create a mask and fill it with the 'slide to unlock' image
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = logo.bounds.offsetBy(dx: 701, dy: 0)
        maskLayer.contents = logo.image?.cgImage
        self.maskLayer = maskLayer
        
//        gradientLayer.frame = CGRect.init(x: -412, y: 0, width: 1200, height: 80)
        gradientLayer.frame = CGRect.init(x: -701 + 156, y: 255, width: 1200, height: 80)
        gradientLayer.mask = maskLayer
        
        self.layer.addSublayer(gradientLayer)
        
        
        let slide = UISlider.init(frame: CGRect.init(x: 67, y: 385, width: 242, height: 28))
        slide.value = 0.618
        self.addSubview(slide)
        self.slider = slide
        
        slide.addTarget(self, action: #selector(observeSlide(_:)), for: .valueChanged)

        AnimatorFactory.showSliderFromMiddle(slide)
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
        }

    }
    
    @objc public func observeSlide(_ sender: UISlider) {
        let slideValue: CGFloat = CGFloat(sender.value)
        
        // value == 0 , x = 156; value == 1, x = -979
        let positionX = -slideValue * 1135.0
        // change rainbow layer position
//        gradientLayer.frame.origin.x = positionX
        gradientLayer.frame.origin.x = positionX + 156
        // change mask layer position
        maskLayer.frame = logoImage.bounds.offsetBy(dx: -positionX, dy: 0)
     
        delay(seconds: 5.0) {
            animationTimer.fireDate = Date.distantPast
        }

    }
    
     public func addSwitch() {
        let aSwitch = UISwitch.init(frame: CGRect.init(x: 162, y: 667, width: 0, height: 0))
//        aSwitch.setOn(true, animated: false)
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
                // view fade out
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
                
                animationTimer.fireDate = Date.distantPast
                
                delay(seconds: 2, completion: {
                    self.addSubview(self.whiteLogo)
                })
                
            })
        }
    }
    
}
