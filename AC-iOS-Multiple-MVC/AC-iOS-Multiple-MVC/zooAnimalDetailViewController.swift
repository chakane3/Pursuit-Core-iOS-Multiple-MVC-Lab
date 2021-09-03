//
//  zooAnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Chakane Shegog on 9/2/21.
//  Copyright © 2021 AC-iOS. All rights reserved.
//

import UIKit

class zooAnimalDetailViewController: UIViewController {
    
    var animalsDVC: ZooAnimal!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var animalDetailLabel: UILabel!
    @IBOutlet weak var animalNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        imageView.image = UIImage(named: "\(animalsDVC.imageNumber)")
        animalDetailLabel.text = animalsDVC.info
        animalNameLabel.text = animalsDVC.name
        
    }


}
