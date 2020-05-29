# Download the latest cspect and associated tools

# Tidy up
Remove-Item $PSScriptRoot\*.zip 

Write-Host "Download and expand the CSpect image from ZXSpectrumNEXT" -ForegroundColor Green
curl -o $PSScriptRoot\CSpect2_12_29.zip http://www.javalemmings.com/public/zxnext/CSpect2_12_29.zip
Expand-Archive -force $PSScriptRoot\CSpect2_12_29.zip $PSScriptRoot

Write-Host "Download the Opena file and expand it" -ForegroundColor Green
curl -o $PSScriptRoot\openal.dll http://www.zxspectrumnext.online/cspect/openal.zip
curl -o $PSScriptRoot\oalinst.zip http://www.zxspectrumnext.online/cspect/oalinst.zip
Expand-Archive -force $PSScriptRoot\oalinst.zip $PSScriptRoot

Write-Host "Download the sjasmplus assembler and expand it" -ForegroundColor Green
curl -L -o $PSScriptRoot\sjasmplus-1.14.5.win.zip https://github.com/z00m128/sjasmplus/releases/download/v1.14.5/sjasmplus-1.14.5.win.zip
Expand-Archive -force $PSScriptRoot\sjasmplus-1.14.5.win.zip $PSScriptRoot
Move-Item -force $PSScriptRoot\sjasmplus-1.14.5.win\sjasmplus.exe $PSScriptRoot\sjasmplus.exe
Remove-Item -r $PSScriptRoot\sjasmplus-1.14.5.win\

Write-Host "Download the SD Card tool HDFMonkey assembler and expand it" -ForegroundColor Green
curl -o $PSScriptRoot\hdfmonkey_windows.zip http://uto.speccy.org/downloads/hdfmonkey_windows.zip
Expand-Archive -force $PSScriptRoot\hdfmonkey_windows.zip $PSScriptRoot

Write-Host "Download Dezog plugins" -ForegroundColor Green
curl -o $PSScriptRoot\DeZogPlugin.dll https://github.com/maziac/DeZogPlugin/releases/download/v1.0.0/DeZogPlugin.dll
curl -o $PSScriptRoot\DeZogPlugin.dll.config https://github.com/maziac/DeZogPlugin/releases/download/v1.0.0/DeZogPlugin.dll.config

# Tidy up
Remove-Item $PSScriptRoot\*.zip 
