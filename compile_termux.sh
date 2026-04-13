#!/bin/bash
# Script prático para compilar o Box64-MOD modificado no Android/Termux

echo "⏳ Preparando ambiente de compilação..."

# Garantir que a pasta build existe
mkdir -p build
cd build || exit 1

echo "⚙️ Configurando o CMake para Termux (ARM64 com suporte 48-bit forçado)..."
# Adaptado para o ambiente Termux comum
cmake .. -DARM_DYNAREC=ON -DTERMUX=1 -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=RelWithDebInfo

echo "🛠️ Iniciando a compilação paralela..."
make -j$(nproc)

echo "✅ Compilação concluída!"
echo ""
echo "🚀 Para testar se a flag funciona, rode o seu jogo da seguinte forma:"
echo "BOX64_FORCE48BIT=1 ./box64 caminho_do_jogo/jogo.exe"
