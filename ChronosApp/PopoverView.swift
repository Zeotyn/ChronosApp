//
//  PopoverView.swift
//  ChronosApp
//
//  Created by Eugen Waldschmidt on 27.10.16.
//  Copyright © 2016 Eugen Waldschmidt. All rights reserved.
//

import Foundation
import AppKit
import SnapKit
import ReactiveSwift
import ReactiveCocoa

class PopoverView: NSView {
    let textField = NSTextField()
    let button = NSButton()
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(textField)
        self.addSubview(button)

        textField.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).offset(10)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(10)
        }

        textField.isEditable = false
        textField.isSelectable = false
        textField.drawsBackground = false
        textField.isBezeled = false
        textField.stringValue = "Timer 25:00"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
