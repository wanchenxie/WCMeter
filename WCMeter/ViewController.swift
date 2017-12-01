//
//  ViewController.swift
//  WCMeter
//
//  Created by wanchenxie on 30/11/2017.
//  Copyright © 2017 wanchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wcMeter: WCMeterSldier!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func valueChanged(_ sender: UISlider) {
        let roundValue = round(sender.value)
        let valueInt = Int.init(roundValue)
        wcMeter.value = valueInt
    }
}

