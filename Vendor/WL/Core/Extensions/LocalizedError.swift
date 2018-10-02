//
//  LocalizedError.swift
//  mcCore
//
//  Created by Vlad Gorlov on 01.10.17.
//  Copyright © 2017 Demo. All rights reserved.
//

import Foundation

public extension LocalizedError where Self: CustomStringConvertible {

   public var errorDescription: String? {
      return description
   }
}
