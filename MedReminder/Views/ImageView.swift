//
//  ImageView.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 05/06/2023.
//

//import SwiftUI
//
//
//struct ImageView: View {
//
//    @Binding var selectedImage: Image?
//
//    let images = [
//        UIImage(named: "Drink med"),
//        UIImage(named: "Long pill"),
//        UIImage(named: "Round pill"),
//        UIImage(named: "Sups1"),
//        UIImage(named: "Syring")
//    ].compactMap { $0 }
//
//    var body: some View {
//
//        HStack(spacing: 10) {
//            ForEach(images, id: \.self) { image in
//                let selected = selectedImage == Image(uiImage: image)
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 60, height: 0)
//                    .cornerRadius(5)
//                    .overlay(
//                        Rectangle()
//                            .strokeBorder(selected ? .gray : .clear, lineWidth: 2)
//                            .cornerRadius(2)
//                    )
//                    .scaleEffect(selected ? 1.2 : 1.0)
//                    .onTapGesture {
//                        selectedImage = Image(uiImage: image)
//                    }
//            }
//        }
//
//
//        .padding(.all)
//        .background(Color.white)
//        .border(Color.gray, width: 2)
//    }
//}


//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(selectedImage: compactMap)
//    }
//}

