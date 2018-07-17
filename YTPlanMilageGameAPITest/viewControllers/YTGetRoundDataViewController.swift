//
//  YTGetRoundDataViewController.swift
//  YTPlanMilageGameAPITest
//
//  Created by victor on 2018/7/17.
//  Copyright © 2018 VHHC Studio. All rights reserved.
//

import UIKit
import SwiftHTTP

class YTGetRoundDataViewController: UIViewController {

    @IBOutlet weak var roundIdTextField: UITextField!
    
    @IBOutlet weak var responseTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        let roundID = Int(roundIdTextField.text!) ?? 0
        HTTP.GET("https://planemilageapi.azurewebsites.net/api/planemilage/flydata/getroundid?roundId=\(roundID)") { response in
            if let err = response.error {
                print("error: \(err.localizedDescription)")
                return //also notify app of failure as needed
            }
            print("opt finished: \(response.description)")
            //print("data is: \(response.data)") access the response of the data with response.data
            DispatchQueue.main.async {
                self.responseTextView.text = response.description
            }
        }
    }
    
    @IBAction func touchedOutsideTextInput(_ sender: Any) {
        view.endEditing(true)
    }
}
