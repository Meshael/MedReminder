//
//  Splash Screen.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 09/06/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    
    @State var animationFinished: Bool = false
    @State var animationStarted: Bool = false
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [Color("White"), Color("White")],
                           startPoint: .leading, endPoint: .trailing)
            
            .ignoresSafeArea()
            
            ZStack{
                
                if animationStarted {
                    
                    
                    if animationFinished {
                        Image("Frog12")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 230, height: 230)
                    } else {
                        AnimatedImage(url: getLogoURL())
                        //                        .customLoopCount(nil)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                else {
                    Image("Frog12")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 400, height: 400)
                }
                VStack{
                    Spacer()
                    Text("Creator: Mashael Alharbi")
                        .font(.system(size: 12))
                }
            }
        }
        .animation(.none, value: animationFinished)
        
        .opacity(animationFinished ? 0 : 1)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                animationStarted = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    
                    withAnimation(.easeInOut(duration: 0.5)) {
                        animationFinished = true
                    }
                }
            }
        }
    }
    
    
    
    
    
    func getLogoURL()->URL{
        let bundle = Bundle.main.path(forResource: "Frog", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        
        return url
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
