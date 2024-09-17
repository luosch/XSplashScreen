//
//  XSplashScreenView.swift
//  XSplashScreen
//
//  Created by XworkApp on 2024/1/14.
//

import UIKit

public class XSplashScreenView: UIView {

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: XSplashScreenProvider.shared.config.logoImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var appNameLabel: XSplashScreenLabel = {
        let label = XSplashScreenLabel(string: XSplashScreenProvider.shared.config.appName,
                                       font: XSplashScreenProvider.shared.config.appNameFont,
                                       textColor: XSplashScreenProvider.shared.config.appNameTextColor)
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI
extension XSplashScreenView {
    
     public override func layoutSubviews() {
        super.layoutSubviews()
        
        let config = XSplashScreenProvider.shared.config
        
        let logoViewWidth = config.logoSize.width
        let logoViewHeight = config.logoSize.height
        
        let logoViewCenterX = config.logoCenterX * bounds.width
        let logoViewCenterY = config.logoCenterY * bounds.height
        
        logoView.frame = CGRect(x: logoViewCenterX - logoViewWidth * 0.5,
                                y: logoViewCenterY - logoViewHeight * 0.5,
                                width: logoViewWidth,
                                height: logoViewHeight)
        
        let appNameLabelSize = appNameLabel.sizeThatFits(CGSize(width: bounds.width - 16.0*2.0,
                                                                height: CGFloat.greatestFiniteMagnitude))
        let appNameLabelX = bounds.width * 0.5
        let appNameLabelY = logoView.frame.maxY + config.lineGap
        
        appNameLabel.frame = CGRect(x: appNameLabelX - appNameLabelSize.width * 0.5,
                                    y: appNameLabelY,
                                    width: appNameLabelSize.width,
                                    height: appNameLabelSize.height)
        
        appNameLabel.layoutSubviews()
        appNameLabel.frame = CGRect(x: appNameLabelX - appNameLabelSize.width * 0.5,
                                    y: appNameLabelY,
                                    width: appNameLabelSize.width,
                                    height: appNameLabelSize.height)
    }
    
    private func setupUI() {
        backgroundColor = XSplashScreenProvider.shared.config.backgroundColor
        addSubview(logoView)
        addSubview(appNameLabel)
    }
    
}
