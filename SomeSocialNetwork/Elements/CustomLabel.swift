//
//  CustomLabel.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

class CustomLabel: UILabel {
    
    enum Consts {
        enum HeaderLabel {
            static let font = UIFont.systemFont(ofSize: 29, weight: .light)
            static let numberOfLines = 0
        }
        enum TitleLabel {
            static let font = UIFont(name: "Verdana", size: 16)
        }
    }
    
    enum CustomLabelStyle {
        case header
        case title
    }
    
    required init(withText text: String, style: CustomLabelStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .header:
            configureHeaderLabel(withText: text)
        case .title:
            configureTitleLabel(withText: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeaderLabel(withText text: String) {
        self.text = text
        self.font = Consts.HeaderLabel.font
        self.numberOfLines = Consts.HeaderLabel.numberOfLines
        self.textAlignment = .center
    }
    private func configureTitleLabel(withText text: String) {
        self.text = text
        self.font = Consts.TitleLabel.font
    }
}
