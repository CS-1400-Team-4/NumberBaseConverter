Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Convert-NumberBase {
    param (
        [string]$InputValue,
        [string]$InputBase,
        [string]$OutputBase
    )

    try {
        # Convert input to decimal
        switch ($InputBase) {
            "Binary" { $decimal = [Convert]::ToInt64($InputValue, 2) }
            "Decimal" { $decimal = [int64]$InputValue }
            "Hexadecimal" { $decimal = [Convert]::ToInt64($InputValue, 16) }
        }

        # Convert decimal to desired output
        switch ($OutputBase) {
            "Binary" { return [Convert]::ToString($decimal, 2) }
            "Decimal" { return $decimal.ToString() }
            "Hexadecimal" { return "0x" + [Convert]::ToString($decimal, 16).ToUpper() }
        }
    }
    catch {
        return "Error: Invalid input or conversion"
    }
}

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Number Base Converter"
$form.Size = New-Object System.Drawing.Size(400,300)
$form.StartPosition = "CenterScreen"

# Input value
$inputLabel = New-Object System.Windows.Forms.Label
$inputLabel.Location = New-Object System.Drawing.Point(10,20)
$inputLabel.Size = New-Object System.Drawing.Size(280,20)
$inputLabel.Text = "Enter a number (binary, decimal, or hexadecimal):"
$form.Controls.Add($inputLabel)

$inputBox = New-Object System.Windows.Forms.TextBox
$inputBox.Location = New-Object System.Drawing.Point(10,40)
$inputBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($inputBox)

# Input base
$inputBaseLabel = New-Object System.Windows.Forms.Label
$inputBaseLabel.Location = New-Object System.Drawing.Point(10,70)
$inputBaseLabel.Size = New-Object System.Drawing.Size(280,20)
$inputBaseLabel.Text = "Select input base:"
$form.Controls.Add($inputBaseLabel)

$inputBaseComboBox = New-Object System.Windows.Forms.ComboBox
$inputBaseComboBox.Location = New-Object System.Drawing.Point(10,90)
$inputBaseComboBox.Size = New-Object System.Drawing.Size(260,20)
$inputBaseComboBox.Items.AddRange(@("Binary", "Decimal", "Hexadecimal"))
$form.Controls.Add($inputBaseComboBox)

# Output base
$outputBaseLabel = New-Object System.Windows.Forms.Label
$outputBaseLabel.Location = New-Object System.Drawing.Point(10,120)
$outputBaseLabel.Size = New-Object System.Drawing.Size(280,20)
$outputBaseLabel.Text = "Select output base:"
$form.Controls.Add($outputBaseLabel)

$outputBaseComboBox = New-Object System.Windows.Forms.ComboBox
$outputBaseComboBox.Location = New-Object System.Drawing.Point(10,140)
$outputBaseComboBox.Size = New-Object System.Drawing.Size(260,20)
$outputBaseComboBox.Items.AddRange(@("Binary", "Decimal", "Hexadecimal"))
$form.Controls.Add($outputBaseComboBox)

# Convert button
$convertButton = New-Object System.Windows.Forms.Button
$convertButton.Location = New-Object System.Drawing.Point(10,170)
$convertButton.Size = New-Object System.Drawing.Size(75,23)
$convertButton.Text = "Convert"
$form.Controls.Add($convertButton)

# Result
$resultLabel = New-Object System.Windows.Forms.Label
$resultLabel.Location = New-Object System.Drawing.Point(10,200)
$resultLabel.Size = New-Object System.Drawing.Size(280,20)
$resultLabel.Text = "Result:"
$form.Controls.Add($resultLabel)

$resultBox = New-Object System.Windows.Forms.TextBox
$resultBox.Location = New-Object System.Drawing.Point(10,220)
$resultBox.Size = New-Object System.Drawing.Size(260,20)
$resultBox.ReadOnly = $true
$form.Controls.Add($resultBox)

# Convert button click event
$convertButton.Add_Click({
    $result = Convert-NumberBase -InputValue $inputBox.Text -InputBase $inputBaseComboBox.SelectedItem -OutputBase $outputBaseComboBox.SelectedItem
    $resultBox.Text = $result
})

# Show the form
$form.ShowDialog()
