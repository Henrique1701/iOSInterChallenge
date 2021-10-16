//
//  PostNavigation.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension PostTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? CommentTableViewController {
            if let postId = sender as? Int {
                destinatoinVC.userName = userName
                destinatoinVC.postId = postId
            }
        }
    }
}
