//
//  ContentView.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 18/01/2024.
//

import SwiftUI

enum ListStyle {
    case grid, list
    
   mutating func toggle(){
        if self == .grid{
            self = .list
        }else{
            self = .grid
        }
    }
}



struct ContentView: View {
    let astronauts : [String :  Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
   
    @State private var listStyle : ListStyle = .grid
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                Group{
                    if listStyle == .grid{
                        ContentViewGridView(missions: missions, astronauts: astronauts)
                            .navigationDestination(for: Mission.self){ mission in
                                MissionView(mission: mission, astrounauts: astronauts)
                            }
                    } else {
                        Text("showing list")
                    }
                }
             
                
                
                }
                .padding([.horizontal, .bottom])
                .navigationTitle("Moonshoot")
                .background(.darkBackground)
                .toolbar{
                    Button("switch", systemImage:  listStyle == .grid ? "list.dash": "square.grid.2x2"){
                        listStyle.toggle()
                    }
            }
            
                
                

            }
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
        }
      
    
    

    }


#Preview {
    ContentView()
}
