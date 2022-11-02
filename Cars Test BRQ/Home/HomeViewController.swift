//
//  HomeViewController.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 02/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var cars: Cars?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.tableView.delegate = self
        self.homeScreen?.tableView.dataSource = self
        Service().getCars { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(result):
                    self.cars = result
                    self.homeScreen?.tableView.reloadData()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsViewCell.reuseIdentifier, for: indexPath) as! CarsViewCell
        guard let carIndex = cars?[indexPath.row] else {return UITableViewCell()}
        cell.configure(with: carIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let car = cars?[indexPath.row] else {return}
        let carDetailVC = CarDetailViewController()
        carDetailVC.carDetail = car
        self.present(carDetailVC, animated: true)
    }
}
