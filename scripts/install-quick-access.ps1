# Add folders to Explorer's "Quick access" section
$chocolatey = "C:\ProgramData\chocolatey"
$sysinternals = "C:\Tools\sysinternals"
$syncthing = "C:\syncthing"
$steam = "C:\Program Files (x86)\Steam"

# Create folders, skipping if they already exist
if (-not (test-path $chocolatey)) { md $chocolatey|out-null; }
if (-not (test-path $sysinternals)) { md $sysinternals |out-null; }
if (-not (test-path $syncthing)) { md $syncthing|out-null; }
if (-not (test-path $steam)) { md $steam|out-null; }

$o = new-object -com shell.application;
# Remove all pinned folders
# See: https://stackoverflow.com/questions/30051634/is-it-possible-programmatically-add-folders-to-the-windows-10-quick-access-panel
# Folders will appear in the order as they are called below
$($o.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | where { $_.IsFolder -eq "True" -and ($($_.Verbs() | Where-Object {$_.Name -in "Unpin from Quick access"}) -ne $null)}).InvokeVerb("unpinfromhome")
# Pin folders
$o.Namespace("${home}").Self.InvokeVerb("pintohome");
$o.Namespace($chocolatey).Self.InvokeVerb("pintohome");
$o.Namespace($sysinternals).Self.InvokeVerb("pintohome");
$o.Namespace($syncthing).Self.InvokeVerb("pintohome");
$o.Namespace("${home}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup").Self.InvokeVerb("pintohome");
$o.Namespace($steam).Self.InvokeVerb("pintohome");
$o.Namespace("${home}\Documents").Self.InvokeVerb("pintohome");
$o.Namespace("${home}\Downloads").Self.InvokeVerb("pintohome");
$o.Namespace("${home}\Pictures").Self.InvokeVerb("pintohome");
$o.Namespace("${home}\Videos").Self.InvokeVerb("pintohome");
