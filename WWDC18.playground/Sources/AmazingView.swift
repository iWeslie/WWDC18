//
//  AmazingView.swift
//  CreationPlayground
//
//  Created by Weslie on 3/19/18.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

public var animationTimer = Timer()
public var iPhoneScreen = UIView()

public class AmazingView: UIView {
    
    var codingFlowTimer: Timer?
    var currentTime: Float = 0.0
    
    var demoView = DemoAppView()
    var slideFrame = CGRect(x: 75, y: 556, width: 226, height: 33)
    var fakeSlide = UIImageView()
    var fakeSlideCoverButton = UIButton()
    var canSlideUnlock = false
    var timeAndDateImg = UIImageView()
    var realSlide = UIImageView()
    let touchDownRange = (70...300, 550...590)
    let springBackRange = (0...375, 0...667)
    let slideOverRange = (375...500, 0...700)
    var slideBeginX: CGFloat = 0
    var slideEndX: CGFloat = 0
    var slidePointOffsetX: CGFloat = 0.0 {
        didSet {
            // can not slide left
            if slidePointOffsetX > 0 {
                timeAndDateImg.frame.origin.x = slidePointOffsetX + 75
                realSlide.frame.origin.x = slidePointOffsetX + 75
            }
        }
    }
    
    let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        
        // create a gradient layer
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // set the layer's color black -> white -> black
        let colors: [CGColor] = [UIColor.black.cgColor,
                                 UIColor.white.cgColor,
                                 UIColor.black.cgColor]
        gradientLayer.colors = colors
        // initial color location 
        let locations: [NSNumber] = [0.25, 0.5, 0.75]
        gradientLayer.locations = locations
        
        
        return gradientLayer
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 768, height: 692)
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        backgroundColor = UIColor.white

//        addTextAttributes()

        let textview = UITextView(frame: CGRect.init(x: 12, y: 12, width: 361, height: 667))
        self.addSubview(textview)
        textview.text = nil
        textview.backgroundColor = UIColor.white
        textview.layer.cornerRadius = 4.0
        textview.layer.masksToBounds = true
        textview.isUserInteractionEnabled = false
        var nextCharacterIndexToBeShown = 0

        var countDown = 0
        
        let interval: Float = 0.02
        
        animationTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: true, block: { (timer) in
            let chars = Array(aText)
            if nextCharacterIndexToBeShown < chars.count {
                
                let subStr = textViewAttributedString.attributedSubstring(from: NSRange.init(location: 0, length: countDown))
                textview.attributedText = subStr
                countDown += 1

                let timeString = notRounding(number: self.currentTime, afterPoint: 2)
                self.currentTime += interval
                if textview.contentSize.height > 667 {
                    textview.contentOffset.y = textview.contentSize.height - textview.bounds.size.height
                }
                
                nextCharacterIndexToBeShown += 1
                
//                iPhoneScreen.isUserInteractionEnabled = false
                
                switch timeString {
                case colorBackground:
                    UIView.animate(withDuration: 1.0, animations: {
                        textview.backgroundColor = UIColor.black
                        self.backgroundColor = UIColor.darkGray
                        // plain text
                        textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: wholeRange)
                    })
                case colorMarkUp:
                    UIView.animate(withDuration: 1.0, animations: {
                        // mark up
                        for rangeArray in markRangeArray {
                            for range in rangeArray {
                                textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: markup, range: range)
                            }
                        }
                    })
                case colorStrings:
                    UIView.animate(withDuration: 1.0, animations: {
                        // strings
                        for rangeArray in stringsRangeArray {
                            for range in rangeArray {
                                textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: strings, range: range)
                            }
                        }
                    })
                case colorNumbers:
                    UIView.animate(withDuration: 1.0, animations: {
                        // number
                        for rangeArray in charAndNumRangeArray {
                            for range in rangeArray {
                                textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: charAndNum, range: range)
                            }
                        }
                    })
                case colorKeywords:
                    UIView.animate(withDuration: 1.0, animations: {
                        // keyword
                        for rangeArray in keywordRangeArray {
                            for range in rangeArray {
                                textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: keyWords, range: range)
                            }
                        }
                    })
                case colorCustom:
                    UIView.animate(withDuration: 1.0, animations: {
                        // custom
                        for rangeArray in customRangeArray {
                            for range in rangeArray {
                                textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: custom, range: range)
                            }
                        }
                    })
                case colorSystem:
                    UIView.animate(withDuration: 1.0, animations: {
                        addTextAttributes()
                    })
                case showMainScreenDate:
                    timer.fireDate = Date.distantFuture
                    self.showMainWindow()
                    iPhoneScreen.isUserInteractionEnabled = true
                case waitTouchUnlockDate:
                    timer.fireDate = Date.distantFuture
                    iPhoneScreen.isUserInteractionEnabled = true
                case showRealSlideDate:
                    timer.fireDate = Date.distantFuture
                    self.showRealSlideToUnlock()
                    iPhoneScreen.isUserInteractionEnabled = true
                case didLaunchAppDate:
                    timer.fireDate = Date.distantFuture
                    iPhoneScreen.isUserInteractionEnabled = true
                case initializeCodingFlowDate:
                    timer.fireDate = Date.distantFuture
                    self.showCodeFlowView()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoShowLabelDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.addLabel()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoLabelFadeAwayDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.labelFadeAway()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoShowILoveAppleDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.addAnotherLabel()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoBounceLabelDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.bounceLabel()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoShowButtonDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.addClickMeButtonWithBounce()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoWaitClickButtonDate:
                    timer.fireDate = Date.distantFuture
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoShowImageAndSlider:
                    timer.fireDate = Date.distantFuture
                    self.demoView.addAppleLogoAndSlider()
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoSliderDidChangeValueDate:
                    timer.fireDate = Date.distantFuture
                    iPhoneScreen.isUserInteractionEnabled = true
                case demoShowSwitchDate:
                    timer.fireDate = Date.distantFuture
                    self.demoView.addSwitch()
                    iPhoneScreen.isUserInteractionEnabled = true
                default: break
                }
                
                
                for t in delayArray {
                    if t == timeString {
                        Thread.sleep(forTimeInterval: 1)
                    }
                }

                for t in doubleDelayArray {
                    if t == timeString {
                        Thread.sleep(forTimeInterval: 2)
                    }
                }

            } else {
                timer.invalidate()
                textview.isUserInteractionEnabled = true
            }
        })
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showMainWindow() {
        // show the whole screen
//        let lockScreen = UIView.init(frame: CGRect.init(x: 385, y: 12, width: 375, height: 667))
        let lockScreen = UIView()
        lockScreen.bounds = CGRect.init(x: 0, y: 0, width: 375, height: 667)
        lockScreen.center = CGPoint(x: 572.5, y: 346)
        lockScreen.layer.cornerRadius = 4
        lockScreen.layer.masksToBounds = true
        lockScreen.backgroundColor = UIColor.white
        
        let animation = AnimatorFactory.showMainScreenFromRotation()
        lockScreen.layer.add(animation, forKey: nil)
        
        lockScreen.clipsToBounds = true
        
        iPhoneScreen = lockScreen
        self.addSubview(lockScreen)
        
        
        delay(seconds: 1.0) {
            self.showLockScreen()
        }

    }
    
    // MARK:- package make the image label to the mask
    public func makeMask(of aView: UIImageView) {
        // create a mask and fill it with the 'slide to unlock' image
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame = aView.bounds.offsetBy(dx: aView.bounds.size.width, dy: 0)
        maskLayer.contents = aView.image?.cgImage
        // mask the gradient layer
        gradientLayer.mask = maskLayer
        
        // set the layer's position to the correct place
        gradientLayer.frame = CGRect.init(x: 75 - 226, y: 556, width: 226 * 3, height: 33)
        gradientLayer.position = CGPoint(x: aView.frame.size.width / 2, y: aView.frame.size.height / 2)
        aView.layer.addSublayer(gradientLayer)
        
        // slide underneath flash light
        let gradientAnimation = AnimatorFactory.gradientAnimationForSlideToUnlock()
        gradientLayer.add(gradientAnimation, forKey: nil)
        
    }
    
    public func showLockScreen() {
        
        // add status bar to the screen
        let statusBarImg = UIImageView.init(frame: CGRect.init(x: 0, y: -50, width: 375, height: 20))
        statusBarImg.image = UIImage.init(named: "StatusBar")
        statusBarImg.contentMode = .scaleAspectFit
        statusBarImg.alpha = 0.0
        iPhoneScreen.addSubview(statusBarImg)
        AnimatorFactory.lockScreenAnimate(view: statusBarImg, direction: .down).startAnimation()
        // add time and date to the screen
        let timeAndDateImg = UIImageView.init(frame: CGRect.init(x: 75, y: -10, width: 226, height: 134))
        timeAndDateImg.image = UIImage.init(named: "TimeAndDate")
        timeAndDateImg.contentMode = .scaleAspectFit
        timeAndDateImg.alpha = 0.0
        self.timeAndDateImg = timeAndDateImg
        iPhoneScreen.addSubview(timeAndDateImg)
        AnimatorFactory.lockScreenAnimate(view: timeAndDateImg, direction: .down).startAnimation()
        
        // add 'slide to unlock' to the screen
        let fakeSlideImg = UIImageView.init(frame: CGRect.init(x: 75, y: 700, width: 226, height: 33))
        fakeSlideImg.image = UIImage.init(named: "SlideToUnlock")
        // add gradient layer to slide image view
        fakeSlideImg.layer.addSublayer(gradientLayer)
        iPhoneScreen.addSubview(fakeSlideImg)
        
        // waiting touch to hide
        self.fakeSlide = fakeSlideImg
        
        makeMask(of: fakeSlideImg)
        // start slide animation
        AnimatorFactory.lockScreenAnimate(view: fakeSlideImg, direction: .up).startAnimation()
        
        let coverSlideButton = UIButton(frame: slideFrame)
        coverSlideButton.addTarget(self, action: #selector(hideFakeSlide), for: .touchDown)
        fakeSlideCoverButton = coverSlideButton
        iPhoneScreen.addSubview(coverSlideButton)
        
        delay(seconds: 1.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }
        
    }
    
    @objc public func hideFakeSlide(_ sender: UIButton) {
        AnimatorFactory.hideFakeSlide(view: fakeSlide, coverButton: sender).startAnimation()
        
        delay(seconds: 2.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }
    }
    
    @objc public func showRealSlideToUnlock() {
        // add 'slide to unlock' to the screen
        let realSlideImg = UIImageView.init(frame: CGRect.init(x: 75, y: 700, width: 226, height: 33))
        realSlideImg.image = UIImage.init(named: "SlideToUnlock")
//        realSlideImg.isUserInteractionEnabled = true
        // add gradient layer to slide image view
        realSlideImg.layer.addSublayer(gradientLayer)
        iPhoneScreen.addSubview(realSlideImg)
        
        makeMask(of: realSlideImg)
        
        // ready to slide and move
        self.realSlide = realSlideImg

        // start slide animation
        AnimatorFactory.lockScreenAnimate(view: realSlideImg, direction: .up).startAnimation()
        
        // allow slide to unlock touch move function call
        canSlideUnlock = true
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if canSlideUnlock {
            for touch in touches {
                let point = touch.location(in: iPhoneScreen)
                self.slideBeginX = point.x
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if canSlideUnlock {
            for touch in touches {
                let point = touch.location(in: iPhoneScreen)
                if springBackRange.0.contains(Int(point.x)) && springBackRange.1.contains(Int(point.y)) {
                    slidePointOffsetX = point.x - slideBeginX
                } else if slideOverRange.0.contains(Int(point.x)) && slideOverRange.1.contains(Int(point.y)) {
                    // remove slide and time label
                    
                    let anim = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut) {
                        self.timeAndDateImg.frame.origin.x = 400
                        self.timeAndDateImg.alpha = 0
                        self.realSlide.frame.origin.x = 400
                        self.realSlide.alpha = 0
                    }
                    anim.addCompletion({ (_) in
                        self.showDemoApp()
                    })
                    self.canSlideUnlock = false
                    anim.startAnimation()
                    
                }
            }
        }
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if canSlideUnlock {
            for touch in touches {
                let point = touch.location(in: iPhoneScreen)
                self.slideEndX = point.x
                if springBackRange.0.contains(Int(point.x)) && springBackRange.1.contains(Int(point.y)) {
                    // spring back
                    AnimatorFactory.springBack(timeAndDateImg).startAnimation()
                    AnimatorFactory.springBack(realSlide).startAnimation()
                }
            }
        }
    }
    
    @objc public func showDemoApp() {
        let demoSize = CGSize(width: 70, height: 70)
        let demoApp = UIImageView.init(frame: CGRect.init(origin: CGPoint.init(x: -142, y: -132), size: CGSize.init(width: 120, height: 120)))
        demoApp.image = UIImage.init(named: "AppIcon")
        demoApp.alpha = 0.0
        iPhoneScreen.addSubview(demoApp)
        
        let wwdcLogo = UIImageView.init(frame: CGRect.init(x: 375, y: 312, width: 241, height: 43))
        wwdcLogo.image = UIImage.init(named: "WWDCLogo")
        wwdcLogo.alpha = 0.0
        iPhoneScreen.addSubview(wwdcLogo)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showDemoScreen))
        demoApp.isUserInteractionEnabled = true
        demoApp.addGestureRecognizer(tap)
        
        // show the demo app from top-left side of the screen
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            demoApp.frame.origin.x = 20
            demoApp.frame.origin.y = 30
            demoApp.frame.size = demoSize
            demoApp.alpha = 1
        }) { (_) in

        }
        // show the wwdc logo with spring animation
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            wwdcLogo.frame.origin.x = 67
            wwdcLogo.alpha = 1.0
        }) { (_) in
            
        }
        
        delay(seconds: 1.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }

    }
    
    @objc public func showDemoScreen() {
        
        let demoView = DemoAppView(frame: CGRect.init(x: 0, y: 0, width: 375, height: 667))
        iPhoneScreen.addSubview(demoView)
        self.demoView = demoView
        
        delay(seconds: 1.0) {
            animationTimer.fireDate = Date.distantPast
            iPhoneScreen.isUserInteractionEnabled = false
        }
    }
    
    @objc public func showCodeFlowView() {
        
        addCodeTextAttributes()
        
        let textview = UITextView(frame: demoView.frame)
        demoView.addSubview(textview)
        textview.text = nil
        textview.alpha = 0
        textview.backgroundColor = UIColor.black
        textview.layer.cornerRadius = 4.0
        textview.layer.masksToBounds = true
        textview.isUserInteractionEnabled = false
        var nextCharacterIndexToBeShown = 0
        
        var countDown = 0
        
        UIView.animate(withDuration: 1.0, animations: {
            textview.alpha = 1.0
        })
        
        delay(seconds: 1.0) {
            self.codingFlowTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
                let chars = Array(codeText)
                if nextCharacterIndexToBeShown < chars.count {
                    
                    let subStr = codeTextAttributedString.attributedSubstring(from: NSRange.init(location: 0, length: countDown))
                    textview.attributedText = subStr
                    countDown += 30
                    
                    if textview.contentSize.height > 667 {
                        textview.contentOffset.y = textview.contentSize.height - textview.bounds.size.height
                    }
                    
                    nextCharacterIndexToBeShown += 30
                    
                } else {
                    timer.invalidate()
                    textview.isUserInteractionEnabled = true
                    textview.isEditable = false
                    
                    // remove codeing flow
                    delay(seconds: 1.0, completion: {
                        UIView.animate(withDuration: 1.0, animations: {
                            textview.alpha = 0.0
                        }, completion: { (_) in
                            textview.removeFromSuperview()
                            
                            delay(seconds: 1.0) {
                                animationTimer.fireDate = Date.distantPast
                                iPhoneScreen.isUserInteractionEnabled = false
                            }
                            
                        })
                    })
                    
                    
                }
            })
        }
        
        
        
        
    }

}
