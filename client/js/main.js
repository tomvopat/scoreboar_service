"use strict";
const baseUrl = "http://localhost:8080/";

$(function () {
    $("#newRecordForm").submit(function (event) {
        event.preventDefault();

        let name = $("#name").val();
        let score = +$("#score").val();
        let newScore = {
            name: name,
            score: score
        };

        let request = new XMLHttpRequest();
        request.open("POST", `${baseUrl}/score`, true);
        request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        request.onload = function() {
            if(request.status === 200) {
                newScore = JSON.parse(this.response);
                let dataTable = $("#table-score").dataTable().api();
                dataTable.row.add(Object.values(newScore));
                dataTable.draw();
                $("#newScoreModal").modal("hide");
            } else {
                alert("Check the input.");
            }
        };
        request.send(JSON.stringify(newScore));

    });

    $("#saveButton").on("click", function () {
        $("#newRecordForm").submit();
    });

});

let request = new XMLHttpRequest();
request.onload = function() {
    let scores = JSON.parse(this.response);
    createTable(scores);
};
request.open("GET", `${baseUrl}/score`, true);
request.send();

//---------------------------------------------------------
// Functions ----------------------------------------------

function createTable(scores) {
    $(function () {
        let table = $("#scores");
        table.empty();
        for(let score of scores) {
            let row = createRow(score);
            table.append(row);
        }

        $("#table-score").DataTable({
            paging: false,
            searching: false,
            info: false,
            order: [[0, "asc"]],
            columns: [
                {className: "text-center", cellType: "th"},
                null,
                null
            ]
        });
    });
}

function createRow(score) {
    let row = document.createElement("tr");
    row.setAttribute("data-scoreid", score.id);

    // id
    let cellId = document.createElement("th");
    cellId.setAttribute("scope", "row");
    cellId.setAttribute("class", "text-center");
    cellId.innerText = score["id"];
    row.appendChild(cellId);

    // name
    let cellName = row.insertCell();
    cellName.innerText = score["name"];
    row.appendChild(cellName);

    // score
    let cellScore = row.insertCell();
    cellScore.innerText = score["score"];
    row.appendChild(cellScore);

    return row;
}
