//
//  AlbumNavigation.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension AlbumTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? PhotoTableViewController {
            if let albumId = sender as? Int {
                destinatoinVC.userName = userName
                destinatoinVC.albumId = albumId
            }
        }
    }
}
