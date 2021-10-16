import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    let photoImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(photoImageView)
        self.contentView.addSubview(titleLabel)
        
        self.setUpComponents()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpComponents() {
        self.photoImageView.contentMode = .scaleAspectFit
        self.photoImageView.isOpaque = true
        self.photoImageView.clearsContextBeforeDrawing = true
        self.photoImageView.clipsToBounds = true
        self.photoImageView.autoresizesSubviews = true
        
        self.titleLabel.font = .systemFont(ofSize: 17)
        self.titleLabel.textAlignment = .natural
        self.titleLabel.numberOfLines = 5
        self.titleLabel.baselineAdjustment = .alignBaselines
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.contentMode = .left
        self.titleLabel.clearsContextBeforeDrawing = true
        self.titleLabel.autoresizesSubviews = true
    }
    
    private func setUpConstraints() {
        self.photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.photoImageView.widthAnchor.constraint(equalToConstant: 150),
            self.photoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        ])
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 60)
        ])
    }
    
}
