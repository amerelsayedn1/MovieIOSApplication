//
//  Extensions.swift
//  tutorial_project
//
//  Created by Amer Elsayed on 29/01/2023.
//

import Foundation

extension String{
    
    func capitalizeFirstLetters() -> String{
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
