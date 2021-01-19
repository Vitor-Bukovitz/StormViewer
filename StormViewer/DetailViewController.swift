//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Vitor Bukovitz on 15/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var imageTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = imageTitle
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false;
    }
    
    @objc
    func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8),
              let imageTitle = imageTitle else {
            print("No image found")
            return
        }
        print("\(imageTitle)")
        let vc = UIActivityViewController(activityItems: [image, imageTitle], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
