async function carregarRadar() {

    try {

        const resposta =
            await fetch("data/radar.json");

        const radar =
            await resposta.json();


        /* ================= DATA ================= */

        document
            .getElementById("dataAtualizacao")
            .textContent =
            radar.atualizacao;


        /* ================= MERCADO ================= */

        document
            .getElementById("ibovespa")
            .textContent =
            radar.mercado.ibovespa;


        document
            .getElementById("dolar")
            .textContent =
            radar.mercado.dolar;


        document
            .getElementById("sp500")
            .textContent =
            radar.mercado.sp500;


        document
            .getElementById("nasdaq")
            .textContent =
            radar.mercado.nasdaq;


        document
            .getElementById("brent")
            .textContent =
            radar.mercado.brent;


        document
            .getElementById("treasury")
            .textContent =
            radar.mercado.treasury;


        /* ================= MACRO ================= */

        const macroTable =
            document.getElementById(
                "macroTable"
            );


        radar.macro.forEach(item => {

            const row =
                document.createElement("tr");


            row.innerHTML = `

                <td>
                    <strong>
                        ${item.evento}
                    </strong>
                </td>

                <td>
                    ${item.situacao}
                </td>

                <td>
                    ${item.impacto}
                </td>

                <td>
                    ${item.win}
                </td>

                <td>
                    ${item.wdo}
                </td>

                <td>
                    ${item.sentimento}
                </td>

            `;


            macroTable.appendChild(row);

        });


        /* ================= POWER ================= */

        const powerGrid =
            document.getElementById(
                "powerGrid"
            );


        radar.power.forEach(item => {

            const card =
                document.createElement("div");


            card.className =
                "ranking-card";


            card.innerHTML = `

                <div class="rank">
                    #${item.rank}
                </div>

                <div class="ticker">
                    ${item.ticker}
                </div>

                <div class="score">
                    ${item.score}/10
                </div>

                <div class="strategy">
                    ${item.strategy}
                </div>

            `;


            powerGrid.appendChild(card);

        });


        /* ================= PORTFOLIO ================= */

        const portfolioTable =
            document.getElementById(
                "portfolioTable"
            );


        radar.portfolio.forEach(item => {

            const row =
                document.createElement("tr");


            row.innerHTML = `

                <td>
                    <strong>
                        ${item.ticker}
                    </strong>
                </td>

                <td>
                    US$ ${item.entrada}
                </td>

                <td>
                    US$ ${item.preco}
                </td>

                <td>
                    ${item.target}
                </td>

                <td>
                    <span class="badge bullish">
                        ${item.status}
                    </span>
                </td>

            `;


            portfolioTable.appendChild(row);

        });


        /* ================= PENNY ================= */

        const pennyGrid =
            document.getElementById(
                "pennyGrid"
            );


        radar.penny.forEach(item => {

            const card =
                document.createElement("div");


            card.className =
                "ranking-card";


            card.innerHTML = `

                <div class="rank">
                    #${item.rank}
                </div>

                <div class="ticker">
                    ${item.ticker}
                </div>

                <div class="score">
                    ${item.score}/10
                </div>

                <div class="strategy">
                    ${item.strategy}
                </div>

            `;


            pennyGrid.appendChild(card);

        });


        /* ================= RECOMMENDATIONS ================= */

        const recommendationTable =
            document.getElementById(
                "recommendationTable"
            );


        radar.recommendations.forEach(item => {

            const row =
                document.createElement("tr");


            row.innerHTML = `

                <td>
                    #${item.rank}
                </td>

                <td>
                    <strong>
                        ${item.ticker}
                    </strong>
                </td>

                <td>
                    ${item.sector}
                </td>

                <td>
                    <strong>
                        ${item.score}
                    </strong>
                </td>

                <td>
                    ${item.strategy}
                </td>

            `;


            recommendationTable.appendChild(row);

        });


        /* ================= MAJOR EVENT ================= */

        document
            .getElementById("majorEvent")
            .textContent =
            radar.majorEvent;


    }

    catch (erro) {

        console.error(
            "Erro ao carregar Radar:",
            erro
        );

    }

}


carregarRadar();