import UIKit

class DetailsViewController: UIViewController {
    
    private var detailsView: DetailsView!
    
    var photo = UIImage()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detalhes"
        self.view.backgroundColor = .systemBackground
        
        
        self.detailsView = DetailsView(frame: self.view.frame)
        self.detailsView.detailImageView.image = self.photo
        self.detailsView.nameLabel.text = self.name
        self.view.addSubview(self.detailsView)
        
        self.detailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.detailsView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.detailsView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.detailsView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.detailsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
