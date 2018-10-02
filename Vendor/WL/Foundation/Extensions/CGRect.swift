//
//  CGRect.swift
//  mcFoundation
//
//  Created by Vlad Gorlov on 10/05/16.
//  Copyright © 2016 WaveLabs. All rights reserved.
//

import CoreGraphics

extension CGRect {

   public init(width: CGFloat, height: CGFloat) {
      self.init(x: 0, y: 0, width: width, height: height)
   }

   public init(size: CGSize) {
      self.init(x: 0, y: 0, width: size.width, height: size.height)
   }

   public init(dimension: CGFloat) {
      self.init(x: 0, y: 0, width: dimension, height: dimension)
   }

   public func insetBy(insets: EdgeInsets) -> CGRect {
      let deltaW = insets.left + insets.right
      let deltaH = insets.top + insets.bottom
      return CGRect(x: origin.x + insets.left, y: origin.y + insets.top,
                    width: size.width - deltaW, height: size.height - deltaH)
   }

   public func insetLeft(by value: CGFloat) -> CGRect {
      return insetBy(insets: EdgeInsets(left: value))
   }

   public func insetRight(by value: CGFloat) -> CGRect {
      return insetBy(insets: EdgeInsets(right: value))
   }

   public func insetTop(by value: CGFloat) -> CGRect {
      return insetBy(insets: EdgeInsets(top: value))
   }

   public func insetBottom(by value: CGFloat) -> CGRect {
      return insetBy(insets: EdgeInsets(bottom: value))
   }
}
