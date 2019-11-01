$ErrorActionPreference = 'Stop';

$auth =[System.Text.Encoding]::UTF8.GetBytes("$($env:DOCKER_USER):$($env:DOCKER_PASS)")
$auth64 = [Convert]::ToBase64String($auth)
@"
{
  "auths": {
    "https://index.docker.io/v1/": {
      "auth": "$auth64"
    }
  }
}
"@ | Out-File -Encoding Ascii ~/.docker/config.json
