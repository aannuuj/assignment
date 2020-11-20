//
//  Model.swift
//  Assignment
//
//  Created by Hariom Palkar on 19/11/20.
//

import Foundation

struct Item:Identifiable {
    var id = UUID()
    var name:String
    var description:String
    var subtitle:String
    var image:String
    var logo : String
}

var items:[Item] = [
    Item(name: "Minecraft", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", subtitle: "CREATIVE", image: "1", logo: "logo"),
    
    Item(name: "Video games", description: "At auctor urna nunc id cursus metus aliquam. ", subtitle: "XBOX", image: "2", logo: "logo1"),
    
    Item(name: "Marvel-Inspired Games", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam tempor orci eu lobortis elementum nibh. ", subtitle: "IRON MAN", image: "3", logo: "logo2"),
    
    Item(name: "Blast off! Rocketship Games", description: "At auctor urna nunc id cursus metus aliquam. Id donec ultrices tincidunt arcu non sodales neque sodales ut. ", subtitle: "ROGER THAT", image: "4", logo: "logo3")
]
