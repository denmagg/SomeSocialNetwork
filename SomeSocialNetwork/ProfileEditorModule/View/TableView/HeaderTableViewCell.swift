//
//  HeaderTableViewCell.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    private enum Consts {
        static let reuseIdentifier = "headerCell"
        static let horizontalSpacing: CGFloat = 20
    }

    var headerLabel: CustomLabel!
    
    required init(withHeader header: String) {
        super.init(style: CellStyle.default, reuseIdentifier: Consts.reuseIdentifier)

        headerLabel = CustomLabel(withText: header, style: .header)
        setupSubviews()
        setupConstraints()
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        setupSubviews()
//        setupConstraints()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(headerLabel)
    }
    
    private func setupConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Consts.horizontalSpacing).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.horizontalSpacing).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true

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
