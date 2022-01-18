//
//  CollectionViewController.swift
//  NetworkingApp
//
//  Created by Диана Овечкина on 16.01.2022.
//

import UIKit

enum Link: String {
    case imageURL = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    case exampleOne = "https://dog.ceo/api/breeds/image/random"
    case exampleTwo = "https://xkcd.com/info.0.json"
    case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    case exampleFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
}

enum UserAction: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class CollectionViewController: UICollectionViewController {
    
    private let userActions = UserAction.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userAction = userActions[indexPath.item]
        
        switch userAction {
            
        case .downloadImage:
            print()
        case .exampleOne: exampleOneButtonPressed()
        case .exampleTwo: exampleTwoButtonPressed()
        case .exampleThree:
            print()
        case .exampleFour:
            print()
        case .ourCourses:
            print()
        }
    }
}



extension CollectionViewController {
    private func exampleOneButtonPressed() {
    
        guard let url = URL(string: Link.exampleOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Dog.self, from: data)
                print(json)
            } catch {
                print(error.localizedDescription)
            }
            
            
        }.resume()

    }
    
    private func exampleTwoButtonPressed() {
    
        guard let url = URL(string: Link.exampleTwo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(HypothesisGeneration.self, from: data)
                print(json)
            } catch {
                print(error.localizedDescription)
            }
    
        }.resume()

    }

}
