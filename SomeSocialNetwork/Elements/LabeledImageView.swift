//
//  LabeledImage.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

class LabeledImageView: UIStackView {
    
    var label: CustomLabel!
    var imageView: UIImageView!

    required init(withTitle title: String, image: UIImage) {
        super.init(frame: .zero)
        
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 8
        
        label = CustomLabel(withText: title, style: .title)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        self.addArrangedSubview(label)
        self.addArrangedSubview(imageView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
