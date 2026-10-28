# IMC e Treino: gerar o APK

Este projeto transforma o app em um APK para Android. Quem compila é o GitHub (de graça), então você
não precisa instalar nada no computador.

## Primeira vez (uns 10 minutos)

1. Crie uma conta em https://github.com (se ainda não tiver).
2. Clique em **New repository**. Dê um nome (ex.: `imc-e-treino`), marque **Private** e clique em **Create repository**.
3. Descompacte este .zip no seu computador.
4. No repositório, clique em **uploading an existing file**, arraste **todos os arquivos e pastas**
   (incluindo a pasta oculta `.github`) e clique em **Commit changes**.
   - Se a pasta `.github` não subir, clique em **Add file > Create new file**, digite o nome
     `.github/workflows/build-apk.yml` e cole o conteúdo do arquivo de mesmo nome deste projeto.
5. Abra a aba **Actions**. O fluxo "Gerar APK" começa sozinho e leva uns 5 a 8 minutos.
   Se não começar, clique em "Gerar APK" e depois em **Run workflow**.
6. Quando ficar verde, vá em **Releases** (coluna da direita na página do repositório) e baixe
   o arquivo **IMC-e-Treino.apk**. Também dá para baixar o mesmo arquivo em Actions > a execução > Artifacts.

## Instalar no Android

1. Abra o arquivo .apk no celular (dá para baixar direto pelo navegador do celular, logado no GitHub).
2. Se o Android pedir, permita **instalar apps desta fonte**.
3. Se o Play Protect avisar que o app não é conhecido, escolha **Instalar mesmo assim**.
   É esperado: o app não vem da Play Store.
4. Na primeira corrida com GPS, aceite a permissão de **localização** e a de **notificações**.
   A notificação "Corrida em andamento" é obrigatória no Android: é ela que mantém o GPS ligado com a tela apagada.

## GPS com a tela apagada

Dentro do app Android, o GPS roda num serviço nativo, igual ao dos apps de corrida: continua gravando com a
tela apagada ou com outro app aberto. Enquanto você corre, aparece a notificação "Corrida em andamento".

Para ficar bem confiável, faça uma vez:
- Abra **Configurações > Apps > IMC e Treino > Bateria** e escolha **Sem restrições** (o nome varia por marca).
  Celulares Xiaomi, Samsung, Huawei, Oppo e outros costumam matar apps em segundo plano para poupar bateria.
- Mantenha a permissão de localização como "Permitir durante o uso do app". Não é preciso "Permitir o tempo todo".
- Na primeira vez, saia para um local aberto e espere o GPS achar o sinal (a precisão aparece na tela da corrida).

## Atualizar o app quando quiser

1. Me peça a mudança e eu devolvo o arquivo HTML novo.
2. No repositório, abra a pasta `www`, clique em `index.html`, depois em **Add file > Upload files**
   (ou use o ícone de lápis) e substitua pelo arquivo novo. Clique em **Commit changes**.
3. O GitHub gera uma nova versão sozinho. Baixe o APK novo em **Releases** e instale **por cima**
   do antigo: seus treinos, corridas e perfil continuam salvos.

## Observações

- **Mantenha o repositório privado.** A chave de assinatura (`debug.keystore`) está nele. Ela garante que
  as atualizações instalem por cima do app antigo, mantendo seus dados.
- Não desinstale o app antes de atualizar, senão os dados são apagados.
- Este APK é para uso pessoal. Para publicar na Play Store seria preciso gerar um pacote assinado com
  uma chave de lançamento.
- Se o app for fechado à força (deslizando para fora da lista de apps), a corrida é interrompida. Ao abrir de novo, o app oferece continuar a corrida salva.
- Se o fluxo falhar (círculo vermelho), abra a execução, copie o texto do passo que falhou e me envie.
