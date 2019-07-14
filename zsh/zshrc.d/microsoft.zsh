export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ -d /opt/mssql-tools/bin ]; then
    export PATH="$PATH:/opt/mssql-tools/bin"
fi
