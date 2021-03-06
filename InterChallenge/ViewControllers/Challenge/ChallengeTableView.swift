//
//  ChallengeTableView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension ChallengeTableViewController {
    
    func setUpTableView() {
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.estimatedRowHeight = 233
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
    }
}

extension ChallengeTableViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        let albumTableViewController = AlbumTableViewController()
        albumTableViewController.userId = userId
        albumTableViewController.userName = name
        self.navigationController?.pushViewController(albumTableViewController, animated: true)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        let postTableViewCotroller = PostTableViewController()
        postTableViewCotroller.userId = userId
        postTableViewCotroller.userName = name
        self.navigationController?.pushViewController(postTableViewCotroller, animated: true)
    }
}
