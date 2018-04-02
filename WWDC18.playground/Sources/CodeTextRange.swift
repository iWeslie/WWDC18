//
//  CodeTextRange.swift
//  CreationPlayground
//
//  Created by Weslie on 2018/3/27.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

var codeTextAttributedString = NSMutableAttributedString(string: codeText)
let codeWholeRange = NSRange.init(location: 0, length: codeTextAttributedString.length)

func rangeOfCodeSubString(_ subString: String) -> Array<NSRange> {
    
    var rangeArray = [NSRange]()
    
    var tempStr = ""
    
    let strLength: Int = Int(subString.count)
    
    for i in 0..<Int(codeText.count) - strLength + 1 {
        tempStr = (codeText as NSString).substring(with: NSRange.init(location: i, length: strLength))
        if tempStr == subString {
            let range = NSRange.init(location: i, length: strLength)
            rangeArray.append(range)
        }
    }
    
    return rangeArray
}

let kRange000 = rangeOfCodeSubString("let")
let kRange001 = rangeOfCodeSubString("public")
let kRange002 = rangeOfCodeSubString("class")
let kRange003 = rangeOfCodeSubString("override")
let kRange004 = rangeOfCodeSubString("init")
let kRange005 = rangeOfCodeSubString("super")
let kRange006 = rangeOfCodeSubString("required")
let kRange007 = rangeOfCodeSubString("self")
let kRange008 = rangeOfCodeSubString("import")
let kRange009 = rangeOfCodeSubString("enum")
let kRange010 = rangeOfCodeSubString("case")
let kRange011 = rangeOfCodeSubString("func")
let kRange012 = rangeOfCodeSubString("@escaping")
let kRange013 = rangeOfCodeSubString("static")
let kRange014 = rangeOfCodeSubString("return")
let kRange015 = rangeOfCodeSubString("var")
let kRange016 = rangeOfCodeSubString("if")
let kRange017 = rangeOfCodeSubString("else")
let kRange018 = rangeOfCodeSubString("_")
let kRange019 = rangeOfCodeSubString(" ")
let kRange020 = rangeOfCodeSubString("nil")
let kRange021 = rangeOfCodeSubString("true")
let kRange022 = rangeOfCodeSubString("false")

let kRangeA21 = rangeOfCodeSubString("@objc")
let kRangeA22 = rangeOfCodeSubString("#selector")

let codeKeywordRangeArray = [kRange000,kRange001,kRange002,kRange003,
                             kRange004,kRange005,kRange006,kRange007,
                             kRange008,kRange009,kRange010,kRange011,
                             kRange012,kRange013,kRange014,kRange015,
                             kRange016,kRange017,kRange018,kRange019,
                             kRange020,kRange021,kRange022,kRangeA21,
                             kRangeA22]


let kRange023 = rangeOfCodeSubString("UIView")
let kRange024 = rangeOfCodeSubString("UIViewPropertyAnimator")
let kRange025 = rangeOfCodeSubString("UISpringTimingParameters")
let kRange026 = rangeOfCodeSubString("UIImageView")
let kRange027 = rangeOfCodeSubString("UIColor")
let kRange028 = rangeOfCodeSubString("UIButton")
let kRange029 = rangeOfCodeSubString("UILabel")
let kRange030 = rangeOfCodeSubString("UIFont")
let kRange031 = rangeOfCodeSubString("UISlider")
let kRange032 = rangeOfCodeSubString("UISwitch")

let kRange033 = rangeOfCodeSubString("CASpringAnimation")
let kRange034 = rangeOfCodeSubString("CAKeyframeAnimation")
let kRange035 = rangeOfCodeSubString("CABasicAnimation")
let kRange036 = rangeOfCodeSubString("CAAnimationGroup")

let kRange037 = rangeOfCodeSubString("CGRect")
let kRange038 = rangeOfCodeSubString("CGFloat")
let kRange039 = rangeOfCodeSubString("CGPoint")
let kRange040 = rangeOfCodeSubString("CGAffineTransform")

let kRange041 = rangeOfCodeSubString("frame")
let kRange042 = rangeOfCodeSubString("backgroundColor")
let kRange043 = rangeOfCodeSubString("white")
let kRange044 = rangeOfCodeSubString("NSCoder")
let kRange045 = rangeOfCodeSubString("fatalError")
let kRange046 = rangeOfCodeSubString("String")
let kRange047 = rangeOfCodeSubString("Double")
let kRange048 = rangeOfCodeSubString("Void")
let kRange049 = rangeOfCodeSubString("DispatchQueue")
let kRange050 = rangeOfCodeSubString("main")
let kRange051 = rangeOfCodeSubString("asyncAfter")
let kRange052 = rangeOfCodeSubString("now")
let kRange053 = rangeOfCodeSubString("fromValue")
let kRange054 = rangeOfCodeSubString("toValue")
let kRange055 = rangeOfCodeSubString("duration")
let kRange056 = rangeOfCodeSubString("settlingDuration")
let kRange057 = rangeOfCodeSubString("damping")
let kRange058 = rangeOfCodeSubString("stiffness")
let kRange059 = rangeOfCodeSubString("initialVelocity")
let kRange060 = rangeOfCodeSubString("fillMode")
let kRange061 = rangeOfCodeSubString("repeatCount")
let kRange062 = rangeOfCodeSubString("addAnimations")
let kRange063 = rangeOfCodeSubString("origin")
let kRange064 = rangeOfCodeSubString(" ")
let kRange065 = rangeOfCodeSubString("easeIn")
let kRange066 = rangeOfCodeSubString("removeFromSuperview")
let kRange067 = rangeOfCodeSubString("easeInOut")
let kRange068 = rangeOfCodeSubString("linear")
let kRange069 = rangeOfCodeSubString("transform")
let kRange070 = rangeOfCodeSubString("addCompletion")
let kRange071 = rangeOfCodeSubString("easeOut")
let kRange072 = rangeOfCodeSubString("animate")
let kRange073 = rangeOfCodeSubString("curveEaseOut")
let kRange074 = rangeOfCodeSubString("bounds")
let kRange075 = rangeOfCodeSubString("center")
let kRange076 = rangeOfCodeSubString("superview")
let kRange077 = rangeOfCodeSubString("font")
let kRange078 = rangeOfCodeSubString("systemFont")
let kRange079 = rangeOfCodeSubString("ultraLight")
let kRange080 = rangeOfCodeSubString("sizeToFit")
let kRange081 = rangeOfCodeSubString("values")
let kRange082 = rangeOfCodeSubString("keyTimes")
let kRange083 = rangeOfCodeSubString("layer")
let kRange084 = rangeOfCodeSubString("add")
let kRange085 = rangeOfCodeSubString("curveEaseOut")

let kRangeA65 = rangeOfCodeSubString("CAGradientLayer")
let kRangeA66 = rangeOfCodeSubString("startPoint")
let kRangeA67 = rangeOfCodeSubString("endPoint")
let kRangeA68 = rangeOfCodeSubString("CGColor")
let kRangeA69 = rangeOfCodeSubString("cgColor")
let kRangeA70 = rangeOfCodeSubString("NSNumber")
let kRangeA71 = rangeOfCodeSubString(".locations")
let kRangeA72 = rangeOfCodeSubString(".image")
let kRangeA73 = rangeOfCodeSubString("scaleToFill")
let kRangeA74 = rangeOfCodeSubString("startAnimation")
let kRangeA75 = rangeOfCodeSubString(".normal")
let kRangeA76 = rangeOfCodeSubString("addTarget")
let kRangeA77 = rangeOfCodeSubString("touchUpInside")
let kRangeA78 = rangeOfCodeSubString("offsetBy")
let kRangeA79 = rangeOfCodeSubString("cgImage")
let kRangeA80 = rangeOfCodeSubString("addSublayer")
let kRangeA81 = rangeOfCodeSubString("valueChanged")
let kRangeA82 = rangeOfCodeSubString(".origin.x")
let kRangeA83 = rangeOfCodeSubString("bounds")
let kRangeA84 = rangeOfCodeSubString("isOn")
let kRangeA85 = rangeOfCodeSubString(".origin.y")
let kRangeA86 = rangeOfCodeSubString("alpha")
let kRangeA87 = rangeOfCodeSubString("addSubview")

let codeSystemRangeArray =  [kRange023,kRange044,kRange065,kRangeA65,
                             kRange024,kRange045,kRange066,kRangeA66,
                             kRange025,kRange046,kRange067,kRangeA67,
                             kRange026,kRange047,kRange068,kRangeA68,
                             kRange027,kRange048,kRange069,kRangeA69,
                             kRange028,kRange049,kRange070,kRangeA70,
                             kRange029,kRange050,kRange071,kRangeA71,
                             kRange030,kRange051,kRange072,kRangeA72,
                             kRange031,kRange052,kRange073,kRangeA73,
                             kRange032,kRange053,kRange074,kRangeA74,
                             kRange033,kRange054,kRange075,kRangeA75,
                             kRange034,kRange055,kRange076,kRangeA76,
                             kRange035,kRange056,kRange077,kRangeA77,
                             kRange036,kRange057,kRange078,kRangeA78,
                             kRange037,kRange058,kRange079,kRangeA79,
                             kRange038,kRange059,kRange080,kRangeA80,
                             kRange039,kRange060,kRange081,kRangeA81,
                             kRange040,kRange061,kRange082,kRangeA82,
                             kRange041,kRange062,kRange083,kRangeA83,
                             kRange042,kRange063,kRange084,kRangeA84,
                             kRange043,kRange064,kRange085,kRangeA85,
                             kRangeA86,kRangeA87]

let kRangeA16 = rangeOfCodeSubString("0")
let kRange116 = rangeOfCodeSubString("1")
let kRange117 = rangeOfCodeSubString("2")
let kRange118 = rangeOfCodeSubString("3")
let kRange119 = rangeOfCodeSubString("4")
let kRange120 = rangeOfCodeSubString("5")
let kRange121 = rangeOfCodeSubString("6")
let kRange122 = rangeOfCodeSubString("7")
let kRange123 = rangeOfCodeSubString("8")
let kRange124 = rangeOfCodeSubString("9")

let codeNumRangeArray = [kRangeA16,
                         kRange116,
                         kRange117,
                         kRange118,
                         kRange119,
                         kRange120,
                         kRange121,
                         kRange122,
                         kRange123,
                         kRange124]

let kRange125 = rangeOfCodeSubString("LockScreenAnimatorDirection")
let kRange126 = rangeOfCodeSubString("appIconCoverFade")
let kRange127 = rangeOfCodeSubString("AnimatorFactory.scaleToFade")
let kRange128 = rangeOfCodeSubString("AnimatorFactory.changeLabelText")
let kRange129 = rangeOfCodeSubString("AnimatorFactory.spingLabel")
let kRange130 = rangeOfCodeSubString("AnimatorFactory.easeInFromEdge")
let kRange131 = rangeOfCodeSubString("AnimatorFactory.wobbleButton")
let kRange132 = rangeOfCodeSubString("AnimatorFactory.scaleLogo")
let kRange133 = rangeOfCodeSubString("AnimatorFactory.showSliderFromMiddle")
let kRange134 = rangeOfCodeSubString("AnimatorFactory.springSwitchFromButton")
let kRange135 = rangeOfCodeSubString("appleLabel")
let kRange136 = rangeOfCodeSubString("button")
let kRange137 = rangeOfCodeSubString(" ")
let kRange138 = rangeOfCodeSubString("maskLayer")
let kRange139 = rangeOfCodeSubString("logoImage")
let kRange140 = rangeOfCodeSubString("whiteLogo")
let kRange141 = rangeOfCodeSubString(" ")

let codeCustomRangeArray = [kRange125,
                            kRange126,
                            kRange127,
                            kRange128,
                            kRange129,
                            kRange130,
                            kRange131,
                            kRange132,
                            kRange133,
                            kRange134,
                            kRange135,
                            kRange136,
                            kRange137,
                            kRange138,
                            kRange139,
                            kRange140,
                            kRange141]

let kRange142 = rangeOfCodeSubString("\"up\"")
let kRange143 = rangeOfCodeSubString("\"down\"")
let kRange144 = rangeOfCodeSubString("\"transform.rotation.y\"")
let kRange145 = rangeOfCodeSubString("\"locations\"")
let kRange146 = rangeOfCodeSubString("\"transform.rotation\"")
let kRange147 = rangeOfCodeSubString("\"transform.scale\"")
let kRange148 = rangeOfCodeSubString("\"position.y\"")
let kRange149 = rangeOfCodeSubString("\"opacity\"")
let kRange150 = rangeOfCodeSubString("\"init(coder:) has not been implemented\"")
let kRange151 = rangeOfCodeSubString("\"AppIcon\"")
let kRange152 = rangeOfCodeSubString("\"Label\"")
let kRange153 = rangeOfCodeSubString("\"I Love Apple\"")
let kRange154 = rangeOfCodeSubString("\"Click Me\"")
let kRange155 = rangeOfCodeSubString("\"AppleLogo_Black\"")
let kRange156 = rangeOfCodeSubString("\"AppleLogo_White\"")

let codeStringRangeArray = [kRange142,
                            kRange143,
                            kRange144,
                            kRange145,
                            kRange146,
                            kRange147,
                            kRange148,
                            kRange149,
                            kRange150,
                            kRange151,
                            kRange152,
                            kRange153,
                            kRange154,
                            kRange155,
                            kRange156]

let kRangeAA0 = rangeOfCodeSubString(".")
let kRangeAA1 = rangeOfCodeSubString("completion")
let kRangeAA2 = rangeOfCodeSubString("Completion")
let kRangeAA3 = rangeOfCodeSubString(":")


let plainSpecificCodeText = [kRangeAA0,
                             kRangeAA1,
                             kRangeAA2,
                             kRangeAA3]


func addCodeTextAttributes() {
    // plain text
    codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: codeWholeRange)
    // keyword
    for rangeArray in codeKeywordRangeArray {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: keyWords, range: range)
        }
    }
    // system
    for rangeArray in codeSystemRangeArray {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: system, range: range)
        }
    }
    // number
    for rangeArray in codeNumRangeArray {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: charAndNum, range: range)
        }
    }
    // strings
    for rangeArray in codeStringRangeArray {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: strings, range: range)
        }
    }
    // custom
    for rangeArray in codeCustomRangeArray {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: custom, range: range)
        }
    }
    // specific plain text
    for rangeArray in plainSpecificCodeText {
        for range in rangeArray {
            codeTextAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
        }
    }
    
}
