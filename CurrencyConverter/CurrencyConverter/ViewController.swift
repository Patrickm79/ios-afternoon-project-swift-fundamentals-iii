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

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usCurrencyString =
            fromCurrencyTextField.text else {return}
        
        guard let usCurrency = Double(usCurrencyString) else {return}
        
        let convertCurrency: Double = convert(usCurrency)
        
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value:convertCurrency))
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        cadButton.isSelected.toggle()
        if cadButton.isSelected {
            mxnButton.isSelected.toggle()
//                != cadButton.isSelected
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        if mxnButton.isSelected {
            cadButton.isSelected.toggle()
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
        }
    }
    
    // MARK: - Helper Methods
}
    func convert (_ dollars: Double) -> Double {
        if currency == .cad {
            let cad = dollars * 1.32
            return cad
        } else {
            let mxn = dollars * 19.23
            return mxn
        }
    }

