//
//  AstronautView.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 27/01/2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                 
                
                Text(astronaut.description)
                    .padding()
                    
                }
                
        }.background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
            
        }
}

#Preview {
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
   
   return AstronautView(astronaut: astronauts.first!.value)
        .preferredColorScheme(.dark)
}
