//
//  LogoTableViewCell.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 30.06.2022.
//

import UIKit

class LogoTableViewCell: UITableViewCell {
    
    private enum Consts {
        static let image = UIImage(named: "Lickmein")
        static let horizontalSpacing: CGFloat = 20
    }

    var logoImageView = UIImageView(image: Consts.image)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(logoImageView)
    }
    
    private func configureSubviews() {
        logoImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Consts.horizontalSpacing).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Consts.horizontalSpacing).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true

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
