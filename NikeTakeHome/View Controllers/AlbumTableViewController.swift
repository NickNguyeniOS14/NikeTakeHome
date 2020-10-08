//
//  ViewController.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import UIKit

class AlbumTableViewController: UITableViewController {

    let albumController = AlbumController()

    enum TableView:String {
        case cellId = "CELL"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Top 100 Albums"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableView.cellId.rawValue) // 
        albumController.fetchAlbumsFromServer(callback: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumController.albums?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.cellId.rawValue, for: indexPath)
        let album = albumController.albums?[indexPath.row]
        cell.textLabel?.text = album?.artistName
        cell.detailTextLabel?.text = album?.name
        return cell
    }

}

