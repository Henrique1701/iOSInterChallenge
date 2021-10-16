import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    let albumNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(albumNameLabel)
        
        self.setUpComponents()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpComponents() {
        self.albumNameLabel.font = .systemFont(ofSize: 17)
        self.albumNameLabel.textAlignment = .natural
        self.albumNameLabel.numberOfLines = 0
        self.albumNameLabel.baselineAdjustment = .alignBaselines
        self.albumNameLabel.lineBreakMode = .byTruncatingTail
        self.albumNameLabel.contentMode = .left
        self.albumNameLabel.clearsContextBeforeDrawing = true
        self.albumNameLabel.autoresizesSubviews = true
    }
    
    func setUpConstraints() {
        self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.albumNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.albumNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.albumNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.albumNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
    }
    
}
