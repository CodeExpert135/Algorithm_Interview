//
//  ViewController.swift
//  Algorithm
//
//  Created by John Nik on 11/8/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleReduceFunction()
        
        handleClosure()
        
//        handleReverseList()
        
        handleFlattenArray()
        
//        handleAbstractTree()
        
        handlePalindrome()
        
        handleFilterMapReduce()
        
        handleSearch()
        
        handleTrack()
        
        handleFizzBuzz()
        
        handleBinarySearch()
        
        handleFactorial()
        
        handleMostCommonName()
        
        handleReverse()
        
        handelFibNumbers()
        
        handleHTML()
        
        handleOptionals()
        
        handleRetainCycle()
        
        handleRetainCycleCorrection()
        
        handleDisplayTime()
        
        handleTuple()
    }
    
    
    
    //MARK: reduce function
    //1 implement summation of an array of integers
    func sumation(for numbers: [Int]) -> Int {
        var sum = 0
        numbers.forEach({sum += $0})
        return sum
    }
    
    func handleReduceFunction() {
        //sum
        let sum = sumation(for: [1, 2, 3])
        print(sum)
        
        let reduceSum = [1, 2, 3].reduce(0) { (res, next) -> Int in
            return res + next
        }
        print(reduceSum)
        
        let bestSum = [1, 2, 3, 4].reduce(0, {$0 + $1})
        print(bestSum)
        
        //product
        let myProduct = productFunction(for: [1, 2, 3, 4])
        let product = [1, 2, 3, 4].reduce(1, {$0 * $1})
        print(myProduct, product)
        
        //transform
        let trueFacts = facts.reduce("", {$0 + $1 + " "})
        let fact = transformIntoSentence(for: facts)
        print(trueFacts, fact)
    }
    
    //2 implement the product of an array of integers
    func productFunction(for numbers: [Int]) -> Int {
        var product = 1
        numbers.forEach { (num) in
            product *= num
        }
        return product
    }
    
    //3. transform an array of strings into a sentence
    let facts = ["Brian", "is", "the", "greatest", "of", "all", "times"]
    
    func transformIntoSentence(for words: [String]) -> String {
        var initialResult = ""
//        words.forEach { (word) in
//            initialResult += word + " "
//        }
        words.forEach{ initialResult += $0 + " "}
        
        return initialResult
    }
    
    //MARK: handle closure
    func filterGreaterThanValue(_ value: Int, numbers: [Int]) -> [Int] {
        var filteredSetOfNumbers = [Int]()
        for num in numbers {
            if num > value {
                filteredSetOfNumbers.append(num)
            }
        }
        
        return filteredSetOfNumbers
    }
    
    func filterLessThanValue(_ value: Int, numbers: [Int]) -> [Int] {
        var filteredSetOfNumbers = [Int]()
        for num in numbers {
            if num < value {
                filteredSetOfNumbers.append(num)
            }
        }
        
        return filteredSetOfNumbers
    }
    
    func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
        var filterNumbers = [Int]()
        for num in numbers {
            //perform some condition check here
            if closure(num) {
                filterNumbers.append(num)
            }
        }
        return filterNumbers
    }
    
    func greaterThanThree(value: Int) -> Bool {
        return value > 3
    }
    
    func divisibleByFive(value: Int) -> Bool {
        return value % 5 == 0
    }
    
    func handleClosure() {
        
        let greaterList = filterGreaterThanValue(3, numbers: [1, 2, 3, 4, 5, 6, 3])
        let lessList = filterLessThanValue(3, numbers: [1, 2, 3, 4, 5, 6])
        
        let filteredList = filterWithPredicateClosure(closure: { (num) -> Bool in
            return num < 5
        }, numbers: [1, 2, 3, 4, 5, 6, 7])
        
        let anotherFilterList = filterWithPredicateClosure(closure: greaterThanThree, numbers: [1, 2, 3, 4, 5,])
        
        let divisibleFilterList = filterWithPredicateClosure(closure: divisibleByFive, numbers: [1, 2, 3, 4, 5, 6])
        print(greaterList, lessList, filteredList, anotherFilterList, divisibleFilterList)
        
        
        
    }
    
    
    //MARK: Reverse linked list
    /*
    let threeNode = Node(value: 3, next: nil)
    lazy var twoNode = Node(value: 2, next: threeNode)
    lazy var oneNode = Node(value: 1, next: twoNode)
    
    func printList(head: Node?) {
        var currentNode = head
        while currentNode != nil {
            print(currentNode?.value ?? -1)
            currentNode = currentNode?.next
        }
    }
    
    func reverseList(head: Node?) -> Node? {
        
        var currentNode = head
        var prev: Node?
        var next: Node?
        
        while currentNode != nil {
            next = currentNode?.next
            currentNode?.next = prev
            
            print("Prev: \(prev?.value ?? -1), Curr: \(currentNode?.value ?? -1), Next: \(next?.value ?? -1)")
            
            prev = currentNode
            currentNode = next
        }
        
        return prev
    }
    
    func handleReverseList() {
        // 1->2->3->nil
        printList(head: oneNode)
        
        //nil->3->2->1
        let myReverseList = reverseList(head: oneNode)
        printList(head: myReverseList)
    }
    */
    
    //MARK: Flatting nested array using recurision
    // [1] -> [1]
    // [1, 2, 3] -> [1, 2, 3]
    // [1, [2]] -> [1, 2]
    // [1, [2, 3]] -> [1, 2, 3]
    // [1, [2, [3,4]]] -> [1, 2, 3, 4]
    // [1, [2, [3, [4]]]] -> [1, 2, 3, 4]
    
    func flattenArray(nestedArray: [Any]) -> [Int] {
        // [1, [2, 3]] -> [1, 2, 3]
        /*
        var flattenArray = [Int]()

        for element in nestedArray {
            print(element)

            if element is Int {
                flattenArray.append(element as! Int)
            } else if element is [Int] {

                let nestedElements = element as! [Int]

                for num in nestedElements {
                    flattenArray.append(num)
                }
            }
        }
        */
        
        var flattenArray = [Int]()
        
        for element in nestedArray {
            print(element)
            
            if element is Int {
                flattenArray.append(element as! Int)
            } else if element is [Any] {
                
                let recurisionResult = self.flattenArray(nestedArray: element as! [Any])
                
                for num in recurisionResult {
                    flattenArray.append(num)
                }
            }
        }
        
        return flattenArray
    }
    
    func handleFlattenArray() {
        
        let result = flattenArray(nestedArray: [1, [2, [3, [4, [5]]]]])
        print("Result: ", result)
        
    }
    
    //MARK: abstract syntax tree
    // Example:
    // 5 + 25 * 6
    
    // Represent the equation above in a tree
    //          '+'
    //         /   \
    //       '*'   5
    //       /  \
    //      25   6
    
    /*
    let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
    let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
    let twentyFiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)
    lazy var multi25_6Node = Node(operation: "*", value: nil, leftChild: fiveNode, rightChild: twentyFiveNode)
    lazy var rootPlusNode = Node(operation: "+", value: nil, leftChild: fiveNode, rightChild: multi25_6Node)
    
    func evaluate(node: Node) -> Float {
        
        if node.value != nil {
            return node.value!
        }
        
        if node.operation == "+" {
            // apply recursion
            return self.evaluate(node: node.leftChild!) + self.evaluate(node: node.rightChild!)
        } else if node.operation == "*" {
            return self.evaluate(node: node.leftChild!) * self.evaluate(node: node.rightChild!)
        } else if node.operation == "-" {
            return self.evaluate(node: node.leftChild!) - self.evaluate(node: node.rightChild!)
        } else if node.operation == "/" {
            
            //if node right child is Zero, you need to throw an error
            
            return self.evaluate(node: node.leftChild!) / self.evaluate(node: node.rightChild!)
        }
        
        return 0
    }
    
    
    
    func handleAbstractTree() {
        
        let result = evaluate(node: rootPlusNode)
        print(result)
    }
    */
    
    //MARK: counting palindrome
    let palindrome = "madam anna kayak racecar anna civic"
    
    func allPalindromeCounts(sentence: String) -> [String: Int] {
        var counts = [String: Int]()
        
        let words = sentence.components(separatedBy: " ")
        words.forEach { (word) in
            
            if isPalindrome(word: word) {
                
                let count = counts[word] ?? 0
                counts[word] = count + 1
                print("Found palindrome: ", word)
            }
            
        }
        
        return counts
    }
    
    func isPalindrome(word: String) -> Bool {
        let characters = Array(word)
        var currentIndex = 0
        
        while currentIndex < characters.count / 2 {
            
            if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
                return false
            }
            
            currentIndex += 1
        }
        
        return true
    }
    
    func handlePalindrome() {
        let counts = self.allPalindromeCounts(sentence: palindrome)
        print(counts)
    }
    
    //MARK: filter, map, reduce
    let numbers = [1, 2, 3, 4, 3, 3]
    //1. filter into [3, 3, 3], then filter into [2, 4] (even nnumbers)
    
    func filteredArrayWith(numbers: [Int]) -> [Int] {
        var array = [Int]()
        for number in numbers {
            if number == 3 {
                array.append(number)
            }
        }
        return array
    }
    //2. transform [1, 2, 3, 4] -> [2, 4, 6, 8]
    func transformWith(numbers: [Int]) -> [Int] {
        
        var array = [Int]()
        for number in numbers {
            array.append(number * 2)
        }
        return array
    }
    
    //3. sum using reduce
    func sumWith(numbers: [Int]) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    func handleFilterMapReduce() {
        let filteredArr = self.filteredArrayWith(numbers: numbers)
        
        let filtered = numbers.filter({return $0 == 3})
        let filter = numbers.filter({return $0 % 2 == 0})
        print(filteredArr, filtered, filter)
        
        let transformedArr = self.transformWith(numbers: numbers)
        let transform = numbers.map({return $0 * 2})
        
        print(transformedArr, transform)
        
        let summed = self.sumWith(numbers: numbers)
        let sum = numbers.reduce(0, {sum, number in sum + number})
        print(summed, sum)
    }
    
    
    //MARK: Recursive search through binary tree
    //           10
    //          /  \
    //         5    14
    //        /     / \
    //       1     11  20
    
    // interviewer's question: Inmplement a search algorithm that searches through this tree for a particular serch values
    
    // left branch
    let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
    lazy var fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)
    
    // right branch
    let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
    let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
    lazy var fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)
    
    lazy var tenRootNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)
    
    func search(node: Node?, searchValue: Int) -> Bool {
        
        if node == nil {
            return false
        }
        /*
        if node?.value == searchValue {
            return true
        } else {
            //recursion
            return self.search(node: node?.leftChild, searchValue: searchValue) || self.search(node: node?.rightChild, searchValue: searchValue)
        }
        */
        
        // more efficiency
        if node?.value == searchValue {
            return true
        } else if searchValue < node!.value {
            return self.search(node: node?.leftChild, searchValue: searchValue)
        } else {
            //recursion
            return self.search(node: node?.rightChild, searchValue: searchValue)
        }
    }
    
    func handleSearch() {
        
        let searched = self.search(node: tenRootNode, searchValue: 5)
        print(searched)
        
        // let's talk about efficiecy
        let list = [1, 2, 3, 4, 5, 6]
        let index = list.index(where: {$0 == 7})
        print(index as Any)
    }
    
    
    //MARK: wrapping array
    //assume we have a list of tracks
    let tracks = ["a", "b", "c", "d", "e"]
    //algorithm should return this playlist if we select track "d"
    // ["d", "e", "a", "b", "c"]
    
    let selectedTrack = "d"
    
    
    func tracked(tracks: [String], selectedTrak: String) -> [String] {
        var playList = [String]()
        var priorTracks = [String]()
        
        for track in tracks {
            
            if track == selectedTrack || playList.count > 0 {
                playList.append(track)
            } else {
                priorTracks.append(track)
            }
            
        }
        
        return playList + priorTracks
    }
    
    func handleTrack() {
        let playList = self.tracked(tracks: tracks, selectedTrak: selectedTrack)
        print(playList)
        
        guard let index = tracks.index(where: {return $0 == selectedTrack}) else { return }
        let prefixArray = tracks.prefix(upTo: index)
        let suffixArray = tracks.suffix(from: index)
        print(suffixArray + prefixArray)
    }
    
    
    //MARK: fizzbuzz
    
    func fizzBuzzWithNumbers(_ numbers: [Int]) {
        
        for num in numbers {
            
            if num % 15 == 0 {
                print("\(num) fizzbuzz")
            } else if num % 3 == 0 {
                print("\(num) fizz")
            } else if num % 5 == 0 {
                print("\(num) buzz")
            } else {
                print(num)
            }
            
        }
        
    }
    
    func oneThousandNumbersWithNumber(_ number: Int) -> [Int] {
        
        var numbers = [Int]()
        for i in 0...number {
            numbers.append(i)
        }
        return numbers
    }
    
    func handleFizzBuzz() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        self.fizzBuzzWithNumbers(numbers)
        self.fizzBuzzWithNumbers(self.oneThousandNumbersWithNumber(10))
    }
    
    //MARK: binary search
    
    func linearSearchForSearchValue(_ searchValue: Int, numbers: [Int]) -> Bool {
    
        for number in numbers {
            
            if number == searchValue {
                return true
            }
            
        }
        
        return false
    }
    
    func binearySearchForSearchValue(_ searchValue: Int, numbers: [Int]) -> Bool {
        
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        
        while leftIndex <= rightIndex {
            
            let middleIndex = (leftIndex + rightIndex) / 2
            let middleValue = numbers[middleIndex]
            
            print("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex), leftValue: \(numbers[leftIndex]), rightValue: \(numbers[rightIndex] )")
            
            if middleValue == searchValue {
                return true
            }
            
            if searchValue < middleValue {
                rightIndex = middleValue - 1
            }
            
            if searchValue > middleValue {
                leftIndex = middleIndex + 1
            }
        }
        
        return false
    }
    
    
    func handleBinarySearch() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 16, 17, 20]
        let state = self.linearSearchForSearchValue(5, numbers: numbers)
        
        let binaryState = self.binearySearchForSearchValue(5, numbers: numbers)
        print(state, binaryState)
        
        let thousandnumbers = self.oneThousandNumbersWithNumber(100)
        let binary = self.binearySearchForSearchValue(99, numbers: thousandnumbers)
        print(binary)
    }
    
    
    //MARK: factorial recursion
    func factorialValue(_ value: UInt) -> UInt {
        
        if value == 0 {
            return 1
        }
        
        var product: UInt = 1
        
        for i in 1...value {
            product = product * i
        }
        
        return product
    }
    
    func recursiveFactorialOfValue(value: UInt) -> UInt {
        
        if value == 0 {
            return 1
        }
        
        return value * self.recursiveFactorialOfValue(value: value - 1)
    }
    
    func handleFactorial() {
        
        let factorial = self.factorialValue(10)
        let recursiveFactorial = self.recursiveFactorialOfValue(value: 10)
        print(factorial, recursiveFactorial)
    }
    
    //MARK: moste common name in array
    
    func mostCommonNameInArray(_ names: [String]) -> String {
        
        var nameCountDictionary = [String: Int]()
        
        for name in names {
            
            if let count = nameCountDictionary[name] {
                nameCountDictionary[name] = count + 1
            } else {
                nameCountDictionary[name] = 1
            }
            
        }
        
        var mostCommonName = ""
        
        for key in nameCountDictionary.keys {
            
            if mostCommonName == "" {
                mostCommonName = key
            }  else {
                if let count = nameCountDictionary[key], let commonNameCount = nameCountDictionary[mostCommonName] {
                    if count > commonNameCount {
                        mostCommonName = key
                    }
                }
            }
        }
        
        return mostCommonName
    }
    
    func handleMostCommonName() {
        
        let names = ["bob", "sally", "sam", "bob", "michel"]
        let name = mostCommonNameInArray(names)
        print(name)
        
    }
    
    //MARK: reverse every other words
    func reverseWordsInSentence(_ sentence: String) -> String {
        
        let allWords = sentence.components(separatedBy: " ")
        var newSentence = ""
        
        for index in 0...allWords.count - 1 {
            
            let word = allWords[index]
            
            if newSentence != "" {
                newSentence += " "
            }
            
            if index % 2 == 1 {
                let reversedWord = String(word.reversed())
                newSentence += reversedWord.stringByRemovingVowels()
            } else {
                newSentence += word.stringByRemovingVowels()
            }
            
            
        }
        
        return newSentence
    }
    
    func handleReverse() {
        let sampleSentence = "Leats start today by completing a very interesting challenge"
        
        let sentence = self.reverseWordsInSentence(sampleSentence)
        print(sentence)
    }
    
    
    //MARK: fibnacci sequence
    func setFibNumbers(numSteps: Int) -> [Int] {
        
        var sequence = [0, 1]
        
        if numSteps <= 1 {
            return sequence
        }
        
        for _ in 0...numSteps - 2 {
            
            let first = sequence[sequence.count - 2]
            let second = sequence.last!
            sequence.append(first + second)
            
        }
        
        return sequence
    }
    
    func setRecursionFibNumbers(numSteps: Int, first: Int, second: Int) -> [Int] {
        
        if numSteps == 0 {
            return []
        }
        
        return [first + second] + setRecursionFibNumbers(numSteps: numSteps - 1, first: second, second: first + second)
    }
    
    func handelFibNumbers() {
        let recursionFib = [2, 4] + setRecursionFibNumbers(numSteps: 9, first: 2, second: 4)
        let fib = setFibNumbers(numSteps: 10)
        
        print(fib, recursionFib)
    }
    
    
    //MARK: closure reference cycles
    
    func handleHTML() {
        let paragraph: HTMLElement? = HTMLElement(name: "p", text: "here is html sample")
        
        let html = paragraph?.asHTML()  //<p>here is html sample</p>
        print(paragraph!, "-", html!)
    }
    
    //MARK: why we use optionals
    func findGreatestValueInList(_ list: [Int]) -> Int? {
        
        if list.count == 0 {
            return nil
        }
        
        var greatestValue = -1
        for number in list {
            if number > greatestValue {
                greatestValue = number
            }
        }
        return greatestValue
    }
    
    func handleOptionals() {
        let greatestValue = findGreatestValueInList([1, 2, 3, 5, 7, 12])
        let greatest = [1, 2, 3, 5, 7, 12].max()
        
        print(greatestValue as Any, greatest as Any)
        
    }
    
    
    //MARK: Create Retain cycle
    func handleRetainCycle() {
        
//        var bob: Person? = Person(name: "Bob")
//
//        var apt: Apartment? = Apartment(number: 123)
//        apt?.tenant = bob
//
//        bob = nil
//        apt = nil
        
        var bob: Person? = Person(name: "Bob")
        
        let apt = Apartment(number: 123)
        apt.tenant = bob
        bob?.apartment = apt
        
        bob = nil
        
    }
    
    //MARK: retain cycle correction
    
    func handleRetainCycleCorrection() {
        
        var bob: Person? = Person(name: "Bob")
        
        var apt: Apartment? = Apartment(number: 123)
        apt?.tenant = bob
        
        bob = nil
        apt = nil
        
    }
    
    //MARK: display time in social media apps
    
    func handleDisplayTime() {
        
//        let now = Date()
        let pastDate = Date(timeIntervalSinceNow: -5)
        
        let dateStr = pastDate.timeAgoDisplay()
        print(dateStr as String)
    }
    
    //MARK: what are tuple and optionals
    func handleTuple() {
        let regularVariable = 1
        
        //tuple
        let person = ("Billy", "Bob", "Johnson")
        print(person.0, person.1, person.2)
        
        let p = (firstName: "Billy", middleName: "Bob", lastName: "Johnson")
        print(p.firstName, p.lastName)
        
        let result = divide(x: 7, y: 2)
        let resultTuple = divideUsingTuple(x: 7, y: 2)
        
        print(result, resultTuple.0, resultTuple.1)
        
        let topNames = topTwoLongestNames(["mike", "bob", "bill", "Steve", "Smantha"])
        print(topNames.0, topNames.1)
    }
    
    //will use tuple as a return value
    
    func multiply(x: Int, y: Int) -> Int {
        return x * y
    }
    
    func divide(x: Int, y: Int) -> Int {
        return x / y
    }
    
    func divideUsingTuple(x: Int, y: Int) -> (Int, Int) {
        let quotient = x / y
        let remainder = x % y
        return (quotient, remainder)
    }
    
    // lets try to use optionals inside of tuples somehow
    func topTwoLongestNames(_ names: [String]) -> (String?, String?) {
        
        if names.isEmpty {
            return (nil, nil)
        }
        
        let sortedList = names.sorted { (x, y) -> Bool in
            
            return x.count > y.count
        }
        print(sortedList)
        
        if sortedList.count == 1{
            return (sortedList[0], nil)
        }
        
        return (sortedList[0], sortedList[1])
    }
    
}


//MARK: classes

//MARK: Reverse linked list
/*
class Node {
    let value: Int
    var next: Node?

    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}
*/

//MARK: Abstract syntax tree
/*
class Node {
    var operation: String? // '+', '-', '*', '/'
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
 */

//MARK: Recursive search through binary tree
class Node {
    
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
}

//MARK: reverse every other words
extension String {
    
    func stringByRemovingVowels() -> String {
        
        var newWord = self
        
        for charactor in ["a", "e", "i"] {
            newWord = newWord.replacingOccurrences(of: charactor, with: "")
        }
        return newWord
    }
    
}

//MARK: closure reference cycles
class HTMLElement {
    
    var name: String
    var text: String
    
    lazy var asHTML: () -> String = { [weak self] in
        guard let this = self else { return "" }
        return "<\(this.name)>\(this.text)</\(this.name)>"
    }
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("call this when instance is nil")
    }
    
}

//MARK: Create Retain cycle
class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitializerd")
    }
}

class Apartment {
    let number: Int
    weak var tenant: Person?
    
    init(number: Int) {
        self.number = number
    }
    
    deinit {
        print("apartment \(number) is being deintializeed")
    }
}

//MARK: display time in social media apps
extension Date {
    
    func timeAgoDisplay() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        
        return "\(secondsAgo / week) weeks ago"
    }
    
}






































































