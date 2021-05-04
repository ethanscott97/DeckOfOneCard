//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Ethan Scott on 5/4/21.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    //MARK: - Functions
    func fetchImageAndUpdateViews(for card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let image):
                    self?.cardImageView.image = image
                    self?.cardLabel.text = "\(card.value) of \(card.suit)"
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }
}//End of class
