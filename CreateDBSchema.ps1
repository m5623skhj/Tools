param
(
    [Parameter(Mandatory=$true)]
    [string]$ServerName,
    [Parameter(Mandatory=$true)]
    [string]$SchemaName,
    [Parameter(Mandatory=$true)]
    [string]$UserName,
    [Parameter(Mandatory=$true)]
    [string]$PWD
)

$connectionString = "server=$($ServerName);uid=$($UserName);pwd=$($PWD);"

$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connectionString)
$conn.ConnectionString = $connectionString

try 
{
    $conn.Open()
    
    $command = New-Object MySql.Data.MySqlClient.MySqlCommand
    $command.Connection = $conn
    $command.CommandText = "
        SELECT SCHEMA_NAME
        FROM INFORMATION_SCHEMA.SCHEMATA
        WHERE SCHEMA_NAME = '$($SchemaName)';
    "

    $commandResult = $command.ExecuteReader()
    if($commandResult.HasRows == $false)
    {
        Write-Output "Schema $($SchemaName) is already exists..."
        return;
    }

    $command.CommandText = "
        CREATE SCHEMA $($SchemaName)
        DEFAULT CHARACTER SET utf8;
    "

    $command.ExecuteNonQuery()
    Write-Output "Schema $($SchemaName) has been created"
}
catch 
{
    Write-Output "sql error occurred : $($_.Exception.Message)"
}
finally 
{
    $conn.Close()
}