//
//  LabeledTextField.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

class LabeledTextFieldsView: UIStackView {
    
    var label: CustomLabel!
    var textFieldsArray: [CustomTextField] = []

    required init(withTitle title: String, textFieldData: [(placeholder: String, text: String)]) {
        super.init(frame: .zero)
        
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 8
        
        label = CustomLabel(withText: title, style: .title)
        self.addArrangedSubview(label)
        
        for (_, fieldData) in textFieldData.enumerated() {
            let textField = CustomTextField(withPlaceholder: fieldData.placeholder, text: fieldData.text)
            textFieldsArray.append(textField)
            self.addArrangedSubview(textField)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
