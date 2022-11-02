//
//  CarDetailViewController.swift
//  Cars Test BRQ
//
//  Created by Vinicius on 02/11/22.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    var carDetailScreen: CarDetailScreen?
    var carDetail: Car?
    
    override func loadView() {
        self.carDetailScreen = CarDetailScreen()
        self.view = carDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let populateCar = carDetail else {return}
        
        carDetailScreen?.configure(with: populateCar)
        
    }
}
