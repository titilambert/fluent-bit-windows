FROM mcr.microsoft.com/windows/nanoserver:1809-amd64

COPY bin .

RUN dir

CMD ["c:\fluentd-bit.exe"]
