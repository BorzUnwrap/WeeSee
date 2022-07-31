//
//  Container.swift
//  WeSee
//
//  Created by Anzor on 31.07.2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    static var rootContainer =  Container(defaultObjectScope: .transient)
    
    func registerServices() {
        let container = Container.rootContainer
    }
    

}
