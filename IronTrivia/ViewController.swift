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
    var arrayOfDummyGames = [String: AnyObject]()
   // var delegate: APIController.self
    
    var anAPIController: APIController!
    
    var aGameItem: GameItem!
    
    var game = [String: AnyObject]()
    var dummyGame = [String: AnyObject]()
    var gameID: String = ""
    var category: String = ""
    var question1: String = ""
    var answer1: String = ""
    var question2: String = ""
    var answer2: String = ""
    var question3: String = ""
    var answer3: String = ""
    var question4: String = ""
    var answer4: String = ""
    var question5: String = ""
    var answer5: String = ""
    var playerScore: String = ""
    var numberAnsweredCorrectly: String = ""
    
    var username: String = ""
    
    
    
    @IBOutlet weak var gameIDTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var question1TextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    
    
    @IBOutlet weak var gameLabel1: UILabel!
    @IBOutlet weak var gameLabel2: UILabel!
    
    //ROSS
    var categoryID: String = ""
    var x=0
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
        //anAPIController.getPuzzleFromAPI()
        
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
           // self.arrayOfGames.append(snapshot) as! GameItem
            //self.messages.insert(snapshot, atIndex: 0)
            // self.tableview.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
         //   self.tableview.insertRowsAtIndexPaths([NSIndexPath(forRow: self.messages.count-1, inSection: 0)], withRowAnimation: .Automatic)
        })
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == gameIDTextField
        {
            gameID = gameIDTextField.text!
            categoryTextField.becomeFirstResponder()
        }
        else if textField == categoryTextField
        {
            category = categoryTextField.text!
            question1TextField.becomeFirstResponder()
        }
        else if textField == question1TextField
        {
            question1 = question1TextField.text!
            answer1TextField.becomeFirstResponder()
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
//        let game = ["playerName": AppState.sharedInstance.displayName!,
//                    "gameId": gameID,
//                    "category": category,
//                    "question1": question1,
//                    "answer1": answer1,
//                    "question2": question2,
//                    "answer2": answer2,
//                    "question3": question3,
//                    "answer3": answer3,
//                    "question4": question4,
//                    "answer4": answer4,
//                    "question5": question5,
//                    "answer5": answer5,
//                    "playerScore": playerScore,
//                    "numberAnsweredCorrectly": numberAnsweredCorrectly
//                    ]
        let aNewGameItem: GameItem
  //     sendMessage(aNewGameItem.prepare4Firebase())
        
        /*
         playerName = gameDict["playerName"]!
         gameId = gameDict["gameId"]!
         category = gameDict["category"]!
         playerScore = gameDict["playerScore"]!
         numberAnsweredCorrectly = gameDict["numberAnsweredCorrectly"]!
         question1 = gameDict["question1"]!
         answer1 = gameDict["answer1"]!
         question2 = gameDict["question1"]!
         answer2 = gameDict["answer1"]!
         question3 = gameDict["question1"]!
         answer3 = gameDict["answer1"]!
         question4 = gameDict["question1"]!
         answer4 = gameDict["answer1"]!
         question5 = gameDict["question1"]!
         answer5 = gameDict["answer1"]!
         */
    }
    
    
    
    func sendMessage(game: NSDictionary?)
    {
        if let gme = game
        {
            
            
//                if username == AppState.sharedInstance.displayName!
//                {
//                    let gameData = ["gameId": gameID, "category": category, "question1": question1, "answer1": answer1]
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
    
    
    
    func showGameResultsData()
    {
        let bDummyGame = arrayOfGames.last
        //let cDummyGame = arrayOfGames.last
        
       // gameLabel1.text! = bDummyGame!.answer1
      //  gameLabel2.text! = bDummyGame!.question1
        
//        let recentGamesSnaphot = (ref?.child("games").queryEqualToValue("sports"))!
//         let gmeResultID = recentGamesSnaphot.valueForKey("gameId")
//        let gmeResultQ1 = recentGamesSnaphot.valueForKey("question1")
//        let gmeResultA1 = recentGamesSnaphot.valueForKey("answer1")
//        print(gmeResultID)
//        print(gmeResultQ1)
//        print(gmeResultA1)
        
    }
    
    func getTheQuestions(theQuestionsDict: [String: AnyObject]) //-> Game
    {
        
        var newCluesArray = [ClueBuilder]()
        //var answersArray = [String]()
        let anAPIResult = APIResult(resultDict: theQuestionsDict)
        
        for aClue in anAPIResult.cluesArray
        {
            let newClue = ClueBuilder(clueBuilderDict: aClue)
            newCluesArray.append(newClue)
            //print(newClue.answer)
        }
        
        let newGameClues = newCluesArray
        let newGame = Game()
        newGame.clueArray = newGameClues
        
        
        //print(newGame.clueArray[3].answer)
        
        arrayOfGames.append(newGame)
        //return newGame
    }
    
    // Last 100 posts, these are automatically the 100 most recent
    // due to sorting by push() keys
 //   let recentGamesByCategoryQuery = (ref?.child("posts").queryEqualToValue("sports"))!
    
//    let myTopPostsQuery = (ref.child("user-posts").child(getUid())).queryOrderedByChild("starCount")
    
//    refHandle = postRef.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
//    let postDict = snapshot.value as! [String : AnyObject]
//    // ...
//    })


    //ROSS***************
    @IBAction func getACategoryPressed(sender: UIButton)
    {
        let userCategoryInput = getCategoryTextField.text
        categoryID = userCategoryInput!
        anAPIController.getPuzzleFromAPI(categoryID)
        
    }
    
    @IBAction func checkGamePressed(sender: UIButton)
    {
        
        questionLabel.text = arrayOfGames[0].clueArray[x].question
        answerTextField.becomeFirstResponder()
        
        
        
        
        
    }
    
    @IBAction func checkAnswerPressed(sender: UIButton)
    {
        
        arrayOfGames[0].userAnswerArray.append("\(answerTextField.text!)")
        
        if answerTextField.text?.lowercaseString == arrayOfGames[0].clueArray[x].answer.lowercaseString
        {
            print("***YOU RIGHT***")
        }
        else
        {
            print("***SUCK IT TREBEK***")
        }
        print(arrayOfGames[0].clueArray[x].question)
        print(arrayOfGames[0].clueArray[x].answer)
        print(arrayOfGames[0].userAnswerArray)
        
        x = x+1
        answerTextField.text = ""
        
        questionLabel.text = arrayOfGames[0].clueArray[x].question
        
        //print(arrayOfGames[0].clueArray[x-1].userAnswer)
        //fgrg1234
        
    }

    



}

