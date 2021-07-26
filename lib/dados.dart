import 'dart:collection';


class DataSimples {
  String cep = "";
  int quantidadePessoas = 0;

  DataSimples(this.cep, this.quantidadePessoas);
}

class DataHistorico {
  HashMap listaHistorico = new HashMap<String, DataSimples>();
  HashMap listaHistoricoData = new HashMap<String, Object>();

  DataHistorico();

  void addHistorico(String cep, int quantidade) {
    DataSimples data = DataSimples(cep, quantidade);
    listaHistorico.putIfAbsent(cep, () => data);
  }

  DataSimples getDados(String key) {
    return listaHistorico[key];
  }

  void addHistoricoData(String cep, int quantidade, int aux) {
    List dados = <int>[];
    for (int i = 0; i < aux; i++) {
      quantidade = quantidade +15;
      dados.add(quantidade);
    }
    listaHistoricoData.putIfAbsent(cep, () => dados);
  }

  List<int> buscaPorCep(String cep){
    return listaHistoricoData[cep];
  }

}

class Login {
  String usuario = "mauricio";
  String senha = "123";
  bool adm = false;

  bool executaLogin(String login, String senha) {
    if ((this.usuario == login) && (this.senha == senha)) return true;
    return false;
  }
}

class LoginAdm extends Login {
  String usuario = "adm";
  String senha = "unesp";
  String autenticacao = "wilson";

  @override
  bool executaLoginADM(String login, String senha, String auten) {
    if (super.executaLogin(login, senha) && auten == this.autenticacao)
      return true;
    return false;
  }
}
