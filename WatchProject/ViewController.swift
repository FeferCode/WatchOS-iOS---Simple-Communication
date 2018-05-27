//
//  ViewController.swift
//  WatchProject
//
//  Created by Jakub Majewski on 26.05.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var receivedLabel: UILabel!
    @IBOutlet weak var sendTextField: UITextField!
    
    let session = WCSession.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.messageReceived), name: NSNotification.Name(rawValue: "watchMessage"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func messageReceived(info: Notification){
        print("iPhone get notification")
        guard let message = info.userInfo else {
            return
        }
        
        if let watchMessage = message["watchMessage"] as? String {
            DispatchQueue.main.async {
                self.receivedLabel.text = watchMessage
            }
        }
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        if self.session.isPaired == true && self.session.isWatchAppInstalled {
            if let message = self.sendTextField.text {
                self.session.sendMessage(["phoneMessage" : message], replyHandler: nil, errorHandler: nil)
            }
        }
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.receivedLabel.text = "Received Message"
            self.sendTextField.text = ""
        }
    }
}

