//
//  SignUpTableViewDataSource.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

class SignUpTableViewDataSource: NSObject, UITableViewDataSource {
    
    private enum Consts {
        static let logoCellId = "logoCell"
        static let labeledFieldCellId = "labeledFieldCell"
        static let fieldCellId = "fieldCell"
        enum fullNameTextField {
            static let title = "Enter your full name:"
            static let data: [(placeholder: String, text: String)] = [
                ("first name*", ""), ("middle name*", ""), ("last name*", "")]
        }
        enum emailTextField {
            static let title = "Email:"
            static let data: [(placeholder: String, text: String)] = [
            ("email", "")]
        }
        enum passwordTextField {
            static let title = "Password:"
            static let data: [(placeholder: String, text: String)] = [
            ("enter your password", ""), ("confirm your password", "")]
        }
        static let numberOfRows = 6
    }
    
    let fullNameCell = LabeledFieldTableViewCell(withTitle: Consts.fullNameTextField.title, textFieldData: Consts.fullNameTextField.data)
    let emailCell = LabeledFieldTableViewCell(withTitle: Consts.emailTextField.title, textFieldData: Consts.emailTextField.data)
    let passwordCell = LabeledFieldTableViewCell(withTitle: Consts.passwordTextField.title, textFieldData: Consts.passwordTextField.data)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Consts.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = LogoTableViewCell()
            return cell
        case 1:
            //Нужно вынести поля в инициализатор и проинициализировать их в основном VC
            let cell = fullNameCell
//FIXME:            Слишком жесткая декомпозиция, надо сделать проще. Тк времени на то, чтобы делать делегаты на это все у меня нет
//            cell.labeledTextField.textFieldsArray[0]...
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 2:
            let cell = emailCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        case 3:
            let cell = passwordCell
            cell.heightAnchor.constraint(equalTo: cell.labeledTextField.heightAnchor).isActive = true
            return cell
        default:
            return UITableViewCell()
        }
    }
}
