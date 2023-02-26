//
//  ListMoviesView.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 25/02/23.
//

import Foundation
import UIKit

class ListMoviesView: UIViewController{
    private var moviesTableView: UITableView = {
        let tableView  = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 123
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
    }()
    
    
    var presenter: ListMoviesPresenter?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) no se ha implementado")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupTableView()
        presenter?.onViewAppear()
    }
    
    private func setupTableView(){
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor)
        
        
        
        ])
        
        moviesTableView.dataSource = self
    }
}

extension ListMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter!.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        cell.backgroundColor = .black
        let model = presenter!.models[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }
    
    
}


extension ListMoviesView: ListMoviesUI{
    func update(movies:[NowPlayingEntity]) {
        print("Datos Recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
