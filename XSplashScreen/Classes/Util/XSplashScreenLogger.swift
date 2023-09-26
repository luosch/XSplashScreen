//
//  XSplashScreenLogger.swift
//  Pods
//
//  Created by XworkApp on 2023/9/17.
//

import UIKit

internal func xlog(_ items: Any...) {
    guard XSplashScreenProvider.shared.loggerEnabled else {
        return
    }
    
    var output = ""
    for item in items {
        output += "\(item) "
    }
    output += "\n"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    print("[XSplashScreen] \(timestamp) >", output)
}
