//
//  ViewController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 5.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background_main.png")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //FillDatabase().fillDatabase()
        
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])        // Do any additional setup after loading the view.
    }


    @IBAction func shkoTe2(_ sender: UIButton) {
        performSegue(withIdentifier: "showTableView", sender: self)
    }
    
}

