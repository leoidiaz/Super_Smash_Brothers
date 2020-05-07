//
//  LIDMovesListTableViewController.swift
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class LIDMovesListTableViewController: UITableViewController {
    
    //MARK: - Proprerties
    private let reuseIdentifier = "movesCell"
    
    var character: LIDCharacters?
    
    var moves = [String](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Private Methods
    private func updateViews(){
        guard let character = character else { return }
        LIDCharacterController.fetchMoves(withCharacter: character) { (moves) in
            DispatchQueue.main.async {
                self.moves = moves
            }
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moves.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let move = moves[indexPath.row]
        cell.textLabel?.text = move
        return cell
    }
}
