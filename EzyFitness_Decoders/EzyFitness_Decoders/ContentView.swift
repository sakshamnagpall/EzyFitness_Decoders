//
//  ContentView.swift
//  EzyFitness_Decoders
//
//  Created by student on 01/05/24.
//

import Foundation
import SwiftUI
struct SwiftUIView:View {
    @State var digitData = 1
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    if digitData == 1 {}
                    else{
                        digitData = digitData - 1
                    }
                }){
                    Image(systemName: "minus")
                }
            }
        }
    }
}
