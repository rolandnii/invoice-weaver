@extends('layouts.auth')

@section('content')
<form method="POST" class="form-signin" action="{{ route('password.send-email') }}" autocomplete="off">
    @csrf

    <div class="form-group">
        <label for="email" class="input-label">{{ _lang('Enter your Email') }}</label>
        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" placeholder="{{ _lang('Enter your Email') }}" value="{{ old('email') }}" required>

        @if ($errors->has('email'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block">
            {{ _lang('Send Password Reset Link') }}
        </button>
    </div>
</form>

@endsection
