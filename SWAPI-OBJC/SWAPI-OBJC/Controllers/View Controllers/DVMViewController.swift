//
//  DVMViewController.swift
//  SWAPI-OBJC
//
//  Created by Hunter McNeil on 6/25/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import UIKit

class DVMViewController: UIViewController {

    @IBOutlet weak var personSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDefaultPerson()
    }
    
    func updateViews(person: DVMPerson) {
        DispatchQueue.main.async {
            self.nameLabel.text = person.name
            self.heightLabel.text = "Height: \(person.height)"
        }
    }

func fetchDefaultPerson() {
    DVMPersonController.fetchPerson(withSearchTerm: "1") { (person) in
        self.updateViews(person: person)
        }
    }
}

extension DVMViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        DVMPersonController.fetchPerson(withSearchTerm: searchTerm) { (person) in
            self.updateViews(person: person)
        }
    }
}
