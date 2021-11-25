foreach ($file in Get-ChildItem -Recurse | ?{ $_.PSIsContainer } | % { $_.FullName })
{
	$fileCount = (Get-ChildItem $file* -Include *.* -Recurse -Force ).Count
	$filesize = Get-ChildItem -Path $file* -Recurse -Force | Measure-Object -Property Length -Sum
	Out-File "D:\test\Counts.txt" -InputObject $file -Append
	Out-File "D:\test\Counts.txt" -InputObject $fileCount  -Append
	Out-File "D:\test\Counts.txt" -InputObject $filesize.Sum -Append
	if ($fileCount -lt 3)
	{
		Rename-Item -Path $file -NewName small_1
	}
}