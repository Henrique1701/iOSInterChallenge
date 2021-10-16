import UIKit

class CommentTableViewController: UITableViewController {
    
    var postId = Int()
    var userName = String()
    var comments = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comentários de \(userName)"
        setUpTableView()
        fillComments(from: postId)
    }
    
    private func fillComments(from postId: Int) {
        NetworkService.shared.getComments(postId: postId) { comments, error in
            if let comments = comments {
                self.comments = comments
                self.tableView.reloadData()
                return
            } else {
                self.showErrorAlert()
                return
            }
        }
   }
}
