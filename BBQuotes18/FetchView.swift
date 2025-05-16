//
//  FetchView.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 2/19/25.
//

import SwiftUI

struct FetchView: View {
    let vm = ViewModel()
    let show: String
    
    @State var showCharacterInfo: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.removeCaseAndSpace())
                .resizable()
                .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack{//This vstack is used to anchor the Get Random Quote button into one place regardless of screen activity
                        Spacer(minLength: 60)// this along with min scale factor keeps long quotes from either running off of the screen or getting truncated (to a point).
                        
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .successQuote:
                            Text("\"\(vm.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .clipShape(.rect(cornerRadius: 25))
                                .padding(.horizontal)
                            
                
                            ZStack(alignment: .bottom){
                                AsyncImage(url: vm.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                
                                Text(vm.quote.character)
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                                
                            }// end zstack
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .clipShape(.rect(cornerRadius: 50))
                            .onTapGesture {
                                showCharacterInfo.toggle()
                            }
                            
                        case .successEpisode:
                            EpisodeView(episode: vm.episode)
                            
                            
                        case .failed(let error):
                            Text(error.localizedDescription)
                        }
                        
                        
                        
                        Spacer(minLength: 20)
                        
                    }// end button anchor
                    
                    HStack{
                        Button {
                            Task{
                                await vm.getQuoteData(for: show)
                            }
                        } label: {
                            Text("Get Random Quote")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 7))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }// end button label
                        
                        Spacer()
                        
                        Button {
                            Task{
                                await vm.getEpisode(for: show)
                            }
                        } label: {
                            Text("Get Random Episode")
                                .font(.title2)
                                .foregroundStyle(.white) 
                                .padding()
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 7))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }// end button label
                    }//end hstack
                    .padding(.horizontal, 30)
                    
                    Spacer(minLength: 95)
                    
                }// end outer vstack
                
                .frame(width: geo.size.width, height: geo.size.height)
                    
                }// end zstack
               
            .frame(width: geo.size.width, height: geo.size.height)
    
        }// end geo reader
        .ignoresSafeArea()
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
        
    }// end body
} // end view

#Preview {
    FetchView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
