[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [string]$Path
)

$ErrorActionPreference = 'Stop'
$resolvedPath = (Resolve-Path -LiteralPath $Path).Path

try {
    [xml]$document = Get-Content -LiteralPath $resolvedPath -Raw -Encoding UTF8
} catch {
    throw "Não foi possível interpretar o arquivo como XML: $($_.Exception.Message)"
}

if (-not $document.Sysmon) {
    throw 'Elemento raiz <Sysmon> não encontrado.'
}

$globalEntries = @($document.Sysmon.ChildNodes | Where-Object {
    $_.NodeType -eq 'Element' -and $_.Name -ne 'EventFiltering'
} | ForEach-Object {
    [ordered]@{ Name = $_.Name; Value = $_.InnerText.Trim() }
})

$filters = @($document.Sysmon.EventFiltering.SelectNodes('.//*[@onmatch]') | ForEach-Object {
    $ruleGroup = $_.ParentNode
    while ($ruleGroup -and $ruleGroup.Name -ne 'RuleGroup' -and $ruleGroup.Name -ne 'EventFiltering') {
        $ruleGroup = $ruleGroup.ParentNode
    }

    [ordered]@{
        EventType = $_.Name
        OnMatch = $_.GetAttribute('onmatch')
        RuleCount = @($_.ChildNodes | Where-Object NodeType -eq 'Element').Count
        GroupName = if ($ruleGroup.Name -eq 'RuleGroup') { $ruleGroup.GetAttribute('name') } else { $null }
        GroupRelation = if ($ruleGroup.Name -eq 'RuleGroup') { $ruleGroup.GetAttribute('groupRelation') } else { $null }
    }
})

$result = [ordered]@{
    Path = $resolvedPath
    SchemaVersion = [string]$document.Sysmon.schemaversion
    GlobalEntries = $globalEntries
    FilterCount = $filters.Count
    EventTypes = @($filters.EventType | Sort-Object -Unique)
    Filters = $filters
}

[pscustomobject]$result | ConvertTo-Json -Depth 6
