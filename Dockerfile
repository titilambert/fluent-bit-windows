# Use this base image for AKS
FROM mcr.microsoft.com/windows/servercore:ltsc2019
# Use this base image on your laptop
#FROM mcr.microsoft.com/windows/nanoserver:1803-amd64

RUN mkdir c:\fluentbit
RUN mkdir c:\download
# Install fluentbit
# https://github.com/fluent/fluent-bit/issues/960
RUN powershell -command Invoke-WebRequest -Uri https://ci.appveyor.com/api/buildjobs/9wmy57txbiub8upp/artifacts/build%2Ftd-agent-bit-1.4.0-win64.zip -OutFile c:\download\td-agent-bit-1.4.0-win64.zip
RUN mkdir c:\download\td-agent-bit
RUN powershell -command Expand-Archive c:\download\td-agent-bit-1.4.0-win64.zip -DestinationPath c:\download\td-agent-bit
RUN dir c:\download\td-agent-bit
RUN powershell -command cp c:\download\td-agent-bit\*\bin\fluent-bit.exe c:\fluentbit
RUN powershell -command cp c:\download\td-agent-bit\*\bin\fluent-bit.dll c:\fluentbit
# Install openssl
# https://indy.fulgan.com/SSL/
RUN powershell -command Invoke-WebRequest -Uri https://indy.fulgan.com/SSL/openssl-1.0.2t-x64_86-win64.zip -OutFile c:\download\openssl-1.0.2t-x64_86-win64.zip
RUN mkdir c:\download\openssl
RUN powershell -command Expand-Archive c:\download\openssl-1.0.2t-x64_86-win64.zip -DestinationPath c:\download\openssl
RUN powershell -command cp c:\download\openssl\libeay32.dll c:\fluentbit
RUN powershell -command cp c:\download\openssl\ssleay32.dll c:\fluentbit
# Install needed dlls
RUN powershell -command Invoke-WebRequest -Uri https://aka.ms/vs/16/release/vc_redist.x64.exe -OutFile c:\download\VC_redist.x64.exe
RUN C:\download\VC_redist.x64.exe /quiet /install

RUN rmdir /s /q c:\download

RUN dir c:\fluentbit
RUN c:\fluentbit\fluent-bit.exe -V

CMD "c:\fluentbit\fluent-bit.exe"
