$hostFile = "C:\Windows\System32\drivers\etc\hosts";

$dateFormat = (Get-Date).ToString('dd-MM-yyyy hh-mm-ss');
$fileCopy = "$hostFile.$dateFormat.copy";
Copy-Item $hostFile -Destination $fileCopy;

$hosts = @(
    'my-website.com',
    'admin.my-website.com'
);

$file = Get-Content $hostFile;

$hostsToAdd = "`r`n";

foreach($hostFileEntry in $hosts)
{
    if(!$file.Contains(("127.0.0.1 `t $hostFileEntry")))
    {
        $hostsToAdd += "127.0.0.1 `t $hostFileEntry`r`n";        
        Write-Information "Adding Host $hostFileEntry";
    }
}

Add-Content -Path $hostFile -value $hostsToAdd;