import UIKit

class PhotoTableViewController: UITableViewController {

    var albumId = Int()
    var userName = String()
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fotos de \(userName)"
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        fillPhotos(from: albumId)
    }
    
    private func fillPhotos(from albumId: Int) {
        NetworkService.shared.getPhotos(albumId: albumId) { photos, error in
            if let photos = photos {
                self.photos = photos
                self.tableView.reloadData()
                return
            } else {
                self.showErrorAlert()
                return
            }
        }
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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatinVC = segue.destination as? DetailsViewController {
            if let info = sender as? (photo: UIImage, name: String) {
                destinatinVC.photo = info.photo
                destinatinVC.name = info.name
            }
        }
    }
}
