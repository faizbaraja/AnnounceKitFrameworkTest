//
//  ViewController.swift
//  AnnounceKitFrameworkTest
//
//  Created by Faiz on 22/02/2021.
//

import UIKit
import BarajaFramework

class ViewController: UIViewController {
    @IBOutlet weak var labelUnreadCount: UILabel!
    @IBOutlet weak var buttonGetUnreadCount: UIButton!
    @IBOutlet weak var buttonShowPost: UIButton!
    
    let announceKit = WhatsNewViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonGetUnreadCount.addTarget(self, action: #selector(getUnreadCount(sender:)), for: .touchUpInside)
        buttonShowPost.addTarget(self, action: #selector(showPost(sender:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func getUnreadCount(sender: UIButton) {
        announceKit.getUnreadCount(userId: nil, widgetId: "4mhHsQ", delegate: self)
    }
    
    @objc func showPost(sender: UIButton) {
        let postPageViewController = announceKit.postPageViewController(userId: nil, widgetId: "4k0Uqk")
        postPageViewController.modalPresentationStyle = .automatic
        self.present(postPageViewController, animated: true, completion: nil)
    }

}

extension ViewController: WhatsNewViewControllerProtocol {
    func updateUnreadCount(unreadCount: Int) {
        labelUnreadCount.text = "\(unreadCount) unread posts"
    }
    
    
}

