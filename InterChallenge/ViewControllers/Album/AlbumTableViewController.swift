import UIKit

class AlbumTableViewController: UITableViewController {

    var userId = Int()
    var userName = String()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Álbuns de \(userName)"
        setUpTableView()
        fillAlbums(from: userId)
    }
    
    private func fillAlbums(from userId: Int) {
        NetworkService.shared.getAlbuns(userId: userId) { albums, error in
            if let albums = albums {
                self.albums = albums
                self.tableView.reloadData()
                return
            } else {
                self.showErrorAlert()
                return
            }
        }
    }
}
