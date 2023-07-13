//
//  AddNewListView.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 05/06/2023.
//

import SwiftUI
import UserNotifications

enum NotificationAction: String {
    case dismiss
    case reminder
}

struct AddNewListView: View {

    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var dose: String = ""
    @State var medname: String = ""
    @State var selectedColor: Color = .yellow
    @State var selectedTime = Date()
    @State var selectedImage: Image?
    @State private var isButtonSelected = false
    @State private var selectedButton: Int?

    let onSave: (String, UIColor, String, String) -> Void

    private var isFormValid: Bool {
        !name.isEmpty
    }

    var body: some View {
        let _ = Self._printChanges()
        ScrollView {
            VStack {
                VStack {
                    Image(systemName: "heart.text.square.fill")
                        .foregroundColor(selectedColor)
                        .font(.system(size: 100))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    
                    ColorPickerView(selectedColor: $selectedColor)
                }
                VStack(alignment: .leading) {
                    
                    Section("     Medicen Name") {
                        
                        TextField("Hold To Scan The Medicen Name", text: $medname)
                            .padding(.leading, 16)
                        //                           .lineLimit(2)
                            .textFieldStyle(.automatic)
                            .textContentType(.organizationName)
                            .frame(width: 380, height: 45, alignment: .center)
                            .border(Color.gray, width: 1)
                            .fontWeight(.medium)
                            .padding(.horizontal)
                    }
                    .font(.custom("SFProRounded", size: 18))
                    
                    Section("     Patient Name") {
                        TextField("Write The Patient Name", text: $name)
                            .padding(.leading)
                            .textFieldStyle(.automatic)
                            .textContentType(.name)
                            .frame(width: 380, height: 45, alignment: .center)
                            .border(Color.gray, width: 1)
                            .fontWeight(.regular)
                            .padding(.horizontal)
                    }
                    .font(.custom("SFProRounded", size: 18))
                    
                    
                    
                    Section(header: Text("")) {
                                    DatePicker("When Is The Med Due?", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                        .font(.custom("SFProRounded", size: 18))
                                        .padding(.vertical)
                                        .datePickerStyle(DefaultDatePickerStyle())
                                        .padding(.horizontal)
                                }
                    .padding(.trailing, 2.0)
                    Divider()
                        .frame(width: 380)
                        .background(Color.black)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("How Many Times A Day?")
                            .font(.custom("SFProRounded", size: 18))
                            .fontWeight(.black)
                            .padding(.all)
                        
                        Spacer()
                        Text("(Click Again To Disable)")
                            .font(.custom("SFProRounded", size: 8))
                            .padding(.all)
                    }
                }
                
                
                
                //            ScrollView(.horizontal){
                
                HStack (spacing: 10) {
                    
                    
                    Button(action: {
                        scheduleNotification4(selectedTime: selectedTime)
                        if selectedButton != 4 {
                            selectedButton = 4
                        } else {
                            selectedButton = nil
                        }
                    }, label: {
                        Text("4 Times")
                            .frame(width: 85, height: 50.0)
                            .font(.custom("SFProRounded", size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    })
                    .background(Color.indigo)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .opacity(selectedButton == 4 ? 1 : 0)
                    )
                    .disabled(selectedButton != nil && selectedButton != 4)
                    
                    Button(action: {
                        scheduleNotification3(selectedTime: selectedTime)
                        if selectedButton != 3 {
                            selectedButton = 3
                        } else {
                            selectedButton = nil
                        }
                    }, label: {
                        Text("3 Times")
                            .frame(width: 85, height: 50.0)
                            .font(.custom("SFProRounded", size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    })
                    .background(Color.blue)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .opacity(selectedButton == 3 ? 1 : 0)
                    )
                    .disabled(selectedButton != nil && selectedButton != 3)
                    
                    
                    Button(action: {
                        scheduleNotification2(selectedTime: selectedTime)
                        if selectedButton != 2 {
                            selectedButton = 2
                        } else {
                            selectedButton = nil
                        }
                    }, label: {
                        Text("2 Times")
                            .frame(width: 85, height: 50)
                            .font(.custom("SFProRounded", size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    })
                    .background(Color.cyan)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .opacity(selectedButton == 2 ? 1 : 0)
                    )
                    .disabled(selectedButton != nil && selectedButton != 2)
                    
                    
                    Button(action: {
                        scheduleNotification1(selectedTime: selectedTime)
                        if selectedButton != 1 {
                            selectedButton = 1
                        } else {
                            selectedButton = nil
                        }
                    }, label: {
                        Text("1 Time")
                            .frame(width: 85, height: 50.0)
                            .font(.custom("SFProRounded", size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    })
                    .background(Color.purple)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                            .opacity(selectedButton == 1 ? 1 : 0)
                    )
                    .disabled(selectedButton != nil && selectedButton != 1)
                    
                    
                }
                //                    .padding(.horizontal)
                .padding(.bottom)
                Divider()
                    .frame(width: 380)
                    .background(Color.black)
                    .padding(.horizontal)
                
                //            }
                //                .padding(.horizontal)
                HStack (alignment: .center){
                    Text("What's your prescribed dosage?")
                        .font(.custom("SFProRounded", size: 18))
                        .fontWeight(.heavy)
                    Spacer()
                    
                    TextField("pill / ml", text: $dose)
                        .padding(.horizontal)
                        .font(.custom("SFProRounded", size: 18))
                        .fontWeight(.heavy)
                        .textContentType(.flightNumber)
                        .frame(width: 100, height: 45)
                        .textFieldStyle(.automatic)
                        .border(Color.gray, width: 1)
                    
                }
                .padding(.horizontal)
            }
            
            
            Spacer()
            
            
            
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Add New Medicine")
                            .font(.headline)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            
                            onSave(name, UIColor(selectedColor), medname, dose)
                            
                            dismiss()
                        } .disabled(!isFormValid)
                    }
                }
        }
            
    }
    
    func scheduleNotification4(selectedTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Nursing Frog"
        content.body = "It's time to take \(name)'s medication!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let repeatInterval = 6 * 60 * 60 // Repeat every 6 hours
        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(repeatInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: repeatingTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Initial notification scheduled successfully")
                
                // Schedule repeating notification
//                UNUserNotificationCenter.current().add(repeatingRequest)
            }
        }
    }
    
//                         ___________________________________
    
    func scheduleNotification3(selectedTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Nursing Frog"
        content.body = "It's time to take \(name)'s medication!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let repeatInterval = 8 * 60 * 60 // Repeat every 6 hours
        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(repeatInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: repeatingTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Initial notification scheduled successfully")
                
                // Schedule repeating notification
//                UNUserNotificationCenter.current().add(repeatingRequest)
            }
        }
    }
    
//                         ___________________________________
    
    func scheduleNotification2(selectedTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Nursing Frog"
        content.body = "It's time to take \(name)'s medication!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let repeatInterval = 12 * 60 * 60 // Repeat every 6 hours
        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(repeatInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: repeatingTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Initial notification scheduled successfully")
                
                // Schedule repeating notification
//                UNUserNotificationCenter.current().add(repeatingRequest)
            }
        }
    }
    
//                         ___________________________________
    
    
    func scheduleNotification1(selectedTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Nursing Frog"
        content.body = "It's time to take \(name)'s medication!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let repeatInterval = 24 * 60 * 60 // Repeat every 6 hours
        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(repeatInterval), repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: repeatingTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Initial notification scheduled successfully")
                
                // Schedule repeating notification
//                UNUserNotificationCenter.current().add(repeatingRequest)
            }
        }
    }
    
//    func scheduleNotification1() {
//        let content = UNMutableNotificationContent()
//        content.title = "Nursing Frog"
//        content.body = "It's time to take \(name)'s medication!"
//        content.sound = UNNotificationSound.default
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 24 * 60 * 60, repeats: true)
//
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request)
//    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewListView(onSave: { (_, _, _, _) in })
        }
    }
}
