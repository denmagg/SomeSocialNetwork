//
//  SignUpTableViewDelegate.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 29.06.2022.
//

import UIKit

protocol SignUpVCDelegate: AnyObject {
    func selectedCell(row: Int)
}

class SignUpTableViewDelegate: NSObject, UITableViewDelegate {
    // #1
    weak var delegate: SignUpVCDelegate?
    
    // #2
    init(withDelegate delegate: SignUpVCDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
    //Отменяем выделение ячейки
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
