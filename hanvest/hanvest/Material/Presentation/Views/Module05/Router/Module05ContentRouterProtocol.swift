//
//  Module05ContentRouterProtocol.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

protocol Module05ContentRouterProtocol {
    var activeContent: Module05ContentView? { get set }
    
    func push(_ content: Module05ContentView)
    func pop()
}
