//
//  MissionView.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 19/01/2024.
//

import SwiftUI


struct MissionView: View {
    struct CrewMember: Hashable {
        let role : String
        let astronaut: Astronaut
    }
    let mission : Mission
    let crew : [CrewMember]
    
    init(mission: Mission, astrounauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astrounaut = astrounauts[member.name]{
                return CrewMember(role: member.role, astronaut: astrounaut)
            }else
            {
                fatalError("Missing \(member.name)")
            }
            
        }
    }
    
    
    
    var body: some View {
        
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){width, axes in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text(mission.longForamttedLaunchDate)
                    
                
              
                    
                VStack(alignment: .leading){
                    CustomDividerView()
                    
                    Text("Misson Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                   CustomDividerView()
                    
                    Text("Crew")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                        .foregroundStyle(.white)
                        .padding(.bottom, 5)
                       
                        
                }
                .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(crew, id: \.role) { crew in
                            NavigationLink(value: crew) {
                             HStack   {
                                    Image(crew.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Capsule())
                                        .overlay{
                                            Capsule()
                                                .stroke(.white, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                        }
                                 VStack(alignment:.leading){
                                     Text(crew.astronaut.name)
                                         .font(.headline)
                                         .foregroundStyle(.white)
                                     Text(crew.role)
                                         .font(.caption)
                                         .foregroundStyle(.gray.opacity(0.8))
                                        
                                 }
                             }
                             .padding(.horizontal)
                                
                                
                                
                            }
                         }
                    }
                }
                .navigationDestination(for: CrewMember.self){ crew in
                    AstronautView(astronaut: crew.astronaut)
                }
               
                
            }.padding(.bottom, 5)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return  MissionView(mission: missions[1], astrounauts: astronauts)
        .preferredColorScheme(.dark)
        
}
