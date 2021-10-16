import UIKit

class PostTableViewController: UITableViewController {
    
    var userId = Int()
    var userName = String()
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Postagens de \(userName)"
        setUpTableView()
        fillPosts(from: userId)
    }
    
    private func fillPosts(from userId: Int) {
        NetworkService.shared.getPosts(userId: userId) { posts, error in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
                return
            } else {
                self.showErrorAlert()
                return
            }
        }
    }
}
