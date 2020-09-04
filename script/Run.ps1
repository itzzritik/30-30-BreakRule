$appName = "30-30-BreakRule\index.js"
$list = forever list
$isAppRunning = $false
$state = $null

foreach ($item in $list) {
	if($item.IndexOf($appName) -ne -1) {
		$isAppRunning = $true
		break
	}
}

if($isAppRunning) {
	forever stop index.js | Out-Null
	$state = "Service stopped"
}
else {
	forever start index.js | Out-Null
	$state = "Service started"
}

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

$template = @"
<toast>
    <visual>
        <binding template="ToastText02">
            <text id="1">30-30-BreakRule</text>
            <text id="2">$state</text>
        </binding>
    </visual>
	<audio src="ms-winsoundevent:Notification.Default"/>
</toast>
"@

$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template)
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("30-30-BreakRule").Show($toast)