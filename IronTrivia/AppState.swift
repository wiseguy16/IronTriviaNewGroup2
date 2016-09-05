//
//  AppState.swift
//  IronTrivia
//
//  Created by Gregory Weiss on 9/1/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class AppState: NSObject
{
    
    static let sharedInstance = AppState()
    
    var signedIn = false
    var displayName: String?
    
    
}
