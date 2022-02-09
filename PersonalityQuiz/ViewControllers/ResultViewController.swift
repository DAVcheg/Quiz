//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Aleksey Dergunov on 03.02.2022.
//

import UIKit


class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var selectAnimalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    // MARK: - Public Properties
    
    var chosen: [Answer]!
    
    // MARK: - Private Properties
    
    private var select = ""
    private var definition = ""
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        animalCountSelect()
        selectAnimalLabel.text = "Вы - \(select)"
        definitionLabel.text = definition
    }
}
// MARK: - Private Methods

extension ResultViewController {
    private func animalCountSelect() {
        var dogCount = 0, catCount = 0, rabbitCount = 0, turtleCount = 0
        
        for answer in chosen {
            switch answer.animal {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        print("Animal answer: Dog \(dogCount), Cat \(catCount), Rabbit \(rabbitCount), Turtle \(turtleCount)")
        
        if (dogCount > catCount) && (dogCount > rabbitCount) && (dogCount > turtleCount) {
            select = String(Animal.dog.rawValue)
            definition = Animal.dog.definition
        } else if (catCount > rabbitCount) && (catCount > turtleCount) {
            select = String(Animal.cat.rawValue)
            definition = Animal.cat.definition
        } else if (rabbitCount > turtleCount) {
            select = String(Animal.rabbit.rawValue)
            definition = Animal.rabbit.definition
        } else {
            select = String(Animal.turtle.rawValue)
            definition = Animal.turtle.definition
        }
        print(select)
    }
}
