//
//  Facts.swift
//  studentchallenge-1
//
//  Created by Marcell JW on 06/02/24.
//

import Foundation

struct Fact {
    
    let statement: String
    let supportingFact: [String]
    let source: [String]
    
    init(statement: String, supportingFact: [String], source: [String]) {
        self.statement = statement
        self.supportingFact = supportingFact
        self.source = source
    }
    
}

extension Fact {
    
    // Trash was better - 154 cities / regency - 2021
    // https://bsilhk.menlhk.go.id/index.php/2022/06/02/ikn-tantangan-kelola-sampah-standar-minimal-harus-berjalan/
    // Trash Build Up 1 Month Prior - 202 cities/ regency - 2022
    // https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik
    // Trash Build Up Info Update - 299 cities / regency - 2022
    // https://unair.ac.id/tpa-salah-satu-solusi-bukan-satu-satunya-solusi/
    // Trash as of Now - 126 cities / regency - 2023
    // https://sipsn.menlhk.go.id/sipsn/
    static let indonesianWasteFact = Fact(
        statement: """
        As much as 13-14 million tons of Waste accumulates each year in Indonesia and only about 70% is processed properly; \
        leaving about 30% or 4.9 million tons of unprocessed waste to accumulate in landfills. Consequences of accumulated unprocessed waste includes potential explosions due to methane build-up during and floods during the rainy seasons.
        
        Between 2021-2023, data from the System of Information for National Waste Management shows that the volume of unprocessed waste is increasing, resulting in further accumulation of wastes in landfills.
        """,
        supportingFact: ["2021 - 72.95% Processed (13,3 million ton) vs. 27.05% Unprocessed (4,9 million ton)",
                         "2022 - 65.71% Processed (13,9 million ton) vs. 34.29% Unprocessed (7,2 million ton)",
                         "2023 - 66.47% Processed (11,6 million ton) vs. 33.53% Unprocessed (5,9 million ton)",
                        "Explosion due to methane gas build up in Leuwigajah Village in 2005"],
        source: [
            "https://bsilhk.menlhk.go.id/index.php/2022/06/02/ikn-tantangan-kelola-sampah-standar-minimal-harus-berjalan/",
            "https://unair.ac.id/tpa-salah-satu-solusi-bukan-satu-satunya-solusi/",
            "https://sipsn.menlhk.go.id/sipsn/",
            "https://paxel.co/id/berita-dan-promo/dampak-sampah-yang-tidak-dikelola-dengan-baik#:~:text=Selain%20banjir%2C%20longsor%20sampah%20dapat,Tempat%20Pemrosesan%20Sampah%20(TPA)."
        ]
    )
    
    // Korean Culture is popular in Indonesia
    // https://snapcart.global/article-k-everything-indonesian-consumption-of-korean-culture-and-entertainment/
    static let southKoreaPopularityFact = Fact(
        statement: "South Korea Entertainment and Media is popular in Indonesia",
        supportingFact: [
            ""
        ],
        source: [
            "https://snapcart.global/article-k-everything-indonesian-consumption-of-korean-culture-and-entertainment/"
        ]
    )
    
    // "Kesuksesan sistem pengolahan sampah Korea"
    // https://greeneration.org/publication/green-info/sistem-pengelolaan-sampah-korea-selatan/
    // https://www.cnbcindonesia.com/news/20230111192253-4-404781/takjub-korsel-daur-ulang-sampah-plastik-943000-ton--tahun
    static let koreanWasteFact = Fact(
        statement: "South Korea Has a Successful Waste-Disposal Policy",
        supportingFact: [
            "South Korea has one of the most rigorous waste recycling programmes in the world",
            "Implements waste management policies such as Extended Producer Responsibility (EPR) and Volume-based Waste Fee (VBWF)"
        ],
        source: [
            "https://www.downtoearth.org.in/news/waste/ten-zero-waste-cities-how-seoul-came-to-be-among-the-best-in-recycling-68585",
            "https://greeneration.org/publication/green-info/sistem-pengelolaan-sampah-korea-selatan/"
        ]
    )
    
    // Encouragement
    // https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik
    static let encouragementFact = Fact(
        statement: "Lets abandon the conventional pattern of waste disposal and start sorting waste at home all the way to living a new lifestyle based on 3R (reduce, reuse, recycle) ~ (translated)",
        supportingFact: ["by Gatot Hendrarto - Deputy Secretary of Mental Revolution, Cultural Advancement, and Athletic Performance"],
        source: ["https://www.kemenkopmk.go.id/72-juta-ton-sampah-di-indonesia-belum-terkelola-dengan-baik"]
    )
    
    static let infoCollection = [
        indonesianWasteFact,
//        southKoreaPopularityFact,
        koreanWasteFact,
        encouragementFact
    ]
    
}





