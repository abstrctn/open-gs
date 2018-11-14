on open location this_url
	set protocol to this_url
	set this_url to (characters 6 thru -1 of this_url)

	if protocol starts with "gs" then
		set console_url to "https://console.cloud.google.com/storage/browser/"
		if this_url ends with "/" or this_url does not contain "/" then
			set console_url to console_url & this_url
		else
			set directory to (do shell script ("echo " & this_url & " | sed 's/\\(.*\\)\\/.*/\\1/'"))
			set prefix to (do shell script ("echo " & this_url & " | sed 's/.*\\///'"))
			set console_url to console_url & directory & "?prefix=" & prefix
		end if
	end if

	if protocol starts with "s3" then
		set console_url to "https://console.aws.amazon.com/s3/buckets/"
		if this_url ends with "/" or this_url does not contain "/" then
			set console_url to console_url & this_url
		else
			set directory to (do shell script ("echo " & this_url & " | sed 's/\\(.*\\)\\/.*/\\1/'"))
			set prefix to (do shell script ("echo " & this_url & " | sed 's/.*\\///'"))
			set console_url to console_url & directory & "/?prefixSearch=" & prefix
		end if
	end if

	do shell script "bash -c \"open " & console_url & "\""
end open location
