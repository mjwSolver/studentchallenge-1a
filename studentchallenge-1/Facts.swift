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
    // Trash Build Up 1 Month Prior - 202 cities/ regency - 2022
    // https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik
    // Trash Build Up Info Update - 299 cities / regency - 2022
    // https://unair.ac.id/tpa-salah-satu-solusi-bukan-satu-satunya-solusi/
    // Trash as of Now - 154 cities / regency - 2023
    // https://sipsn.menlhk.go.id/sipsn/
    static let indonesianWasteFact = Fact(
        statement: "We must abandon the conventional pattern of waste disposal and start sorting waste at home all the way to living a new lifestyle based on 3R (reduce, reuse, recycle)",
        supportingFact: "by Gatot Hendrarto - Deputy Secretary of Mental Revolution, Cultural Advancement, and Athletic Performance",
        source: "https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik (translated)"
    )
    
    // "Kesuksesan sistem pengolahan sampah Korea"
    // https://greeneration.org/publication/green-info/sistem-pengelolaan-sampah-korea-selatan/
    // https://www.cnbcindonesia.com/news/20230111192253-4-404781/takjub-korsel-daur-ulang-sampah-plastik-943000-ton--tahun
    static let koreanWasteFact = Fact(
        statement: "South Korea Has a Successful Waste-Disposal Policy",
        supportingFact: "Fact About Successful Trash Sorting Policy",
        source: "CNBC Maybe"
    )
    
    // Encouragement
    // https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik
    static let encouragementFact = Fact(statement: "Let's ", supportingFact: "", source: "")
    
    static let infoCollection = [
        indonesianWasteFact, koreanWasteFact, encouragementFact
    ]
    
}





