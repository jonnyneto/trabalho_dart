class GeradorFrase {
  static final List<String> frases = [
    'Quando o vento da mudança sopra, algumas pessoas constroem muros, outras constroem moinhos de vento',
    'Uma viagem de mil quilômetros começa com um único passo',
    'Confúcio diz: aprender sem pensar é um esforço inútil; pensar sem aprender é perigoso',
    'Um homem que move montanhas começa carregando pequenas pedras',
    'Melhor acender uma vela do que amaldiçoar a escuridão',
  ];

  static String gerarFrase() {
    frases.shuffle();
    return frases.first;
  }
}
