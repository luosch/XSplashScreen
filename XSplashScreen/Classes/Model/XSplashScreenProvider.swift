//
//  XSplashScreenProvider.swift
//  XSplashScreen
//
//  Created by XworkApp on 2023/9/17.
//

import UIKit

public class XSplashScreenProvider: NSObject {

    public static let shared = XSplashScreenProvider()
    public var loggerEnabled = true
    
    internal var config = XSplashScreenConfig()
    
    
    private override init() {
        
    }
    
    public func updateConfig(_ config: XSplashScreenConfig) {
        xlog("updateConfig")
        self.config = config
    }
    
}
