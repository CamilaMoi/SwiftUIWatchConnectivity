//
//  Counter.swift
//  WatchConnectivityPrototype
//
//  Created by Chris Gaafary on 4/18/21.
//

import Foundation
import Combine
import WatchConnectivity

final class Counter: ObservableObject {
    var session: WCSession
    let delegate: WCSessionDelegate
    let subject = PassthroughSubject<String, Never>()
    
    @Published private(set) var plant: String = "tomate"
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(countSubject: subject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$plant)
    }
    
    func increment() {
        plant = "tomatudooo"
        session.sendMessage(["plant": plant], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func decrement() {
        plant = "menos um tomate"
        session.sendMessage(["plant": plant], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
}
