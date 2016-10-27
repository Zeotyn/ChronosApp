//
//  PopoverViewController.swift
//  ChronosApp
//
//  Created by Eugen Waldschmidt on 27.10.16.
//  Copyright © 2016 Eugen Waldschmidt. All rights reserved.
//

import Foundation
import AppKit
import ReactiveCocoa
import ReactiveSwift

class PopoverViewController: NSViewController {
    var popoverView: PopoverView
    let viewModel = PopoverViewModel()
    
    override func loadView() {
        popoverView.textField.reactive.stringValue <~ viewModel.time.map({ timeValue in
            let hours = Int(timeValue) / 3600
            let minutes = Int(timeValue) / 60 % 60
            let seconds = Int(timeValue) % 60
            
            return String("\(hours):\(minutes):\(seconds)")
        })
        view = popoverView
    }

    init(popoverView: PopoverView) {
        self.popoverView = popoverView
        super.init(nibName: nil, bundle: nil)!
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
