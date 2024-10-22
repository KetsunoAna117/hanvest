//
//  LocalSimulationNewsRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation
import SwiftData

struct LocalSimulationNewsRepository: SimulationNewsRepository {
    let modelContext: ModelContext?
    
    func fetch() -> [SimulationNewsSchema] {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<SimulationNewsSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func fetch(id: String) -> SimulationNewsSchema? {
        if let context = modelContext {
            do {
                let descriptor = FetchDescriptor<SimulationNewsSchema>(
                    predicate: #Predicate { $0.newsID == id}
                )
                let result = try context.fetch(descriptor)
                return result.first
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func save(_ news: SimulationNewsSchema) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: news.newsID)
                if fetchedNews != nil {
                    throw SwiftDataError.alreadyExists
                }
                
                context.insert(news)
                try context.save()
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func delete(id: String) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                if fetchedNews == nil {
                    throw SwiftDataError.notFound
                }
                
                context.delete(fetchedNews!)
                try context.save()
            }
        }
    }
    
    func update(id: String, stockIDName: String) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                guard let fetchedNews else {
                    throw SwiftDataError.notFound
                }
                
                fetchedNews.update(stockIDName: stockIDName)
            }
        }
    }
    
    func update(id: String, newsTitle: String) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                guard let fetchedNews else {
                    throw SwiftDataError.notFound
                }
                
                fetchedNews.update(newsTitle: newsTitle)
            }
        }
    }
    
    func update(id: String, newsReleasedTime: Date) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                guard let fetchedNews else {
                    throw SwiftDataError.notFound
                }
                
                fetchedNews.update(newsReleasedTime: newsReleasedTime)
            }
        }
    }
    
    func update(id: String, newsContent: String) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                guard let fetchedNews else {
                    throw SwiftDataError.notFound
                }
                
                fetchedNews.update(newsContent: newsContent)
            }
        }
    }
    
    func update(id: String, stockFluksPercentage: Int) throws {
        if let context = modelContext {
            do {
                let fetchedNews = fetch(id: id)
                guard let fetchedNews else {
                    throw SwiftDataError.notFound
                }
                
                fetchedNews.update(stockFluksPercentage: stockFluksPercentage)
            }
        }
    }
}
