//
//  Dynamic.swift
//  STCProject
//
//  Created by Lina on 23/07/1443 AH.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    private var willCallListener: Bool = true
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            guard willCallListener else { return }
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func beginSafeModify() {
        willCallListener = false
    }
    
    func endSafeModify() {
        willCallListener = true
    }
}
