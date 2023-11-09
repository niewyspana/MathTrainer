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
}
