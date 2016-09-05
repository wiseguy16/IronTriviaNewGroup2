//
//  ViewController.swift
//  IronTrivia
//
//  Created by Gregory Weiss on 9/1/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import Firebase

protocol APIControllerProtocol
{
    func getTheQuestions(theQuestionsDict: [String: AnyObject])
}


class ViewController: UIViewController, UITextFieldDelegate, APIControllerProtocol
{
    
    var ref: FIRDatabaseReference!
    private var refHandle: FIRDatabaseHandle!
    var games = Array<FIRDataSnapshot>()
    var arrayOfGames = [Game]()
    var arrayOfDummyGames = [[String: AnyObject]]()
   // var delegate: APIController.self
    
    var anAPIController: APIController!
    
    var aGameItem: GameItem!
    var theGameScore = 0
    
    var game = [String: AnyObject]()
    var dummyGame = [String: AnyObject]()
    var gameID: String = ""
    var category: String = ""
    var question1: String = ""
    var answer1: String = ""

    var playerScore: String = ""
    var numberAnsweredCorrectly: String = ""
    
    var username: String = ""
    
    
    
    @IBOutlet weak var gameIDTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var question1TextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    
    
    @IBOutlet weak var gameLabel1: UILabel!
    @IBOutlet weak var gameLabel2: UILabel!
    
    @IBOutlet weak var rightOrWrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    
    
    //ROSS
    var categoryID: String = ""
    var x = 0
    /////////////////////////
    

    
    //ROSS
    @IBOutlet weak var getCategoryTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    
    ////////////////

    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        anAPIController = APIController(delegate: self)
        
         configureDatabase()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        if !AppState.sharedInstance.signedIn
        {
            performSegueWithIdentifier("ModalLoginSegue", sender: self)
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureDatabase()
    {
        ref = FIRDatabase.database().reference()
        // Listen for new messages from Firebase
        refHandle = ref.child("games").observeEventType(.ChildAdded, withBlock: {
            (snapshot) -> Void in
            self.games.append(snapshot)
        
        })
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == gameIDTextField
        {
            gameID = gameIDTextField.text!
        //    categoryTextField.becomeFirstResponder()
        }
        else if textField == categoryTextField
        {
            category = categoryTextField.text!
        //    question1TextField.becomeFirstResponder()
        }
        else if textField == question1TextField
        {
            question1 = question1TextField.text!
          //  answer1TextField.becomeFirstResponder()
        }
        else if textField == answer1TextField
        {
            answer1 = answer1TextField.text!
            resignFirstResponder()
        }
        
        
        return true
    }

    
    @IBAction func send2FirebaseTapped(sender: UIButton)
    {
  //      let aNewGameItem: GameItem
  //     sendMessage(aNewGameItem.prepare4Firebase())
        
      }
    
    
    
    func sendMessage(game: NSDictionary?)
    {
        if let gme = game
        {
            
            
//                if username == AppState.sharedInstance.displayName!
//                    
//                    //Push to Firebase Database
            ref.child("games").childByAutoId().setValue(gme)
//            let gmeSnapshot = ref.child("games")
//            games.append(gmeSnapshot)
            
            
            
        }
    }
    
    @IBAction func getDataTapped(sender: UIButton)
    {
        
        /*
        for i in 0..<games.count
        {
            let gameSnapshot = games[i]
            let sampleGame = gameSnapshot.value as! Dictionary<String, String>
            let aDummyGame = GameItem(gameDict: sampleGame)
            arrayOfGames.append(aDummyGame)
//            if let thisGame = sampleGame["question1"]
//            {
//                print(thisGame)
//            }
//            print(arrayOfGames[i].answer1)
        }
      //  print(arrayOfGames)
       // arrayOfGames = games as! [GameItem]
       // print("\(games[0])")
        //retrieveGamesData()
        showGameResultsData()
        */
    }
    
    
    
    
    func getTheQuestions(theQuestionsDict: [String: AnyObject]) //-> Game
    {
        
        var newCluesArray = [ClueBuilder]()
        let anAPIResult = APIResult(resultDict: theQuestionsDict)
        
        for aClue in anAPIResult.cluesArray
        {
            let newClue = ClueBuilder(clueBuilderDict: aClue)
            newCluesArray.append(newClue)
        }
        
        let newGameClues = newCluesArray
        let newGame = Game()
        newGame.clueArray = newGameClues
        
        arrayOfGames.append(newGame)
    }
    

    //ROSS***************
    
    
    // This action sends category ID# to api and gets questions back to play game with
    
    @IBAction func getACategoryPressed(sender: UIButton)
    {
        let userCategoryInput = getCategoryTextField.text
        categoryID = userCategoryInput!
        anAPIController.getPuzzleFromAPI(categoryID)
        
    }
    
    
    // This action gets first question from the array and displays it to be answered
    
    @IBAction func checkGamePressed(sender: UIButton)
    {
        
        questionLabel.text = arrayOfGames[0].clueArray[x].question
        answerTextField.becomeFirstResponder()
        
    //  let gmeSnapshot = arrayOfGames[0]
    //   let newSnapshot = gmeSnapshot["score"] as! Int
    //   let gmeSnapshot = ref.child("games")
    //   games.append(gmeSnapshot)
    //   arrayOfDummyGames.append(gme as! [String: AnyObject])
    //   ref.child("games").childByAutoId().setValue(gme)
        
    }
    
    
    
    // This action checks if question was answwered right and retrieves next question
    
    @IBAction func checkAnswerPressed(sender: UIButton)
    {
        
        arrayOfGames[0].userAnswerArray.append("\(answerTextField.text!)")
        
        if answerTextField.text?.lowercaseString == arrayOfGames[0].clueArray[x].answer.lowercaseString
        {
            print("***YOU RIGHT***")
            rightOrWrongLabel.text = "YOU RIGHT!!!"
            theGameScore = theGameScore + 1
        }
        else
        {
            print("***SUCK IT TREBEK***")
            rightOrWrongLabel.text = "***SUCK IT TREBEK***"
            theGameScore = theGameScore - 1
        }
        print(arrayOfGames[0].clueArray[x].question)
        print(arrayOfGames[0].clueArray[x].answer)
        print(arrayOfGames[0].userAnswerArray)
         //  ref.child("games").childByAutoId().updateChildValues(["games":arrayOfGames[0]])
        
        
        correctAnswerLabel.text = "Correct answer is:  \(arrayOfGames[0].clueArray[x].answer)"
        x = x+1
        answerTextField.text = ""
        
        scoreLabel.text = "\(theGameScore)"
        
        questionLabel.text = arrayOfGames[0].clueArray[x].question
        
      
        
    }

    



}

