//
//  RoundView.swift
//  FlightCentreTest
//
//  Created by Eloy Bruckhoff on 5/2/21.
//

import UIKit

class RoundView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var borderColor: UIColor = UIColor.white
    @IBInspectable var shadow: Bool = false

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        if self.shadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.layer.shadowOpacity = 0.12
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
        else {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = self.cornerRadius
            self.layer.borderWidth = self.borderWidth
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
}
