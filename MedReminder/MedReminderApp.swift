//
//  MedReminderApp.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 04/06/2023.
//

import SwiftUI

@main
struct MedReminderApp: App {
    @State var showSplash = true
    init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { result, error in
            if let error = error {
                print(error)
            }
        }
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        
    }
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
            }
        }
    }
}
