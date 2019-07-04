//
//  ViewController.swift
//  XmlParsing
//
//  Created by Alivelu Ravula on 4/20/18.
//  Copyright © 2018 brn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate {

    var xmlParserObj:XMLParser?
    var tollyWoodArry=[String]()
    var bollywoodArry=[String]()
    var zone=String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xmlFilePath=Bundle.main.path(forResource: "Actors", ofType: "xml")
        print(xmlFilePath!)
        
        self.xmlParserObj=XMLParser(contentsOf: URL(fileURLWithPath: xmlFilePath!))
        self.xmlParserObj?.delegate=self
        self.xmlParserObj?.parse()
        
       
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func parserDidStartDocument(_ parser: XMLParser) {
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if(elementName == "TollyWood" || elementName == "BollyWood")
        {
           self.zone = elementName
        }
        
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        
        let trimmedSrtng=string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if(trimmedSrtng.count>0)
        {
        if(self.zone == "TollyWood")
        {
            self.tollyWoodArry.append(string)
            
            }
            else if(self.zone == "BollyWood")
        {
            self.bollywoodArry.append(string)

            }
        }
        
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print(tollyWoodArry)
        print(bollywoodArry)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

