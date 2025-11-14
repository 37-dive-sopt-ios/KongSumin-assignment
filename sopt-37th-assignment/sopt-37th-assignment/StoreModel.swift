//
//  FoodModel.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import UIKit

public struct StoreModel {
    public let itemImg: UIImage
    public let name: String
    
    public init(itemImg: UIImage, name: String) {
        self.itemImg = itemImg
        self.name = name
    }
    
    public static let mockData: [StoreModel] = [
        StoreModel(itemImg: UIImage(named: "ice") ?? UIImage(), name: "B마트"),
        StoreModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "CU"),
        StoreModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "이마트슈퍼"),
        StoreModel(itemImg: UIImage(named: "bacon") ?? UIImage(), name: "홈플러스"),
        StoreModel(itemImg: UIImage(named: "taco") ?? UIImage(), name: "GS25"),
        StoreModel(itemImg: UIImage(named: "cake") ?? UIImage(), name: "세븐일레븐"),
        StoreModel(itemImg: UIImage(named: "nacho") ?? UIImage(), name: "이마트"),
        StoreModel(itemImg: UIImage(named: "pizza") ?? UIImage(), name: "B마트"),
        StoreModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "CU"),
        StoreModel(itemImg: UIImage(named: "taco") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "ice") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "bacon") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "마켓"),
        StoreModel(itemImg: UIImage(named: "cake") ?? UIImage(), name: "마켓")
    ]
}
