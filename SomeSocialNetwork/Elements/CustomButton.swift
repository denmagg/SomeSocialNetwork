//
//  ButtonFactory.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

class CustomButton: UIButton {
    
    enum CustomButtonStyle {
        case gray
        case filled
        case caterory
        case categoryFilled
    }
    
    enum Consts {
        enum FilledButton {
            static let buttonAttributes: [NSAttributedString.Key : Any] = [
                .font: UIFont(name: "Verdana-Bold", size: 15)!
            ]
        }
        enum GrayButton {
            static let buttonAttributes: [NSAttributedString.Key : Any] = [
                .font: UIFont(name: "Verdana", size: 15)!
            ]
        }
    }
    
    required init(withTitle title: String, style: CustomButtonStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .gray:
            configureGrayButton(withTitle: title)
        case .filled:
            configureFilledButton(withTitle: title)
        case .caterory:
            configureCategoryButton(withTitle: title)
        case .categoryFilled:
            configureCategoryFilled(withTitle: title)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFilledButton(withTitle title: String) {
        var configuration = UIButton.Configuration.filled()
        let attributeContainer = AttributeContainer(Consts.FilledButton.buttonAttributes)
        let buttonAttributedTitle = AttributedString(title, attributes: attributeContainer)
        configuration.attributedTitle = buttonAttributedTitle
        self.configuration = configuration
    }
    private func configureGrayButton(withTitle title: String) {
        var configuration = UIButton.Configuration.gray()
        let attributeContainer = AttributeContainer(Consts.GrayButton.buttonAttributes)
        let buttonAttributedTitle = AttributedString(title, attributes: attributeContainer)
        configuration.attributedTitle = buttonAttributedTitle
        self.configuration = configuration
    }
    private func configureCategoryButton(withTitle title: String) {
        let configuration = UIButton.Configuration.gray()
        self.configuration = configuration
    }
    private func configureCategoryFilled(withTitle title: String) {
        let configuration = UIButton.Configuration.filled()
        self.configuration = configuration
        
        var button: UIButton {
            self.tintColor = .gray
            return self
        }
    }
}
