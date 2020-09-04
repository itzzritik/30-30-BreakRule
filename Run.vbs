Set WshShell = CreateObject("Wscript.shell")
WshShell.run "powershell.exe -ExecutionPolicy bypass -windowstyle hidden -file ./script/Run.ps1", 0