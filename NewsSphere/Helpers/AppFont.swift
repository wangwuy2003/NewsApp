//
//  AppFont.swift
//  NewsSphere
//
//
//

import Foundation
import UIKit

struct AppFont {
    // Check if the current device is iPad
    static var isIPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    // Font size multiplier for iPad
    static var iPadFontMultiplier: CGFloat {
        return 1.25
    }
    
    enum SFPro {
        static func roundedRegular(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Regular",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedBold(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Bold",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedSemiBold(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Semibold",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedBlack(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Black",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedHeavy(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Heavy",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedLight(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Light",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedMedium(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Medium",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedThin(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Thin",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
        
        static func roundedUltralight(size: CGFloat) -> UIFont {
            let adjustedSize = isIPad ? size * iPadFontMultiplier : size
            return UIFont(name: "SFProRounded-Ultralight",
                          size: adjustedSize) ?? UIFont.systemFont(ofSize: adjustedSize)
        }
    }
}
