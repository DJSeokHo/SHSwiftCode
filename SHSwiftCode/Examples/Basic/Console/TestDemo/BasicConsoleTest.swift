//
//  BasicConsoleTest.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 21/06/2019.
//  Copyright © 2019 SWein. All rights reserved.
//

import Foundation


class BasicConsoleTest {
    
    func basicGrammarTest() {
        let basicGrammar: BasicGrammer = BasicGrammer()
        basicGrammar.simpleValue()
        basicGrammar.longString()
        basicGrammar.makeArray()
        basicGrammar.makeDictionary()
        basicGrammar.switchControl()
        basicGrammar.forControl()
        basicGrammar.whileControl()
        print(basicGrammar.functionWithReturn(name: "haha"))
        
        let resultTuple = basicGrammar.functionWithReturnTuple(name: "haha", age: 20)
        print("name is \(resultTuple.name) age is \(resultTuple.age)")
        
        basicGrammar.functionInFunction()
        
        let resultFunction = basicGrammar.functionReturnFunction()
        print(resultFunction(12))
        
        basicGrammar.functionWithFunctionParameter(name: "hehe", helloFunction: basicGrammar.helloFunction(name:))
        
        basicGrammar.createAClass()
        
        basicGrammar.testEnum()
        basicGrammar.testStruct()
        
        basicGrammar.testExtension()
        basicGrammar.valueParsing()
        
        basicGrammar.checkPlateformAPI()
    }
    
    func basicStringTest() {
        let basicString: BasicString = BasicString()
        basicString.stringTest()
    }
    
    func basicCollectionTest() {
        let basicCollection: BasicCollection = BasicCollection()
        basicCollection.arrayTest()
        basicCollection.setsTest()
        basicCollection.dictionariesTest()
    }
    
    func basicControlFlowTest() {
        let basicControlFlow: BasicControlFlow = BasicControlFlow()
        basicControlFlow.forItemInItemsMethod()
        basicControlFlow.whileMethod()
        basicControlFlow.repeatWhileMethod()
        basicControlFlow.switchMethod()
        basicControlFlow.switchMethodWithFallthroughMethod()
    }
    
    func basicFunctionTest() {
        let basicFunction: BasicFunction = BasicFunction()
        print(basicFunction.hello(name: "Seok Ho"))
        
        let people = basicFunction.returnWithMultiItemTuple()
        
        var name: String? = nil
        var age: Int? = nil
        
        name = people.name
        if(name != nil) {
            print(name!)
        }
        else {
            print("name is nil")
        }
        
        age = people.age
        if(age != nil) {
            print(age!)
        }
        else {
            print("age is nil")
        }
        
        basicFunction.functionWithDefaultValue("Seok Ho", hwoold: 32)
        basicFunction.functionWithDefaultValue("Seok Ho")
       
        var someInt = 3
        var anotherInt = 107
        basicFunction.swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
        
        let resultSquare = basicFunction.functionWithFunctionParameter(data: 3, function: basicFunction.square(data:))
        print(resultSquare)
        
        let resultCube = basicFunction.functionWithFunctionParameter(data: 2, function: basicFunction.cube(data:))
        print(resultCube)
        
        
        let resultFunction = basicFunction.functionReturnFunction(type: "hehe")
        print(resultFunction("who"))
        
        let closureFunction = basicFunction.functionReturnFunctionByClosure(type: "haha")
        print(closureFunction("you"))
        
        basicFunction.closureTest()
        
        var a = 3
        var b = 5
        
        basicFunction.swap(a: &a, b: &b)
        print("after swap a is \(a) and b is \(b)")
        
        let closure: Closure = Closure()
        
        var mathFunc = closure.getMathFunc("cube")
        print(mathFunc(2))
        mathFunc = closure.getMathFunc("square")
        print(mathFunc(5))
        mathFunc = closure.getMathFunc("other")
        print(mathFunc(5))
        
      
        print(closure.square(3))
        print(closure.cube)
        
        let trailingClosure: TrailingClosure = TrailingClosure()
        
        let result = trailingClosure.getMathFunc(7, fn: {(value: Int) -> Int in
            return value * value
        })
        
        print(result)
    }
    
    func basicClassAndStruct() {
        
        let classAndStruct = ClassAndStruct()
        classAndStruct.classTest()
        classAndStruct.structTest()
        classAndStruct.selectableTest()
        classAndStruct.inheritTest()
        classAndStruct.checkObjectType()
        classAndStruct.protocolTest()
    }
    
    func basicFoundation() {
        let basicFoundation = BasicFoundation()
        basicFoundation.testNSString()
        basicFoundation.testNSMutableString()
        basicFoundation.testNSDate()
        basicFoundation.testNSDateFormatter()
        basicFoundation.testNSCalendarAndNSDateComponents()
        basicFoundation.testNSArray()
        basicFoundation.testNSMutableArray()
        basicFoundation.testNSSet()
        basicFoundation.testNSMutableSet()
        basicFoundation.testNSDictionary()
        basicFoundation.testNSMutableDictionary()
    }
    
}
