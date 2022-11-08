//
//  ColorMap.swift
//  PContributionsView
//
//  Created by 박준하 on 2022/11/08.
//

import Foundation

open class ColorMap {
    private final var colorList: [UIColor]
    
    public static func checkCount(_ count: Int) throws {
        if(count != 5) {
            throw ContributionsError.OutOfColorSize
        }
    }
    
    public init(_ colors: UIColor...) {
        try! ColorMap.checkCount(colors.count)
        self.colorList = colors
    }
    
    public init(_ colors: String...) {
        try! ColorMap.checkCount(colors.count)
        self.colorList = colors.map({ s in
            return UIColor(hex: s)!
        })
    }
    
    public func getColor(_ index: Int) -> UIColor {
        return index >= 0 ? colorList[index] : UIColor.clear
    }
}

public class DefaultColorMap: ColorMap {
    public init() {
        super.init("#eeeeee", "#c6e48b", "#7bc96f", "#239a3b", "#196127")
    }
}

public class VioletColorMap: ColorMap {
    public init() {
        super.init("#F4F4F4", "#EEF1FF", "#D2DAFF", "#AAC4FF", "#9495FF")
    }
}

public class ShootingStarColorMap: ColorMap {
    public init() {
        super.init("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF")
    }
}
