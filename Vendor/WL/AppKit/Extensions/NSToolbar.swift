//
//  NSToolbar.swift
//  WLUI
//
//  Created by Vlad Gorlov on 05/10/2016.
//  Copyright © 2016 WaveLabs. All rights reserved.
//

import Cocoa

extension NSToolbar {

   public class GenericDelegate: NSObject, NSToolbarDelegate {

      public var selectableItemIdentifiers: [NSToolbarItem.Identifier] = []
      public var defaultItemIdentifiers: [NSToolbarItem.Identifier] = []
      public var allowedItemIdentifiers: [NSToolbarItem.Identifier] = []

      var eventHandler: ((Event) -> Void)?
      public var makeItemCallback: ((_ itemIdentifier: NSToolbarItem.Identifier, _ willBeInserted: Bool) -> NSToolbarItem?)?
   }
}

extension NSToolbar.GenericDelegate {

   enum Event {
      case willAddItem(item: NSToolbarItem, index: Int)
      case didRemoveItem(item: NSToolbarItem)
   }
}

extension NSToolbar.GenericDelegate {

   public func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                       willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
      return makeItemCallback?(itemIdentifier, flag)
   }

   public func toolbarDefaultItemIdentifiers(_: NSToolbar) -> [NSToolbarItem.Identifier] {
      return defaultItemIdentifiers
   }

   public func toolbarAllowedItemIdentifiers(_: NSToolbar) -> [NSToolbarItem.Identifier] {
      return allowedItemIdentifiers
   }

   public func toolbarSelectableItemIdentifiers(_: NSToolbar) -> [NSToolbarItem.Identifier] {
      return selectableItemIdentifiers
   }

   // MARK: Notifications

   public func toolbarWillAddItem(_ notification: Notification) {
      if let toolbarItem = notification.userInfo?["item"] as? NSToolbarItem,
         let index = notification.userInfo?["newIndex"] as? Int {
         eventHandler?(.willAddItem(item: toolbarItem, index: index))
      }
   }

   public func toolbarDidRemoveItem(_ notification: Notification) {
      if let toolbarItem = notification.userInfo?["item"] as? NSToolbarItem {
         eventHandler?(.didRemoveItem(item: toolbarItem))
      }
   }
}
