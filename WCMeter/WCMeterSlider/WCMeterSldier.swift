//
//  WCMeterSldier.swift
//  WCMeter
//
//  Created by wanchenxie on 30/11/2017.
//  Copyright © 2017 wanchen. All rights reserved.
//

import UIKit

class WCMeterSldier: UIView {
    
    var maxValue: Int = 100
    var minValue: Int = 0
    var value: Int = 50 {
        didSet {
            updateMask(value: value)
        }
    }
    private var maskImageView: UIImageView!
    private var trackImageView: UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        self.initializer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initializer()
    }
    
    
    func initializer() {
        let backgrndColor = UIColor.init(red: 81 / 255, green: 94 / 255, blue: 97 / 255, alpha: 1)
        self.backgroundColor = backgrndColor
        
        // mask image view
        maskImageView = UIImageView.init(frame: self.bounds)
        maskImageView.image = UIImage.init(named: "sliderbarMaskVertical.png")
        self.addSubview(maskImageView)
        
        // track image view
        trackImageView = UIImageView.init(frame: self.bounds)
        trackImageView.image = UIImage.init(named: "sliderbarVertical.png")
        self.addSubview(trackImageView)
        self.sendSubview(toBack: trackImageView)
    }
    
    func updateMask(value: Int) -> Void{
        if value < minValue || value > maxValue {
            return
        }
        let ratio = Float.init(value) / (Float.init(maxValue) - Float.init(minValue))
        let floatRatio = CGFloat.init(ratio)
        
        let maskLayer = CAShapeLayer.init()
        let endPointY = floatRatio * self.bounds.size.height
        let maskRect = CGRect.init(x: 0, y: self.bounds.size.height - endPointY, width: self.bounds.size.width, height: endPointY)
        
        let muPath = CGMutablePath()
        muPath.addRect(maskRect)
        maskLayer.path = muPath
        
        trackImageView.layer.mask = maskLayer
        
        
    }

}
