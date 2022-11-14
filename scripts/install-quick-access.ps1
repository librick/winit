# Add folders to Explorer's "Quick access" section

# Create syncthing folder, ignore if it already exists
if (-not (test-path "C:\syncthing") ) {
    md 'C:\syncthing'|out-null
}

$o = new-object -com shell.application;
# Remove all pinned folders
# See: https://stackoverflow.com/questions/30051634/is-it-possible-programmatically-add-folders-to-the-windows-10-quick-access-panel
$($o.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | where { $_.IsFolder -eq "True" -and ($($_.Verbs() | Where-Object {$_.Name -in "Unpin from Quick access"}) -ne $null)}).InvokeVerb("unpinfromhome")
# Pin folders
$o.Namespace('~').Self.InvokeVerb("pintohome");
$o.Namespace('C:\ProgramData\chocolatey').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Tools\sysinternals').Self.InvokeVerb("pintohome");
$o.Namespace('C:\syncthing').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Program Files (x86)\Steam').Self.InvokeVerb("pintohome");
$o.Namespace('~\Documents').Self.InvokeVerb("pintohome");
$o.Namespace('~\Downloads').Self.InvokeVerb("pintohome");
$o.Namespace('~\Pictures').Self.InvokeVerb("pintohome");
$o.Namespace('~\Videos').Self.InvokeVerb("pintohome");
