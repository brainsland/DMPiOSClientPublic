//
//  ViewController.swift
//  Demo
//
//  Created by Rashid Ramazanov on 3/12/22.
//

import DMPClient
import UIKit

class ViewController: UIViewController {
    @IBOutlet var dismissButton: UIButton!

    var pageViewInfo: PageViewInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.isHidden = modalPresentationStyle != .fullScreen
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let request = PageViewRequest(
            url: "https://hurriyet.com/", canonicalUrl: "", title: "", referrer: "r",
            origin: "o", infiniteScrollDepth: 0
        )
        pageViewInfo = DMP.shared.pageView(request, pageViewInfo)
    }

    @IBAction func represent() {
        guard let viewController = storyboard?.instantiateInitialViewController() as? ViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

    @IBAction func dismissController() {
        dismiss(animated: true)
    }
}
