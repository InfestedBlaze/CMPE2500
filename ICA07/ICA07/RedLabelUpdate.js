
$(document).ready(function () {
    $("#redAmount").change(updateRedLabel);
});

function updateRedLabel() {
    $("#redLabel").html("Red: [" + $("#redAmount").val() +"]");
}