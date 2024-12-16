<script src="https://js.paystack.com/v1/inline.js"></script>

<form action="{{ url('membership/paystack_payment_authorize/'.$payment->id) }}" method="post" id="payment-form">
    @csrf
    <div class="form-row">
        <div id="card-element" class="form-control">
            <!-- A Paystack Element will be inserted here. -->
        </div>

        <!-- Used to display form errors. -->
        <div id="paystack-errors" class="text-danger m-auto" role="alert"></div>
    </div>

    <div class="form-row">
        <button class="btn btn-dark btn-block" id="pay_now"><i class="ti-credit-card"></i> {{ _lang('Pay Now') }}</button>
    </div>
</form>

<script>
    // Create a Paystack client.
    var paystack = Paystack('{{ get_option('paystack_public_key') }}');

    // Create an instance of Paystack.
    var card = paystack.card({
        number: '#card-number',
        cvc: '#cvv',
        month: '#expiry-month',
        year: '#expiry-year',
    });

    // Custom styling can be passed to options when creating an Element.
    // (Note that this demo uses a wider set of styles than the guide below.)
    var style = {
        base: {
            color: '#32325d',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
                color: '#aab7c4'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };

    // Create an instance of the card Element.
    var card = elements.create('card', { style: style });

    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');

    // Handle real-time validation errors from the card Element.
    card.on('change', function (event) {
        var displayError = document.getElementById('paystack-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });

    // Handle form submission.
    var form = document.getElementById('payment-form');
    form.addEventListener('submit', function (event) {
        event.preventDefault();
        document.getElementById('pay_now').disabled = true;

        paystack.createToken(card).then(function (result) {
            if (result.error) {
                // Inform the user if there was an error.
                var errorElement = document.getElementById('paystack-errors');
                errorElement.textContent = result.error.message;
                document.getElementById('pay_now').disabled = false;
            } else {
                // Send the token to your server.
                paystackTokenHandler(result.token);
            }
        });
    });

    // Submit the form with the token ID.
    function paystackTokenHandler(token) {
        // Insert the token ID into the form so it gets submitted to the server
        var form = document.getElementById('payment-form');
        var hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'paystackToken');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);

        // Submit the form
        form.submit();
    }
</script>
