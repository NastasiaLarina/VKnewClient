//
//  NewsViewCell.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 09.11.2020.
//

import UIKit

final class NewsViewCell: UITableViewCell {

    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var photoContainer: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
    }
    func configure(item: NewsItem) {
        authorImageView.image = UIImage.loadAvatar(item.author.avatar)
        authorLabel.text = item.author.fullName
        dataLabel.text = item.postDate
        newsTextLabel.text = item.text
        setupPhotos(item.photos)
        
    }
    
    private func setupPhotos (_ photos: [String]) {
        photoContainer.isHidden = photos.count == 0
        guard !photos.isEmpty else { return }
        
        switch photos.count {
        case 1:
            let imageView = createImageView(photos[0])
            photoContainer.addSubview(imageView)
            pinView(imageView, to: photoContainer)
        case 2:
            break
        case 3:
            break
        default:
            let topLeftImageView = createImageView(photos[0])
            let topRightImageView = createImageView(photos[1])
            let topStackView = UIStackView(arrangedSubviews: [topLeftImageView, topRightImageView])
            topStackView.translatesAutoresizingMaskIntoConstraints = false
            topStackView.axis = .horizontal
            
            let bottonLeftImageView = createImageView(photos[2])
            let bottonRightImageView = createImageView(photos[3])
            let bottonStackView = UIStackView(arrangedSubviews: [bottonLeftImageView, bottonRightImageView])
            bottonStackView.translatesAutoresizingMaskIntoConstraints = false
           bottonStackView.axis = .horizontal
            
            let stackView = UIStackView(arrangedSubviews: [topStackView, bottonStackView])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            
            photoContainer.addSubview(stackView)
            pinView(stackView, to: photoContainer)
            
            NSLayoutConstraint.activate([
                topLeftImageView.widthAnchor.constraint(equalTo: topRightImageView.widthAnchor),
                bottonLeftImageView.widthAnchor.constraint(equalTo: bottonRightImageView.widthAnchor),
                topStackView.heightAnchor.constraint(equalTo: bottonStackView.heightAnchor)
            ])
            
            let limit = 4
            if photos.count > limit {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = "+\(photos.count - limit)"
                label.textColor = .white
                label.font = .systemFont(ofSize: 80)
                
                bottonRightImageView.addSubview(label)
                NSLayoutConstraint.activate([
                    label.centerYAnchor.constraint(equalTo: bottonRightImageView.centerYAnchor),
                    label.centerXAnchor.constraint(equalTo: bottonRightImageView.centerXAnchor),
                    
                ])
               
            }
            
        }
    }
    
    private func createImageView(_ photo: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage.loadAvatar(photo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }
    private func pinView(_ view: UIView, to otherView: UIView) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: otherView.topAnchor),
            view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor)
        ])
        
    
    }
}
