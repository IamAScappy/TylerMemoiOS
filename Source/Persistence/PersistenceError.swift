//
//  PersistenceError.swift
//  RxPokedex
//
//  Created by Carl Brenneisen on 2/8/18.
//  Copyright © 2018 carl.brenneisen. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
  case persistenceIntialization   //cant create realm object
  case invalidInput               //could not attempt task due to bad information
  case recordNotFound             //critical record not found
  case outOfMemory                //user's memory is at capacity
  case notAuthorized              //app is in background with encryption / phone not unlocked
  case unknown                    //any error not meeting the above conditions
  
  var description: String {
    switch self {
    case .persistenceIntialization:
      return "Had trouble accessing internal database"
    case .invalidInput:
      return "Input not supported"
    case .recordNotFound:
      return "Record not found"
    case .outOfMemory:
      return "Could not save due to low memory - check your phone's available storage"
    case .notAuthorized:
      return "Access Restricted"
    case .unknown:
      return "An unknown error occurred"
    }
  }
  
}
