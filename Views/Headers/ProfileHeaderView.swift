//
//  ProfileHeaderView.swift
//  SocialProfileKit
//
//  Created by Hoàng Võ on 28/01/2026.
//

import UIKit

final class ProfileHeaderView: UICollectionReusableView {
    
    private var storiesCollectioView: UICollectionView!
    private let storiesCount = 10
    static let reuseId = "ProfileHeaderView"
    
    private let avatar = UIView()
    private let nameLabel = UILabel()
    private let stats = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupStories()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        avatar.backgroundColor = .gray
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        addSubview(avatar)
        
        nameLabel.text = "_theomartinez"
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        addSubview(nameLabel)
        
        stats.text = "27 Post     807 Follower      333 Following"
        stats.font = .systemFont(ofSize: 13, weight: .regular)
        addSubview(stats)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        nameLabel.frame = CGRect(x: 16, y: avatar.frame.maxY + 12, width: bounds.width - 32, height: 20)
        stats.frame = CGRect(x: 16, y: nameLabel.frame.maxY + 8 , width: bounds.width - 32, height: 18)
        
        storiesCollectioView.frame = CGRect(x: 0, y: stats.frame.maxY + 12, width: bounds.width, height: 90)
    }
    
    private func setupStories() {
        backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        storiesCollectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        storiesCollectioView.backgroundColor = .white
        storiesCollectioView.showsHorizontalScrollIndicator = false        
        storiesCollectioView.dataSource = self
        storiesCollectioView.delegate = self
        storiesCollectioView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseId)
        
        addSubview(storiesCollectioView)
    }
}

extension ProfileHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storiesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectioView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseId, for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
}

extension ProfileHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: 80)
    }
}


