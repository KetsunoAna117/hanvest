//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

class Module02ViewModel: ObservableObject {
    @Inject var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule
    
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = Module02HeaderWithDetailText.page10.rawValue
    
    @Published var currentTab: Int = 0
    @Published var progressBarCurrValue: Int = 4
    @Published var pageState: Module02PageState = .pageContinue
    @Published var userSelectedAnswers = Array(repeating: "", count: Module02HeaderWithDetailText.page10.rawValue) // TODO: last index always bug, idk why need to exceess count by + 1
    
    
    func directToCompletionPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        do {
            let isModuleCompleted = try validateIfUserHasCompletedTheModule.execute(specificModule: specificModule)
                
            if isModuleCompleted {
                router.popToRoot()
            } else {
                router.push(.moduleCompletion(completionItem: specificModule))
            }
        }
        catch {
            debugPrint("Failed to direct to completion page: \(error.localizedDescription)")
        }
    }
    
    func goToNextPage(router: any AppRouterProtocol, specificModule: CompletionEntityType) {
        if currentTab < lastPage {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            directToCompletionPage(router: router, specificModule: specificModule)
        }
    }
    
    func changePageState() {
        switch currentTab {
            case Module02TextImage.page06.rawValue:
                pageState = .pageCheckout
            case Module02MultipleChoice.page07.rawValue:
                pageState = .pagePay
            default:
                pageState = .pageContinue
        }
    }
    
    func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / lastPage)
    }
    
    func checkIsDisabled() -> Bool {
        guard currentTab < userSelectedAnswers.count else {
            return false
        }
        
        let isPage04 = (currentTab == Module02TextImageColorPicker.page04.rawValue)
        let isChoicePage = Module02MultipleChoice.allCases.contains(where: { $0.rawValue == currentTab })
        let isAnswerEmpty = userSelectedAnswers[currentTab].isEmpty
        
        return (isPage04 || isChoicePage) && isAnswerEmpty
    }
    
    func checkPageToSkip(page: Module02HeaderWithDetailText, userSelectedAnswer: Bool) -> Bool {
        return (
            (
                userSelectedAnswer && (page == .page08Alt2 || page == .page09Alt2)
            ) || (
                !userSelectedAnswer && (page == .page08 || page == .page09)
            )
        )
    }
    
    func adjustPageStateRawValue(rawValue: Int) -> Int {
        if rawValue > lastPage {
            return (rawValue / lastPage)
        } else {
            return rawValue
        }
    }
    
    func checkDebitOrPayLater() -> Bool {
        return userSelectedAnswers.contains(where: { $0 == Module02MultipleChoice.page07.options.first })
    }
    
    func checkIphoneOrIphoneProMax() -> String {
        guard let firstOption = Module02MultipleChoice.page03.options.first,
              let lastOption = Module02MultipleChoice.page03.options.last else {
            return ""
        }
        
        if userSelectedAnswers.contains(where: { $0 == firstOption }) {
            return firstOption
        } else {
            return lastOption
        }
    }
}
