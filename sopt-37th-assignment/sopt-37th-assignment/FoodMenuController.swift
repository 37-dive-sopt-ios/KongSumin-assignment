//
//  FoodMenuCollectionView.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import UIKit
import SnapKit
public final class FoodMenuController: UIViewController {
    // MARK: - Properties
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 21
    private let cellHeight: CGFloat = 198
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       layout.minimumLineSpacing = itemSpacing
       layout.minimumInteritemSpacing = lineSpacing
       layout.sectionInset = collectViewInset
       
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
       return collectionView
    }()
    
    private var foods: [FoodModel] = []
    
    //MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        register()
        setDelegate()
        setLayout()
        loadMockData()
    }
    // MARK: - UI & Layout
        private func setUI() {
            view.backgroundColor = .white
            title = "피드"
        }
        
        private func setLayout() {
            view.addSubview(collectionView)
            
            collectionView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        private func register() {
            collectionView.register(FoodMenuCollectionViewCell.self, forCellWithReuseIdentifier: FoodMenuCollectionViewCell.identifier)
        }
        
        private func setDelegate() {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
        
        // MARK: - Data
        
        private func loadMockData() {
            foods = FoodModel.mockData
            collectionView.reloadData()
        }
}
// MARK: - UICollectionViewDelegate
extension FoodMenuController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(foods[indexPath.item].name) 선택됨")
    }
}

// MARK: - UICollectionViewDataSource
extension FoodMenuController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodMenuCollectionViewCell.identifier, for: indexPath) as? FoodMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(food: foods[indexPath.item])
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension FoodMenuController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 62, height: 78)
    }
}

#Preview {
    FoodMenuController(nibName: nil, bundle: nil)
}
