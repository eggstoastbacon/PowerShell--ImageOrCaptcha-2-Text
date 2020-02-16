#EGGSTOASTBACON :: https://github.com/eggstoastbacon
#Export-ImageText requires the PSImaging module: https://github.com/Positronic-IO/PSImaging
#Convert image text on your screen into a string, results may vary

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")

#Take a screenshot of a specific area
function screenshot([Drawing.Rectangle]$bounds, $path) {
    $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
    $graphics = [Drawing.Graphics]::FromImage($bmp)
    $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)
    $bmp.Save($path)
    $graphics.Dispose()
    $bmp.Dispose()
 }

 #Modify the area of the rectangle
 $bounds = [Drawing.Rectangle]::FromLTRB(800, 510, 1000, 590)
 screenshot $bounds $env:USERPROFILE\Pictures\captchapic01.jpg

$solved = Export-ImageText -Path $env:USERPROFILE\Pictures\captchapic01.jpg

#Determine if it's been solved based on length, adjust to the correct char amounts
if ($solved -notlike $null -and $solved.length -ge 6 -and $solved.length -lt 9){
    $solved
}
