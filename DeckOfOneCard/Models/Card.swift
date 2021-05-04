//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Ethan Scott on 5/4/21.
//

import Foundation

struct TopLevelObject: Decodable {
    
    var cards: [Card]
}//End of struct

struct Card: Decodable {
    
    var value: String
    var suit: String
    var image: URL?
    
}//End of struct
