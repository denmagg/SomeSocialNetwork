//
//  CategoryTableViewCell.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private enum Consts {
        static let reuseIdentifier: String = "categoryCell"
    }
    
    var label: CustomLabel!
    var categoryScrollView = UIScrollView()
    var categoryStackView = UIStackView()
    var categoryButtons: [CustomButton] = []
    
    required init(withTitle title: String, categories: [String]) {
        super.init(style: CellStyle.default, reuseIdentifier: Consts.reuseIdentifier)

        label = CustomLabel(withText: title, style: .title)
        for category in categories {
            let categoryButton = CustomButton(withTitle: category, style: .caterory)
            categoryButtons.append(categoryButton)
        }
        setupSubviews(categories: categories)
        for categoryButton in categoryButtons {
            categoryStackView.addArrangedSubview(categoryButton)
        }
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews(categories: [String]) {
        self.addSubview(label)
        self.addSubview(categoryScrollView)
        categoryScrollView.addSubview(categoryStackView)
    }
    
    private func configureSubviews() {
        categoryStackView.axis = .horizontal
        categoryScrollView.showsHorizontalScrollIndicator = false
        categoryStackView.alignment = .leading
        categoryStackView.distribution = .equalSpacing
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        categoryScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        categoryScrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        categoryScrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        categoryScrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        categoryScrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        categoryStackView.leadingAnchor.constraint(equalTo: categoryScrollView.leadingAnchor).isActive = true
        categoryStackView.trailingAnchor.constraint(equalTo: categoryScrollView.trailingAnchor).isActive = true
        categoryStackView.topAnchor.constraint(equalTo: categoryScrollView.topAnchor).isActive = true
        categoryStackView.bottomAnchor.constraint(equalTo: categoryScrollView.bottomAnchor).isActive = true
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
