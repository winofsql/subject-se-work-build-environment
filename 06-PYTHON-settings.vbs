Set objShellApplication = CreateObject("Shell.Application")
If WScript.Arguments.Count = 0 Then
    objShellApplication.ShellExecute "cscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " dummy", "", "runas", 1
	Wscript.Quit
End If

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

target0 = "c:\app2\Python"
target1 = "c:\app"
target2 = "c:\app2"

If not objFSO.FolderExists(target1) Then

	objFSO.CreateFolder(target1)

End If
If not objFSO.FolderExists(target2) Then

	objFSO.CreateFolder(target2)

End If

If not objFSO.DriveExists("G:") Then
	MsgBox("G �h���C�u������܂���BGoogle �h���C�u�����s���Ă�������")
	Wscript.Quit
End If

If not objFSO.FolderExists("G:\���L�h���C�u\SE-WORK-DOWNLOAD") Then
	MsgBox("SE-WORK-DOWNLOAD �t�H���_�����L�t�H���_�ɂ���܂���B�ΏۂƂȂ�A�J�E���g�Ń��O�C�����ĉ�����")
	Wscript.Quit
End If

SevenZipPath = objShell.RegRead("HKLM\SOFTWARE\7-Zip\Path") & "7z.exe"

If not objFSO.FolderExists(target0) Then

	Wscript.Echo "Python.zip �� copy ���Ă��܂��B���΂炭���҂���������"

	Set sourceFile = objFSO.GetFile("G:\���L�h���C�u\SE-WORK-DOWNLOAD\software\Python.zip")
	sourceFile.Copy target2 & "\Python.zip", True

	Wscript.Echo "Python.zip �� copy ���I�����܂���"

	Wscript.Echo "Python.zip �� �𓀂��Ă��܂��B���΂炭���҂���������"

	objShell.Run Chr(34) & SevenZipPath & Chr(34) & " x -o" & target0 & " " & target0 & ".zip", 0, True

	Wscript.Echo "Python.zip �� �𓀂��I�����܂���"

End If

MsgBox("Python �ݒ���I�����܂����B")