//
//  Facts.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 06/02/24.
//

import Foundation

struct Fact {
    let statement: String
    let supportingFact: String
    let source: String
    
    init(statement: String, supportingFact: String, source: String) {
        self.statement = statement
        self.supportingFact = supportingFact
        self.source = source
    }
    
}

extension Fact {
    
    //
    static let indonesianWasteFact = Fact(
        statement: "A lot of Trash",
        supportingFact: "Fact About Trash in Korea",
        source: "CNBC Maybe"
    )
    
    // "Kesuksesan sistem pengolahan sampah Korea"
    // https://greeneration.org/publication/green-info/sistem-pengelolaan-sampah-korea-selatan/
    // https://www.cnbcindonesia.com/news/20230111192253-4-404781/takjub-korsel-daur-ulang-sampah-plastik-943000-ton--tahun
    static let koreanWasteFact = Fact(
        statement: "South Korea Has a Successful Waste-Disposal Policy",
        supportingFact: "Fact About Successful Trash Sorting Policy",
        source: "CNBC Maybe"
    )
    
    static let encouragementFact = Fact(statement: "Let's ", supportingFact: "", source: "")
    
    static let infoCollection = [
        indonesianWasteFact, koreanWasteFact, encouragementFact
    ]
    
}





