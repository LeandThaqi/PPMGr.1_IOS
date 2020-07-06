//
//  FillDatabase.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 6.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import Foundation
import RealmSwift

class FillDatabase{
    func fillDatabase(){
        let realm = try! Realm()
        let namesOfRecipes = ["Parmesan Chicken","French Chicken"]
        let imagePath=["chicken-parmesan.jpeg","french-chicken.jpeg"]
        let ingredients=["-4 chicken breasts\n-1 pinch salt and black pepper\n-2 eggs\n1 cup panko bread crumbs\n-1/2 cup Parmesan cheese\n-1 cup olive oil\n-1/4 cup fresh mozzarella","-1 cup bread crumbs\n-1 package dry French onion soup mix\n-1/3 cup mayonnaise\n-1tablespoon garlic paste\n-4 chicken breasts"]
        let instructions = ["Step1\nPreheat an oven to 450 degrees F (230 degrees C).\nStep2\nPlace chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface. Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper.","Step1\nPreheat the oven to 425 degrees F (220 degrees C).\nStep2\nMix bread crumbs and dry soup mix together in a bowl."]
        let time=["1.5h","2h"]
        let persons=[4,6]
        var i=0
        while i < namesOfRecipes.count{
            let recipe=Recipe()
            recipe.name=namesOfRecipes[i]
            recipe.imagePath=imagePath[i]
            recipe.ingredients=ingredients[i]
            recipe.instructions=instructions[i]
            recipe.timeNeeded=time[i]
            recipe.persons=persons[i]
            try! realm.write {
                realm.add(recipe)
            }
            i+=1
        }
    
    }
    
}
