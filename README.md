# _Setup_

Este repositório contém instruções e recursos para configuração do Windows 11, Debian e outros _softwares_.

> Esta configuração é personalizada de acordo com minhas preferências e necessidades.
>
> O uso do Windows 11 como sistema operacional é um requisito do meu atual trabalho profissional.
>
> Prefiro instalar e configurar esses _softwares_ de forma manual e imperativa para controle e aprendizado.

Os comandos deste documento foram escritos para serem executados com o [PowerShell](https://learn.microsoft.com/en-us/powershell/).

Em sessões sobre `apt` e `brew`, os comandos foram escritos para serem executados com o [Bash](https://manpages.debian.org/stretch/bash/bash.1.en.html).

Os comandos para instalação de _softwares_ estão repetidos para que seja possível copiar e executá-los individualmente.

## Conteúdos

- [Conteúdos](#conteúdos)
- [_Softwares_](#softwares)
- [`winget`](#winget)
- [`wsl`](#wsl)
- [Debian](#debian)
  - [`apt`](#apt)
  - [`brew`](#brew)
- [Repositório](#repositório)
  - [_Resources_](#resources)
  - [_Scritps_](#scritps)
    - [_Symbolic links_](#symbolic-links)
- [`chrome`](#chrome)
- [Manutenção dos _softwares_](#manutenção-dos-softwares)
  - [`apt`](#apt-1)
  - [`brew`](#brew-1)
  - [`winget`](#winget-1)
  - [`wsl`](#wsl-1)
- [Atualizações do Windows](#atualizações-do-windows)

## _Softwares_

Os principais _softwares_ instalados com as instruções neste repositório são:

- [`7z`](https://7-zip.org)
- [`bat`](https://github.com/sharkdp/bat)
- [`brew`](https://github.com/Homebrew/brew)
- [`carapace`](https://github.com/carapace-sh/carapace)
- [`chrome`](https://www.google.com/chrome)
- [`code`](https://code.visualstudio.com)
- [`docker`](https://docs.docker.com/engine)
- [`fzf`](https://github.com/junegunn/fzf)
- [`gcloud`](https://cloud.google.com/sdk/docs/install)
- [`gh`](https://github.com/cli/cli)
- [`git-lfs`](https://github.com/git-lfs/git-lfs)
- [`git`](https://git-scm.com)
- [`nushell`](https://github.com/nushell/nushell)
- [`ouch`](https://github.com/ouch-org/ouch)
- [`psql`](https://www.postgresql.org/docs/current/app-psql.html)
- [`pwsh`](https://learn.microsoft.com/en-us/powershell)
- [`ruff`](https://github.com/astral-sh/ruff)
- [`sqlfluff`](https://github.com/sqlfluff/sqlfluff)
- [`starship`](https://github.com/starship/starship)
- [`task`](https://github.com/go-task/task)
- [`terminal`](https://github.com/microsoft/terminal)
- [`uv`](https://github.com/astral-sh/uv)
- [`winget`](https://github.com/microsoft/winget-cli)
- [`wsl`](https://learn.microsoft.com/en-us/windows/wsl)
- [`yaak`](https://github.com/mountain-loop/yaak)

## `winget`

Certifique-se de que o `winget` está instalado.

```powershell
winget --version
```

Inicie o PowerShell como administrador e instale os _softwares_ especificados abaixo.

```powershell
winget install --source "winget" --scope "machine" --id "7zip.7zip"
winget install --source "winget" --scope "machine" --id "Git.Git" --override '/VERYSILENT /NODESKTOPICON /NOEXPLORER /COMPONENTS="icons,gitlfs" /NOASSOC /NOSCALAR /PATH'
winget install --source "winget" --scope "machine" --id "GitHub.cli"
winget install --source "winget" --scope "machine" --id "Google.Chrome"
winget install --source "winget" --scope "machine" --id "Microsoft.PowerShell"
winget install --source "winget" --scope "machine" --id "Microsoft.VisualStudioCode" --override '/VERYSILENT /MERGETASKS="!runcode,!desktopicon,addcontextmenufiles,addcontextmenufolders,associatefiles,path"'

winget install --source "winget" --id "Microsoft.WindowsTerminal"
winget install --source "winget" --id "Yaak.app"
```

> Os _softwares_ especificados abaixo são utilizados apenas em meu trabalho profissional.

```powershell
winget install --source "winget" --scope "machine" --id "Microsoft.OneDrive"
winget install --source "winget" --scope "machine" --id "Microsoft.PowerBI"

winget install --source "winget" --id "Microsoft.Teams"
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

## Debian

### `apt`

Utilizando o [`apt`](https://manpages.debian.org/stretch/apt/apt.8.en.html), sincronize os índices de pacotes e instale as atualizações disponíveis.

```bash
sudo apt update && sudo apt full-upgrade --yes
```

Instale os pacotes especificados abaixo.

```bash
sudo apt install --yes "bat"
sudo apt install --yes "build-essential"
sudo apt install --yes "curl"
sudo apt install --yes "file"
sudo apt install --yes "git-lfs"
sudo apt install --yes "git"
sudo apt install --yes "gnupg"
sudo apt install --yes "postgres-client"
sudo apt install --yes "wget"
```

Crie o diretório `/etc/apt/keyrings/` com as permissões `0755`, para armazenar chaves GPG.

```bash
sudo install --mode=0755 --directory "/etc/apt/keyrings/"
```

Baixe e converta as chaves GPG especificadas abaixo, salvando-as no diretório `/etc/apt/keyrings/`.

```bash
sudo curl --fail "https://download.docker.com/linux/debian/gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/docker.gpg"
sudo curl --fail "https://cli.github.com/packages/githubcli-archive-keyring.gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/gh.gpg"
sudo curl --fail "https://apt.fury.io/nushell/gpg.key" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/nushell.gpg"
```

Adicione os repositórios especificados abaixo como fontes de pacotes para o `apt`.

Em seguida, com as novas fontes, sincronize os índices de pacotes.

```bash
printf "Types: deb\nURIs: https://download.docker.com/linux/debian/\nSuites: trixie\nComponents: stable\nSigned-By: /etc/apt/keyrings/docker.gpg\n" | sudo tee "/etc/apt/sources.list.d/docker.sources"
printf "Types: deb\nURIs: https://cli.github.com/packages/\nSuites: stable\nComponents: main\nSigned-By: /etc/apt/keyrings/gh.gpg\n" | sudo tee "/etc/apt/sources.list.d/github-cli.sources"
printf "Types: deb\nURIs: https://apt.fury.io/nushell/\nSuites: /\nComponents:\nSigned-By: /etc/apt/keyrings/nushell.gpg\n" | sudo tee "/etc/apt/sources.list.d/nushell.sources"

sudo apt update
```

Instale os pacotes especificados abaixo.

```bash
sudo apt install --yes "docker-ce" "docker-ce-cli" "containerd.io" "docker-buildx-plugin" "docker-compose-plugin"
sudo apt install --yes "gh"
sudo apt install --yes "nushell"
```

Adicione o usuário referenciado pela variável `$USER` ao grupo `"docker"`.

```bash
sudo usermod --append --groups "docker" "$USER"
```

> Os pacotes especificados abaixo são utilizados apenas em meu trabalho profissional.

```bash
sudo curl --fail "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor --yes --output="/etc/apt/keyrings/gcloud.gpg"

printf "Types: deb\nURIs: https://packages.cloud.google.com/apt/\nSuites: cloud-sdk\nComponents: main\nSigned-By: /etc/apt/keyrings/gcloud.gpg\n"  | sudo tee "/etc/apt/sources.list.d/google-cloud-sdk.sources"

sudo apt update

sudo apt install --yes "google-cloud-cli"
```

### `brew`

Baixe e execute o _script_ de instalação do `brew`.

```bash
bash -c "$(curl --fail --silent --show-error --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Instale os pacotes especificados abaixo.

```bash
/home/linuxbrew/.linuxbrew/bin/brew install --formula "carapace"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "fzf"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "gcc"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "go-task"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "ouch"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "ruff"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "sqlfluff"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "starship"
/home/linuxbrew/.linuxbrew/bin/brew install --formula "uv"
```

> Os pacotes especificados abaixo são utilizados apenas em meu trabalho profissional.

```bash
/home/linuxbrew/.linuxbrew/bin/brew install --formula "ariga/tap/atlas"
```

## Repositório

Configure o `gh` para autenticação com o GitHub.

```powershell
gh auth login --git-protocol="https" --hostname="github.com" --web
```

Clone esse repositório.

```powershell
git clone "https://github.com/pedrocrvs/setup.git" "$Env:USERPROFILE/setup"

Set-Location "$Env:USERPROFILE/setup"; git lfs pull
```

### _Resources_

O diretório [`resources/`](resources/) contém arquivos de configuração dos [_softwares_](#softwares).

### _Scritps_

O diretório [`scripts/`](scripts/) contém _scripts_ que configuram os _softwares_.

#### _Symbolic links_

Alguns desses _scripts_ criam _symbolic links_ apontando para os arquivos em [`resources/`](resources/).

O _developer mode_ é necessário para a criação de _symbolic links_ sem permissões de administrador no Windows 11.

## `chrome`

A configuração do Google Chrome deve ser feita manualmente. Para isso, acesse `chrome://flags`.

Desabilite as _flags_ especificadas abaixo.

- `autofill-enable-save-and-fill`
- `autofill-improved-labels`
- `enable-autofill-credit-card-upload`
- `fluent-overlay-scrollbars`
- `fluent-scrollbars`
- `pwm-show-suggestions-on-autofocus`
- `show-autofill-type-predictions`

Habilite as _flags_ especificadas abaixo.

- `enable-gpu-rasterization`
- `enable-parallel-downloading`
- `enable-zero-copy`
- `smooth-scrolling`

## Manutenção dos _softwares_

### `apt`

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
sudo apt purge --yes "git"
```

Execute `apt autoremove` para remover pacotes desnecessários.

```bash
sudo apt autoremove --purge --yes
```

Execute `apt clean` para remover arquivos em `/var/cache/apt/archives/`.

```bash
sudo apt clean
```

### `brew`

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

Execute `brew autoremove` para remover dependências desnecessários.

```bash
brew autoremove
```

Execute `brew cleanup` para remover arquivos desnecessários.

```bash
brew cleanup --prune="all" --scrub
```

Execute `brew uninstall` para remover um pacote especificado.

```bash
brew uninstall --formula "git"
```

### `winget`

Execute `winget list` para listar os _softwares_ instalados.

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
winget uninstall --all-versions --purge --id "Git.Git"
```

### `wsl`

Execute `wsl --update` para atualizar o WSL.

```powershell
wsl --update
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
