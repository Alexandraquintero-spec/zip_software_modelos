# Software Matemático IA — ejecutable para Windows

Versión 1.0 del programa empaquetado (`.exe`), con el ingreso por **rostro**, **voz** y **postura**. No necesita Python instalado.

El código fuente está en [santigoaranda99-star/softwarematematicoIA](https://github.com/santigoaranda99-star/softwarematematicoIA).

## Por qué está en partes

GitHub no acepta archivos de más de 100 MB, y el `.zip` pesa 285 MB. Por eso está dividido en 4 partes dentro de la carpeta `partes/`.

## Cómo instalarlo

1. Descargue el repositorio. Puede usar **Code → Download ZIP** y descomprimirlo, o clonarlo:
   ```bash
   git clone https://github.com/Alexandraquintero-spec/zip_software_modelos.git
   ```
2. Haga doble clic en **`RECONSTRUIR.bat`**. El script:
   - une las 4 partes,
   - comprueba que el archivo quedó idéntico al original (SHA-256),
   - lo descomprime en la carpeta `SoftwareMatematicoIA`.
3. Abra `SoftwareMatematicoIA\SoftwareMatematicoIA.exe`.

### Para usar la IA que resuelve los problemas

Copie un archivo `.env` dentro de la carpeta `SoftwareMatematicoIA`, con estos valores:

```
GROUP_API_KEY=su_clave
GROUP_BASE_URL=https://api.groq.com/openai/v1
GROUP_MODEL=qwen/qwen3.8-27b
```

La clave **no** se incluye aquí porque el repositorio es público.

### Cuentas de usuario

La base de datos (`software_matematico.db`) se crea vacía la primera vez que se abre el programa. Para recuperar las cuentas ya registradas, copie dentro de la carpeta su respaldo de `software_matematico.db`. No se publica aquí porque contiene datos biométricos.

## Comprobar que funciona

En una terminal, dentro de la carpeta `SoftwareMatematicoIA`, ejecute:

```bash
SoftwareMatematicoIA.exe --autoprueba
```

Se crea `autoprueba.txt` con el estado de las 10 comprobaciones: los modelos de rostro, voz y postura, SFace, la anti-suplantación, el micrófono, la cámara y la base de datos.

## Reconstruir sin el script (manual)

```bash
copy /b partes\SoftwareMatematicoIA-v1.0-windows.zip.001 + partes\SoftwareMatematicoIA-v1.0-windows.zip.002 + partes\SoftwareMatematicoIA-v1.0-windows.zip.003 + partes\SoftwareMatematicoIA-v1.0-windows.zip.004 SoftwareMatematicoIA-v1.0-windows.zip
```

Después descomprima `SoftwareMatematicoIA-v1.0-windows.zip` con clic derecho → **Extraer todo**.

SHA-256 del `.zip` completo: `FA46352953EC9F136CCD78245D07424EF2C3B7CC79638382AECC36B359E7105F`
