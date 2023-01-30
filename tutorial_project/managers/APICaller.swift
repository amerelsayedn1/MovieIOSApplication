//
//  APICaller.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 29/01/2023.
//

import Foundation
import Metal

struct Constants{
    static let API_KEY = "285dcedfc17a8c1cc87ff6b166092aec"
    static let BASE_URL = "https://api.themoviedb.org"
    
}

class APICaller {
    
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    func getTrendingUpComingMovies(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
    func getPopularMovies(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    //https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    func getTopRatedMovies(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
    
    
}
