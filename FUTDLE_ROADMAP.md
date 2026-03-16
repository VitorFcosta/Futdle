# 🗺️ FutDLE — Roadmap de Funcionalidades

Sugestões de funcionalidades futuras organizadas por prioridade.
Cada item inclui uma estimativa de complexidade.

---

## 🔴 Alta Prioridade

### Autenticação de Usuário
- Login com Google / Apple via **Firebase Auth**
- Salvar progresso, streaks e estatísticas por usuário
- Exibir nome real no header (substituir o "User" hardcoded)
- **Complexidade:** Média — Firebase Auth já tem integração nativa com Flutter

### Navegação com Rotas
- Implementar `go_router` ou `auto_route` para navegar entre jogos
- Cada mini jogo tem sua própria rota
- Transições animadas entre telas
- **Complexidade:** Média

### Testes Automatizados
- Testes unitários para `GameManager`, `ApiService`, `FirestoreService`
- Testes de widget para componentes da Home
- A injeção de dependência no `GameManager` já facilita mocking
- **Complexidade:** Média

---

## 🟡 Média Prioridade

### Cache Local
- Usar `shared_preferences` ou `hive` para salvar estado offline
- Evitar chamadas repetidas à API quando o jogador do dia já foi sorteado
- Cache dos resultados dos jogos completados
- **Complexidade:** Baixa-Média

### Gerenciamento de Estado
- Adotar **Provider** (simples) ou **Riverpod** (mais robusto)
- Estado do usuário: nome, streak, jogos completados
- Estado de cada mini jogo: em progresso, resultado, tentativas
- Estado de conectividade e loading
- **Complexidade:** Média-Alta (precisa refatorar componentes existentes)

### Animações e Transições
- Micro-animações nos círculos dos jogos (pulse, scale on tap)
- Animação de acerto/erro nos jogos
- Transições entre telas com hero animations
- Confetti ao completar todos os jogos do dia
- **Complexidade:** Média

### Ranking / Leaderboard
- Ranking global de streaks via Firestore
- Top 10 jogadores com mais vitórias
- Comparação com amigos
- **Complexidade:** Média

---

## 🟢 Baixa Prioridade

### Notificações Push
- Notificação diária lembrando dos jogos novos
- Firebase Cloud Messaging (FCM)
- Configuração de horário preferido pelo usuário
- **Complexidade:** Baixa-Média

### CI/CD
- GitHub Actions para rodar testes e build automaticamente
- Build automático para Android/iOS a cada merge na main
- Deploy automático do Firebase Hosting (se aplicável)
- **Complexidade:** Baixa

### Modo Escuro
- Tema dark alternativo usando `AppTheme`
- Toggle na tela de configurações
- Respeitar preferência do sistema
- **Complexidade:** Baixa (infraestrutura de tema já está criada)

### Compartilhamento de Resultados
- Compartilhar resultados do dia no estilo Wordle (grid de emojis)
- Integração com redes sociais
- **Complexidade:** Baixa

---

## 🎮 Ideias de Mini Jogos

| Jogo | Descrição | Dificuldade de Implementação |
|---|---|---|
| **Wordle** | Adivinhar o jogador por atributos (como o original) | Média |
| **Silhueta** | Identificar jogador pela silhueta da foto | Média |
| **Camisa** | Adivinhar jogador pelo número da camisa + time | Baixa |
| **Carreira** | Adivinhar jogador pelo histórico de clubes | Média-Alta |
| **Stats Quiz** | Quiz de estatísticas (gols, assistências) | Baixa |
| **Escudo** | Identificar time pelo escudo borrado | Baixa |
