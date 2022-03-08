//
//  ViewController.swift
//  ItunesSearchApp
//
//  Created by Mehdi MMS on 07/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchPressed(_ sender: Any) {
        guard let term = searchTextField.text else { return }
        
        SearchResultsController.searchResultForSearchTerm(searchTerm: term) { [weak self] (results) in
            if let searchResults = results,
               let firstResult = searchResults.first {
                DispatchQueue.main.async {
                    self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
                }
            }
        }
    }
    
}

