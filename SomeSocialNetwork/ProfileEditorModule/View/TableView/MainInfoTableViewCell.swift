//
//  PhotoAndNameTableViewCell.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {

    private enum Consts {
        static let reuseIdentifier: String = "labeledFieldCell"
        static let horizontalSpacing: CGFloat = 20
        static let photoImage = UIImage(systemName: "person.crop.circle")
        enum labeledTextField {
            static let widthMultiplier: CGFloat = 0.6
        }
        enum photoLabel {
            static let heightMultiplier: CGFloat = 0.2
            static let title = "Photo:"
        }
    }

    var labeledTextField: LabeledTextFieldsView!
    var photoLabel: CustomLabel!
    var photoImageView = UIImageView(image: Consts.photoImage)
    
    required init(withTitle title: String, textFieldData: [(placeholder: String, text: String)]) {
        super.init(style: CellStyle.default, reuseIdentifier: Consts.reuseIdentifier)

        labeledTextField = LabeledTextFieldsView(withTitle: title, textFieldData: textFieldData)
        photoLabel = CustomLabel(withText: Consts.photoLabel.title, style: .title)
        setupSubviews()
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(photoLabel)
        self.addSubview(photoImageView)
        self.addSubview(labeledTextField)
    }
    
    private func configureSubviews() {
        photoImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        labeledTextField.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false

        
        photoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        photoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Consts.horizontalSpacing).isActive = true
        photoLabel.trailingAnchor.constraint(equalTo: labeledTextField.leadingAnchor, constant: -Consts.horizontalSpacing).isActive = true
        photoLabel.heightAnchor.constraint(equalTo: labeledTextField.heightAnchor, multiplier: Consts.photoLabel.heightMultiplier).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Consts.horizontalSpacing).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: labeledTextField.leadingAnchor, constant: -Consts.horizontalSpacing).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        labeledTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        labeledTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        labeledTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.horizontalSpacing).isActive = true
        labeledTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: Consts.labeledTextField.widthMultiplier).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }


}
