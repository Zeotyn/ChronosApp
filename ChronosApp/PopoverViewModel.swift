//
//  PopoverViewModel.swift
//  ChronosApp
//
//  Created by Eugen Waldschmidt on 05.11.16.
//  Copyright © 2016 Eugen Waldschmidt. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class PopoverViewModel {
    let time = MutableProperty<TimeInterval>(1500)
    var timer = Timer()
    var timerActive = false

    init(time: TimeInterval = 1500) {
        self.time.value = time
    }

    @objc func doSomething(sender: AnyObject?) {
        if !timerActive {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(PopoverViewModel.countdown(sender:)),
                userInfo: nil,
                repeats: true
            )
            timerActive = true
        } else {
            timer.invalidate()
            timerActive = false
        }
    }

    @objc func countdown(sender: AnyObject?) {
        if self.time.value != 0 {
            self.time.value -= 1
        }
    }
}
