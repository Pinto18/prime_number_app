//
//  ViewController.swift
//  Prime_Number
//
//  Created by Nicholas DiPinto on 11/10/16.
//  Copyright © 2016 Nicholas DiPinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var number: UITextField?  //variable to represent the editable text field in the view
    @IBOutlet var resultLabel: UILabel? //variable represents the label which will display the results of the calculation
    @IBOutlet var face: UIImageView?  //image view will display emoji faces to be associated with different outcomes
    
    @IBAction func buttonPressed(sender: AnyObject)  //function for when the button in the view is pressed
    {
        let numberInt = Int(number!.text!)  //casting the string entered by the user from text to an integer value
        if numberInt != nil    //conditional statement checks whether or not the number is a valid integer
        {
            let unwrappedNumber = numberInt!  //constant value to be used for convenience of not have to unwrap numberInt every time it is used
            var isPrime = true  //boolean variable that holds results of whether the number entered by the user is prime or not
            if unwrappedNumber == 1 || unwrappedNumber == 0 //1 is not considered a prime number, therefore there is a special case for if the usr enters 1
            {
                isPrime = false
            }
            else if unwrappedNumber != 2  //2 is a prime number so if the user enters 2, then by the isPrime variable will remain at its default value, which is true
            {
                var counter = 2 //varable will be used to verify if a number is prime or not
                while counter <= unwrappedNumber/2  //this while loops continues to iterate until counter is equal to unwrappedNumber / 2 because after that point the calculations are simply being repeated
                {
                    if unwrappedNumber % counter == 0  //conditional statement to see if the counter variable divides evenly into the unwrapped number
                    {
                        isPrime = false  //if the counter variable does divide evenly, then the unwrapped number is not prime
                    }
                    counter += 1  //incrementing the counter variable allows the while the program to eventually break from the while loop
                }
            }
            if isPrime  //this conditional block edits the results label to display the results of the calculations
            {
                resultLabel?.text =  "\(unwrappedNumber) is prime"
                face?.image = UIImage(named: "frowneyface")  //sets a frowney face to appear if the number is prime
            }
            else
            {
                resultLabel?.text =  "\(unwrappedNumber) is not prime"
                face?.image = UIImage(named: "smileyface") //sets a smiley face to appear if the number is not prime
            }
        }
        else  //condition if the user enters invalid text into the text field
        {
            resultLabel?.text = "ERROR: Please enter a number."
            face?.image = UIImage(named: "sterface")  //stern face appears to let the user know that they have performed an error
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

