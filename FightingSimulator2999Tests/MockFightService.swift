//
//  MockFightService.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import Foundation
import Combine
@testable import FightingSimulator2999

class MockFightService: FightService {
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)

    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }

    var startFightCalled: Bool = false
    var basicAttackCalled: Bool = false
    var magicAttackCalled: Bool = false

    func startFight() {
        startFightCalled = true
    }
    
    func basicAttack() -> (Int, Int) {
        basicAttackCalled = true
        _myHealth.value -= 10
        _enemyHealth.value -= 9
        return (_myHealth.value, _enemyHealth.value)
    }
    
    func magicAttack() -> (Int, Int) {
        magicAttackCalled = true
        _myHealth.value -= 10
        _enemyHealth.value -= Int.random(in: 7..<16)
        return (_myHealth.value, _enemyHealth.value)
    }
    
    func showResult(_: FightingSimulator2999.Result) {
        return
    }
}
