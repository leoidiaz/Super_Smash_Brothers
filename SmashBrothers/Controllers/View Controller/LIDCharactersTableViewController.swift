//
//  LIDCharactersTableViewController.swift
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class LIDCharactersTableViewController: UITableViewController {
    //MARK: - Properties
    private let segueIdentifier = "toMovesVC"
    private let reuseIdentifier = "characterCell"
    
    var characters = [LIDCharacters](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Private Methods
    private func updateViews(){
        LIDCharacterController.fetch { (characters) in
            self.characters = characters
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LIDCharacterTableViewCell else { return UITableViewCell()}
        let character = characters[indexPath.row]
        cell.character = character
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? LIDMovesListTableViewController else { return }
            let character = characters[indexPath.row]
            destinationVC.character = character
        }
    }

}
