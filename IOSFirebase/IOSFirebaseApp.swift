//
//  IOSFirebaseApp.swift
//  IOSFirebase
//
//  Created by ISSC_611_2023 on 03/05/23.
//

import SwiftUI
import Firebase

@main
struct IOSFirebaseApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
