require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1000
}

body = {
  title: "Balancete Demonstrativo",
  body: [
    {
      header: "Demonstrativo de Consumo",
      tables: [
        {
          rows: [
            [
              {
                align: "left",
                color: "#000000",
                style: "bold",
                text: "Exemplo de despesa",
                colspan: 2
              },
              {
                align: "left",
                color: "#000000",
                style: "bold",
                text: "Total lançado",
                colspan: 2
              }
            ],
            [
              {
                align: "left",
                color: "#000000",
                style: "normal",
                text: "Instalação",
                colspan: 2
              },
              {
                align: "left",
                color: "#000000",
                style: "normal",
                text: "R$ 100,00",
                colspan: 2
              }
            ]
          ]
        }
      ]
    },
    {
      header: "Balancete Geral",
      tables: [
        {
          rows: [
            [
              {
                align: "left",
                color: "#000000",
                style: "normal",
                text: "Confira na documentação da Gerencianet todas as configurações possíveis de um boleto balancete.",
                colspan: 4
              }
            ]
          ]
        }
      ]
    }
  ]
}

gerencianet = Gerencianet.new(options)
puts gerencianet.create_charge_balance_sheet(params: params, body: body)
