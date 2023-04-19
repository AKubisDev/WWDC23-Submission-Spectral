import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SpectralViewModel()
    @State var showElement: Element
    @State var chosenElement : Element? = emptyElement
    @State var viewElement = false
    @State var showLabInfo = false
    @State var showReference = false
    @State var showQuiz = false
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .center){
                Spacer()
                // Display for absorption lines along visible rainbow wavelength spectrum
                ZStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: geometry.size.width, height:geometry.size.height * 0.1)
                    IndvSpectrumView(chosenElement: showElement)
                        .opacity(viewElement ? 1 : 0)
                        .frame(width: geometry.size.width, height:geometry.size.height * 0.1)
                        .border(Color(.darkGray), width:20)
                }
                ZStack{ // label strip
                    Rectangle()
                        .fill(Color(.white))
                    HStack{
                        HStack{
                            Image(systemName: "arrow.left")
                            Text("UV")
                        }
                        Spacer()
                        Text("Visible")
                        Spacer()
                        HStack{
                            Text("IR")
                            Image(systemName: "arrow.right")
                        }
                    }
                    .padding(.horizontal, 10.0)
                }
                .frame(height: geometry.size.height * 0.05)
                // Button to 'turn on' machine
                VStack{
                    Button {
                        withAnimation {
                            viewElement.toggle()
                            chosenElement = showElement
                        }
                    }label:{
                        VStack{
                            Image(systemName: "power.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(viewElement == false ? .black : .white)
                        }
                    }
                    Text("Power")
                }
                .padding(15)
                // Place to choose which element to observe
                VStack{
                    Text("Insert a vial")
                        .font(.title2)
                        .padding(10)
                        .foregroundColor(.black)
                    Picker("Element choice",selection: $showElement) {
                        Text("Empty")
                        ForEach(jumbledElements, id: \.self) { element in
                            ZStack{
                                Text("\(element.atomicNum)")
                            }
                        }
                        .background(Color(.white))
                    }
                    .pickerStyle(.menu)
                    .onChange(of: showElement) { _ in
                        viewElement = false
                    }
                }
                .padding(50)
                .background(Color(.white))
                .border(Color(.darkGray), width: 20)
                Spacer()
// Buttons to the Info, Reference, and Quiz sheets
                HStack{
                    Spacer()
                    Button{
                        showLabInfo.toggle()
                    }label:{
                        ZStack{
                            Rectangle()
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.2)
                                .foregroundColor(.white)
                            Text("Lab Info \n Sheet")
                                .fontWeight(.bold)
                                .padding(10)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.2)
                        }
                    }
                    .sheet(isPresented: $showLabInfo) {
                        InfoView()
                    }
                    Spacer()
                    Button{
                        showReference.toggle()
                    }label:{
                        ZStack{
                            Rectangle()
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.2)
                                .foregroundColor(.white)
                            Text("Element Reference Sheet")
                                .fontWeight(.bold)
                                .padding(10)
                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.2)
                        }
                    }
                    .sheet(isPresented: $showReference) {
                        ReferenceView()
                    }
                    Spacer()
                    Button{
                        showQuiz.toggle()
                    }label:{
                        ZStack{
                            Rectangle()
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.2)
                                .foregroundColor(.white)
                            VStack{
                                Text("Quiz Sheet")
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.2)
                            }
                        }
                    }
                    .sheet(isPresented: $showQuiz) {
                        QuizView(quizAnswers: quizAnswerArray)
                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(width:geometry.size.width)
        }
        .background(Color(.lightGray))
    }
}
