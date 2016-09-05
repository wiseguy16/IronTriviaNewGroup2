//
//  Game.swift
//  IronTrivia
//
//  Created by Gregory Weiss on 9/2/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation
import Firebase

class Game: NSObject
{
    var clueArray = [ClueBuilder]()
    var playerName = AppState.sharedInstance.displayName!
    var score = 0
    var userAnswerArray = [String]()


//    init(gameDict: [String: AnyObject])
//    {
//        
//        //clueArray = gameDict["clueArray"] as! [ClueBuilder]
//        //playerName = gameDict["playerName"] as! String
//        //score = gameDict["score"] as! Int
//        
//    }
    
//    func getTheQuestions(theQuestionsDict: [String: AnyObject]) -> [ClueBuilder]
//    {
//        //var newCluesArray = [ClueBuilder]()
//        //var answersArray = [String]()
//        let anAPIResult = APIResult(resultDict: theQuestionsDict)
//        
//        for aClue in anAPIResult.cluesArray
//        {
//            let newClue = ClueBuilder(clueBuilderDict: aClue)
//            clueArray.append(newClue)
//            //newCluesArray.append(newClue)
//            //print(newClue.answer)
//        }
//        //print(newCluesArray)
//        
////        let newGame = Game(gameDict: ["playerName": "Ross", "score": 0, "clueArray": newCluesArray])
////        let test = newGame.clueArray[0]
//        
//        return clueArray
//        
//        }
//    

}

    

