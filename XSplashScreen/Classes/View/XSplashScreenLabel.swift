//
//  XSplashScreenLabel.swift
//  XSplashScreen
//
//  Created by XworkApp on 2023/9/27.
//

import UIKit

class XSplashScreenLabel: UIView {

    let string: String
    private var labels = [UILabel]()
    private var font: UIFont?
    private var textColor: UIColor?
    
    init(string: String, font: UIFont?, textColor: UIColor?) {
        self.string = string
        self.font = font
        self.textColor = textColor
        
        super.init(frame: .zero)
        
        self.setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI
extension XSplashScreenLabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var maxHeight: CGFloat = 0.0
        var totalWidth: CGFloat = 0
        for i in 0..<labels.count {
            let labelSize = labels[i].sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude,
                                                          height: CGFloat.greatestFiniteMagnitude))
            maxHeight = max(maxHeight, labelSize.height)
            totalWidth += labelSize.width
        }
        
        self.bounds = CGRect(x: 0, y: 0, width: totalWidth, height: maxHeight)
        
        var left: CGFloat = 0
        for i in 0..<labels.count {
            let labelSize = labels[i].sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude,
                                                          height: CGFloat.greatestFiniteMagnitude))
            labels[i].frame = CGRect(x: left,
                                     y: (maxHeight - labelSize.height) / 2.0,
                                     width: labelSize.width,
                                     height: labelSize.height)
            left += labelSize.width
        }
    }
    
    private func setupLabels() {
        for char in string {
            let label = UILabel()
            label.text = String.init(char)
            label.font = font
            label.textColor = textColor
            addSubview(label)
            labels.append(label)
        }
    }
    
    func animate() {
        for i in 0..<labels.count {
            // opacity animation
            labels[i].alpha = 0
            UIView.animate(withDuration: 0.3, delay: CGFloat(i) * 0.05, options: .curveEaseInOut) {
                self.labels[i].alpha = 1
            } completion: { _ in
                
            }
        }
    }
    
}
