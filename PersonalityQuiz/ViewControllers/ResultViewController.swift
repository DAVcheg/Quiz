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
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        animalCountSelect()
    }
}
// MARK: - Private Methods

extension ResultViewController {
    private func animalCountSelect() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = chosen.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
            let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
            guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
            
            updateUI(with: mostFrequencyAnimal)
        }
    }
    private func updateUI(with animal: Animal?) {
        selectAnimalLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        definitionLabel.text = animal?.definition ?? ""
    }
    
}

        
        
//        var dogCount = 0, catCount = 0, rabbitCount = 0, turtleCount = 0
//
//        for answer in chosen {
//            switch answer.animal {
//            case .dog:
//                dogCount += 1
//            case .cat:
//                catCount += 1
//            case .rabbit:
//                rabbitCount += 1
//            case .turtle:
//                turtleCount += 1
//            }
//        }
//        print("Animal answer: Dog \(dogCount), Cat \(catCount), Rabbit \(rabbitCount), Turtle \(turtleCount)")
//
//        if (dogCount > catCount) && (dogCount > rabbitCount) && (dogCount > turtleCount) {
//            select = String(Animal.dog.rawValue)
//            definition = Animal.dog.definition
//        } else if (catCount > rabbitCount) && (catCount > turtleCount) {
//            select = String(Animal.cat.rawValue)
//            definition = Animal.cat.definition
//        } else if (rabbitCount > turtleCount) {
//            select = String(Animal.rabbit.rawValue)
//            definition = Animal.rabbit.definition
//        } else {
//            select = String(Animal.turtle.rawValue)
//            definition = Animal.turtle.definition
//        }
//        print(select)
