#FROM mcr.microsoft.com/windows/nanoserver:1803-amd64
#FROM mcr.microsoft.com/windows/servercore:1803-amd64
FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/windows/nanoserver
#FROM mcr.microsoft.com/windows/nanoserver:sac2016
#FROM stefanscherer/webserver-windows

COPY bin .
#COPY conf\\fluent-bit.conf .
RUN Invoke-WebRequest -Uri https://aka.ms/vs/16/release/vc_redist.x64.exe -OutFile VC_redist.x64.exe
#COPY VC_redist.x64.exe .
RUN C:\VC_redist.x64.exe /quiet /install
RUN del c:\VC_redist.x64.exe

RUN c:\fluent-bit.exe -V

CMD "c:\fluent-bit.exe"
