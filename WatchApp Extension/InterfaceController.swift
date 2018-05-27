//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by Jakub Majewski on 26.05.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet var receivedLabel: WKInterfaceLabel!
    @IBOutlet var respondeLabel: WKInterfaceLabel!
    
    let session = WCSession.default
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        NotificationCenter.default.addObserver(self, selector: #selector(self.messageReceived), name: NSNotification.Name(rawValue: "phoneMessage"), object: nil)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @objc func messageReceived(info:NSNotification) {
        print("Watch get notification")
        
        guard let message = info.userInfo else {
            return
        }
        
        if let iPhoneMessage = message["phoneMessage"] as? String {
            DispatchQueue.main.async {
                self.receivedLabel.setText(iPhoneMessage)
            }
        }
    }
    
    @IBAction func resetButton() {
        self.receivedLabel.setText("Received")
        self.respondeLabel.setText("Watch Responde")
    }
    
    @IBAction func respondeButton() {
        if self.session.isReachable {
            self.session.sendMessage(["watchMessage":"Watch Responde"], replyHandler: nil, errorHandler: nil)
        }
    }
}
