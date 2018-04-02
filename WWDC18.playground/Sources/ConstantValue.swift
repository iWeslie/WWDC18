//
//  ConstantValue.swift
//  CreationPlayground
//
//  Created by Weslie on 25/03/2018.
//  Copyright © 2018 weslie. All rights reserved.
//

import UIKit

let plainText = UIColor(red:0.88, green:0.89, blue:0.90, alpha:1.00)
let markup = UIColor(red:0.25, green:0.80, blue:0.27, alpha:1.00)
let strings = UIColor(red:1.00, green:0.17, blue:0.22, alpha:1.00)
let charAndNum = UIColor(red:0.47, green:0.43, blue:1.00, alpha:1.00)
let keyWords = UIColor(red:0.83, green:0.09, blue:0.58, alpha:1.00)
let custom = UIColor(red:0.14, green:1.00, blue:0.51, alpha:1.00)
let system = UIColor(red:0.00, green:0.63, blue:1.00, alpha:1.00)


extension String {
    
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
                       length: utf16.distance(from: from!, to: to!))

    }
}

func notRounding(number: Float, afterPoint position: Int) -> String {
    let roundingBehavior = NSDecimalNumberHandler(roundingMode: .down, scale: Int16(position), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    let ouncesDecimal = NSDecimalNumber(value: number).rounding(accordingToBehavior: roundingBehavior)
    
    return String.init(format: "%@", ouncesDecimal)
    
    
}

let delayArray = ["1.11","1.85","3.05","5.03","6.79",
                  "7.47","8.48","9.86","10.14","11.94",
                  "19.06","20","20.56","21.68","22.08",
                  "33.02","34.52","35.62","38.66",
                  "38.64","41.78","43.26","44.06","45.24",
                  "46.84","47.18","47.66","49.18","51.18",
                  "52.16","52.7","52.84","53.02","53.2",
                  "54.64","55.38","56.46","56.72","57.94",
                  "62.8","63.94","67.82","68.88","69.6",
                  "71.14","72.57","73.69","74.83","75.51",
                  "75.95","77.99","78.87","80.61","81.81",
                  "82.13","82.91","84.31","85.49"]

let colorBackground = "22.08"
let colorMarkUp = "24.76"
let colorStrings = "26.12"
let colorNumbers = "27.52"
let colorKeywords = "28.88"
let colorCustom = "30.2"
let colorSystem = "31.52"

let showMainScreenDate = "37"
let waitTouchUnlockDate = "39.2"
let showRealSlideDate = "43.22"
let didLaunchAppDate = "45.68"
let initializeCodingFlowDate = "53.58"
let demoShowLabelDate = "57.14"
let demoLabelFadeAwayDate = "58.52"
let demoShowILoveAppleDate = "59.06"
let demoBounceLabelDate = "61.52"
let demoShowButtonDate = "66.78"
let demoWaitClickButtonDate = "71.73"
let demoShowImageAndSlider = "77.31"
let demoSliderDidChangeValueDate = "79.77"
let demoShowSwitchDate = "84.89"


let doubleDelayArray = ["40.54","48.3","49.68","50.06",
                        "50.54","64.22","78.41","81.49"]


