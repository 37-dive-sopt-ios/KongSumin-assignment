//
//  FoodModel.swift
//  sopt-37th-assignment
//
//  Created by sumin Kong on 11/14/25.
//

import UIKit

public struct FoodModel {
    public let itemImg: UIImage
    public let name: String
    
    public init(itemImg: UIImage, name: String) {
        self.itemImg = itemImg
        self.name = name
    }
    
    public static let mockData: [FoodModel] = [
        FoodModel(itemImg: UIImage(named: "bacon") ?? UIImage(), name: "베이컨"),
        FoodModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "빵"),
        FoodModel(itemImg: UIImage(named: "cake") ?? UIImage(), name: "케이크"),
        FoodModel(itemImg: UIImage(named: "egg") ?? UIImage(), name: "계란"),
        FoodModel(itemImg: UIImage(named: "hamburger") ?? UIImage(), name: "햄버거"),
        FoodModel(itemImg: UIImage(named: "ice") ?? UIImage(), name: "아이스크림"),
        FoodModel(itemImg: UIImage(named: "nacho") ?? UIImage(), name: "나쵸"),
        FoodModel(itemImg: UIImage(named: "pizza") ?? UIImage(), name: "피자"),
        FoodModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "초밥"),
        FoodModel(itemImg: UIImage(named: "taco") ?? UIImage(), name: "타코"),
        FoodModel(itemImg: UIImage(named: "ice") ?? UIImage(), name: "아이스"),
        FoodModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "머빵"),
        FoodModel(itemImg: UIImage(named: "hamburger") ?? UIImage(), name: "햄벅"),
        FoodModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "수시"),
        FoodModel(itemImg: UIImage(named: "bacon") ?? UIImage(), name: "베이컨"),
        FoodModel(itemImg: UIImage(named: "bread") ?? UIImage(), name: "빵"),
        FoodModel(itemImg: UIImage(named: "cake") ?? UIImage(), name: "케이크"),
        FoodModel(itemImg: UIImage(named: "egg") ?? UIImage(), name: "계란"),
        FoodModel(itemImg: UIImage(named: "hamburger") ?? UIImage(), name: "햄버거"),
        FoodModel(itemImg: UIImage(named: "ice") ?? UIImage(), name: "아이스크림"),
        FoodModel(itemImg: UIImage(named: "nacho") ?? UIImage(), name: "나쵸"),
        FoodModel(itemImg: UIImage(named: "pizza") ?? UIImage(), name: "피자"),
        FoodModel(itemImg: UIImage(named: "sushi") ?? UIImage(), name: "초밥"),
    ]
}
