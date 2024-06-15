function addToCart(productId) {
    var form = document.createElement('form');
    form.action = 'cart';
    form.method = 'post';

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'productId';
    input.value = productId;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}