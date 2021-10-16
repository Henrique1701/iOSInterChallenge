import UIKit

class ChallengeTableViewController: UITableViewController {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fillUsers()
    }
    
    private func fillUsers() {
        NetworkService.shared.getUsers() { users, error in
            if let users = users {
                self.users = users
                self.tableView.reloadData()
                return
            } else {
                self.showErrorAlert()
                return
            }
        }
    }
}
