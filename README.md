<<<<<<< HEAD
# ⚽ FutDle - O "Wordle" do Futebol

Um jogo de adivinhação diária de jogadores de futebol inspirado no Wordle. O jogador precisa descobrir qual é o "Jogador Misterioso do Dia" baseado em dicas de atributos (Nacionalidade, Liga, Time, Posição e Idade).

## 👨‍💻 Autor
**Vitor Hugo Fernandes Costa** - Estudante de Engenharia de Software  
GitHub: [@VitorFcosta](https://github.com/VitorFcosta) | [LinkedIn](https://www.linkedin.com/in/vitor-hugo-fernandes-costa-122419300/)

---

## 🎯 Sobre o Projeto (Trabalho do 1º Bimestre)

Este projeto foi desenvolvido como requisito de avaliação da disciplina, cumprindo 100% das exigências propostas:
- ✅ **[2 pontos]** Aplicação exibindo dados de API (API-Football)
- ✅ **[2 pontos]** Integração com Firebase (Authentication e Cloud Firestore)
- ✅ **[2 pontos]** README bem feito com orientação de utilização e tecnologias
- ✅ **[1 ponto]** Código-fonte Dart corretamente versionado
- ✅ **[1 ponto]** Desenho da arquitetura da aplicação
- ✅ **[1 ponto]** Prints da aplicação
- ✅ **[1 ponto]** Link para baixar o apk / versão web

---

## 🏗️ Arquitetura da Aplicação

Para otimizar o consumo da API externa e garantir a escalabilidade do jogo, a aplicação foi arquitetada para que o App Flutter se comunique apenas com o Firebase. O Firebase, por sua vez, é alimentado diariamente com os dados da API de esportes.

![Desenho da Arquitetura do FutDle](https://github.com/VitorFcosta/futdle/blob/main/Imagens/FootEDL.drawio.png)

---

## 📂 Estrutura do Projeto

O projeto segue uma arquitetura baseada em *Features* para garantir escalabilidade e separação de responsabilidades:

```text
lib/
├── core/                     # Núcleo da aplicação 
│   ├── api/                  # Serviços e constantes da API externa
│   ├── di/                   # Configuração de injeção de dependências
│   ├── exceptions/           # Tratamento de erros customizados
│   ├── firebase/             # Serviços do Firebase 
│   ├── logger/               # Sistema centralizado de logs
│   ├── managers/             # Gerenciadores lógicos 
│   ├── models/               # Modelos de dados globais
│   ├── theme/                # Sistema de design 
│   └── utils/                # Funções utilitárias e mappers
├── features/                 # Módulos funcionais do app
│   ├── admin/                # Tela e controle do painel de administração
│   ├── auth/                 # Fluxo de login, registro e controle de acesso 
│   ├── home/                 # Tela inicial e seleção de jogos
│   └── wordle/               # Lógica, interface e estatísticas do jogo principal
├── firebase_options.dart     # Configurações geradas pelo FlutterFire
└── main.dart                 # Ponto de entrada e inicialização do app
```
🚀 Tecnologias e Pacotes Utilizados
Flutter & Dart: Framework e linguagem base.

Firebase Auth & Cloud Firestore: Gerenciamento de usuários, banco de dados NoSQL e controle de acesso integrado ao AuthGate.

API-Football (via RapidAPI): Fonte dos dados reais dos jogadores.

GetIt: Padrão de Injeção de Dependências (DI) para desacoplar os serviços.

Flutter DotEnv: Gerenciamento seguro de chaves de API via variáveis de ambiente.

Cached Network Image: Otimização e cache no carregamento de imagens.

Country Flags: Exibição de bandeiras com base na nacionalidade dos jogadores.

Google Fonts: Fontes Outfit e JetBrains Mono.

⚙️ Como Instalar e Rodar o Projeto
Siga os passos abaixo para testar a aplicação na sua máquina:

1. Pré-requisitos:

Ter o Flutter SDK instalado (SDK ^3.11.1)
Ter um emulador configurado ou dispositivo conectado

2. Clonando o repositório:

```
git clone [https://github.com/VitorFcosta/futdle.git](https://github.com/VitorFcosta/futdle.git)
cd futdle
```
3. Configure as variáveis de ambiente (.env):

Na raiz do projeto, você verá um arquivo chamado .env.example
Crie um arquivo novo chamado .env no mesmo local
Copie o conteúdo de .env.example para dentro do .env e substitua a chave pela sua chave real da API-Sports

4. Instalando dependências:
````
flutter pub get
````
5. Rodando o aplicativo:

```
flutter run
```
## 📱 Prints da Aplicação

<p align="center">
  <img src="Imagens/flutter_01.png" width="200" alt="Tela Inicial">
  &nbsp;&nbsp;&nbsp;
  <img src="Imagens/Pagina_jogo.png" width="200" alt="Gameplay">
  &nbsp;&nbsp;&nbsp;
  <img src="Imagens/popup.png" width="200" alt="Popup de Resultado">
  &nbsp;&nbsp;&nbsp;
  <img src="Imagens/Historico.png" width="200" alt="Histórico de Jogos">
=======
<p align="center">
  <h1 align="center">⚽ FutDLE</h1>
  <p align="center">
    Um jogo mobile estilo <strong>Wordle</strong> focado em jogadores de futebol.<br/>
    Adivinhe o jogador misterioso do dia comparando atributos como nacionalidade, liga, time, posição e idade.
  </p>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.11-0175C2?logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Firebase-Backend-FFCA28?logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/API-Football--Data.org-27AE60" alt="Football API"/>
  <img src="https://img.shields.io/badge/License-MIT-blue" alt="License"/>
</p>

---

## 📸 Screenshots

<p align="center">
  <img src="Imagens/flutter_01.png" width="280" alt="Tela inicial do FutDLE"/>
</p>

---

## 🎮 Como Funciona

O FutDLE é inspirado no [Wordle](https://www.nytimes.com/games/wordle), mas adaptado para o universo do futebol:

1.  **Todo dia** um novo jogador misterioso é sorteado automaticamente.
2.  O jogador pesquisa e escolhe um palpite digitando o nome de um jogador de futebol.
3.  Cada palpite revela **dicas visuais** através de cores:
    - 🟩 **Verde** → atributo idêntico ao jogador misterioso
    - 🟨 **Amarelo** → atributo parcialmente correto (ex: mesma liga, time diferente)
    - 🟥 **Vermelho** → atributo completamente diferente
    - ⬆️⬇️ **Setas de idade** → indicam se o misterioso é mais velho ou mais novo
4.  O jogador tem **6 tentativas** para acertar.
5.  Estatísticas de **streaks**, **vitórias** e **distribuição de palpites** são salvas no perfil.

---

## 🏗️ Arquitetura

O projeto segue uma arquitetura modular organizada em **camadas**:

<p align="center">
  <img src="Imagens/FootEDL.drawio.png" width="800" alt="Diagrama de arquitetura do FutDLE"/>
</p>

### Visão Geral

| Camada | Responsabilidade |
|---|---|
| **Apresentação** | UI Flutter (páginas, componentes, tema) |
| **Backend-as-a-Service** | Firebase Auth + Cloud Firestore |
| **Rotina Diária** | Cloud Function que sorteia o jogador do dia |
| **Integração Externa** | Consumo da API [football-data.org](https://www.football-data.org/) |

### Estrutura de Pastas

```
lib/
├── main.dart                     # Entry point do app
├── firebase_options.dart         # Config Firebase gerada automaticamente
│
├── core/                         # Camada compartilhada
│   ├── api/                      # Cliente HTTP e constantes da API
│   │   ├── api_constants.dart    # Base URL, ligas top-5, temporada atual
│   │   └── api_service.dart      # Requisições à football-data.org
│   ├── di/                       # Injeção de dependência (GetIt)
│   │   └── injection.dart
│   ├── exceptions/               # Exceções customizadas
│   │   └── app_exceptions.dart
│   ├── firebase/                 # Serviços Firebase
│   │   ├── auth_service.dart     # Login, cadastro, logout
│   │   ├── firestore_service.dart# CRUD: jogadores, stats, daily player
│   │   └── import_players.dart   # Script de importação em lote
│   ├── logger/                   # Logger centralizado
│   ├── managers/                 # Lógica de negócio
│   │   └── daily_player_manager.dart  # Sorteia jogador do dia
│   ├── models/                   # Modelos de dados
│   │   ├── player_model.dart     # Jogador + estatísticas
│   │   ├── user_stats.dart       # Streak, vitórias, distribuição
│   │   └── mini_game_model.dart  # Definição dos mini jogos
│   ├── theme/                    # Design system
│   │   ├── app_colors.dart       # Paleta de cores
│   │   └── app_theme.dart        # ThemeData do Material
│   └── utils/                    # Utilitários
│       └── country_code_mapper.dart  # Mapeia nacionalidade → código ISO
│
├── features/                     # Feature modules
│   ├── admin/                    # Painel administrativo
│   │   └── pages/
│   │       └── admin_page.dart   # Sorteio manual, importação
│   ├── auth/                     # Autenticação
│   │   ├── auth_gate.dart        # Decide Login ou Home via stream
│   │   ├── controllers/
│   │   │   └── auth_controller.dart
│   │   └── pages/
│   │       ├── login_page.dart
│   │       └── register_page.dart
│   ├── home/                     # Tela principal
│   │   ├── components/
│   │   │   ├── daily_games_grid.dart  # Grid dos mini jogos
│   │   │   ├── home_header.dart       # Header com avatar e nome
│   │   │   └── streak_card.dart       # Card de streaks
│   │   └── pages/
│   │       └── home_page.dart
│   └── wordle/                   # Jogo principal
│       ├── wordle_game_logic.dart     # Motor de comparação
│       ├── components/
│       │   ├── player_guess_row.dart  # Linha de resultado do palpite
│       │   ├── player_search_field.dart # Campo de busca com autocomplete
│       │   └── wordle_stats_modal.dart  # Modal de estatísticas
│       └── pages/
│           ├── wordle_page.dart        # Tela do jogo
│           └── wordle_history_page.dart # Histórico de partidas
```

---

## 🛠️ Stack Tecnológica

| Tecnologia | Uso |
|---|---|
| [Flutter](https://flutter.dev/) | Framework UI multiplataforma |
| [Dart](https://dart.dev/) `^3.11.1` | Linguagem de programação |
| [Firebase Auth](https://firebase.google.com/docs/auth) | Autenticação (email/senha) |
| [Cloud Firestore](https://firebase.google.com/docs/firestore) | Banco de dados NoSQL em tempo real |
| [football-data.org API](https://www.football-data.org/) | Dados de jogadores, times e ligas |
| [GetIt](https://pub.dev/packages/get_it) | Injeção de dependência / Service Locator |
| [Google Fonts](https://pub.dev/packages/google_fonts) | Tipografia customizada |
| [country_flags](https://pub.dev/packages/country_flags) | Bandeiras das nacionalidades |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | Cache de imagens (escudos, fotos) |
| [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) | Variáveis de ambiente |

---

## 🚀 Como Rodar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `≥ 3.x`
- [Firebase CLI](https://firebase.google.com/docs/cli)
- Conta no [football-data.org](https://www.football-data.org/client/register) (gratuita — 10 requests/min)

### 1. Clone o repositório

```bash
git clone https://github.com/VitorFcosta/futdle.git
cd futdle
```

### 2. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto baseado no `.env.example`:

```bash
cp .env.example .env
```

Preencha com sua chave da API:

```env
API_KEY=sua_chave_da_api_sports_aqui
```

### 3. Configure o Firebase

```bash
# Instale o Firebase CLI (se ainda não tiver)
npm install -g firebase-tools

# Login
firebase login

# Inicialize o projeto (ou use o firebase.json existente)
flutterfire configure
```

### 4. Instale as dependências e rode

```bash
flutter pub get
flutter run
```

---

## 🔑 Collections do Firestore

| Collection | Descrição |
|---|---|
| `player_list` | Lista completa de jogadores importados da API |
| `daily_player` | Jogador misterioso do dia (sobrescrito diariamente) |
| `user_stats` | Estatísticas de cada usuário (streak, vitórias, distribuição) |

---

## 🏆 Ligas Cobertas

O FutDLE inclui jogadores das **5 maiores ligas da Europa**:

| Código | Liga |
|---|---|
| `PL` | 🏴󠁧󠁢󠁥󠁮󠁧󠁿 Premier League |
| `PD` | 🇪🇸 La Liga |
| `SA` | 🇮🇹 Serie A |
| `BL1` | 🇩🇪 Bundesliga |
| `FL1` | 🇫🇷 Ligue 1 |

---

## 🎨 Design System

O app segue uma paleta visual coesa e amigável:

| Token | Cor | Hex | Uso |
|---|---|---|---|
| `primary` | 🔵 | `#2980B9` | Títulos, destaques, botões |
| `dark` | ⚫ | `#2C3E50` | Bordas, textos fortes |
| `background` | 🟡 | `#FEF9E7` | Fundo das telas e cards |
| `success` | 🟢 | `#27AE60` | Acerto (🟩) |
| `error` | 🔴 | `#E74C3C` | Erro (🟥) |
| `warning` | 🟠 | `#F39C12` | Parcial (🟨) |
| `grey` | ⚪ | `#95A5A6` | Textos secundários |

---

## 📁 Scripts Utilitários

| Script | Descrição |
|---|---|
| `assets/fetch_and_import_players.dart` | Importa todos os jogadores das top-5 ligas para o Firestore via API |
| `get_nats.dart` | Lista todas as nacionalidades únicas dos jogadores importados |

---

## 🤝 Contribuindo

1. Faça um **fork** do projeto
2. Crie uma **branch** para sua feature (`git checkout -b feature/minha-feature`)
3. **Commit** suas alterações (`git commit -m 'feat: adiciona minha feature'`)
4. **Push** para a branch (`git push origin feature/minha-feature`)
5. Abra um **Pull Request**

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<p align="center">
  Feito com ⚽ e ☕ por <a href="https://github.com/VitorFcosta">Vitor Costa</a>
>>>>>>> a7a4b66 (docs: Adicione README.md com visão geral do projeto, arquitetura e instruções de configuração)
</p>
