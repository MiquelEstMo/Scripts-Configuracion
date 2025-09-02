# 🚀 Mi Entorno de Desarrollo

[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![ZSH](https://img.shields.io/badge/Shell-ZSH-89e051?style=for-the-badge&logo=zsh&logoColor=white)](https://www.zsh.org/)
[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://www.python.org/)
[![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)


Colección de scripts automatizados para configurar mi entorno de desarrollo completo en sistemas Linux. Este repositorio me permite recrear rápidamente mi setup preferido en cualquier máquina nueva.

## 📁 Estructura del Proyecto

```
mi-entorno-desarrollo/
├── 📂 fuentes/                    # Scripts para instalación de fuentes
│   └── instalar-jetbrains-mono.sh
├── 📂 terminal/                   # Configuración de terminal y shell
│   ├── instalar-zsh.sh
│   ├── instalar-oh-my-zsh.sh
│   ├── instalar-plugins-zsh.sh
│   └── config-zsh/
│       └── .zshrc                 # Mi configuración personalizada de ZSH
├── 📂 herramientas-dev/          # Herramientas de desarrollo esenciales
│   ├── instalar-git.sh
│   ├── instalar-python.sh
│   ├── instalar-java.sh
│   └── instalar-gcc.sh
├── 📂 aplicaciones/              # Aplicaciones y editores
│   ├── instalar-neovim.sh        # Mi script personalizado de NeoVim
│   └── instalar-neofetch.sh
├── 📂 configuraciones/           # Archivos de configuración
│   ├── nvim/                     # Configuración de NeoVim
│   └── dotfiles/                 # Otros archivos de configuración
├── 📂 documentacion/             # Documentación y guías
│   └── GUIA_INSTALACION.md
├── 📜 instalar-todo.sh           # Script principal - Instala todo
└── 📖 README.md                  # Este archivo
```

## ⚡ Instalación Rápida

### Instalación Completa (Recomendado)
```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/mi-entorno-desarrollo.git
cd mi-entorno-desarrollo

# Hacer ejecutable y correr el script principal
chmod +x instalar-todo.sh
./instalar-todo.sh
```

### Instalación Selectiva
```bash
# Solo terminal y shell
./terminal/instalar-zsh.sh
./terminal/instalar-oh-my-zsh.sh
./terminal/instalar-plugins-zsh.sh

# Solo herramientas de desarrollo
./herramientas-dev/instalar-git.sh
./herramientas-dev/instalar-python.sh

# Solo aplicaciones
./aplicaciones/instalar-neovim.sh
```

## 🛠️ Componentes Incluidos

### 🖥️ Terminal y Shell
- **ZSH**: Shell avanzado con mejor autocompletado
- **Oh My ZSH**: Framework para gestionar configuración de ZSH
- **Plugins ZSH**: Plugins esenciales para productividad
- **Configuración personalizada**: Mi `.zshrc` optimizado

### 🔧 Herramientas de Desarrollo
- **Git**: Control de versiones
- **Python**: Lenguaje de programación + pip
- **Java**: JDK para desarrollo Java
- **GCC**: Compilador GNU para C/C++

### 📝 Editores y Aplicaciones
- **NeoVim**: Editor de texto modal altamente configurable
- **NeoFetch**: Información del sistema con estilo

### 🎨 Fuentes y Personalización
- **JetBrains Mono**: Fuente monoespaciada optimizada para código

## 📋 Requisitos

- Sistema operativo basado en Linux (Ubuntu, Debian, Arch, etc.)
- Acceso a `sudo`
- Conexión a internet
- `curl` o `wget` instalado

## 🚀 Características

- ✅ **Instalación automatizada**: Un solo comando instala todo
- ✅ **Modular**: Cada componente se puede instalar por separado
- ✅ **Personalizado**: Configuraciones optimizadas para mi flujo de trabajo
- ✅ **Bien documentado**: Cada script está comentado
- ✅ **Multiplataforma**: Compatible con diferentes distribuciones Linux
- ✅ **Idempotente**: Se puede ejecutar múltiples veces sin problemas

## 📖 Documentación Adicional

Para instrucciones detalladas de instalación y configuración, consulta:
- [📋 Guía de Instalación Completa](documentacion/GUIA_INSTALACION.md)

## 🤝 Contribuciones

Este es mi setup personal, pero siéntete libre de:
- Hacer fork del proyecto
- Sugerir mejoras
- Reportar problemas
- Compartir tus propias configuraciones

## 📝 Notas

- Los scripts están diseñados para ser **idempotentes** (se pueden ejecutar múltiples veces)
- Cada script verifica si el software ya está instalado antes de proceder
- Se incluyen verificaciones de errores y logs informativos
- Las configuraciones personales están en la carpeta `configuraciones/`

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

---

⭐ **¿Te resultó útil?** ¡Dale una estrella al repositorio!

💡 **¿Tienes sugerencias?** Abre un issue o envía un pull request.
