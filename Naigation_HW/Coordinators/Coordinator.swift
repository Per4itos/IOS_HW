//
//  Coordinator.swift
//  Naigation_HW
//
//  Created by Адхам Тангиров on 22.07.2023.
//

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
