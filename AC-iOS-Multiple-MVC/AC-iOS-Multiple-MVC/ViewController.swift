//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animals = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var sectionedAnimals = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(ZooAnimal.getSections())
        tableView.dataSource = self
        loadData()
        
        
    }
    
    func loadData() {
        animals = ZooAnimal.getSections()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? zooAnimalDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        dvc.animalsDVC = animals[indexPath.section][indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = animals[indexPath.section][indexPath.row]
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.info
        cell.imageView?.image = UIImage(named: "\(animal.imageNumber)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animals[section].first?.classification
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    
    
}

