//
//  YTPostRoundDataViewController.swift
//  YTPlanMilageGameAPITest
//
//  Created by victor on 2018/7/17.
//  Copyright © 2018 VHHC Studio. All rights reserved.
//

import UIKit
import SwiftHTTP

class YTPostRoundDataViewController: UIViewController {
    @IBOutlet weak var roundIdTextField: UITextField!
    @IBOutlet weak var offsetsTextView: UITextView!
    @IBOutlet weak var endPointTextField: UITextField!
    @IBOutlet weak var isEndedSwitch: UISwitch!
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBOutlet weak var responseTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        let offsetsString = offsetsTextView.text!
        let offsets = offsetsString.components(separatedBy: "\n")
        let params = ["RoundId": Int(roundIdTextField.text!) ?? 0, "Offsets": offsets, "Endpoints": Int(endPointTextField.text!) ?? 0, "IsEnded": isEndedSwitch.isOn ? 1 : 0, "Destination": destinationTextField.text!] as [String : Any]
        HTTP.POST("https://planemilageapi.azurewebsites.net/api/planemilage/flydata/rounddata", parameters: params) {
            response in
            
            print("response=\(response.description)")
            DispatchQueue.main.async {
                self.responseTextView.text = response.description
            }
        }
        
    }
    @IBAction func touchedOutsideTextInput(_ sender: Any) {
        view.endEditing(true)
    }
}

