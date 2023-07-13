//
//  MyListCellView.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 06/06/2023.
//

import SwiftUI

struct MyListCellView: View {
    
    let myList: MyList
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "heart.text.square.fill")
                    .foregroundColor(Color(myList.color))
                    .scaleEffect(1.5)
                    .frame(width: 25, height: 25)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .circular))
                Text("Paitint:")
                    .font(.custom("SFProRounded", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(myList.name)
                    .fontWeight(.bold)
                    .font(.custom("SFProRounded", size: 18))
                    .foregroundColor(.white)
                Spacer()
                Text("Dose:")
//                    .padding(.horizontal)
                    .font(.custom("SFProRounded", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(myList.dose)
                    .font(.custom("SFProRounded", size: 18))
                    .fontWeight(.bold)
                    .padding([.trailing], 10)
                    .foregroundColor(.white)
                
            }
            .font(.custom("SFProRounded", size: 20))
            HStack{
                Text("       Med:")
//                    .padding(.horizontal)
                    .font(.custom("SFProRounded", size: 18))
                    .fontWeight(.bold)
                Text(myList.medname)
                    .font(.custom("SFProRounded", size: 18))
                    .fontWeight(.bold)
                Spacer()

            }
            .font(.custom("SFProRounded", size: 18))
            .foregroundColor(.white)
//            .padding(.all)
        }
        .frame(width: 380, height: 80)
        
    }
}

struct MyListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MyListCellView(myList: PreviewData.myList)
    }
}

