import Foundation

// Task 1

class Pair<T> {
    var first: T
    var second: T
    
    init(first: T, second: T) {
        self.first = first
        self.second = second
    }

    func setFirst(_ value: T) {
        self.first = value
    }

    func setSecond(_ value: T) {
        self.second = value
    }
}

extension Pair {
    func key() -> T {
        return self.first;
    }

    func value() -> T {
        return self.second;
    }
}

print("Task 1 - Example")

let pairTask1 = Pair(first: "Hello", second: "World")
print(pairTask1.key())
print(pairTask1.value())

print()
pairTask1.setFirst("First")
pairTask1.setSecond("Second")

print(pairTask1.key())
print(pairTask1.value())
print()
print()


// Task 2

protocol IPair {
    associatedtype T

    func setFirst(_ value: T)
    func setSecond(_ value: T)
    func key() -> T
    func value() -> T
}

class NewPair<T>: IPair {
    var first: T
    var second: T

    init(first: T, second: T) {
        self.first = first
        self.second = second
    }

    func setFirst(_ value: T) {
        self.first = value
    }

    func setSecond(_ value: T) {
        self.second = value
    }
    
    func key() -> T {
        return self.first;
    }

    func value() -> T {
        return self.second;
    }
}

print("Task 2 - Example")

let pairTask2 = NewPair(first: "Abc", second: "Def")
print(pairTask2.key())
print(pairTask2.value())

print()
pairTask2.setFirst("First")
pairTask2.setSecond("Second")

print(pairTask1.key())
print(pairTask1.value())