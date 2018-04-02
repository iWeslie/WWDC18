//
//  TextRange.swift
//  CreationPlayground
//
//  Created by Weslie on 26/03/2018.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

var textViewAttributedString = NSMutableAttributedString(string: aText)

let wholeRange = NSRange.init(location: 0, length: textViewAttributedString.length)

func rangeOfSubString(_ subString: String) -> Array<NSRange> {
    
    var rangeArray = [NSRange]()
    
    var tempStr = ""
    
    let strLength: Int = Int(subString.count)

    for i in 0..<Int(aText.count) - strLength + 1 {
        tempStr = (aText as NSString).substring(with: NSRange.init(location: i, length: strLength))
        if tempStr == subString {
            let range = NSRange.init(location: i, length: strLength)
            rangeArray.append(range)
        }
    }
    
    return rangeArray
}



let kStrRange000 = rangeOfSubString("let")
let kStrRange001 = rangeOfSubString("public")
let kStrRange002 = rangeOfSubString("class")
let kStrRange003 = rangeOfSubString("override")
let kStrRange004 = rangeOfSubString("init")
let kStrRange005 = rangeOfSubString("super")
let kStrRange006 = rangeOfSubString("required")
let kStrRange007 = rangeOfSubString("self")
let kStrRange008 = rangeOfSubString("import")
let kStrRange009 = rangeOfSubString("enum")
let kStrRange010 = rangeOfSubString("case")
let kStrRange011 = rangeOfSubString("func")
let kStrRange012 = rangeOfSubString("@escaping")
let kStrRange013 = rangeOfSubString("static")
let kStrRange014 = rangeOfSubString("return")
let kStrRange015 = rangeOfSubString("var")
let kStrRange016 = rangeOfSubString("if")
let kStrRange017 = rangeOfSubString("else")
let kStrRange018 = rangeOfSubString("_")
let kStrRange019 = rangeOfSubString(" ")
let kStrRange020 = rangeOfSubString("nil")
let kStrRange021 = rangeOfSubString("true")
let kStrRange022 = rangeOfSubString("false")

let kStrRangeA21 = rangeOfSubString("@objc")
let kStrRangeA22 = rangeOfSubString("#selector")


let keywordRangeArray = [kStrRange000,kStrRange001,kStrRange002,kStrRange003,
                         kStrRange004,kStrRange005,kStrRange006,kStrRange007,
                         kStrRange008,kStrRange009,kStrRange010,kStrRange011,
                         kStrRange012,kStrRange013,kStrRange014,kStrRange015,
                         kStrRange016,kStrRange017,kStrRange018,kStrRange019,
                         kStrRange020,kStrRange021,kStrRange022,kStrRangeA21,
                         kStrRangeA22]

let kStrRange023 = rangeOfSubString("UIView")
let kStrRange024 = rangeOfSubString("UIViewPropertyAnimator")
let kStrRange025 = rangeOfSubString("UISpringTimingParameters")
let kStrRange026 = rangeOfSubString("UIImageView")
let kStrRange027 = rangeOfSubString("UIColor")
let kStrRange028 = rangeOfSubString("UIButton")
let kStrRange029 = rangeOfSubString("UILabel")
let kStrRange030 = rangeOfSubString("UIFont")
let kStrRange031 = rangeOfSubString("UISlider")
let kStrRange032 = rangeOfSubString("UISwitch")

let kStrRange033 = rangeOfSubString(".text")
let kStrRange034 = rangeOfSubString(".setTitle")
let kStrRange035 = rangeOfSubString("UIImage")
let kStrRange036 = rangeOfSubString(" ")

let kStrRange037 = rangeOfSubString("CGRect")
let kStrRange038 = rangeOfSubString("CGFloat")
let kStrRange039 = rangeOfSubString("CGPoint")
let kStrRange040 = rangeOfSubString("CGAffineTransform")

let kStrRange041 = rangeOfSubString("frame")
let kStrRange042 = rangeOfSubString("backgroundColor")
let kStrRange043 = rangeOfSubString("white")
let kStrRange044 = rangeOfSubString("NSCoder")
let kStrRange045 = rangeOfSubString("fatalError")
let kStrRange046 = rangeOfSubString("String")
let kStrRange047 = rangeOfSubString("Double")
let kStrRange048 = rangeOfSubString("Void")
let kStrRange049 = rangeOfSubString("DispatchQueue")
let kStrRange050 = rangeOfSubString("main")
let kStrRange051 = rangeOfSubString("asyncAfter")
let kStrRange052 = rangeOfSubString("now")
let kStrRange053 = rangeOfSubString("fromValue")
let kStrRange054 = rangeOfSubString("toValue")
let kStrRange055 = rangeOfSubString("duration")
let kStrRange056 = rangeOfSubString("settlingDuration")
let kStrRange057 = rangeOfSubString("damping")
let kStrRange058 = rangeOfSubString("stiffness")
let kStrRange059 = rangeOfSubString("initialVelocity")
let kStrRange060 = rangeOfSubString("fillMode")
let kStrRange061 = rangeOfSubString("repeatCount")
let kStrRange062 = rangeOfSubString("addAnimations")
let kStrRange063 = rangeOfSubString("origin")
let kStrRange064 = rangeOfSubString(" ")
let kStrRange065 = rangeOfSubString("easeIn")
let kStrRange066 = rangeOfSubString("removeFromSuperview")
let kStrRange067 = rangeOfSubString("easeInOut")
let kStrRange068 = rangeOfSubString("linear")
let kStrRange069 = rangeOfSubString("transform")
let kStrRange070 = rangeOfSubString("addCompletion")
let kStrRange071 = rangeOfSubString("easeOut")
let kStrRange072 = rangeOfSubString("animate")
let kStrRange073 = rangeOfSubString("curveEaseOut")
let kStrRange074 = rangeOfSubString("bounds")
let kStrRange075 = rangeOfSubString("center")
let kStrRange076 = rangeOfSubString("superview")
let kStrRange077 = rangeOfSubString("font")
let kStrRange078 = rangeOfSubString("systemFont")
let kStrRange079 = rangeOfSubString("ultraLight")
let kStrRange080 = rangeOfSubString("sizeToFit")
let kStrRange081 = rangeOfSubString("values")
let kStrRange082 = rangeOfSubString("keyTimes")
let kStrRange083 = rangeOfSubString("layer")
let kStrRange084 = rangeOfSubString("add")
let kStrRange085 = rangeOfSubString("curveEaseOut")

let kStrRangeA65 = rangeOfSubString("CAGradientLayer")
let kStrRangeA66 = rangeOfSubString("startPoint")
let kStrRangeA67 = rangeOfSubString("endPoint")
let kStrRangeA68 = rangeOfSubString("CGColor")
let kStrRangeA69 = rangeOfSubString("cgColor")
let kStrRangeA70 = rangeOfSubString("NSNumber")
let kStrRangeA71 = rangeOfSubString(".locations")
let kStrRangeA72 = rangeOfSubString(".image")
let kStrRangeA73 = rangeOfSubString("scaleToFill")
let kStrRangeA74 = rangeOfSubString("startAnimation")
let kStrRangeA75 = rangeOfSubString(".normal")
let kStrRangeA76 = rangeOfSubString("addTarget")
let kStrRangeA77 = rangeOfSubString("touchUpInside")
let kStrRangeA78 = rangeOfSubString("offsetBy")
let kStrRangeA79 = rangeOfSubString("cgImage")
let kStrRangeA80 = rangeOfSubString("addSublayer")
let kStrRangeA81 = rangeOfSubString("valueChanged")
let kStrRangeA82 = rangeOfSubString(".origin.x")
let kStrRangeA83 = rangeOfSubString("bounds")
let kStrRangeA84 = rangeOfSubString("isOn")
let kStrRangeA85 = rangeOfSubString(".origin.y")
let kStrRangeA86 = rangeOfSubString("alpha")
let kStrRangeA87 = rangeOfSubString("addSubview")

let systemRangeArray =  [kStrRange023,kStrRange044,kStrRange065,kStrRangeA65,
                         kStrRange024,kStrRange045,kStrRange066,kStrRangeA66,
                         kStrRange025,kStrRange046,kStrRange067,kStrRangeA67,
                         kStrRange026,kStrRange047,kStrRange068,kStrRangeA68,
                         kStrRange027,kStrRange048,kStrRange069,kStrRangeA69,
                         kStrRange028,kStrRange049,kStrRange070,kStrRangeA70,
                         kStrRange029,kStrRange050,kStrRange071,kStrRangeA71,
                         kStrRange030,kStrRange051,kStrRange072,kStrRangeA72,
                         kStrRange031,kStrRange052,kStrRange073,kStrRangeA73,
                         kStrRange032,kStrRange053,kStrRange074,kStrRangeA74,
                         kStrRange033,kStrRange054,kStrRange075,kStrRangeA75,
                         kStrRange034,kStrRange055,kStrRange076,kStrRangeA76,
                         kStrRange035,kStrRange056,kStrRange077,kStrRangeA77,
                         kStrRange036,kStrRange057,kStrRange078,kStrRangeA78,
                         kStrRange037,kStrRange058,kStrRange079,kStrRangeA79,
                         kStrRange038,kStrRange059,kStrRange080,kStrRangeA80,
                         kStrRange039,kStrRange060,kStrRange081,kStrRangeA81,
                         kStrRange040,kStrRange061,kStrRange082,kStrRangeA82,
                         kStrRange041,kStrRange062,kStrRange083,kStrRangeA83,
                         kStrRange042,kStrRange063,kStrRange084,kStrRangeA84,
                         kStrRange043,kStrRange064,kStrRange085,kStrRangeA85,
                         kStrRangeA86,kStrRangeA87]

let kStrRange086 = rangeOfSubString("0")
let kStrRange087 = rangeOfSubString("1")
let kStrRange088 = rangeOfSubString("2")
let kStrRange089 = rangeOfSubString("3")
let kStrRange090 = rangeOfSubString("4")
let kStrRange091 = rangeOfSubString("5")
let kStrRange092 = rangeOfSubString("6")
let kStrRange093 = rangeOfSubString("7")
let kStrRange094 = rangeOfSubString("8")
let kStrRange095 = rangeOfSubString("9")
//let kStrRange096 = rangeOfSubString(" ")
//let kStrRange097 = rangeOfSubString(" ")
//let kStrRange098 = rangeOfSubString(" ")
//let kStrRange099 = rangeOfSubString(" ")
//let kStrRange100 = rangeOfSubString("0.83")
//let kStrRange101 = rangeOfSubString("0.09")
//let kStrRange102 = rangeOfSubString("0.58")
//let kStrRange103 = rangeOfSubString("0.14")
//let kStrRange104 = rangeOfSubString("0.51")
//let kStrRange105 = rangeOfSubString("0.00")
//let kStrRange106 = rangeOfSubString("0.63")


let charAndNumRangeArray = [kStrRange086,
                            kStrRange087,
                            kStrRange088,
                            kStrRange089,
                            kStrRange090,
                            kStrRange091,
                            kStrRange092,
                            kStrRange093,
                            kStrRange094,
                            kStrRange095]

let kStrRange107 = rangeOfSubString("\"init(coder:) has not been implemented\"")
let kStrRange108 = rangeOfSubString("\"up\"")
let kStrRange109 = rangeOfSubString("\"down\"")
let kStrRange110 = rangeOfSubString("\"transform.rotation.y\"")
let kStrRange111 = rangeOfSubString("\"locations\"")
let kStrRange112 = rangeOfSubString("\"transform.rotation\"")
let kStrRange113 = rangeOfSubString("\"transform.scale\"")
let kStrRange114 = rangeOfSubString("\"position.y\"")
let kStrRange115 = rangeOfSubString("\"opacity\"")

let kStrRangeA12 = rangeOfSubString("\"I Love Apple\"")
let kStrRangeA13 = rangeOfSubString("\"Click Me\"")
let kStrRangeA14 = rangeOfSubString("\"AppleLogo\"")

let stringsRangeArray = [kStrRange107,
                         kStrRange108,
                         kStrRange109,
                         kStrRange110,
                         kStrRange111,
                         kStrRange112,
                         kStrRange113,
                         kStrRange114,
                         kStrRange115,
                         kStrRangeA12,
                         kStrRangeA13,
                         kStrRangeA14]

let kStrRange116 = rangeOfSubString("""
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
""")

let kStrRange117 = rangeOfSubString("""
/// This doesn't do anything, you may think.
/// And...
/// What about define a class?
""")
let kStrRange118 = rangeOfSubString("""
/// That's done. We created an amazing class.
/// Just... Wait a second!!
/// Do you think the black and white text is so boring?
/// Let's color it
""")
let kStrRange119 = rangeOfSubString("""
// TODO:- make the code world colorful
/// Now, it's much better to read.
/// Cheers...
""")
let kStrRange120 = rangeOfSubString("""
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
""")
let kStrRange121 = rangeOfSubString("""
/// Oh, a label appears on the screen.
/// But, we don't need this.
""")
let kStrRange122 = rangeOfSubString("""
/// You can not click a label, it is only for show some text.
/// In addition, there are also something you can click.
/// A button.
""")
let kStrRange123 = rangeOfSubString("""
/// The most important thing for a button, I think,
/// is that you can click it and somethings happens.
/// So, this will be interesting...
""")
let kStrRange124 = rangeOfSubString("""
/// And now, try to click it.
/// Amazing, it is so interesting, right?
///
/// By far, we know label and button can show text.
/// Did you think something can be changed as your wish?
/// I also prepared this for you.
/// You will love it.
""")
let kStrRange125 = rangeOfSubString("""
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
""")
let kStrRange126 = rangeOfSubString("""
/// I hope you enjoy my work.
/// I'm extremely grateful for your watching. Thank you.
""")

let kStrRange127 = rangeOfSubString("""
/// However, there is still nothing to show except code.
/// Okay. What about make a screen on the right side?
""")

let markRangeArray = [kStrRange116,
                      kStrRange117,
                      kStrRange118,
                      kStrRange119,
                      kStrRange120,
                      kStrRange121,
                      kStrRange122,
                      kStrRange123,
                      kStrRange124,
                      kStrRange125,
                      kStrRange126,
                      kStrRange127]

let kStrRange128 = rangeOfSubString("AmazingView")
let kStrRange129 = rangeOfSubString("myScreen.")
let kStrRange130 = rangeOfSubString("label.")
let kStrRange131 = rangeOfSubString("button.")
let kStrRange132 = rangeOfSubString("wobbleButton")


let customRangeArray = [kStrRange128,
                       kStrRange129,
                       kStrRange130,
                       kStrRange131,
                       kStrRange132]

let kStrRange133 = rangeOfSubString("alpha:")
let kStrRange134 = rangeOfSubString("AmazingView:")
let kStrRange135 = rangeOfSubString(".")
let kStrRange136 = rangeOfSubString("frame:")


let plainTextRangeArray = [kStrRange133,
                           kStrRange134,
                           kStrRange135,
                           kStrRange136]

func addTextAttributes() {
    // plain text
    textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: wholeRange)
    // keyword
    for rangeArray in keywordRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: keyWords, range: range)
        }
    }
    // system
    for rangeArray in systemRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: system, range: range)
        }
    }
    // number
    for rangeArray in charAndNumRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: charAndNum, range: range)
        }
    }
    // strings
    for rangeArray in stringsRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: strings, range: range)
        }
    }
    // custom
    for rangeArray in customRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: custom, range: range)
        }
    }
    // specific plain text
    for rangeArray in plainTextRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: range)
        }
    }
    // mark up
    for rangeArray in markRangeArray {
        for range in rangeArray {
            textViewAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: markup, range: range)
        }
    }
 
}


