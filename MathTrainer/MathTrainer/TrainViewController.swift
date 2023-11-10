//
//  TrainViewController.swift
//  MathTrainer
//
//  Created by Viki on 09/11/2023.
//

import UIKit

final class TrainViewController: UIViewController {
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons2()
    }
    
    @IBOutlet var buttonsCollection2: [UIButton]!
    
    private func configureButtons2() {
        // add shadow
        buttonsCollection2.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3
        }
}
}
