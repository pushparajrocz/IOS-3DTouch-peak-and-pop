//
//  previewViewController.swift
//  previewCustomViewController
//
//  Created by Pushparaj Selvam on 17/11/20.
//

import UIKit

// Customized priview element using seperate viewController
class previewViewController: UIViewController {
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the properties of the imageView
        navigationItem.title = "Mountains"
        let mountains = UIImage(named: "berkay-gumustekin-ngqyo2AYYnE-unsplash")!
        imageView.image = mountains
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        //NS Constraints for the imageview
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        // Prefered size of the view controller's view
        let width = view.bounds.width
        let height = mountains.size.height * (width / mountains.size.width)
        preferredContentSize = CGSize(width: width, height: height)
    }

}
