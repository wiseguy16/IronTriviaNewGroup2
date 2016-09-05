//
//  APIController.swift
//  WordSearchAPI
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation

class APIController
{
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    var delegate: APIControllerProtocol!
    
    
    func getPuzzleFromAPI(userCategoryInput: String) //-> [[String: AnyObject]]
    {
        var questionsFromAPIDict = [String: AnyObject]()
        
        let firstURL = NSURL(string: "http://jservice.io/api/category?id=\(userCategoryInput)")
        let firstRequest = NSURLRequest(URL: firstURL!)
        let firstTask = NSURLSession.sharedSession().dataTaskWithRequest(firstRequest) {
            data, response, error in
            if error != nil
            {
                print("error=\(error)")
                return
            }
            //Let's convert response sent from a server side script to a NSDictionary object:
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? [String: AnyObject]
                
                //print(myJSON!)
                if let myJSON = myJSON {
                    questionsFromAPIDict = myJSON
                    // print(questionsFromAPIArray)
                    self.delegate.getTheQuestions(questionsFromAPIDict)
                    
                }
            } catch {
                print(error)
            }
            
            
            
        }
        
        
        firstTask.resume()
        // print(questionsFromAPIArray)
        
        //  return questionsFromAPIArray
        
    }
    
    
    
    
//    func puzzlePostAPI(width: String, height: String, words: String, minLength: String, maxLength: String, capabilities: [String])
//    {
//        let seed = Int(arc4random())
//        
//        var jsonString: NSData?
//    
//        let myUrl = NSURL(string: "http://54.211.91.163:8080/puzzle")
//        let request = NSMutableURLRequest(URL: myUrl!)
//        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        request.HTTPMethod = "POST"  // Compose a query string
//        
//         let dic = ["width": width, "height": height, "words": words, "minLength": minLength, "maxLength": maxLength, "capabilities": capabilities, "seed": seed]
//        
//        do {
//            jsonString = try NSJSONSerialization.dataWithJSONObject(dic, options: [])
//            // here "jsonData" is the dictionary encoded in JSON data
//        } catch let error as NSError {
//            print(error)
//        }
//        
//    
//        let postString = jsonString
//    
//        request.HTTPBody = postString //dataUsingEncoding(NSUTF8StringEncoding)
//        
//    
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//        data, response, error in
//        
//        if error != nil
//        {
//            print("error=\(error)")
//            return
//        }
//        
//        
//        //Let's convert response sent from a server side script to a NSDictionary object:
//        do {
//            let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
//            
//            //print(myJSON!)
//            if let myJSON = myJSON {
//                
//                
//                self.delegate.gotThePuzzle(myJSON)
//
//            }
//        } catch {
//            print(error)
//        }
//    }
//    task.resume()
//       return
//    }
    
    
}


