# Add folders to Explorer's "Quick access" section
mkdir C:\Users\user\syncthing
$o = new-object -com shell.application;
$o.Namespace('C:\Users\user').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Users\user\syncthing').Self.InvokeVerb("pintohome");
$o.Namespace('C:\Program Files (x86)\Steam').Self.InvokeVerb("pintohome");
$o.Namespace('C:\ProgramData\chocolatey').Self.InvokeVerb("pintohome");
