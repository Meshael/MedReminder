//
//  MyListView.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 06/06/2023.
//

import SwiftUI
import CoreData

struct MyListsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MyList.name, ascending: true)],
        animation: .default)
    private var myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationView {
            VStack {
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
                Button("Delete List") {
                    deleteMyList()
                }
            }
        }
    }
    
    private func deleteMyList() {
        for myList in myLists {
            viewContext.delete(myList)
        }
    }
}

//struct MyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListsView(myLists: FetchedResults<MyList>)
//    }
//}
