//
//  MovieCellView.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 26/02/23.
//

import Foundation
import UIKit


// codigo de vista y diseño

class MovieCellView: UITableViewCell {
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieName: UILabel = {
       let label = UILabel()
        label.numberOfLines=0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
       let label = UILabel()
        label.numberOfLines=0
        label.font = .systemFont(ofSize: 12 , weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) no se ha implemantado")
    }
    
    //tamaños y constraint
    func setupViews(){
        addSubview(movieImageView)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 17),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8)
            
            
            
        
        ])
    }
    
    func configure(model: NowPlayingEntity){
        movieName.text = model.title
        movieDescription.text = model.overview
    }
    
}
