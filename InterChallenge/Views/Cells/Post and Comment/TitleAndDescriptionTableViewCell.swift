import UIKit

class TitleAndDescriptionTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        
        self.setUpComponents()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpComponents() {
        self.titleLabel.font = .systemFont(ofSize: 21)
        self.titleLabel.textAlignment = .natural
        self.titleLabel.numberOfLines = 2
        self.titleLabel.baselineAdjustment = .alignBaselines
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.contentMode = .left
        self.titleLabel.clearsContextBeforeDrawing = true
        self.titleLabel.autoresizesSubviews = true
        
        self.descriptionLabel.font = .systemFont(ofSize: 17)
        self.descriptionLabel.textAlignment = .natural
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.baselineAdjustment = .alignBaselines
        self.descriptionLabel.lineBreakMode = .byTruncatingTail
        self.descriptionLabel.contentMode = .left
        self.descriptionLabel.clearsContextBeforeDrawing = true
        self.descriptionLabel.autoresizesSubviews = true
    }
    
    func setUpConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        ])
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
}
