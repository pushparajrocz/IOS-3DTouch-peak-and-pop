//
//  ContextMenuItem.swift
//  previewCustomViewController
//
//  Created by Pushparaj Selvam on 17/11/20.
//
import UIKit

// Swift file to add protocol and extensions to use in multiple swift class
protocol contextMenuCreate {
    static var title: String { get }
}

extension contextMenuCreate {
    func makeDefaultMenu() -> UIMenu {

        // Create a UIAction for sharing
        let sub_Item1 = UIAction(title: "Sub-Item-1", image: UIImage(systemName: "square.and.arrow.up")) { action in
            // Show system share sheet
        }

        // Create an action for renaming
        let sub_Item2 = UIAction(title: "Sub-Item-2", image: UIImage(systemName: "square.and.pencil")) { action in
            // Perform renaming
        }
        
        let item = UIAction(title: "Item", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
            // Perform delete
        }
        // Here we specify the "destructive" attribute to show that it’s destructive in nature
        let mainMenu = UIAction(title: "Main-Menu", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
            // Perform delete
        }
        let subMenu = UIMenu(title: "Sub-Menu", children: [sub_Item1, sub_Item2])
        // Create and return a UIMenu with all of the actions as children
        let menu = UIMenu(title: "Menu", options: .displayInline ,children: [subMenu, item])
        
        return UIMenu(title: "", children: [mainMenu, menu])
    }
}
