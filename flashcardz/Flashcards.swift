//
//  Flashcards.swift
//  flashcardz
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import Foundation
class Flashcard {
    var question : String
    var correctAnswer : String
    var options : [String]
    init(question : String, options : [String]) {
        self.question = question
        self.options  = options
        self.correctAnswer = options[0]
    }
}
class CardCollection {
    public static var instance : CardCollection = CardCollection()
    public private(set) var cards: [Flashcard]
    public private(set) var currentIndex : Int
    public var currentCard : Flashcard {
        get{return cards[currentIndex]
        }
    }
    private init(){
        cards = [Flashcard(question: "Test Question", options: ["True","False"])]
        currentIndex = 0
    }
    public func nextQuestion(){
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
            
        }
    }
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
