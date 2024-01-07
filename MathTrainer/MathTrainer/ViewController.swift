//
//  ViewController.swift
//  MathTrainer
//
//  Created by Viki on 08/11/2023.
//

import UIKit

enum MathTypes: Int, CaseIterable {
    case add, subtract, multiply, divide
    
    var key: String {
        switch self {
        case .add:
            return "addCount"
        case .subtract:
            return "subtractCount"
        case .multiply:
            return "multiplyCount"
        case .divide:
            return "divideCount"
        }
    }
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    @IBOutlet weak var addCountLabel: UILabel!
    @IBOutlet weak var subtractCountLabel: UILabel!
    @IBOutlet weak var multiplyCountLabel: UILabel!
    @IBOutlet weak var divideCountLabel: UILabel!
    
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
    }
    
    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func clearAction(_ sender: Any) {
        MathTypes.allCases.forEach { type in
            let key = type.key
            UserDefaults.standard.removeObject(forKey: key)
            addCountLabel.text = "-"
            subtractCountLabel.text = "-"
            multiplyCountLabel.text = "-"
            divideCountLabel.text = "-"
        }
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        setCountLabels()
    }
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }
    
    private func setCountLabels() {
        MathTypes.allCases.forEach { type in
            let key = type.key
            guard let count = UserDefaults.standard.object(forKey: key) as? Int else { return }
            let stringValue = String(count)
            
            switch type {
            case .add:
                addCountLabel.text = stringValue
            case .subtract:
                subtractCountLabel.text = stringValue
            case .multiply:
                multiplyCountLabel.text = stringValue
            case .divide:
                divideCountLabel.text = stringValue
            }
        }
    }
    
    private func configureButtons() {
        // add shadow
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3
        }
    }
}
