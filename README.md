# _Setup_

Este repositório contém instruções e recursos para configuração do Windows 11, Debian e outros _softwares_.

> Esta configuração é personalizada de acordo com minhas preferências e necessidades.
>
> O uso do Windows 11 como sistema operacional é um requisito do meu atual trabalho profissional.
>
> Prefiro instalar e configurar esses _softwares_ de forma manual e imperativa para controle e aprendizado.

Os comandos deste documento foram escritos para serem executados com o [PowerShell](https://learn.microsoft.com/en-us/powershell/).

## Conteúdos

- [Conteúdos](#conteúdos)
- [_Softwares_](#softwares)
- [`winget`](#winget)
- [`wsl`](#wsl)
- [Repositório](#repositório)
  - [_Resources_](#resources)
  - [_Scritps_](#scritps)
- [Debian](#debian)
  - [`apt`](#apt)
  - [`brew`](#brew)
- [`chrome`](#chrome)
- [Manutenção dos _softwares_](#manutenção-dos-softwares)
  - [`winget`](#winget-1)
  - [`wsl`](#wsl-1)
  - [`apt`](#apt-1)
  - [`brew`](#brew-1)
- [Atualizações do Windows](#atualizações-do-windows)

## _Softwares_

Os principais _softwares_ instalados com as instruções deste repositório são:

- [`7z`](https://7-zip.org)
- [`bat`](https://github.com/sharkdp/bat)
- [`brew`](https://github.com/Homebrew/brew)
- [`carapace`](https://github.com/carapace-sh/carapace)
- [`chrome`](https://www.google.com/chrome)
- [`code`](https://code.visualstudio.com)
- [`docker`](https://docs.docker.com/engine)
- [`gcloud`](https://cloud.google.com/sdk/docs/install)
- [`gh`](https://github.com/cli/cli)
- [`git`](https://git-scm.com)
- [`nushell`](https://github.com/nushell/nushell)
- [`pwsh`](https://learn.microsoft.com/en-us/powershell)
- [`screenbox`](https://github.com/huynhsontung/Screenbox)
- [`starship`](https://github.com/starship/starship)
- [`terminal`](https://github.com/microsoft/terminal)
- [`uv`](https://github.com/astral-sh/uv)
- [`winget`](https://github.com/microsoft/winget-cli)
- [`wsl`](https://learn.microsoft.com/en-us/windows/wsl)
- [`yaak`](https://github.com/mountain-loop/yaak)

## `winget`

Certifique-se de que o `winget` está instalado.

Caso necessário, baixe e instale o `winget` manualmente na [Microsoft Store](https://apps.microsoft.com/detail/9NBLGGH4NNS1).

```powershell
winget --version
```

Inicie o PowerShell como administrador e instale os _softwares_ especificados abaixo.

> Os comandos abaixo foram escritos como estão para que seja possível executá-los individualmente.

```powershell
winget install --source "winget" --scope "machine" --id "7zip.7zip"
winget install --source "winget" --scope "machine" --id "Git.Git" --override '/VERYSILENT /NODESKTOPICON /NOEXPLORER /COMPONENTS="icons,gitlfs" /NOASSOC /NOSCALAR /PATH'
winget install --source "winget" --scope "machine" --id "GitHub.cli"
winget install --source "winget" --scope "machine" --id "Google.Chrome"
winget install --source "winget" --scope "machine" --id "Microsoft.PowerShell"
winget install --source "winget" --scope "machine" --id "Microsoft.VisualStudioCode" --override '/VERYSILENT /MERGETASKS="!runcode,!desktopicon,addcontextmenufiles,addcontextmenufolders,associatefiles,path"'
winget install --source "winget" --scope "machine" --id "Starship.Starship"
```

> Os _softwares_ especificados abaixo são utilizados apenas em meu trabalho profissional.

```powershell
winget install --source "winget" --scope "machine" --id "Microsoft.OneDrive"
winget install --source "winget" --scope "machine" --id "Microsoft.PowerBI"
winget install --source "winget" --scope "user" --id "Microsoft.Teams"
```

Inicie o PowerShell sem permissões de administrador e instale os _softwares_ especificados abaixo.

```powershell
winget install --source "winget" --id "Microsoft.WindowsTerminal"
winget install --source "winget" --id "Starpine.Screenbox"
winget install --source "winget" --id "Yaak.app"
```

## `wsl`

Instale o `wsl`.

```powershell
wsl --install --no-distribution
```

Instale a distribuição Debian no `wsl`.

```powershell
wsl --install "Debian"
```

Configure a distribuição Debian como padrão do `wsl`.

```powershell
wsl --set-default "Debian"
```

## Repositório

Configure o `gh` para autenticação com o GitHub.

```powershell
gh auth login --git-protocol="https" --hostname="github.com" --web
```

Clone esse repositório.

> Eu utilizo o diretório `$Env:USERPROFILE/shards/` para salvar repositórios no Windows 11.

```powershell
New-Item -Path "$Env:USERPROFILE" -Name "shards" -ItemType "Directory" -Force

git clone "https://github.com/pedrocrvs/setup.git" $PathRepository "$Env:USERPROFILE/shards/setup"

Set-Location "$Env:USERPROFILE/shards/setup"; git lfs pull
```

### _Resources_

O diretório [`resources/`](resources/) contém arquivos de configuração dos [_softwares_](#softwares).

Por exemplo, o arquivo [`.gitconfig`](resources/git/.gitconfig) para o `git`.

### _Scritps_

O diretório [`scripts/`](scripts/) contém _scripts_ que configuram os _softwares_.

Alguns desses _scripts_ criam _symbolic links_ nos locais esperados pelos _softwares_, apontando para os arquivos em [`resources/`](resources/).

Inicie o PowerShell como administrador e execute o comando abaixo para ativar o _developer mode_ no Windows 11.

O _developer mode_ é necessário para permitir a criação de _symbolic links_ sem permissões de administrador.

```powershell
New-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" `
    -Name "AllowDevelopmentWithoutDevLicense" `
    -Value 1 `
    -PropertyType DWORD `
    -Force
```

O comando abaixo é um exemplo de como executar um dos _scripts_ individualmente.

```powershell
& ".\scripts\windows\configure-git.ps1"
```

## Debian

Os comandos desta seção foram escritos para serem executados com o [Bash](https://manpages.debian.org/stretch/bash/bash.1.en.html) na distribuição Debian no `wsl`.

### `apt`

Utilizando o [`apt`](https://manpages.debian.org/stretch/apt/apt.8.en.html), sincronize os índices de pacotes e instale as atualizações disponíveis.

```bash
sudo apt update && sudo apt upgrade --assume-yes
```

Instale os pacotes especificados abaixo.

```bash
sudo apt install --assume-yes \
  "apt-transport-https" \
  "bat" \
  "build-essential" \
  "ca-certificates" \
  "curl" \
  "file" \
  "git-lfs" \
  "git" \
  "gnupg" \
  "procps" \
  "unzip" \
  "wget" \
  "zip"
```

Crie o diretório `/etc/apt/keyrings/` com as permissões `0755`, para armazenar chaves GPG.

```bash
sudo install --mode="0755" --directory "/etc/apt/keyrings/"
```

Baixe e converta as chaves GPG especificadas abaixo, salvando-as no diretório `/etc/apt/keyrings/`.

```bash
sudo curl --fail "https://download.docker.com/linux/debian/gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/docker.gpg"
sudo curl --fail "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/gcloud.gpg"
sudo curl --fail "https://cli.github.com/packages/githubcli-archive-keyring.gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/gh.gpg"
sudo curl --fail "https://apt.fury.io/nushell/gpg.key" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/nushell.gpg"
```

Adicione os repositórios especificados abaixo como fontes de pacotes para o `apt`.

Em seguida, com as novas fontes, sincronize os índices de pacotes.

```bash
echo "deb [signed-by=/etc/apt/keyrings/docker.gpg arch=amd64] https://download.docker.com/linux/debian bookworm stable" | sudo tee "/etc/apt/sources.list.d/docker.list" > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/gcloud.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee "/etc/apt/sources.list.d/google-cloud-sdk.list" > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/gh.gpg arch=amd64] https://cli.github.com/packages stable main" | sudo tee "/etc/apt/sources.list.d/github-cli.list" > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/nushell.gpg] https://apt.fury.io/nushell/ /" | sudo tee "/etc/apt/sources.list.d/nushell.list" > /dev/null

sudo apt update
```

Instale os pacotes especificados abaixo.

```bash
sudo apt install --assume-yes "docker-ce" "docker-ce-cli" "containerd.io" "docker-buildx-plugin" "docker-compose-plugin"
sudo apt install --assume-yes "google-cloud-cli"
sudo apt install --assume-yes "gh"
sudo apt install --assume-yes "nushell"
```

Adiciona o usuário referenciado pela variável `$USER` ao grupo `"docker"`.

```bash
sudo usermod --append --groups "docker" "$USER"
```

### `brew`

Baixe e execute o _script_ de instalação do Homebrew.

```bash
bash -c "$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Instale os pacotes especificados abaixo.

```bash
/home/linuxbrew/.linuxbrew/bin/brew install --formula "carapace" "gcc" "starship" "uv"
```

## `chrome`

A configuração do Google Chrome deve ser feita manualmente. Para isso, acesse `chrome://flags`.

Desabilite as _flags_ especificadas abaixo.

- `#autofill-enable-save-and-fill`
- `#autofill-improved-labels`
- `#enable-autofill-credit-card-upload`
- `#fluent-overlay-scrollbars`
- `#fluent-scrollbars`
- `#overlay-scrollbars`
- `#pwm-show-suggestions-on-autofocus`
- `#show-autofill-type-predictions`

Habilite as _flags_ especificadas abaixo.

- `#enable-gpu-rasterization`
- `#enable-parallel-downloading`
- `#enable-zero-copy`
- `#smooth-scrolling`

## Manutenção dos _softwares_

### `winget`

Execute `winget list` para listar os _softwares_ instalados.

Utilize a _flag_ `--upgrade-available` para listar apenas os _softwares_ que possuam atualizações disponíveis.

```powershell
winget list --source "winget" --scope "machine"
```

Utilize a _flag_ `--upgrade-available` para listar apenas os _softwares_ que possuam atualizações disponíveis.

```powershell
winget list --source "winget" --scope "machine" --upgrade-available
```

Execute `winget upgrade` para atualizar _softwares_ especificados.

```powershell
winget upgrade --source "winget" --scope "machine" --id "Git.Git"
```

Utilize a _flag_ `--all` para atualizar todos os _softwares_ que possuam atualizações disponíveis.

```powershell
winget upgrade --source "winget" --scope "machine" --all
```

Execute `winget uninstall` para desinstalar um _software_ especificado.

```powershell
winget uninstall --id "Git.Git" --all-versions --purge
```

### `wsl`

Execute `wsl --update` para atualizar o WSL.

```powershell
wsl --update
```

### `apt`

Os comandos desta seção foram escritos para serem executados com o [Bash](https://manpages.debian.org/stretch/bash/bash.1.en.html) na distribuição Debian no `wsl`.

Execute `apt list` para listar os pacotes instalados.

```bash
apt list --installed
```

Utilize a _flag_ `--upgradable` para listar apenas os pacotes que possuam atualizações disponíveis.

```
apt list --upgradable
```

Execute `apt purge` para remover um pacote especificado.

```bash
sudo apt purge "git" --assume-yes
```

Execute `apt autoremove` para remover pacotes desnecessários.

```bash
sudo apt autoremove
```

### `brew`

Os comandos desta seção foram escritos para serem executados com o [Bash](https://manpages.debian.org/stretch/bash/bash.1.en.html) na distribuição Debian no `wsl`.

Execute `brew update` para atualizar o Homebrew.

```bash
brew update
```

Execute `brew list` para listar os pacotes instalados.

```bash
brew list --formula --versions
```

Utilize a _flag_ `--installed-on-request` para listar apenas os pacotes instalados manualmente.

```bash
brew  list --formula --installed-on-request -1
```

Execute `brew outdated` para listar os pacotes instalados que possuam atualizações disponíveis.

```bash
brew outdated --formula
```

Execute `brew upgrade` para atualizar _softwares_ especificados ou todos que possuam atualizações disponíveis.

```bash
brew upgrade --formula
```

Execute `brew autoremove` para remover pacotes desnecessários.

```bash
brew autoremove
```

Execute `brew cleanup` para remover arquivos desnecessários.

```bash
brew cleanup --prune=all
```

Execute `brew uninstall` para remover um pacote especificado.

```bash
brew uninstall --formula "git"
```

## Atualizações do Windows

Inicie o PowerShell como administrador para executar os comandos desta seção.

Execute os comandos abaixo para tentar solucionar uma atualização mal sucedida do Windows.

```powershell
Stop-Service -Name "bits", "cryptsvc", "wuauserv" -Force
Get-Service -Name "bits", "cryptsvc", "wuauserv"
Remove-Item -Path "C:\Windows\SoftwareDistribution\" -Recurse -Force
Remove-Item -Path "C:\Windows\System32\catroot2" -Recurse -Force
Invoke-Expression -Command "sfc /scannow"
Invoke-Expression -Command "DISM /Online /Cleanup-Image /RestoreHealth"
Restart-Computer
```
