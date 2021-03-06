//
//  MTLDevice.swift
//  WaveLabs
//
//  Created by Vlad Gorlov on 11.07.17.
//  Copyright © 2017 WaveLabs. All rights reserved.
//

import Foundation
import MetalKit

@available(OSX 10.11, *)
extension MTLDevice {

   public func makeBuffer(length: Int, options: MTLResourceOptions = []) throws -> MTLBuffer {
      guard let buffer = makeBuffer(length: length, options: options) else {
         throw NSError.MTLDevice.unableToInitialize(MTLBuffer.self)
      }
      return buffer
   }

   public func makeBuffer(bytes: UnsafeRawPointer, length: Int, options: MTLResourceOptions = []) throws -> MTLBuffer {
      guard let buffer = makeBuffer(bytes: bytes, length: length, options: options) else {
         throw NSError.MTLDevice.unableToInitialize(MTLBuffer.self)
      }
      return buffer
   }
}

extension NSError {

   public enum MTLDevice: Swift.Error {
      case unableToInitialize(AnyClass)
   }
}
