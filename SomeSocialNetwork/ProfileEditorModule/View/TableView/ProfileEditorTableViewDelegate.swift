//
//  ProfileEditorTableViewDelegate.swift
//  SomeSocialNetwork
//
//  Created by Денис Медведев on 01.07.2022.
//

import UIKit

protocol ProfileEditorVCDelegate: AnyObject {
    func selectedCell(row: Int)
}

class ProfileEditorTableViewDelegate: NSObject, UITableViewDelegate {
    // #1
    weak var delegate: ProfileEditorVCDelegate?
    
    // #2
    init(withDelegate delegate: ProfileEditorVCDelegate) {
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
