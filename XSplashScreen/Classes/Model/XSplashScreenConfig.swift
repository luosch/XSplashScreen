//
//  XSplashScreenConfig.swift
//  XSplashScreen
//
//  Created by XworkApp on 2023/9/17.
//

import UIKit

public struct XSplashScreenConfig {
    
    public var backgroundColor: UIColor?
    
    public var logoImage: UIImage?
    public var logoCenterX: CGFloat = 0.5
    public var logoCenterY: CGFloat = 0.5
    public var logoSize: CGSize = CGSize(width: 100, height: 100)
    
    public var lineGap: CGFloat = 0.0
    
    public var appName: String = ""
    public var appNameFont: UIFont?
    public var appNameTextColor: UIColor?
    
    public init() {
        
    }
    
}
