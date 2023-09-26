//
//  XSplashScreenController.swift
//  XSplashScreen
//
//  Created by XworkApp on 2023/9/17.
//

import UIKit

public class XSplashScreenController: UIViewController {

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: XSplashScreenProvider.shared.config.logoImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = XSplashScreenProvider.shared.config.appName
        label.textColor = XSplashScreenProvider.shared.config.appNameTextColor
        label.font = XSplashScreenProvider.shared.config.appNameFont
        return label
    }()
    
    private lazy var testLabel: XSplashScreenLabel = {
        let label = XSplashScreenLabel(string: XSplashScreenProvider.shared.config.appName,
                                       font: XSplashScreenProvider.shared.config.appNameFont,
                                       textColor: XSplashScreenProvider.shared.config.appNameTextColor)
        return label
    }()
    
    deinit {
        xlog("deinit")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
        animate()
    }

}

// MARK: - UI
extension XSplashScreenController {
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let config = XSplashScreenProvider.shared.config
        
        let logoViewWidth = config.logoSize.width
        let logoViewHeight = config.logoSize.height
        
        let logoViewCenterX = config.logoCenterX * view.bounds.width
        let logoViewCenterY = config.logoCenterY * view.bounds.height
        
        logoView.frame = CGRect(x: logoViewCenterX - logoViewWidth * 0.5,
                                y: logoViewCenterY - logoViewHeight * 0.5,
                                width: logoViewWidth,
                                height: logoViewHeight)
        
        let appNameLabelSize = appNameLabel.sizeThatFits(CGSize(width: view.bounds.width - 16.0*2.0,
                                                                height: CGFloat.greatestFiniteMagnitude))
        let appNameLabelX = view.bounds.width * 0.5
        let appNameLabelY = logoView.frame.maxY + config.lineGap
        
        appNameLabel.frame = CGRect(x: appNameLabelX - appNameLabelSize.width * 0.5,
                                    y: appNameLabelY,
                                    width: appNameLabelSize.width,
                                    height: appNameLabelSize.height)
        
        testLabel.layoutSubviews()
        testLabel.frame = CGRect(x: appNameLabelX - testLabel.bounds.width * 0.5,
                                 y: appNameLabelY,
                                 width: testLabel.bounds.width,
                                 height: testLabel.bounds.height)
    }
    
    private func setupUI() {
        view.backgroundColor = XSplashScreenProvider.shared.config.backgroundColor
        
        view.addSubview(logoView)
//        view.addSubview(appNameLabel)
        view.addSubview(testLabel)
    }
    
    
    private func animate() {
        // transform animation
        var animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.6
        animation.toValue = 1.0
        animation.duration = 0.6
        animation.autoreverses = false
        animation.repeatCount = .zero
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        logoView.layer.add(animation, forKey: "scaleAnimation")
        
        // opacity animation
        animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.3
        animation.toValue = 1.0
        animation.duration = 0.6
        animation.autoreverses = false
        animation.repeatCount = .zero
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        logoView.layer.add(animation, forKey: "opacityAnimation")
        
        appNameLabel.layer.add(animation, forKey: "opacityAnimation")
        
        testLabel.animate()
    }
    
}

// MARK: - Gesture
extension XSplashScreenController {
    
    private func setupGesture() {
        // Testing: using gesture to animate
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnBackground))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapOnBackground() {
        animate()
    }
    
}
