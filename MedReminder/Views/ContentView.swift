//
//  ContentView.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 04/06/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var myLists: FetchedResults<MyList>
    @State var text = ["text0", "text1", "text2", "text3"]
    @State var showsheet = false
    @State var textitemtemp = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("Mint"), Color("Dark")]),
                               startPoint: .bottomTrailing,
                               endPoint: .topLeading)
                
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    VStack {
                        //            .toolbar {
                        Button(action: {
                            isPresented = true
                        }, label: {
                            Image(systemName: "cross.fill")
                                .font(.system(size: 30, weight: .bold))
                                .symbolVariant(.fill)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300,maxHeight: 65)
                                .contentShape(Rectangle())
                        })
                        .buttonStyle(.plain)
                        .background(Color("Baby"))
                        .cornerRadius(20)
                        .padding(.bottom)
                        .padding([.leading, .bottom, .trailing])
                        
                    }
                  
                    .padding(.all)
                    
                    ScrollView {
//                    Divider()
//                MARK: List is Here
                        if myLists.isEmpty {
                            Text("No Medicine Added ⚕️")
                                .font(.custom("SFProRounded", size: 22))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        } else {
                            ForEach(myLists) { myList in
                                MyListCellView(myList: myList)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading], 10)
                            }
                        }
                        
                        
                    }
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 130)
//                        .overlay(
//                            Spacer()
//                        )
//                       .frame(height: 130)
                        
                                
                    .padding(.horizontal)
                    .fullScreenCover(isPresented: $isPresented) {
                        NavigationView{
                            AddNewListView { name, color, medname, dose in
                                do {
                                    try ReminderService.saveMyList(name, color, medname, dose)
                                } catch {
                                    print(error)
                                }
                                
                            }
                        }
                        
                    }
                    .toolbar {
                        Button("Delete All") {
                            deleteMyList()
                        }
                        .foregroundColor(.red)
                        .font(.headline)
                }
                }
                
                Image("Luckey")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .offset(x: -90, y: 250)
                
            }
            .navigationTitle("Reminders")
        }
    }
        
    private func deleteMyList() {
        for myList in myLists {
            viewContext.delete(myList)
        }
    }
}
            
//                    List {
//                        TextField("item", text: $textitemtemp)
//                    }
//                    .navigationTitle("Add Med")
//                    .toolbar {
//                        Button("Save") {
//                            text.append(textitemtemp)
//                            showsheet.toggle()
//                        }
//                    }
//                }
//            }
            
        
            
//
//    private func deleteMyList(_ indexSet: IndexSet) {
//        indexSet.forEach { index in
//            let myList = myListResults[index]
//            do {
//                try ReminderService.deleteMyList(myList)
//            } catch {
//                print(error)
//            }
//        }
//    }
        
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
}
