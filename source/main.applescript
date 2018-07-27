on open location this_url
	set console_url to "https://console.cloud.google.com/storage/browser/"
	set this_url to (characters 6 thru -1 of this_url)
	
	if this_url ends with "/" or this_url does not contain "/" then
		set console_url to console_url & this_url
	else
		set directory to (do shell script ("echo " & this_url & " | sed 's/\\(.*\\)\\/.*/\\1/'"))
		set prefix to (do shell script ("echo " & this_url & " | sed 's/.*\\///'"))
		set console_url to console_url & directory & "?prefix=" & prefix
	end if
	
	do shell script "bash -c \"open " & console_url & "\""
end open location
