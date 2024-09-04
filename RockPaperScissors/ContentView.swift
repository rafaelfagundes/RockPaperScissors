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
    @State var currentUserItem: HandSignItem?
    @State var matchOutcome: MatchOutcome?
    @State var winCount: Int = 0
    @State var loseCount: Int = 0
    @State var showMachineChoice: Bool = false
    @State var disableNewActions: Bool = false
    @State var showResetAlert: Bool = false
    
    
    init() {
        self.rockItem = HandSignItem.create(type: .rock)
        self.paperItem = HandSignItem.create(type: .paper)
        self.scissorsItem = HandSignItem.create(type: .scissors)
        self.allItems = [rockItem, paperItem, scissorsItem]
        
        self._currentMachineItem = State(initialValue: ContentView.getRandomItem(items: self.allItems))
    }

    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 2/255, green: 52/255, blue: 54/255).ignoresSafeArea()
                VStack {
                    Logo()
                    ScoreBoard(winCount: winCount, loseCount: loseCount)
                    Spacer()
                    if showMachineChoice {
                        HandSignChoice(name: currentMachineItem.getName(), isRotated: true)
                    }
                    Spacer()
                    MatchOutcomeDisplay(matchOutcome: matchOutcome)
                    Spacer()
                    if currentUserItem !== nil {
                        HandSignChoice(name: currentUserItem!.getName(), isRotated: false)
                    }
                    Spacer()
                    if (!disableNewActions){
                        HStack {
                            HandSignButtonView(text: rockItem.getName(), action: {
                                handleHandSignButtonPressed(userItem: rockItem, machineItem: currentMachineItem)
                            }, isDisabled: disableNewActions, backgroundImage: "button_square_depth_gradient_blue")
                            
                            HandSignButtonView(text: paperItem.getName(), action: {
                                handleHandSignButtonPressed(userItem: paperItem, machineItem: currentMachineItem)
                            }, isDisabled: disableNewActions, backgroundImage: "button_square_depth_gradient_green")
                            
                            HandSignButtonView(text: scissorsItem.getName(), action: {
                                handleHandSignButtonPressed(userItem: scissorsItem, machineItem: currentMachineItem)
                            }, isDisabled: disableNewActions, backgroundImage: "button_square_depth_gradient_red")
                        }
                    }
                    
                    if disableNewActions{
                        HStack{
                            ResetButton(action: {
                                showResetAlert = true
                            })
                            Spacer()
                            NextButton(action: handleNextRoundButtonPressed)
                        }.padding()
                    }
                }
            }
        }.alert(isPresented: $showResetAlert) {
            Alert(
                title: Text("Reset Game"),
                message: Text("Are you sure you want to reset the game?"),
                primaryButton: .destructive(Text("Reset")) {
                    resetGame()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    
    static func getRandomItem(items: [HandSignItem]) -> HandSignItem {
        let randomIndex = Int.random(in: 0..<items.count)
        return items[randomIndex]
    }
    
    func handleNextRoundButtonPressed(){
        playTapSound()
        showMachineChoice = false
        currentMachineItem = ContentView.getRandomItem(items: self.allItems)
        matchOutcome = nil
        disableNewActions = false
        currentUserItem = nil
    }
    
    func handleHandSignButtonPressed(userItem: HandSignItem, machineItem: HandSignItem){
        currentUserItem = userItem
        matchOutcome = determineOutcome(user: userItem, machine: machineItem)
        updateScore(outcome: matchOutcome!)
        showMachineChoice = true
        disableNewActions = true
    }
    
    func playTapSound(){
        let soundPlayer = SoundPlayer()
        soundPlayer.playAudio(resource: "tap-a", withExtension: "wav")
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
    
    func resetGame(){
        winCount = 0
        loseCount = 0
        currentUserItem = nil
        currentMachineItem = ContentView.getRandomItem(items: self.allItems)
        showMachineChoice = false
        disableNewActions = false
        matchOutcome = nil
    }
}

#Preview {
    ContentView()
}
