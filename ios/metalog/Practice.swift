//  Practice.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import ComposableArchitecture
import SwiftUI

enum ADestination: Equatable {
    case b
}

struct BState: Equatable {
    var number = 0
}

struct AState: Equatable {
    var number = 0
    var destinationPaths: [ADestination] = []
    var bState = BState()
}

enum AAction {
    case goToB
    case bAction(BAction)
}

struct AEnvironment { }

typealias AReducer = Reducer<AState, AAction, SystemEnvironment<AEnvironment>>
typealias AStore = Store<AState, AAction>

let aReducer = AReducer { state, action, sysEnv in
    debugPrint("A ACTION", action)
    switch action {
    case .goToB:
        debugPrint("A Reducer GoToB")
        state.destinationPaths = [.b]
        return .none
        
    case .bAction(.goBack):
        debugPrint("A REDUCER GO BACK FROM B")
        state.destinationPaths = []
        return .none
        
    case .bAction:
        debugPrint("A Reducer BAction")
        return .none
    }
}

enum BAction {
    case doBThings
    case goBack
}

struct BEnvironment { }

typealias BReducer = Reducer<BState, BAction, SystemEnvironment<BEnvironment>>
typealias BStore = Store<BState, BAction>

let bReducer = BReducer { state, action, sysEnv in
    debugPrint("B ACTION", action)
    switch action {
    case .doBThings:
        debugPrint("B Reducer DoTheThings")
        return .none
        
    case .goBack:
        debugPrint("GO BACK B REDUCER")
        return .none
    }
}

let aReducerPublisher = AReducer.combine(
    aReducer,
    bReducer.pullback(
        state: \.bState,
        action: /AAction.bAction,
        environment: { _ in
            .live(environment: .init())
        }
    )
)

struct AView: View {
    let store: AStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationStack(
                path: viewStore.binding(
                    get: \.destinationPaths,
                    send: .goToB
                )
            ) {
                Button("GO TO B", action: { viewStore.send(.goToB) })
                    .navigationDestination(for: ADestination.self) { destination in
                        switch destination {
                        case .b:
                            BView(store: BStore(
                                initialState: viewStore.bState,
                                reducer: bReducer,
                                environment: .live(environment: .init()))
                            )
                        }
                    }
            }
        }
    }
}

struct BView: View {
    let store: BStore
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button("WELCOME TO B", action: {})
                .onDisappear {
                    viewStore.send(.goBack)
                }
        }
    }
        
}

