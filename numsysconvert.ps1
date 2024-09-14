function Convert-Number {
    param (
        [string]$inputValue,
        [string]$fromBase,
        [string]$toBase
    )
    
    switch ($fromBase) {
        "decimal" { $number = [int]$inputValue }
        "binary" { $number = [Convert]::ToInt32($inputValue, 2) }
        "hexadecimal" { $number = [Convert]::ToInt32($inputValue, 16) }
    }
    
    switch ($toBase) {
        "decimal" { return $number.ToString() }
        "binary" { return [Convert]::ToString($number, 2) }
        "hexadecimal" { return "0x" + [Convert]::ToString($number, 16).ToUpper() }
    }
}

function Perform-Calculation {
    param (
        [int]$num1,
        [int]$num2,
        [string]$operation
    )
    
    switch ($operation) {
        "add" { return $num1 + $num2 }
        "subtract" { return $num1 - $num2 }
        "multiply" { return $num1 * $num2 }
        "divide" { 
            if ($num2 -eq 0) {
                return "Error: Division by zero"
            }
            return $num1 / $num2 
        }
    }
}

# Main program
do {
    $inputValue = Read-Host "Enter a decimal, binary, or hexadecimal value"
    $inputBase = Read-Host "Enter the base of the input value (decimal, binary, or hexadecimal)"

    $action = Read-Host "Do you want to convert or calculate? (convert/calculate)"

    if ($action -eq "convert") {
        $toBase = Read-Host "Enter the base to convert to (decimal, binary, or hexadecimal)"
        $result = Convert-Number -inputValue $inputValue -fromBase $inputBase -toBase $toBase
        Write-Host "Result: $result"
    }
    elseif ($action -eq "calculate") {
        $operation = Read-Host "Enter the operation (add, subtract, multiply, divide)"
        $secondValue = Read-Host "Enter the second value (in decimal)"
        
        $num1 = Convert-Number -inputValue $inputValue -fromBase $inputBase -toBase "decimal"
        $result = Perform-Calculation -num1 ([int]$num1) -num2 ([int]$secondValue) -operation $operation
        Write-Host "Result: $result"
    }
    else {
        Write-Host "Invalid action. Please choose 'convert' or 'calculate'."
    }

    $continue = Read-Host "Do you want to perform another operation? (yes/no)"
} while ($continue -eq "yes")
