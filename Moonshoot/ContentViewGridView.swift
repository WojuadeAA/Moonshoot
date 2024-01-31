//
//  ContentViewGridView.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 28/01/2024.
//

import SwiftUI

struct ContentViewGridView: View {
    
    
    
    let missions : [Mission]
    let astronauts : [String: Astronaut]
    let column = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        LazyVGrid(columns: column){
            ForEach(missions){mission in
                NavigationLink(value: mission) {
                    VStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            VStack{
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(.lightBackground)
                        
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .padding(.bottom)
                    
                    
                }
                
            }
        }
    }
}
#Preview {
    let astronauts : [String :  Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
return   ContentViewGridView(missions: missions, astronauts: astronauts)
}
