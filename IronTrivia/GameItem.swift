//
//  GameItem.swift
//  IronTrivia
//
//  Created by Gregory Weiss on 9/2/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation
import Firebase

class GameItem
{
    var playerName: String
    var gameId: String
    var category: String
    var playerScore: String
    var numberAnsweredCorrectly: String
    var question1: String
    var answer1: String
    var question2: String
    var answer2: String
    var question3: String
    var answer3: String
    var question4: String
    var answer4: String
    var question5: String
    var answer5: String
    
    
    init(gameDict: [String: String]) // as! [String: AnyObject]) //as! Dictionary<String, String>)
    {
        playerName = gameDict["playerName"]!
        gameId = gameDict["gameId"]!
        category = gameDict["category"]!
        playerScore = gameDict["playerScore"]!
        numberAnsweredCorrectly = gameDict["numberAnsweredCorrectly"]!
        question1 = gameDict["question1"]!
        answer1 = gameDict["answer1"]!
        question2 = gameDict["question2"]!
        answer2 = gameDict["answer2"]!
        question3 = gameDict["question3"]!
        answer3 = gameDict["answer3"]!
        question4 = gameDict["question4"]!
        answer4 = gameDict["answer4"]!
        question5 = gameDict["question5"]!
        answer5 = gameDict["answer5"]!
    }
    
    // ["gameId": gameID, "category": category, "question1": question1, "answer1": answer1]
    
    func prepare4Firebase() -> [String: String]
    {
        return ["playerName": AppState.sharedInstance.displayName!,
                    "gameId": gameId,
                    "category": category,
                    "question1": question1,
                    "answer1": answer1,
                    "question2": question2,
                    "answer2": answer2,
                    "question3": question3,
                    "answer3": answer3,
                    "question4": question4,
                    "answer4": answer4,
                    "question5": question5,
                    "answer5": answer5,
                    "playerScore": playerScore,
                    "numberAnsweredCorrectly": numberAnsweredCorrectly
        ]

    }
    
}
