import UIKit

class PhotoTableViewController: UITableViewController {

    var albumId = Int()
    var userName = String()
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fotos de \(userName)"
        setUpTableView()
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
}
