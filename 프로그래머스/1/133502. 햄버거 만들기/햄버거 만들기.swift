import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var result = 0
    var expected = 1
    var ingredientStack: [Int] = []
    var canMakeBugerStack: [Bool] = []
    
    for n in ingredient {
        if n == expected {
            if n == 1 {
                if let canMake = canMakeBugerStack.last,
                let lastIngredient = ingredientStack.last,
                canMake == true, lastIngredient == 3 {
                    for _ in 0..<3 {
                        _ = canMakeBugerStack.popLast()!
                        _ = ingredientStack.popLast()!
                    }
                    result += 1
                    if let newCanMake = canMakeBugerStack.last,
                    let newLastIngredient = ingredientStack.last {
                        expected = newCanMake ? newLastIngredient + 1 : 1
                    } else {
                        expected = 1
                    }
                    continue
                }
            }
            
            ingredientStack.append(n)
            canMakeBugerStack.append(true)
            if n == 1 || n == 2 { expected = n+1 } 
            else { expected = 1 }
        } else {
            ingredientStack.append(n)
            if n == 1 {
                canMakeBugerStack.append(true)
                expected = 2
            } else {
                canMakeBugerStack.append(false)
                expected = 1
            }
        }
    }
    
    return result
}