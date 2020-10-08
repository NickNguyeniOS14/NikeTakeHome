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
        case cellId = "cellID"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Top 100 Albums"

        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: TableView.cellId.rawValue)
        
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
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: TableView.cellId.rawValue)

        guard let album = albumController.albums?[indexPath.row] else { preconditionFailure("Something goes wrong") }
        
        cell.textLabel?.text = album.name
        cell.detailTextLabel?.text = album.name
        albumController.downloadImageFor(album: album, completion: { result in
            DispatchQueue.main.async {
                cell.setNeedsUpdateConstraints()
                cell.imageView?.image = try? result.get()
            }
        })

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


