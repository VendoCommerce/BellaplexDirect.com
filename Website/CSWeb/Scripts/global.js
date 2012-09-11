function CalculateTotal() {
    var total = 0;
    if (document.getElementById('SKU407QTY').value.length > 0) {
        total += document.getElementById('SKU407QTY').value * 29.99;
        document.getElementById('total').value = total;
    }
    if (document.getElementById('SKU408QTY').value.length > 0) {
        total += document.getElementById('SKU408QTY').value * 24.99;
        document.getElementById('total').value = total;
    }

}
function Validate() {
    var message = 'There are one or more problems with your form:';
    message += '\n -------------------------------------------'

    var check = true;
    var check2 = true;
    if (document.getElementById('SKU407QTY').value.length < 1) {
        check = false;
    }
    if (document.getElementById('SKU408QTY').value.length < 1) {
        check2 = false;
    }
    if (check == false && check2 == false) {
        message += '\n Please select 1 or more discounted products.';
        message += '\n -------------------------------------------';
        message += '\n Please correct and resubmit.';
        alert(message);
        return false;
    }
    else {
        return true;
    }
}