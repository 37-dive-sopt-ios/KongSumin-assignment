//
//  bottomView.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//
import Foundation
import UIKit
import Then
import SnapKit

class BottomView: UIView {
    // MARK: - Properties
    private let tabs: [String] = ["음식배달", "픽업", "장보기쇼핑", "선물하기", "혜택모아보기"]
    private let adImages: [UIImage] = [
        UIImage(named: "image21")!,
        UIImage(named: "image21")!,
        UIImage(named: "image21")!
    ]
    private lazy var adCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .baeminWhite
        cv.delegate = self
        cv.dataSource = self
        cv.register(AdCell.self, forCellWithReuseIdentifier: "AdCell")
        return cv
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .baeminWhite
        cv.delegate = self
        cv.dataSource = self
        cv.register(TabCell.self, forCellWithReuseIdentifier: "TabCell")
        return cv
    }()
    private let indicatorView = UIView().then {
        $0.backgroundColor = .baeminBlack
        $0.layer.cornerRadius = 1.5
    }
    private var indicatorLeadingConstraint: Constraint?
    private var indicatorWidthConstraint: Constraint?
    private var selectedIndex: Int = 0
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        DispatchQueue.main.async { [weak self] in
            self?.selectTab(at: 0, animated: false)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        DispatchQueue.main.async { [weak self] in
            self?.selectTab(at: 0, animated: false)
        }
    }
    
    // MARK: - Layout
    private func setupUI() {
        addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.height.equalTo(3)
            indicatorWidthConstraint = $0.width.equalTo(0).constraint
            indicatorLeadingConstraint = $0.leading.equalToSuperview().constraint
        }
        addSubview(adCollectionView)
        adCollectionView.snp.makeConstraints {
            $0.top.equalTo(indicatorView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(114)
        }
    }
    
    // MARK: - Tab Selection
    private func selectTab(at index: Int, animated: Bool) {
        guard index >= 0 && index < tabs.count else { return }
        selectedIndex = index
        menuCollectionView.reloadData()
        menuCollectionView.layoutIfNeeded()
        let cell = menuCollectionView.cellForItem(at: IndexPath(item: index, section: 0))
        let leading = cell?.frame.minX ?? 0
        let width = cell?.frame.width ?? 0
        indicatorLeadingConstraint?.update(offset: leading)
        indicatorWidthConstraint?.update(offset: width)
    }
}

// MARK: - UICollectionViewDataSource & Delegate
extension BottomView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return tabs.count
        }else if collectionView == adCollectionView {
            return adImages.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
            cell.titleLabel.text = tabs[indexPath.item]
            cell.titleLabel.textColor = (indexPath.item == selectedIndex) ? .baeminBlack : .baeminGray300
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as! AdCell
            cell.configure(image: adImages[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTab(at: indexPath.item, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:          UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView {
            let text = tabs[indexPath.item]
            let font = Fontmanager.head_b_18.font
            let width = text.size(withAttributes: [.font: font]).width + 20
            return CGSize(width: width, height: 44)
        } else{
            return CGSize(width: collectionView.bounds.width * 0.8, height: collectionView.bounds.height)
        }
    }
}

#Preview {
    let bottomView = BottomView()
    bottomView.frame = CGRect(x: 0, y: 0, width: 393, height: 120)
    bottomView.backgroundColor = .systemBlue
    return bottomView
}

