//
//  AlbumTableView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension AlbumTableViewController {
    
    func setUpTableView() {
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        tableView.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        print("===================")
        let album = albums[indexPath.row]
        cell.albumNameLabel.text = album.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = albums[indexPath.row].id
        performSegue(withIdentifier: "albumToPhoto", sender: albumId)
    }
}
