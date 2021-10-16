//
//  PostTableView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension PostTableViewController {
    
    func setUpTableView() {
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
        tableView.estimatedRowHeight = 97
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = posts[indexPath.row].id
        let commentTableViewController = CommentTableViewController()
        commentTableViewController.userName = userName
        commentTableViewController.postId = postId
        self.navigationController?.pushViewController(commentTableViewController, animated: true)
    }
}
