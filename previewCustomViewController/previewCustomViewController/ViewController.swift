//
//  ViewController.swift
//  previewCustomViewController
//
//  Created by Pushparaj Selvam on 17/11/20.
//

import UIKit

// Main ViewController to interact with
class ViewController: UIViewController, contextMenuCreate {

    static var title: String { return "UIViewController (Single View)" }

    private let photoView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adding Set Up for the image view
        view.backgroundColor = .systemBackground

        photoView.image = UIImage(named: "berkay-gumustekin-ngqyo2AYYnE-unsplash")
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.isUserInteractionEnabled = true
        photoView.frame.size = .init(width: 100, height: 100)
        view.addSubview(photoView)

        // Adding interaction element to the UIContextMenuInteraction
        let interaction = UIContextMenuInteraction(delegate: self)
        photoView.addInteraction(interaction)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoView.center = view.center
    }
}

// Adding or Extending additional protocol to the main view controller
extension ViewController: UIContextMenuInteractionDelegate {
    
    // Configuration Set Up
    // previewProvider option in UIContextMenuConfiguration to provide the custom preview view controller
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: previewViewController.init) { suggestedActions in
            return self.makeDefaultMenu()
        }
    }
    
    // Final animation which brings additional view when the main preview is clicked
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {

        // If we used a view controller for our preview, we can pull it out of the animator and show it once the commit animation is complete.
            animator.addCompletion {
                // provide which viewController to be shown at completion
                if let viewController = animator.previewViewController {
                    self.show(viewController, sender: self)
                }
            }
    }
}

