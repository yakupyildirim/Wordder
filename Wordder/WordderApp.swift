//
//  WordderApp.swift
//  Wordder
//
//  Created by yusuf on 3.01.2024.
//

import SwiftUI

@main
struct WordderApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Splash()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
