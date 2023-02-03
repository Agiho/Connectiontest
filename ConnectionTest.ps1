$computers = Get-Content "iplist.txt"
$online =@()
$offline =@()

Foreach ($computer in $computers) {  
      
    Write-Progress -Activity "Testing connection" -Status $computer -PercentComplete (($count / $computers.Count) * 100)  
  
    If (Test-Connection -ComputerName $computer -Quiet -Count 1 -ErrorAction SilentlyContinue) {  
        $online += $computer
    }  
    Else {  
        $offline += $computer 
    }  
      
    $count += 1  
  
}  

Write-Progress "Done" "Done" -completed
Write-Host "Online:"
Foreach ($CompOn in $online){
    Write-Host $CompOn
}
Write-Host " "
Write-Host "Offline:"
Foreach ($CompOf in $offline){
    Write-Host $CompOf
}

write-host " "
write-host "Press any key to continue..."
[void][System.Console]::ReadKey($true)