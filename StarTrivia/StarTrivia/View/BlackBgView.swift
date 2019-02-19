//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Nicholas Coggin on 2/19/19.
//  Copyright © 2019 Nicholas Coggin. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
