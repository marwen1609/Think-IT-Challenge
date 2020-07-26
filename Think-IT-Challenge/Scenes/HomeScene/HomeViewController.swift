//
//  HomeViewController.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/26/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    // MARK: - Properties
    var viewModel: HomeViewModel?
    let cellIdentifier = "RoomsTableViewCell"
    let cellNib = UINib(nibName: "RoomsTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        registerTableView()
    }
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        
    }
    func setupBindings(){
        guard let viewModel = viewModel else {
            return }
        
        viewModel.welcomeText.asObservable()
            .map { text -> String? in
                return Optional(text)
        }.bind(to:welcomeLabel.rx.text)
            .disposed(by:self.disposeBag)
        
        viewModel.dateText.asObservable()
            .map { text -> String? in
                return Optional(text)
        }.bind(to:dateLabel.rx.text)
            .disposed(by:self.disposeBag)
        
    }
    
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RoomsTableViewCell
        guard let viewModel = viewModel else { return cell }
        cell.roomImageView.image = UIImage(named:(viewModel.rooms[indexPath.row].imageName))
        cell.devicesLabel.text = ("\(viewModel.rooms[indexPath.row].devices) Devices")
        cell.roomNameLabel.text = viewModel.rooms[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
