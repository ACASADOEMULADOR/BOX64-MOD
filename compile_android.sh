#!/bin/bash
# Script de compilação do Box64-MOD focado estritamente em Android (NDK/CHRoot/Proot)

echo "⏳ Preparando ambiente de compilação..."

# Garantir que a pasta build existe
mkdir -p build
cd build || exit 1

echo "⚙️ Configurando o CMake estritamente para Android (ARM64 com suporte 48-bit forçado)..."
# Usando as flags canônicas para compilação Android genérica ao invés de usar as do Termux
cmake .. -DARM_DYNAREC=ON -DANDROID=1 -DBAD_SIGNAL=ON -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=RelWithDebInfo

echo "🛠️ Iniciando a compilação paralela..."
make -j$(nproc)

echo "✅ Compilação concluída!"
echo ""
echo "🚀 Para testar se a flag funciona no seu dispositivo Android, rode o seu jogo da seguinte forma:"
echo "BOX64_FORCE48BIT=1 ./box64 caminho_do_jogo/jogo.exe"
