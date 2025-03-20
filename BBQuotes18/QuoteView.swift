//
//  QuoteView.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 2/19/25.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                .resizable()
                .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Text("\"\(vm.quote.quote)\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                }
                .frame(width: geo.size.width)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
    
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
