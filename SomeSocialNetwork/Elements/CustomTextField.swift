//
//  CustomTextField.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

class CustomTextField: UITextField {

    required init(withPlaceholder placeholder: String = "", text: String = "") {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.text = text
        self.borderStyle = .roundedRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
