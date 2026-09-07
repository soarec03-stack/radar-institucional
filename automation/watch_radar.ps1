# ============================================
# RADAR INSTITUCIONAL
# Monitor automático do radar_input.txt
# ============================================

$ErrorActionPreference = "Stop"

Set-Location "$PSScriptRoot\.."

$arquivo = Join-Path (Get-Location) "input\radar_input.txt"

Write-Host ""
Write-Host "============================================"
Write-Host " MONITOR DO RADAR INSTITUCIONAL"
Write-Host "============================================"
Write-Host ""
Write-Host "Monitorando:"
Write-Host $arquivo
Write-Host ""
Write-Host "O script ficará aguardando alterações."
Write-Host "Pressione CTRL+C para encerrar."
Write-Host ""

$watcher = New-Object System.IO.FileSystemWatcher

$watcher.Path = Split-Path $arquivo
$watcher.Filter = "radar_input.txt"
$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite

$ultimaExecucao = [DateTime]::MinValue

Register-ObjectEvent `
    -InputObject $watcher `
    -EventName Changed `
    -Action {

        $agora = Get-Date

        if (($agora - $script:ultimaExecucao).TotalSeconds -lt 3) {
            return
        }

        $script:ultimaExecucao = $agora

        Write-Host ""
        Write-Host "============================================"
        Write-Host " ALTERAÇÃO DETECTADA"
        Write-Host "============================================"
        Write-Host ""

        Write-Host "Executando atualização do Radar..."
        Write-Host ""

        try {

            & "$PSScriptRoot\update_radar.ps1"

            if ($LASTEXITCODE -eq 0) {
                Write-Host ""
                Write-Host "Atualização concluída."
            }
            else {
                Write-Host ""
                Write-Host "ERRO: atualização não concluída." -ForegroundColor Red
            }

        }
        catch {
            Write-Host ""
            Write-Host "ERRO: $($_.Exception.Message)" -ForegroundColor Red
        }

        Write-Host ""
        Write-Host "Monitoramento continua ativo."
        Write-Host ""
    } | Out-Null

$watcher.EnableRaisingEvents = $true

while ($true) {
    Start-Sleep -Seconds 1
}