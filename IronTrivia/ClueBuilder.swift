//
//  ClueBuilder.swift
//  IronTrivia
//
//  Created by Ross Gottschalk on 9/4/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation
class ClueBuilder
{
    let id: Int
    let answer: String
    let question: String
    //let value: Int
    let categoryID: Int

    init(clueBuilderDict: [String: AnyObject])
    {
        id = clueBuilderDict["id"] as! Int
        answer = clueBuilderDict["answer"] as! String
        question = clueBuilderDict["question"] as! String
        //value = clueBuilderDict["value"] as! Int
        categoryID = clueBuilderDict["category_id"] as! Int
    }
}