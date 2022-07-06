//  SystemEnvironment.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture

struct SystemEnvironment<Environment> {
    var environment: Environment
    
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    static func live(environment: Environment) -> Self {
        .init(environment: environment, mainQueue: { .main })
    }
    
    static func dev(environment: Environment) -> Self {
        .init(environment: environment, mainQueue: { .main })
    }
}
