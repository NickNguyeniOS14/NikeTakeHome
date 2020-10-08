//
//  DetailAlbumViewController.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import UIKit
import SafariServices

class DetailAlbumViewController: UIViewController {
    
    var album: Album
    var albumController: AlbumController

    let albumImageView = UIImageView()
    let genreLabel = UILabel()
    let copyRightLabel = UILabel()
    let releaseDateLabel = UILabel()
    let showWebsiteButton = UIButton()

    init(album: Album, albumController: AlbumController) {
        self.album = album
        self.albumController = albumController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = album.artistName
        view.backgroundColor = .white
        [albumImageView, genreLabel, copyRightLabel, releaseDateLabel, showWebsiteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubViews(albumImageView,genreLabel,copyRightLabel,releaseDateLabel,showWebsiteButton)

        albumImageView.contentMode = .scaleAspectFit

        showWebsiteButton.backgroundColor = .link
        showWebsiteButton.setTitle("Visit Website", for: .normal)
        showWebsiteButton.addTarget(self, action: #selector(showWebsite), for: .touchUpInside)

        for label in [genreLabel, copyRightLabel, releaseDateLabel] {
            label.textAlignment = .center
        }
        copyRightLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 300),


            showWebsiteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20),
            showWebsiteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showWebsiteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            showWebsiteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),

            genreLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor,constant: 20),
            genreLabel.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),

            releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor,constant: 20),
            releaseDateLabel.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),

            copyRightLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor,constant: 20),
            copyRightLabel.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            copyRightLabel.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),
            copyRightLabel.heightAnchor.constraint(equalToConstant: 100)

        ])


        albumController.downloadImageFor(album: album) { (result) in
            DispatchQueue.main.async {
                self.albumImageView.image = try? result.get()
            }
        }
        let genresStrings = album.genres.map { $0.name }
        genreLabel.text = "Genre: \(genresStrings.joined(separator: ","))"
        releaseDateLabel.text = "Release Date: \(album.releaseDate)"
        copyRightLabel.text = album.copyright

    }

    @objc func showWebsite() {
        let appleURL = URL(string: album.url)!
        let safariController = SFSafariViewController(url: appleURL)
        self.present(safariController, animated: true, completion: nil)
        
    }
}


