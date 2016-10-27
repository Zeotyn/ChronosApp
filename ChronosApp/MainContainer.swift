//
//  MainContainer.swift
//  ChronosApp
//
//  Created by Eugen Waldschmidt on 05.11.16.
//  Copyright © 2016 Eugen Waldschmidt. All rights reserved.
//

import Foundation
import Swinject

class MainContainer {
    let container = Container() { c in
        c.register(PopoverViewController.self) { _ in
            let view = PopoverView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
            let controller = PopoverViewController(popoverView: view)
            return controller
        }
    }
}
