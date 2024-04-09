//
//  HomeViewController.swift
//  TheMovie
//
//  Created by Jeiel Lima on 09/04/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorConstants.backColor
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
