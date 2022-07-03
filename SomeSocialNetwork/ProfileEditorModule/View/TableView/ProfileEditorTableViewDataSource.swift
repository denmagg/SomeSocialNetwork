//
//  ProfileEditorTableViewDataSource.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

class ProfileEditorTableViewDataSource: NSObject, UITableViewDataSource {
    
    private enum Consts {
        static let headerCellId = "headerCell"
        static let mainInfoCellId = "mainInfoCell"
        static let labeledFieldCellId = "labeledFieldCell"
        static let categoryCellId = "categoryCell"
        
        enum fullNameTextField {
            static let title = "Enter your full name:"
            static let data: [(placeholder: String, text: String)] = [
                ("first name*", ""), ("middle name*", ""), ("last name*", "")]
        }
        enum birthplaceTextField {
            static let title = "Birthplace*:"
            static let data: [(placeholder: String, text: String)] = [
                ("", "")]
        }
        enum birthdateTextField {
            static let title = "Birthdate:"
            static let data: [(placeholder: String, text: String)] = [
            ("dd.mm.yyyy", "")]
        }
        enum companyTextField {
            static let title = "Company:"
            static let data: [(placeholder: String, text: String)] = [
            ("", "")]
        }
        enum positionTextField {
            static let title = "Position:"
            static let data: [(placeholder: String, text: String)] = [
            ("", "")]
        }
        static let numberOfRows = 8
        enum categoryCell {
            static let title = "Pick what you like* (minimum 1 required)"
            static let categories = ["Cars", "Business", "Stocks", "Sport", "Self development", "Health", "Food", "Family", "Pets", "Movies", "Games", "Music" ]
        }
    }
    
//    init(withFields: [CustomTextField]) {
//        super.init()
//        
//        self.dataDayForecast = weatherData.dataDayForecast
//        self.dataDetailDescription = weatherData.dataDetailDescription
//        self.dataSpecs = weatherData.dataSpecs
//    }
    
    let mainInfoCell = MainInfoTableViewCell(withTitle: Consts.fullNameTextField.title, textFieldData: Consts.fullNameTextField.data)
    let birthplaceCell = LabeledFieldTableViewCell(withTitle: Consts.birthplaceTextField.title, textFieldData: Consts.birthplaceTextField.data)
    let birthDateCell = LabeledFieldTableViewCell(withTitle: Consts.birthdateTextField.title, textFieldData: Consts.birthdateTextField.data)
    let companyCell = LabeledFieldTableViewCell(withTitle: Consts.companyTextField.title, textFieldData: Consts.companyTextField.data)
    let positionCell = LabeledFieldTableViewCell(withTitle: Consts.positionTextField.title, textFieldData: Consts.positionTextField.data)
    let categoryCell = CategoryTableViewCell(withTitle: Consts.categoryCell.title, categories: Consts.categoryCell.categories)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Consts.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = HeaderTableViewCell(withHeader: "Let's make your profile")
            return cell
        case 1:
            let cell = mainInfoCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 2:
            let cell = birthplaceCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 3:
            let cell = birthDateCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 4:
            let cell = companyCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 5:
            let cell = positionCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 6:
            let cell = categoryCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}
