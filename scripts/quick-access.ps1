# Add folders to Explorer's "Quick access" section
mkdir C:\Users\user\syncthing
$o = new-object -com shell.application;
# Remove all pinned folders
# See: https://stackoverflow.com/questions/30051634/is-it-possible-programmatically-add-folders-to-the-windows-10-quick-access-panel
$($o.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | where { $_.IsFolder -eq "True" -and ($($_.Verbs() | Where-Object {$_.Name -in "Unpin from Quick access"}) -ne $null)}).InvokeVerb("unpinfromhome")
# Pin folders
$o.Namespace('C:\Users\user').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Users\user\syncthing').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Program Files (x86)\Steam').Self.InvokeVerb("pintohome");
$o.Namespace('C:\ProgramData\chocolatey').Self.InvokeVerb("pintohome");
