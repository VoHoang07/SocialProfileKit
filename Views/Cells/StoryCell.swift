//
//  StoryCell.swift
//  SocialProfileKit
//
//  Created by Hoàng Võ on 28/01/2026.
//

import UIKit

final class StoryCell: UICollectionViewCell {
    
    static let reuseId = "StoryCell"
    
    private let circleView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        circleView.backgroundColor = .lightGray
        circleView.clipsToBounds = true
        contentView.addSubview(circleView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.frame = contentView.bounds
        circleView.layer.cornerRadius = contentView.bounds.width / 2
    }
}
