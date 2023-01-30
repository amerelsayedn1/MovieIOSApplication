//
//  Tv.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 29/01/2023.
//

import Foundation

struct TrendingTvResponse : Codable {
    let results:[Tv]
}

struct Tv : Codable{
    let id:Int
    let media_type :String?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let poster_path:String?
    let vote_count:Int
    let release_date:String?
    let vote_average:Double
}
