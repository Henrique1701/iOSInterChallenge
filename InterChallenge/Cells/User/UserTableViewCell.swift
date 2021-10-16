import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    let initialsLabel = UILabel()
    let nameLabel = UILabel()
    let userNameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    private let separatorView = UIView()
    private let initialsView = UIView()
    private let albumsButton = UIButton()
    private let postsButton = UIButton()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.contentView.clipsToBounds = true
        self.initialsView.addSubview(self.initialsLabel)
        self.contentView.addSubview(self.initialsView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.separatorView)
        self.contentView.addSubview(self.userNameLabel)
        self.contentView.addSubview(self.emailLabel)
        self.contentView.addSubview(self.phoneLabel)
        self.stackView.addArrangedSubview(self.albumsButton)
        self.stackView.addArrangedSubview(self.postsButton)
        self.contentView.addSubview(self.stackView)
        
        self.setUpComponents()
        
        self.albumsButton.addTarget(self, action: #selector(self.touchedAlbumsButton), for: .touchUpInside)
        self.postsButton.addTarget(self, action: #selector(self.touchedPostsButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func touchedAlbumsButton() {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func touchedPostsButton() {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}

extension UserTableViewCell {
    private func setUpComponents() {
        self.setUpLabels()
        self.setUpViews()
        self.setUpConstraints()
        self.setUpStackView()
        
    }
    
    private func setUpLabels() {
        
        let labels = [initialsLabel, nameLabel, userNameLabel, emailLabel, phoneLabel]
        for label in labels {
            if label == self.initialsLabel || label == self.nameLabel {
                label.textAlignment = .center
            } else  {
                label.textAlignment = .natural
            }
            label.font = .systemFont(ofSize: 17)
            label.numberOfLines = 0
            label.baselineAdjustment = .alignBaselines
            label.lineBreakMode = .byTruncatingTail
            label.contentMode = .left
        }
    }
    
    private func setUpViews() {
        self.separatorView.contentMode = .scaleAspectFill
        self.separatorView.isUserInteractionEnabled = true
        self.separatorView.backgroundColor = .lightGray
        self.separatorView.isOpaque = true
        
        self.initialsView.contentMode = .scaleAspectFill
        self.initialsView.isUserInteractionEnabled = true
        self.initialsView.backgroundColor = .systemYellow
        self.initialsView.isOpaque = true
    }
    
    private func setUpStackView() {
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = 0
        self.stackView.contentMode = .scaleToFill
        self.stackView.isUserInteractionEnabled = true
        self.stackView.isHidden = false
        
        self.albumsButton.translatesAutoresizingMaskIntoConstraints = false
        self.albumsButton.setTitle("ÁLBUNS", for: .normal)
        self.albumsButton.titleLabel?.font = .systemFont(ofSize: 15)
        self.albumsButton.setTitleColor(.systemOrange, for: .normal)
        //self.albumsButton.role = .normal
        self.albumsButton.contentVerticalAlignment = .center
        self.albumsButton.contentHorizontalAlignment = .center

        self.postsButton.translatesAutoresizingMaskIntoConstraints = false
        self.postsButton.setTitle("POSTAGENS", for: .normal)
        self.postsButton.titleLabel?.font = .systemFont(ofSize: 15)
        self.postsButton.setTitleColor(.systemOrange, for: .normal)
        self.postsButton.role = .normal
        self.postsButton.contentVerticalAlignment = .center
        self.postsButton.contentHorizontalAlignment = .center
    }
    
    private func setUpConstraints() {
        self.initialsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.initialsView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.initialsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.initialsView.widthAnchor.constraint(equalToConstant: 88),
            self.initialsView.heightAnchor.constraint(equalToConstant: 88)
        ])
        
        self.initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.initialsLabel.leadingAnchor.constraint(equalTo: self.initialsView.leadingAnchor),
            self.initialsLabel.topAnchor.constraint(equalTo: self.initialsView.topAnchor),
            self.initialsLabel.trailingAnchor.constraint(equalTo: self.initialsView.trailingAnchor),
            self.initialsLabel.bottomAnchor.constraint(equalTo: self.initialsView.bottomAnchor)
        ])
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.nameLabel.topAnchor.constraint(equalTo: self.initialsView.bottomAnchor, constant: 16),
            
        ])
        
        self.separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.separatorView.leadingAnchor.constraint(equalTo: self.initialsView.trailingAnchor, constant: 32),
            self.separatorView.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 32),
            self.separatorView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.separatorView.widthAnchor.constraint(equalToConstant: 2),
        ])
        
        self.userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.userNameLabel.leadingAnchor.constraint(equalTo: self.separatorView.trailingAnchor, constant: 16),
            self.userNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.userNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
        
        self.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.emailLabel.leadingAnchor.constraint(equalTo: self.separatorView.trailingAnchor, constant: 16),
            self.emailLabel.topAnchor.constraint(equalTo: self.userNameLabel.bottomAnchor, constant: 24),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
        
        self.phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.phoneLabel.leadingAnchor.constraint(equalTo: self.separatorView.trailingAnchor, constant: 16),
            self.phoneLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 24),
            self.phoneLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ])
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.stackView.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 24),
            self.stackView.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 64),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
}
