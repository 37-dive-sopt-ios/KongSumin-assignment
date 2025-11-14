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
    private lazy var foodMenuView = FoodMenuController()
    private lazy var storeController = StoreController()
    private let adImages: [UIImage] = [
        UIImage(named: "image21")!,
        UIImage(named: "image21")!,
        UIImage(named: "image21")!
    ]
    private lazy var bmartImageView = UIImageView().then{
        $0.image = .eventBtn
    }
    private lazy var eventTextButton = UIButton().then{
        $0.setTitle("전상품 쿠폰팩 + 60%특가", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .baeminBlack
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: -4)
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.titleLabel?.font = Fontmanager.head_b_18.font
    }    
    
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
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(tabs[selectedIndex]) 에서 더보기 >", for: .normal)
        button.titleLabel?.font = Fontmanager.head_b_18.font
        button.setTitleColor(.baeminBlack, for: .normal)
        return button
    }()
    
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
        addSubview(bmartImageView)
        bmartImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(16)
            $0.width.equalTo(50)
        }
        addSubview(eventTextButton)
        eventTextButton.snp.makeConstraints{
            $0.top.equalTo(bmartImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(eventTextButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.height.equalTo(3)
            indicatorWidthConstraint = $0.width.equalTo(0).constraint
            indicatorLeadingConstraint = $0.leading.equalToSuperview().constraint
        }
        addSubview(foodMenuView.view)
        foodMenuView.view.snp.makeConstraints {
            $0.top.equalTo(indicatorView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(168)
        }
        addSubview(seeMoreButton)
        seeMoreButton.snp.makeConstraints {
            $0.top.equalTo(foodMenuView.view.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        addSubview(storeController.view)
        storeController.view.snp.makeConstraints {
            $0.top.equalTo(seeMoreButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(116)
        }
        addSubview(adCollectionView)
        adCollectionView.snp.makeConstraints {
            $0.top.equalTo(storeController.view.snp.bottom).offset(10)
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
        seeMoreButton.setTitle("\(tabs[selectedIndex]) 에서 더보기 >", for: .normal)
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
    bottomView.frame = CGRect(x: 0, y: 0, width: 393, height: 600)
    bottomView.backgroundColor = .systemBlue
    return bottomView
}

