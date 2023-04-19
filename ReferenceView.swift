//
//  ReferenceView.swift
//  Spectral
//
//  Created by Anne Kubis on 4/13/23.
//

import SwiftUI

struct ReferenceView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Button{
                            dismiss()
                        }label:{
                            Image(systemName:"x.circle.fill")
                                .resizable()
                                .foregroundColor(Color(.blue))
                                .frame(width: 25, height: 25)
                        }
                    }
                    .padding(.bottom, 10)
                        Text("Element Sample Set")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                    Divider()
                    Text("Each vial contains a sample of one element listed below. The Virtual Spectrometer will display the element's absorption lines as shown.")
                    Divider()
                    ForEach(elements, id: \.self) { element in
                        VStack(alignment: .center){
                            Text("\(element.name)")
                                .font(.title2)
                            IndvSpectrumView(chosenElement: element)
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.05)
                            Divider()
                                .padding(5)
                        }
                    }
                    .padding(.bottom, 10)
                }
                .frame(width: geometry.size.width * 0.8)
                .padding(20)
            }
            .frame(width:geometry.size.width)
        }
    }
}

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView()
    }
}
