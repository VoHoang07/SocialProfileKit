//
//  PostCell.swift
//  repeat1_Ig
//
//  Created by Hoàng Võ on 29/01/2026.
//

import UIKit

final class PostCell: UICollectionViewCell {
    static let reuseId = "PostCell"
    
    private var imageView = UIView()
    private var captionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.1
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        imageView.backgroundColor = .lightGray
        contentView.addSubview(imageView)
        
        captionLabel.text = "This is a post"
        captionLabel.font = .systemFont(ofSize: 13)
        contentView.addSubview(captionLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageHeight = contentView.bounds.height - 30
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: imageHeight)
        captionLabel.frame = CGRect(x: 8, y: imageView.frame.maxY + 4, width: contentView.bounds.width - 16 , height: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        captionLabel.text = nil
    }
    
    func configure(text: String) {
        captionLabel.text = text
    }
}
