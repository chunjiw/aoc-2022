use std::fs::File;
use std::io::{BufRead, BufReader};

fn main() {
    let file_path = "input.txt"; // Replace with the actual file path
    
    let mut s1 = 0;
    let mut s2 = 0;

    if let Ok(file) = File::open(file_path) {
        let reader = BufReader::new(file);

        for line in reader.lines() {
            if let Ok(line) = line {
                let numbers: Vec<&str> = line.split(',').collect();

                // Assuming each line contains exactly two parts separated by a comma
                if numbers.len() != 2 {
                    continue;
                }

                let part1: Vec<&str> = numbers[0].trim().split('-').collect();
                let part2: Vec<&str> = numbers[1].trim().split('-').collect();

                // Assuming each part contains exactly two numbers separated by a hyphen
                if part1.len() != 2 || part2.len() != 2 {
                    continue;
                }


                // Process the individual numbers as needed
                if let (Ok(number1), Ok(number2), Ok(number3), Ok(number4)) =
                    (part1[0].parse::<i32>(), part1[1].parse::<i32>(), part2[0].parse::<i32>(), part2[1].parse::<i32>())
                {
                    // Do something with the numbers
                    s1 += fullycontain(number1, number2, number3, number4);
                    s2 += overlap(number1, number2, number3, number4);
                }
            }
        }
    }
    println!("{} {}", s1, s2);
}

fn fullycontain(n1:i32, n2:i32, n3:i32, n4:i32) -> i32 {
    if (n1 <= n3 && n4 <= n2) || (n3 <= n1 && n2 <= n4) {
        1
    } else {
        0
    }
}

fn overlap(n1:i32, n2:i32, n3:i32, n4:i32) -> i32 {
    if n2 < n3 || n4 < n1 {
        0
    } else {
        1
    }
}
