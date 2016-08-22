jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
    $('#new_profil').submit ->
        $('input[type=submit]').attr('disabled', true)
        Stripe.card.createToken($('#new_profil'), payment.handleStripeResponse)
        false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_profil').append($('<input type="hidden" name="stripe_card_token" />').val(response.id))
      $('#new_profil')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)

