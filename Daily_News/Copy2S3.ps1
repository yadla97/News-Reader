

$s3Bucket = "daily-data-news"
#$sourcePath = "C:\Daily_News\Images\News.png"
#$destinationPath = "Images/News.png"
$region = "us-east-1"
$ACL = ""

ipmo AWSPowerShell

#if ($ACL -ne ""){

    Write-S3Object -BucketName $s3Bucket -File "C:\Daily_News\Images\headlines.png" -Region $region -Key "Images/headlines.png" -CannedACLName $ACL   
    Write-S3Object -BucketName $s3Bucket -File "C:\Daily_News\Images\Sports.png"  -Region $region -Key "Images/sports.png" -CannedACLName $ACL 
    Write-S3Object -BucketName $s3Bucket -File "C:\Daily_News\Images\DailyNews.html"  -Region $region -Key  "Images/DailyNews.html" -CannedACLName $ACL
    Write-S3Object -BucketName $s3Bucket -File "C:\Daily_News\Images\uc_news.png"  -Region $region -Key  "Images/uc_news.png" -CannedACLName $ACL
    Write-S3Object -BucketName $s3Bucket -File "C:\Daily_News\Images\aws_blogs.png"  -Region $region -Key  "Images/aws_blogs.png" -CannedACLName $ACL
    
     
   # Write-S3Object -BucketName $s3Bucket -File $sourcePath -Region $region -Key $destinationPath -CannedACLName $ACL



#}else{

#   Write-S3Object -BucketName $s3Bucket -File $sourcePath -Region $region -Key $destinationPath
#}

exit
