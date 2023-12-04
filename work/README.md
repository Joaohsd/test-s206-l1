# **API Test with Karate using Rick and Morty API**

The goal of this project is testing <a href="https://rickandmortyapi.com/">Rick and Morty API</a>. In order to do that, We've created **15 tests scenarios**, being 5 for each entity:

*   Character:

    *   Testing **GET** a sample of characters: Status code **200**;
    *   Testing **GET** one valid character: Status code **200**;
    *   Testing **GET** one valid character and verifying its first episode: Status code **200** on **both**;
    *   Testing **GET** one **invalid** character passing **valid** id value: Status code **404**;
    *   Testing **GET** one **invalid** character passing **invalid** id value: Status code **500**;

*   Episode:

    *   Testing **GET** a sample of episodes: Status code **200**;
    *   Testing **GET** one valid episode: Status code **200**;
    *   Testing **GET** one valid episode and verifying its first character: Status code **200** on **both**;
    *   Testing **GET** one **invalid** episode passing **valid** id value: Status code **404**;
    *   Testing **GET** one **invalid** episode passing **invalid** id value: Status code **500**;

*   Location:

    *   Testing GET a sample of locations: Status code **200**;
    *   Testing GET one valid location: Status code **200**;
    *   Testing GET one valid location and verifying its first resident: Status code **200** on **both**;
    *   Testing GET one **invalid** location passing **valid** id value: Status code **404**;
    *   Testing GET one **invalid** location passing **invalid** id value: Status code **500**;

## **Pre-requirements**

*   JDK (used v17)
*   Maven (used v3.9.5)

## **Running tests**

In order to **Test** the project, use the commands below in this **work_s206** folder of this project:

```shell
mvn test -Dtest=RickMortyRunner
```

## **Reports**
After running the tests, the reports will be available at **"target/karate-reports/"** folder. Just open the **html** reports file in your browser. When you open, you will see something like that:

![Report](assets/reports.png)

## **Exercício 2**
**1.** Quantas suítes de testes você desenvolveu?
*   Apenas uma suíte de testes, pois a suíte é um conjunto de casos e cenários de teste.

**2.** Os testes desenvolvidos são manuais ou automatizados?
*   Os testes são automatizados, visto que estamos utilizando a ferramenta Karate DSL, a qual permite a automação de testes de API.

**3.** Onde os testes se localizam na pirâmide apresentada?
*   Os testes se encontram no meio da pirâmide, ou seja, são testes de serviço.

**4.** Os testes desenvolvidos são funcionais ou não-funcionais?
*   Os testes desenvolvidos são funcionais, dado que eles visam verificar funcionalidades da API, não levando em consideração aspectos não-funcionais (sobrecarga, por exemplo).

**5.** Alguns dos testes desenvolvidos são testes Fim-a-Fim(End-To-End)?
*   Não, pois não estão sendo realizados testes de interface, os quais por definição (E2E) são testes que envolvem todas as camadas, incluindo a camada de visualização.

**6.** O que se deve fazer para que os testes desenvolvidos funcionem em modo regressão?
*   Podemos integrar os testes a sitema de CI, atrelado às modificações da aplicação. Isso irá garantir que os testes sejam executados automaticamente sempre que um evento (push ou pull request) for habilitado. Logo, facilitará a detecção de problemas.
