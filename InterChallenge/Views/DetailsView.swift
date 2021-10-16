//
//  DetailsView.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 16/10/21.
//

import Foundation
import UIKit

class DetailsView: UIView {
    
    let detailImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground

        
        self.addSubview(self.detailImageView)
        self.addSubview(self.nameLabel)
        
        self.setUpComponents()
        self.setUpeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpComponents() {
        self.detailImageView.contentMode = .scaleAspectFit
        self.detailImageView.isOpaque = true
        self.detailImageView.clipsToBounds = true
        
        self.nameLabel.font = .systemFont(ofSize: 17)
        self.nameLabel.textAlignment = .natural
        self.nameLabel.numberOfLines = 0
        self.nameLabel.baselineAdjustment = .alignBaselines
        self.nameLabel.lineBreakMode = .byTruncatingTail
        self.nameLabel.contentMode = .left
    }
    
    func setUpeConstraints() {
        self.detailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.detailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.detailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.detailImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.detailImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.nameLabel.topAnchor.constraint(equalTo: self.detailImageView.bottomAnchor, constant: 16),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
    }
    
}
