//
//  IndvSpectrumView.swift
//  Spectral
//
//  Created by Anne Kubis on 4/4/23.
//

import SwiftUI

struct IndvSpectrumView: View {
    @StateObject var viewModel = SpectralViewModel()
    var chosenElement: Element
//    var fixedPerc = 410
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{                
                ZStack(alignment: .leading){
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.black,.black, .purple, .blue, .green, .yellow, .orange, .red, .black, .black]), startPoint: .leading, endPoint: .trailing))
//                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                        .frame(width: geometry.size.width)
                    HStack {
                        ForEach(viewModel.percentToSpacing(wavelengths: chosenElement.absorption), id: \.self) { line in
                            
                            Divider()
                                .frame(minWidth: 2, minHeight: 0)
                                .frame(height: geometry.size.height * 0.99)
                                .overlay(Color.black)
                                .padding(.leading, geometry.size.width * line)
                        }
                    }
                }
//                .padding(0)
            }
        }
//        .background(Color(.yellow))
    }
}

struct IndvDummy: View {
    @State var chosenElement: Element = elements[5]
    var body: some View {
        IndvSpectrumView(chosenElement: chosenElement)
    }
}
struct IndvSpectrumView_Previews: PreviewProvider {
    static var previews: some View {
        IndvDummy()
    }
}
