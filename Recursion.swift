/*
  Recursion.swift
  
  By Zefeng Wang
  Created February 1, 2022
   
  The program reads the integers in input.txt and prints
  an hourglass pattern with asterisks to the console
*/

// Import the Foundation module 
import Foundation

// Recursively produces the hourglass pattern
func hourglass(asterisks: Int, spaces: Int) {
	print(format(asterisks: asterisks, spaces: spaces))
	if asterisks > 1 {
		hourglass(asterisks: asterisks - 1, spaces: spaces + 1)
		print(format(asterisks: asterisks, spaces: spaces))
	} else if asterisks == 1 {
		print(format(asterisks: asterisks, spaces: spaces))
	}
}

// Output the asterisks and spaces for each line
func format(asterisks: Int, spaces: Int) -> String {
	return String(repeating: " ", count: spaces)
		+ String(repeating: "* ", count: asterisks)
}

// Reads each line from input.txt
let contents = try String(contentsOfFile: "input.txt")
let numArr = contents.components(separatedBy: "\n").filter { $0 != "" }

// Casts numbers and calls the function to output the pattern with error checking
if numArr.count != 0 {
	for index in 0..<numArr.count {
		if let num = Int(numArr[index]) {
			if num < 1 {
				print("You entered \(num). Please enter an integer greater or equal to 1")
			} else {
				print("Number: \(num)")
				hourglass(asterisks: num, spaces: 0)
			}
		} else {
			print("You entered \(numArr[index]). Please enter an integer")
		}
	}
} else {
	print("Please enter at least one integer in input.txt")
}
