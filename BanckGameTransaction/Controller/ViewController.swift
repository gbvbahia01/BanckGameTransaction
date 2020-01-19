//
//  ViewController.swift
//  BanckGameTransaction
//
//  Created by Guilherme B V Bahia on 13/01/20.
//  Copyright © 2020 Guilherme B V Bahia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hiddenNavigation = false
    let locale = Locale(identifier: K.LOCALE.PT_BR)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(named: K.ASSETS_NAME.COLOR_RED)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated);
          navigationController?.isNavigationBarHidden = hiddenNavigation;
      }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.isNavigationBarHidden = false;
        
    }
    
    func registerCell(with table: UITableView,
                      nibFile nib: String,
                      cellId id: String) {
        table.register(UINib(nibName: nib,  bundle: nil),
                       forCellReuseIdentifier: id)
    }

    func formatToCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        if let formatted = formatter.string(from: value as NSNumber) {
            return formatted
        }
        return ""
    }
   
}


extension UIColor {
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(alpha * multiplier),
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars = ["F","F"] + chars
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}
