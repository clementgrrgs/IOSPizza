//
//  ViewController.swift
//  Estiam Pizza
//
//  Created by Clement on 19/03/2019.
//  Copyright © 2019 Clement. All rights reserved.
//

import UIKit

struct Pizza {
    let title: String
    let ingredients: String
}

class PizzaCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var IngredientsLabel: UILabel!
    
    var title: String? {
        didSet {
            TitleLabel.text = title
        }
    }
    var ingredients: String? {
        didSet {
            IngredientsLabel.text = ingredients
        }
    }
}


class PizzasDataSource: NSObject {
    let pizza: [Pizza]
    
    init(pizza: [Pizza]) {
        self.pizza = pizza
    }
}


class ViewController: UIViewController {
   let dataSource: PizzasDataSource
    required public init?(coder : NSCoder) {
        let pizzas = [
            Pizza(title: "Margharita", ingredients:"Tomates Fromage"),
            Pizza(title: "Reine", ingredients:"Tomates,Fromage,Champignons"),
            Pizza(title: "4 Fromages", ingredients:"Tomates,Fromage,Fromage,Fromage,Fromage"),
            Pizza(title: "Calzone", ingredients:"Tomates,Fromage,Champignons,Oeuf")
        ]
        self.dataSource = PizzasDataSource(pizza: pizzas)
        super.init(coder: coder)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ListView.estimatedRowHeight = 100
        ListView.rowHeight = UITableView.automaticDimension
        ListView.dataSource = dataSource
        ListView.reloadData()
    }
}

extension PizzasDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PizzaCell.self)) as! PizzaCell
        let pizz = pizza[indexPath.row]
        cell.title = pizz.title
        cell.ingredients = pizz.ingredients
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.count
    }
}
