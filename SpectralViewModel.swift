//
//  SpectralViewModel.swift
//  Spectral
//
//  Created by Anne Kubis on 4/4/23.
//

import Foundation

let jumbledElements: [Element] = elements.shuffled()

let emptyElement = Element(name:"Empty", symbol:" ", atomicNum: 0,absorption: [0])

var quizAnswerArray: [String] = ["","","","","",""]

struct Element: Hashable{
    let id = UUID()
    let name: String
    let symbol: String
    let atomicNum: Int
    let absorption: [Int]
}

var elements = [
    Element(name: "Hydrogen", symbol: "H", atomicNum: 1, absorption: [410, 434, 486, 656]),
    Element(name: "Carbon", symbol: "C", atomicNum: 6, absorption: [477, 493, 505, 538, 600, 600, 601, 658, 711, 711]),
    Element(name: "Oxygen", symbol: "O", atomicNum: 8, absorption:[423, 436, 532, 533, 543, 557, 595, 595, 604, 615, 615, 615, 645, 700, 715, 725]),
    Element(name: "Nitrogen", symbol: "N", atomicNum: 7, absorption: [410, 411, 491, 493, 528, 575, 599, 600, 641, 642, 644, 648, 649, 650, 662, 663, 664, 665, 672, 740, 742, 746]),
    Element(name: "Sulfur", symbol: "S", atomicNum: 16, absorption: [390, 393, 412, 414, 416, 469, 471, 481, 492, 499, 542, 545, 551, 556, 560, 564, 566, 570, 581, 605, 628, 630, 638, 641, 674, 757]),
    Element(name: "Sodium", symbol: "Na", atomicNum: 11, absorption: [371, 411, 423, 429, 432, 434, 436, 438, 440, 444, 447, 449, 451, 453, 459, 466,  472, 474, 497, 568, 589, 615, 653, 654])
]

class SpectralViewModel: ObservableObject {
    
    func waveToPercent(wavelength:Int) -> Double {
        let wave = Double(wavelength-300)
        let finalPercent = Double(wave)/Double(500)
        return finalPercent
    }
    
    func percentToSpacing(wavelengths: [Int]) -> [Double]{
        var spacing: [Double] = []
        for entry in wavelengths{
            spacing.append(waveToPercent(wavelength: entry))
        }
        var finalSpacing = spacing
    
        for num in 0...finalSpacing.count-1{
            var prior: Double = 0.00
            if num == 0{
            }else{
                prior = spacing[num-1]
                finalSpacing[num] -= prior
            }
        }
        return finalSpacing
    }
    
    func compareAnswers(reference: [Element], compare: [String]) -> Bool{
        var score = 0
        for num in 0...5{
            if reference[num].name.lowercased() == compare[num].lowercased(){
                score += 1
            }
        }
        if score == 6{
            return true
        }else{
            return false
        }
    }
}

// This array preserves the data with the more accurate numbers for the wavelengths as well as including some that were culled due to becoming too crowded in this app's displays. 
//var elements = [
//    Element(name: "Hydrogen", symbol: "H", absorption: [410.2, 434, 486.1, 656.3]),
//    Element(name: "Carbon", symbol: "C", absorption: [477.1, 493.2, 505.2, 538, 600.1, 600.6, 600.7, 601.1, 601.3, 601.5, 658.8, 711.3, 711.5, 711.7]),
//    Element(name: "Oxygen", symbol: "O", absorption:[423.3, 436.8, 532.9, 533, 533.1, 543.5, 543.6, 557.7, 595.8, 595.9, 604.6, 615.6, 615.7, 615.8, 645.4, 645.6, 700.2, 715.7, 725.5]),
//    Element(name: "Nitrogen", symbol: "N", absorption: [410, 411, 491.5, 493.5, 528.1, 575.3, 599.9, 600.8, 641.2, 642.1, 642.3, 644.1, 648.2, 648.3, 648.4, 648.5, 649.1, 649.9, 650.6, 662.2, 663.7, 664.5, 664.7, 665.3, 665.7, 672.3, 740.6, 742.4, 744.2, 746.8]),
//    Element(name: "Sulfur", symbol: "S", absorption: [390.2, 393.3, 412.1, 414.2, 414.5, 415.3, 416.3, 469.4, 469.5, 469.6, 471.6, 481.6, 492.4, 492.5, 499.4, 542.9, 543.3, 545.4, 547.4, 551, 556.5, 560.6, 564, 564.7, 566, 566.5, 570.6, 581.9, 605.3, 628.6, 628.7, 630.6, 631.3, 638.5, 639.7, 639.8, 641.4, 674.4, 674.9, 675.7, 757.9]),
//    Element(name: "Sodium", symbol: "Na", absorption: [371.1, 411.4, 412.3, 423.3, 424.1, 429.2, 429.3, 430.9, 432.1, 433.7, 434.4, 436.9, 437.5, 438.7, 439.3, 440.5, 444.7, 445.5, 445.7, 447.5, 447.9, 448.2, 449, 449.1, 450, 450.7, 451.9, 452.5, 453.3, 455.2, 459.1, 466.5, 466.9, 466.9, 472.2, 473.1, 474.2, 476.9, 497.9, 498.3, 568.3, 568.8, 589, 589.6, 615.4, 616.1, 653.1, 654.4, 654.6])
//    ]
