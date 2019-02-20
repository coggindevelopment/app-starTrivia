//
//  SelectPersonVC.swift
//  StarTrivia
//
//  Created by Nicholas Coggin on 2/18/19.
//  Copyright © 2019 Nicholas Coggin. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
    }

}

