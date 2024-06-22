//
//  AlifTestApp.swift
//  AlifTest
//
//  Created by Iskandar Fazliddinov on 22/06/24.
//

import SwiftUI

@main
struct AlifTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
