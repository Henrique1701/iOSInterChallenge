//
//  PhotoNavigation.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension PhotoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatinVC = segue.destination as? DetailsViewController {
            if let info = sender as? (photo: UIImage, name: String) {
                destinatinVC.photo = info.photo
                destinatinVC.name = info.name
            }
        }
    }
}
