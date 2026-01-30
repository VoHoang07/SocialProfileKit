import UIKit


final class ProfileViewController: UIViewController {
    
    private enum Section: Int, CaseIterable {
        case header = 0
        case posts = 1
    }
    
    private enum Const {
        static let columns = 3
        static let itemsCount = 30
        static let inset: CGFloat = 0
        static let spacing: CGFloat = 2
    }
    
    private var collectionView: UICollectionView!
    private var posts: [Int] = Array(0..<Const.itemsCount)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        updateEmptyState()
    }
    private func updateEmptyState() {
        if posts.isEmpty {
            let label = UILabel()
            label.text = " No Posts Yet"
            label.textAlignment = .center
            collectionView.backgroundView = label
        } else {
            collectionView.backgroundView = nil
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Const.spacing
        layout.minimumInteritemSpacing = Const.spacing
        layout.sectionInset = UIEdgeInsets(top: Const.inset, left: Const.inset, bottom: Const.inset, right: Const.inset)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderView.reuseId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.allowsSelection = false
        collectionView.frame = view.bounds
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {return 0}
        switch section {
        case .header:
            return 0
        case .posts:
            return Const.itemsCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseId, for: indexPath)
        as! PostCell
        cell.configure(text: "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else  { return UICollectionReusableView()}
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderView.reuseId, for: indexPath)
        return header
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (CGFloat(Const.columns) - 1) * Const.spacing
        let totalInset = Const.inset * 2
        let availableView = collectionView.bounds.width - totalInset - totalSpacing
        let eachView = availableView / (CGFloat(Const.columns))
        
        return CGSize(width: eachView, height: eachView + 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let section = Section(rawValue: section) else {return .zero}
        switch section {
        case .header:
            return CGSize(width:  collectionView.bounds.width, height: 280)
        case .posts:
            return .zero
        }
    }
    
}
