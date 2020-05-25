//
//  StateMachine.swift
//  StateMachine
//
//  Created by Ricardo Rachaus on 25/05/20.
//

import Foundation

/**
 Base state machine class to manage states.
 */
open class StateMachine: NSObject {

    /**
     Current state that the machine is. First state is nil.
     */
    private(set) open var currentState: State?

    private var states: Set<State>

    /**
     Initialize state machine.

     - parameters:
         - states: All states of the state machine.

     - Returns: self : StateMachine
     */
    public init(states: [State]) {
        self.states = Set<State>(states)
    }

    /**
     Check if is possible to enter a state.

     - parameters:
         - stateClass: Class of the state to enter.

     - Returns: canEnterState : Bool
     */
    open func canEnterState(_ stateClass: AnyClass) -> Bool {
        return currentState?.isValidNextState(stateClass) ?? true
    }

    /**
     Enter the state if it can.

     - parameters:
         - stateClass: Class of the state to enter.

     - Returns: didEnter : Bool
     */
    open func enter(_ stateClass: AnyClass) -> Bool {
        guard canEnterState(stateClass) else {
            return false
        }

        for state in states {
            if state.isKind(of: stateClass) {
                let previousState = currentState
                previousState?.willExit(to: state)
                currentState = state
                currentState?.didEnter(from: previousState)
            }
        }
        return true
    }
}

