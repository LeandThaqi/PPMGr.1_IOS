//
//  RecipeModel.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 6.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import Foundation
import RealmSwift

class Recipe: Object {
    @objc dynamic var name=""
    @objc dynamic var imagePath=""
    @objc dynamic var ingredients=""
    @objc dynamic var instructions=""
    @objc dynamic var timeNeeded=""
    @objc dynamic var persons=""
    @objc dynamic var category=""
}
	
