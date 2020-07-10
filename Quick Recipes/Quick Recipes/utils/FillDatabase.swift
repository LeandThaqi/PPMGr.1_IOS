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
        var config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 3,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        let realm = try! Realm(configuration: config)
        
        //Vala e pare e uploadimeve
        /*
        let namesOfRecipes = ["Parmesan Chicken","French Chicken"]
        let imagePath=["chicken-parmesan.jpeg","french-chicken.jpeg"]
        let ingredients=["-4 chicken breasts\n-1 pinch salt and black pepper\n-2 eggs\n1 cup panko bread crumbs\n-1/2 cup Parmesan cheese\n-1 cup olive oil\n-1/4 cup fresh mozzarella","-1 cup bread crumbs\n-1 package dry French onion soup mix\n-1/3 cup mayonnaise\n-1tablespoon garlic paste\n-4 chicken breasts"]
        let instructions = ["Step1\nPreheat an oven to 450 degrees F (230 degrees C).\nStep2\nPlace chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface. Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper.","Step1\nPreheat the oven to 425 degrees F (220 degrees C).\nStep2\nMix bread crumbs and dry soup mix together in a bowl."]
        let time=["1.5h","2h"]
        let persons=["4","6"]
        let category=["MainDishes","MainDishes"]
        */
        
        //Vala e dyte e uploadimeve
        
        let namesOfRecipes=["Grilled Salmon","Lasanga","Broccoli Salad","Parrothead Salad","Black Magic Cake","Chocolate Cupcake","Smooth Sweet Tea"]
        let imagePath=["Grilled-Salmon.jpg","Lasagna.jpg","Broccoli-Salad.jpeg","Parrothead-Salad.jpg","BlackMagic-Cake.jpeg","Chocolate-Cupcake.jpg","SmoothSweet-Tea.jpeg"]
        let ingredients=["-1 ½ pounds salmon fillets\n-½ teaspoon lemon pepper to taste\n-¼ teaspoon garlic powder to taste\n-½ teaspoon salt to taste\n-⅓ cup soy sauce\n-⅓ cup brown sugar\n-⅓ cup water\n-¼ cup vegetable oil","-1 pound sweet Italian sausage\n-¾ pound lean ground beef\n-½ cup minced onion\n-2 cloves garlic, crushed\n-1 (28 ounce) can crushed tomatoes\n-2 (6 ounce) cans tomato paste\n-2 (6.5 ounce) cans canned tomato sauce\n-½ cup water\n-2 tablespoons white sugar\n-1 ½ teaspoons dried basil leaves","-1 head fresh broccoli, cut into bite size pieces\n-¼ cup red onion, chopped\n-½ cup raisins\n-3 tablespoons white wine vinegar\n-2 tablespoons white sugar\n-1 cup sunflower seeds","-1 head leaf lettuce - rinsed, dried, and torn into bite-size pieces\n-½ pound fresh strawberries, sliced\n-½ pound fresh blueberries\n-1 mango, peeled, seeded, and cut into strips\n-1 cup cherry tomatoes, halved\n-½ cup raisins\n-¼ cup toasted slivered almonds\n-¼ cup chopped red onion","-1 ¾ cups all-purpose flour\n-2 cups white sugar\n-¾ cup unsweetened cocoa powder\n-2 teaspoons baking soda\n-1 teaspoon baking powder\n-2 eggs\n-1 cup strong brewed coffee\n-1 cup buttermilk\n-1 teaspoon vanilla extract","-1 ⅓ cups all-purpose flour\n-¼ teaspoon baking soda\n-2 teaspoons baking powder\n-¾ cup unsweetened cocoa powder\n-⅛ teaspoon salt\n-3 tablespoons butter, softened\n-1 ½ cups white sugar\n-2 eggs\n-¾ teaspoon vanilla extract\n-1 cup milk","-1 pinch baking soda\n-2 cups boiling water\n-6 eaches tea bags\n-¾ cup white sugar\n-6 cups cool water"]
        let instructions=["Step 1\nSeason salmon fillets with lemon pepper, garlic powder, and salt.\n\nStep 2\nIn a small bowl, stir together soy sauce, brown sugar, water, and vegetable oil until sugar is dissolved. Place fish in a large resealable plastic bag with the soy sauce mixture, seal, and turn to coat. Refrigerate for at least 2 hours.\n\nStep 3\nPreheat grill for medium heat.\n\nStep 4\nLightly oil grill grate. Place salmon on the preheated grill, and discard marinade. Cook salmon for 6 to 8 minutes per side, or until the fish flakes easily with a fork.","Step 1\nIn a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 teaspoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally.\n\nStep 2\nBring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt.\n\nStep 3\nPreheat oven to 375 degrees F (190 degrees C).\n\nStep 4\nTo assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13 inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese.","Step 1\nIn a medium bowl, combine the broccoli, onion and raisins. In a small bowl, whisk together the vinegar, sugar and mayonnaise. Pour over broccoli mixture, and toss until well mixed. Refrigerate for at least two hours.\n\nStep 2\nBefore serving, toss salad with sunflower seeds.","Step 1\nToss the lettuce, strawberries, blueberries, mango, tomatoes, raisins, almonds, and onions together in a salad bowl. Cover, and refrigerate at least 30 minutes to allow the flavors to mingle. Do not refrigerate more than 4 hours.\n\nStep 2\nPlace the bacon in a large, deep skillet, and cook over medium-high heat, turning occasionally, until crisp and evenly browned, about 10 minutes. Drain the bacon slices on a paper towel-lined plate. Crumble and sprinkle over the salad to serve.","Step 1\nPreheat oven to 350 degrees F (175 degrees C). Grease and flour two 9 inch round cake pans or one 9x13 inch pan.\n\nStep 2\nIn large bowl combine flour, sugar, cocoa, baking soda, baking powder and salt. Make a well in the center.\n\nStep 3\nAdd eggs, coffee, buttermilk, oil and vanilla. Beat for 2 minutes on medium speed. Batter will be thin. Pour into prepared pans.\n\nStep 4\nBake at 350 degrees F (175 degrees C) for 30 to 40 minutes, or until toothpick inserted into center of cake comes out clean. Cool for 10 minutes, then remove from pans and finish cooling on a wire rack. Fill and frost as desired.","Step 1\nPreheat oven to 350 degrees F (175 degrees C). Line a muffin pan with paper or foil liners. Sift together the flour, baking powder, baking soda, cocoa and salt. Set aside.\n\nStep 2\nIn a large bowl, cream together the butter and sugar until light and fluffy. Add the eggs one at a time, beating well with each addition, then stir in the vanilla. Add the flour mixture alternately with the milk; beat well. Fill the muffin cups 3/4 full.\n\nStep 3\nBake for 15 to 17 minutes in the preheated oven, or until a toothpick inserted into the cake comes out clean. Frost with your favorite frosting when cool.","Step 1\nSprinkle a pinch of baking soda into a 64-ounce, heat-proof, glass pitcher. Pour in boiling water, and add tea bags. Cover, and allow to steep for 15 minutes.\n\nStep 2\nRemove tea bags, and discard; stir in sugar until dissolved. Pour in cool water, then refrigerate until cold."]
        let time=["1h","3.5h","15min","30min","1h","30min","15min"]
        let persons=["6","12","3","6","24","16","8"]
        let category=["MainDishes","MainDishes","Healthy","Healthy","Desserts","Desserts","Drinks"]
        
        var i=0
        while i < namesOfRecipes.count{
            let recipe=Recipe()
            recipe.name=namesOfRecipes[i]
            recipe.imagePath=imagePath[i]
            recipe.ingredients=ingredients[i]
            recipe.instructions=instructions[i]
            recipe.timeNeeded=time[i]
            recipe.persons=persons[i]
            recipe.category=category[i]
            try! realm.write {
                realm.add(recipe)
            }
            i+=1
        }
    
    }
    
}
