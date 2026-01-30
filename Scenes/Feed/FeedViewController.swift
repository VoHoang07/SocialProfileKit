//
//  FeedProfileView.swift
//  repeat1_Ig
//
//  Created by Hoàng Võ on 29/01/2026.
//

import UIKit

final class FeedProfileView: UIViewController {
    
    private enum Const {
        static let itemsCount = 30
        static let columns: CGFloat = 3
        static let reuseId = "FeedCell"
        static let spacing: CGFloat = 2
        static let inset: CGFloat = 0
    }
    
    private var feedScroll: UICollectionView!
    private var posts: [Int] = Array(0..<Const.itemsCount)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        setupUI()
        updateEmptyState()
    }
    
    private func updateEmptyState() {
        if posts.isEmpty {
            let label = UILabel()
            label.text = " No Posts Yet"
            label.textAlignment = .center
            feedScroll.backgroundView = label
        } else {
            feedScroll.backgroundView = nil
        }
    }
    
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Const.spacing
        layout.minimumInteritemSpacing = Const.spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        feedScroll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedScroll.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        feedScroll.backgroundColor = .white
        
        feedScroll.dataSource = self
        feedScroll.delegate = self
        
        view.addSubview(feedScroll)
        feedScroll.frame = view.bounds
        feedScroll.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}

extension FeedProfileView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Const.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseId, for: indexPath)
        as! PostCell
        cell.configure(text: "Feed post \(indexPath.row)")
        return cell
    }
}

extension FeedProfileView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (Const.columns - 1) * Const.spacing
        let totalInset = Const.inset * 2
        let availableUsing = view.bounds.width - totalInset - totalSpacing
        let itemsEach = availableUsing / Const.columns
        
        return CGSize(width: itemsEach, height: itemsEach + 15)
    }
}
