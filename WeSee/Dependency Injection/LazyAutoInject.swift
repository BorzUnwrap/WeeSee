//
//  LazyAutoInject.swift
//  WeSee
//
//  Created by Anzor on 31.07.2022.
//

import Foundation
import Swinject

@propertyWrapper
final class LazyAutoInject<Value> {

    // MARK: - Private properties

    private var value: Value?

    public var wrappedValue: Value {
        get {
            if let value = self.value {
                return value
            } else {
                let newValue = resolveValue()
                value = newValue
                return newValue
            }
        }
        set {
            value = newValue
        }
    }

    // MARK: - Init

    init(value: Value? = nil) {
        self.value = value
    }

    // MARK: - Private methods

    private func resolveValue() -> Value {
        let container = Container.rootContainer.synchronize()

        guard let value = container.resolve(Value.self) else {
            fatalError("Could not resolve non-optional \(Value.self)")
        }

        return value
    }

}
