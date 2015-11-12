//  CartSpec.swift

import Quick
import Nimble
@testable import swift_shopping_cart

class CartSpec: QuickSpec {
    override func spec() {
        describe("Cart") {
            
            let 🍕 = Item(name: "🍕", priceInCents: 150)
            let 🌮 = Item(name: "🌮", priceInCents: 250)
            let 🌯 = Item(name: "🌯", priceInCents: 599)
            let 🍏 = Item(name: "🍏", priceInCents: 50)
            let 🍎 = Item(name: "🍎", priceInCents: 50)
            let 🍊 = Item(name: "🍊", priceInCents: 45)
            let 🍓 = Item(name: "🍓", priceInCents: 10)
            let 🧀 = Item(name: "🧀", priceInCents: 399)
            let 🍪 = Item(name: "🍪", priceInCents: 199)
            
            // duplicate items, equatable but not identical
            let 🍕2 = Item(name: "🍕", priceInCents: 150)
            let 🍏2 = Item(name: "🍏", priceInCents: 50)
            
            
            var emptyCart = Cart()
            var fullCart = Cart()
            var fruitCart = Cart()
            var appleCart = Cart()
            var junkFoodCart = Cart()
            
            beforeEach() {
                emptyCart = Cart()
                
                fullCart = Cart()
                fullCart.items = [🍕, 🌮, 🌯, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪]
                
                fruitCart = Cart()
                fruitCart.items = [🍏, 🍎, 🍊, 🍓]
                
                appleCart = Cart()
                appleCart.items = [🍏, 🍎, 🍏2, 🍏]
                
                junkFoodCart = Cart()
                junkFoodCart.items = [🍕, 🌮,🍕2, 🍕, 🌮, 🌯, 🍕, 🍕2, 🌯]
            }
            
            
            describe("calculateTotalPriceInCents()") {
                it("should return 0 for an empty cart") {
                    let result = emptyCart.calculateTotalPriceInCents()
                    
                    expect(result).to(equal(0))
                }
                
                it("should return 1752 for a full cart") {
                    let result = fullCart.calculateTotalPriceInCents()
                    
                    expect(result).to(equal(1752))
                }
                
                it("should return 155 for a fruit cart") {
                    let result = fruitCart.calculateTotalPriceInCents()
                    
                    expect(result).to(equal(155))
                }
            }
            
            describe("addItem(_:)") {
                it("should add pizza to an empty cart") {
                    emptyCart.addItem(🍕)
                    
                    expect(emptyCart.items).to(equal([🍕]))
                }
                
                it("should add another pizza to a full cart") {
                    fullCart.addItem(🍕)
                    let expected = [🍕, 🌮, 🌯, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪, 🍕]
                    
                    expect(fullCart.items).to(equal(expected))
                }
                
                it("should add cheese to a fruit cart") {
                    fruitCart.addItem(🧀)
                    let expected = [🍏, 🍎, 🍊, 🍓, 🧀]
                    
                    expect(fruitCart.items).to(equal(expected))
                }
            }
            
            describe("removeItem(_:)") {
                it("should remove burrito from a full cart") {
                    fullCart.removeItem(🌯)
                    let expected = [🍕, 🌮, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪]
                    
                    expect(fullCart.items).to(equal(expected))
                }
                
                it("should remove orange from a fruit cart") {
                    fruitCart.removeItem(🍊)
                    let expected = [🍏, 🍎, 🍓]
                    
                    expect(fruitCart.items).to(equal(expected))
                }
            }

            describe("removeAllItemsLikeItem(_:)") {
                it("should remove a green apple from a fruit cart") {
                    fruitCart.removeItem(🍏)
                    let expected = [🍎, 🍊, 🍓]
                    
                    expect(fruitCart.items).to(equal(expected))
                }
                
                it("should remove a pizza from a full cart") {
                    fullCart.removeItem(🍕)
                    let expected = [🌮, 🌯, 🍏, 🍎, 🍊, 🍓, 🧀, 🍪]
                    
                    expect(fullCart.items).to(equal(expected))
                }
                
                it("should remove the first greent apples from an apple cart") {
                    appleCart.removeItem(🍏)
                    let expected = [🍎, 🍏2, 🍏]
                    
                    expect(appleCart.items).to(equal(expected))
                }
                
                it("should remove the first pizza from a junk food cart") {
                    junkFoodCart.removeItem(🍕)
                    let expected = [🌮,🍕2, 🍕, 🌮, 🌯, 🍕, 🍕2, 🌯]
                    
                    expect(junkFoodCart.items).to(equal(expected))
                }
            }

            describe("allItemsWithName(_:)") {
                it("should return an empty array when no matches are found cart") {
                    let result = emptyCart.allItemsWithName("🌯")
                    let expected = [Item]()
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing cheese from a full cart") {
                    let result = fullCart.allItemsWithName("🧀")
                    let expected = [🧀]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containg all of the green apples from an apple cart") {
                    let result = appleCart.allItemsWithName("🍏")
                    let expected = [🍏, 🍏2, 🍏]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the pizza from a junk food cart") {
                    let result = junkFoodCart.allItemsWithName("🍕")
                    let expected = [🍕, 🍕2, 🍕, 🍕, 🍕2]
                    
                    expect(result).to(equal(expected))
                }
            }
            
            describe("allItemsWithMinimumPriceInCents(_:)") {
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 151") {
                    let result = fullCart.allItemsWithMinimumPriceInCents(151)
                    let expected = [🌮, 🌯, 🧀, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal 150") {
                    let result = fullCart.allItemsWithMinimumPriceInCents(150)
                    let expected = [🍕, 🌮, 🌯, 🧀, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 251") {
                    let result = fullCart.allItemsWithMinimumPriceInCents(251)
                    let expected = [🌯, 🧀]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents greater than or equal to 250") {
                    let result = fullCart.allItemsWithMinimumPriceInCents(250)
                    let expected = [🌮, 🌯, 🧀]
                    
                    expect(result).to(equal(expected))
                }
            }
            
            describe("allItemsWithMaximumPriceInCents(_:)") {
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 149") {
                    let result = fullCart.allItemsWithMaximumPriceInCents(149)
                    let expected = [🍏, 🍎, 🍊, 🍓]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 150") {
                    let result = fullCart.allItemsWithMaximumPriceInCents(150)
                    let expected = [🍕, 🍏, 🍎, 🍊, 🍓]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 249") {
                    let result = fullCart.allItemsWithMaximumPriceInCents(249)
                    let expected = [🍕, 🍏, 🍎, 🍊, 🍓, 🍪]
                    
                    expect(result).to(equal(expected))
                }
                
                it("should return an array containing all of the full cart's items that have a priceInCents less than or equal to 250") {
                    let result = fullCart.allItemsWithMaximumPriceInCents(250)
                    let expected = [🍕, 🌮, 🍏, 🍎, 🍊, 🍓, 🍪]
                    
                    expect(result).to(equal(expected))
                }
            }
        }
    }
}


