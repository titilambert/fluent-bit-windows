#FROM mcr.microsoft.com/windows/nanoserver:1809-amd64
FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY bin .

RUN dir

CMD ["c:\fluentd-bit.exe"]
