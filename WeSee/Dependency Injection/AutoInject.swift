//
//  AutoInject.swift
//  WeSee
//
//  Created by Anzor on 31.07.2022.
//

import Foundation
import Swinject

@propertyWrapper
final class AutoInject<Value> {

    // MARK: - Private properties

    private(set) var wrappedValue: Value

    // MARK: - Init

    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }

    init() {
        let container = Container.rootContainer.synchronize()

        guard let value = container.resolve(Value.self) else {
            fatalError("Could not resolve non-optional \(Value.self)")
        }

        wrappedValue = value
    }

}
