//
//  BasicString.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 22/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation

class BasicString {
    
    
    func stringTest() {
        
        /*
         如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，你可以用在行尾写一个反斜杠（\）作为续行符。
         */
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        The White Rabbit put on his spectacles.  "Where shall I begin,\
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        print(quotation)
        
        // 初始化空字符串
        let anotherEmptyString = String()
        ILog.debug(tag: #file, content: anotherEmptyString)
        
        // 初始化字符串并赋值
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        // welcome 变量现在等于 "hello!"
        
        welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
        // welcome 变量现在等于 "hello there!"
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome 现在等于 "hello there"
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        // welcome 现在等于 "hello"
        
        var hello = "hello"
        hello += " sh"
        // 现在 hello 是 "hello sh"
        
        // 遍历字符串中的字符
        for character in hello {
            print(character)
        }
        
        // 插入字符串
        welcome.insert("!", at: welcome.endIndex)
        // welcome 变量现在等于 "hello!"

        welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
        // welcome 变量现在等于 "hello there!"
        
        //调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome 现在等于 "hello there"
        
        // 通过调用字符串的 hasPrefix(_:)/hasSuffix(_:) 方法来检查字符串是否拥有特定前缀/后缀，两个方法均接收一个 String 类型的参数，并返回一个布尔值。
        
        
    }
    
}
