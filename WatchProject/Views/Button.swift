//
//  Button.swift
//  WatchProject
//
//  Created by Jakub Majewski on 09.06.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = tintColor.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 5
    }

}
