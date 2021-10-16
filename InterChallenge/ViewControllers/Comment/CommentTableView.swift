//
//  CommentTableView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension CommentTableViewController {
    
    func setUpTableView() {
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
        tableView.estimatedRowHeight = 97
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return comments.count
    }
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
             return UITableViewCell()
         }

         let comment = comments[indexPath.row]
         cell.selectionStyle = .none
         cell.titleLabel.text = comment.name
         cell.descriptionLabel.text = comment.body

         return cell
     }
    
}
