//  ContentView.swift
//  RockPaperScissors
//
//  Created by Rafael Fagundes on 2024-09-02.
//

import SwiftUI

enum HandSign {
    case rock, paper, scissors
}

enum MatchOutcome {
    case draw, win, lose
}

class HandSignItem {
    var winsAgainst: HandSign
    var losesTo: HandSign
    var type: HandSign
    
    private init(type: HandSign) {
        if type == HandSign.rock {
            self.winsAgainst = HandSign.scissors
            self.losesTo = HandSign.paper
        } else if type == HandSign.paper {
            self.winsAgainst = HandSign.rock
            self.losesTo = HandSign.scissors
        } else {
            self.winsAgainst = HandSign.paper
            self.losesTo = HandSign.rock
        }
        
        self.type = type
    }
    
    static func create(type: HandSign) -> HandSignItem {
        return HandSignItem(type: type)
    }
    
    func getName() -> String {
        switch self.type {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
}


struct ContentView: View {
    
    let rockItem: HandSignItem
    let paperItem: HandSignItem
    let scissorsItem: HandSignItem
    let allItems: [HandSignItem]
    
    @State var currentMachineItem: HandSignItem
    @State var matchOutcome: MatchOutcome?
    
    @State var winCount: Int = 0
    @State var loseCount: Int = 0
    
    @State var showMachineChoice: Bool = false
    
    @State var disableNewChoices: Bool = false
    
    
    init() {
        self.rockItem = HandSignItem.create(type: .rock)
        self.paperItem = HandSignItem.create(type: .paper)
        self.scissorsItem = HandSignItem.create(type: .scissors)
        self.allItems = [rockItem, paperItem, scissorsItem]
        
        self._currentMachineItem = State(initialValue: ContentView.getRandomItem(items: self.allItems))
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Wins: \(winCount)")
                    Spacer()
                    Text("Losses: \(loseCount)")
                }.padding(.vertical, 20)
                Spacer()
                Text(currentMachineItem.getName()).opacity(showMachineChoice ? 1 : 0)
                Spacer()
                if matchOutcome == .draw {
                    Text("It's a Draw!").foregroundColor(.black).font(.largeTitle).bold()
                } else if matchOutcome == .win {
                    Text("You Win!").foregroundColor(.green).font(.largeTitle).bold()
                } else if matchOutcome == .lose {
                    Text("You Lose!").foregroundColor(.red).font(.largeTitle).bold()
                }
                Spacer()
                HStack {
                    Button("Rock") {
                        handleHandSignButtonPressed(userItem: rockItem, machineItem: currentMachineItem)
                    }.disabled(disableNewChoices)
                    Spacer()
                    Button("Paper") {
                        handleHandSignButtonPressed(userItem: paperItem, machineItem: currentMachineItem)
                    }.disabled(disableNewChoices)
                    Spacer()
                    Button("Scissors") {
                        handleHandSignButtonPressed(userItem: scissorsItem, machineItem: currentMachineItem)
                    }.disabled(disableNewChoices)
                }
                Spacer()
                Button("Next Round") {
                    handleNextRoundButtonPressed()
                }
            }
            .navigationTitle("Rock, Paper & Scissors")
            .padding(.horizontal, 40)
        }
        
    }
    
    
    static func getRandomItem(items: [HandSignItem]) -> HandSignItem {
        let randomIndex = Int.random(in: 0..<items.count)
        return items[randomIndex]
    }
    
    func handleNextRoundButtonPressed(){
        showMachineChoice = false
        currentMachineItem = ContentView.getRandomItem(items: self.allItems)
        matchOutcome = nil
        disableNewChoices = false
    }
    
    func handleHandSignButtonPressed(userItem: HandSignItem, machineItem: HandSignItem){
        matchOutcome = determineOutcome(user: userItem, machine: machineItem)
        updateScore(outcome: matchOutcome!)
        showMachineChoice = true
        disableNewChoices = true
    }
    
    func updateScore(outcome: MatchOutcome) {
        if outcome == .win {
            self.winCount += 1
        }
        if outcome == .lose {
            self.loseCount += 1
        }
    }
    
    func determineOutcome(user: HandSignItem, machine: HandSignItem) -> MatchOutcome {
        if user.type == machine.type {
            return MatchOutcome.draw
        }
        if user.winsAgainst == machine.type {
            return MatchOutcome.win
        }
        return MatchOutcome.lose
    }
}

#Preview {
    ContentView()
}
