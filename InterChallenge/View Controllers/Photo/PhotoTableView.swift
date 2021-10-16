//
//  PhotoTableView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 15/10/21.
//

import Foundation
import UIKit

extension PhotoTableViewController {
    
    func setUpTableView() {
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos[indexPath.row]
        let url = photo.thumbnailUrl
        cell.titleLabel.text = photo.title
        
        NetworkService.shared.downloadImageData(url: url) { data, error in
            if let data = data {
                cell.photoImageView.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        NetworkService.shared.downloadImageData(url: photo.url) { data, error in
            if let data = data {
                self.performSegue(withIdentifier: "photoToDetail",
                                  sender: (photo: UIImage(data: data), name: photo.title))
            }
        }
    }
}
