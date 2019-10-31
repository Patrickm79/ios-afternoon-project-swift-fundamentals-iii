//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}

var currency: Currency = .cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        if(cadButton.isSelected){
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        if(mxnButton.isSelected) {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
    }
    
    // MARK: - Helper Methods
    
    enum Currency {
        case cad
        case mxn
    }
    
    var currency: Currency = .cad
    
    func convert(_ dollars: Double) -> Double {
        if (currency == .cad) {
            let cad = dollars * 1.32
            return cad
        } else {
            let mxn = dollars * 19.22
            return mxn
        }
    }
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}

