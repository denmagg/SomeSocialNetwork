//
//  LabeledFieldTableViewCell.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 30.06.2022.
//

import UIKit

class LabeledFieldTableViewCell: UITableViewCell {
    
    private enum Consts {
        static let reuseIdentifier: String = "labeledFieldCell"
        static let horizontalSpacing: CGFloat = 20
    }

    var labeledTextField: LabeledTextFieldsView!
    
    required init(withTitle title: String, textFieldData: [(placeholder: String, text: String)]) {
        super.init(style: CellStyle.default, reuseIdentifier: Consts.reuseIdentifier)

        labeledTextField = LabeledTextFieldsView(withTitle: title, textFieldData: textFieldData)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(labeledTextField)
    }
    
    private func setupConstraints() {
        labeledTextField.translatesAutoresizingMaskIntoConstraints = false
        labeledTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        labeledTextField.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        labeledTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Consts.horizontalSpacing).isActive = true
        labeledTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.horizontalSpacing).isActive = true
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
