//
//  QuizView.swift
//  Spectral
//
//  Created by Anne Kubis on 4/17/23.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SpectralViewModel()
    @State var quizAnswers = [ "", "", "", "", "", ""]
    @State var checkAnswers = false
    @State var correctAnswers = false
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                ZStack{
                    Rectangle()
                        .fill(.clear)
                        .border(.green, width:20)
                        .opacity(correctAnswers == true ? 1 : 0)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.green)
                        .frame(width: geometry.size.width * 0.5, height:geometry.size.width * 0.5)
                        .opacity(correctAnswers == true ? 0.8 : 0)
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
                            Text("Physics Lab Quiz")
                                .font(.title)
                            Text("Absorption Lines")
                                .font(.title2)
                            Divider()
                                .padding(15)
                            Text("Compare the observed absorption lines of the vial's contents and type which element you think is within that vial.")
                                .padding(.bottom, 15)
                            Text("Check your answers when you think you have all of them right.")
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 15)
                            Text("If you need to go back, make sure to save your answers before putting this sheet away.")
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 15)
                            Divider()
                                .padding(15)
                        }
                        VStack(alignment:.center){
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[0].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[0])", text: $quizAnswers[0])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[0].lowercased() == jumbledElements[0].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[1].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[1])", text: $quizAnswers[1])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[1].lowercased() == jumbledElements[1].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[2].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[2])", text: $quizAnswers[2])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[2].lowercased() == jumbledElements[2].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[3].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[3])", text: $quizAnswers[3])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[3].lowercased() == jumbledElements[3].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[4].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[4])", text: $quizAnswers[4])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[4].lowercased() == jumbledElements[4].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            HStack{
                                Spacer()
                                Text("\(jumbledElements[5].atomicNum)")
                                    .fontWeight(.heavy)
                                Spacer()
                                TextField("\(quizAnswerArray[5])", text: $quizAnswers[5])
                                    .frame(width: geometry.size.width * 0.3)
                                    .padding(10)
                                    .border(.gray, width: 2)
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height:20)
                                    Image(systemName:"checkmark.seal.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width:25, height:25)
                                        .opacity(quizAnswers[5].lowercased() == jumbledElements[5].name.lowercased() ? 1 : 0)
                                }
                                Spacer()
                            }
                            .padding(.bottom, 10)
                        }
                        Group{
                            Divider()
                                .padding(15)
                            HStack{
                                Spacer()
                                Button{
                                    quizAnswerArray = quizAnswers
                                }label:{
                                    Text("Save Answers")
                                        .fontWeight(.bold)
                                        .padding(10)
                                }
                                .background(Color(.blue))
                                .foregroundColor(.white)
                                Spacer()
                                Button{
                                    quizAnswerArray = quizAnswers
                                    correctAnswers = viewModel.compareAnswers(reference: jumbledElements, compare: quizAnswerArray)
                                }label:{
                                    Text("Check Answers")
                                        .fontWeight(.bold)
                                        .padding(10)
                                }
                                .background(Color(.blue))
                                .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
