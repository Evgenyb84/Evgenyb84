$roots = @("D:\test\2","D:\test\2")

foreach($root in $roots){
    $groups = ls $root | where {$_.PSIsContainer -eq $false} | group extension
    foreach($group in $groups){
        $newPath = Join-Path $root ($group.Name.Substring(1,($group.Name.length - 1)))
        if( (Test-Path $newPath) -eq $false){
            md $newPath | Out-Null
        }
        $group.Group | Move-Item -Destination $newPath
    }
}