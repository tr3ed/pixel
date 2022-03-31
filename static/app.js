$(document).on('ready turbolinks:load', function () {
    generateQR();
});

function addItem(id) {
    var item = $('#'+id)[0];
    $('#basket').append(item.outerHTML)
    var formElement = `<input type="hidden" name="items" value="` + item.id + `">`
    $('#order-form').append(formElement)
}

function generateQR() {
    console.log($('#qr').data('items'))
    $('#qr').each(() => {
        var qrcode = new QRCode(document.querySelector(".qr-code"), {
            text: $('#qr').data('items'),
            width: 1000, //default 128
            height: 1000,
            colorDark : "#000000",
            colorLight : "#ffffff",
            correctLevel : QRCode.CorrectLevel.H
        });
    });
} 