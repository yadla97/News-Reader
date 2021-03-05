function Send-Report {


	param (
		[Parameter(Mandatory=$true)][ValidateSet("1","2","3","4","5",ignorecase=$true)] [String]   $Report ,
		[Parameter(Mandatory=$false)][ValidateNotNullOrEmpty()][switch]$test = $false
	)

	# The line below will Import-Module Selenium if it fails it will display the installation command and stop the script. 
	Import-Module  Selenium
	#$dtcode = get-date -format "yyyyMMddHHmm"
	$IMGPath = "C:\Daily_News\Images\"  
	$smtpServer = "smtp.gmail.com"
	$dt = get-date -format "dddd yyyy-MM-dd HH:mm"
	
	
	
	switch ($Report) {
		"1" {
			$caption = "AWS_blogs"
			$ImageName = "aws_blogs"
			$guid = [guid]::NewGuid()
			$Source = "https://aws.amazon.com/blogs/aws/" 
			$ImageFile = $IMGPath + $ImageName + ".png"
			$Link = "$ImageName.png"
			$WindowSize = 'window-size=1900,1500'
		}

        "2" {
			$caption = "Sports"
			$ImageName = "Sports"
			$guid = [guid]::NewGuid()
			$Source = "https://www.deccanchronicle.com/sports" 
			$ImageFile = $IMGPath + $ImageName + ".png"
			$Link = "$ImageName.png"
			$WindowSize = 'window-size=1900,1500'
		}

        "3" {
			$caption = "headlines"
			$ImageName = "headlines"
			$guid = [guid]::NewGuid()
			$Source = "https://www.cnn.com" 
			$ImageFile = $IMGPath + $ImageName + ".png"
			$Link = "$ImageName.png"
			$WindowSize = 'window-size=1900,1500'
		}
		"4" {
			$caption = "uc_news"
			$ImageName = "uc_news"
			$guid = [guid]::NewGuid()
			$Source = "https://www.uc.edu/news.html" 
			$ImageFile = $IMGPath + $ImageName + ".png"
			$Link = "$ImageName.png"
			$WindowSize = 'window-size=1900,1500'
		}
		
		
	}

	# Start the Selenium Chrome Driver
	try{ 
       #$WindowSize = 'window-size=920,1050' 
       write-host $WindowSize
		$Driver = Start-SeChrome -Arguments @($WindowSize) -Headless -Quiet 
		#$Driver = Start-SeChrome  -Headless -Quiet 
	} catch{ 
		Write-Host 'The selenium driver was not running.' -ForegroundColor Red 
		break
	}


	# Next we will check if the driver is running and if it's not running we will show a message. If the driver is running we will run the commands inside the if statment.
	if($Driver){
        write-host "Shuttting down  Driver"
		
	# Now that we verified that the driver is running we can start doing cool things with it.

		###### URL1 ######
		Enter-SeUrl -Driver $Driver -Url $Source
		Start-sleep 5


		$f = $driver.GetScreenshot()
		$f.SaveAsFile($ImageFile) 
		Start-sleep 1
		######

		# Once we are done with the web driver and we finished with all our testing/automation we can release the driver by running the Stop-SeDriver command.
		Stop-SeDriver -Driver $Driver
		Start-sleep 1
	}




}	
