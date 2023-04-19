//
//  InfoView.swift
//  Spectral
//
//  Created by Anne Kubis on 4/17/23.
//

import SwiftUI

struct InfoView: View {
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
                    Group{
                        Text("Physics Lab")
                            .font(.title)
                        Text("Absorption Lines")
                            .font(.title2)
                        Divider()
                            .padding(15)
                        VStack(alignment:.leading){
                            Text("In this lab session, you'll be able to see the absorption lines within the visible light spectrum of a sample of elements. You have been given a mixed set of vials to determine what is in each vial. See the information section below for more details.")
                        }
                        Divider()
                            .padding(15)
                    }
                    Group{
                        Text("Instructions").font(.title3)
                            .padding(.bottom, 15)
                        VStack(alignment: .leading){
                            Text("Choose a vial to insert into the machine.")
                                .padding(.bottom, 15)
                            Text("Turn on the machine activate the sample with light.")
                                .padding(.bottom, 15)
                            Text("Observe the absorption spectrum lines that appear.")
                                .padding(.bottom, 15)
                            Text("Compare the observed lines with the Reference Sheet guide.")
                                .padding(.bottom, 15)
                            Text("Determine which element is in the vial and fill in your answers on the Quiz Sheet.")
                                .padding(.bottom, 15)
                        }
                        Divider()
                            .padding(15)
                    }
                    Group{
                        Text("Terms to Know").font(.title3)
                            .padding(.bottom, 15)
                        VStack(alignment: .leading){
                            Text("Element: Each of more than 100 substances in our universe that cannot be broken down into simpler substances or converted into each other.")
                                .padding(.bottom, 15)
                            Text("Wavelength: A characteristic of the energy of light. Longer wavelengths have lower energy, while shorter wavelengths have higher energy. In this lab, we're staying within the visible wavelength spectrum of 380 through 700 nanometers(nm). Below this range (0-380nm) is Ultraviolet (UV) light, X-rays, then Gamma rays. Above it (700+nm) is Infrared (IR) light, Microwaves, then Radio waves.")
                                .padding(.bottom, 15)
                            Text("Atom: Smallest possible piece of an element. The center is made up of Protons and Neutrons, with Electrons orbiting around the center.")
                        }
                        Divider()
                            .padding(15)
                    }
                    Group{
                        Text("What is happening in this lab?")
                            .font(.title2)
                            .padding(.bottom, 15)
                        VStack(alignment: .leading){
                            Text("When atoms are hit with light, its electrons will absorb the energy. The black lines displayed in this lab are places where that specific wavelength of light has been fully absorbed by the atom and is now missing. This is not limited to the visible spectrum that we can see. These lines can be above and below that range as well.")
                                .padding(.bottom, 15)
                            Text("These lines are like a fingerprint for each element and can be layered on top of each other when there are multiple elements present. This is how scientists can identify what elements are within the stars on the other side of the galaxy.")
                                .padding(.bottom, 15)
                            Text("For example: the element Helium was discovered in the spectrum of the Sun's light before it was found on Earth. This is also related to why flames can be different colors depending on what's being burned.")
                                .padding(.bottom, 15)
                        }
                    }
                }
                .padding(20)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
