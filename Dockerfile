FROM mcr.microsoft.com/windows/nanoserver:1903

COPY bin .

RUN dir

CMD ["c:\fluentd-bit.exe"]
