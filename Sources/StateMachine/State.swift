import Foundation

/**
 Base state class to inherit to custom states.
 */
open class State: NSObject {
    /**
     Enter when changed state to current.

     - parameters:
         - previousState: Previous state that was.
     */
    open func didEnter(from previousState: State?) {}

    /**
     Check if the next state is valid. Return true by default.

     - parameters:
         - stateClass: Class of the next state that will be.

     - Returns: isValidNextState : Bool
     */
    open func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }

    /**
     Enter when will exit current state to a new one.

     - parameters:
         - nextState: Next state to enter.
     */
    open func willExit(to nextState: State) {}
}
