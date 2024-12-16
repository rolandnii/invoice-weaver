@extends('layouts.auth')

@section('content')
<form method="POST" action="{{ route('password.update') }}">
    @csrf

    <input type="hidden" name="token" value="{{ $token }}">

    <div class="form-group">
        <label for="email" class="input-label">{{ _lang('E-Mail Address') }}</label>
        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $email ?? old('email') }}" placeholder="{{ _lang('E-Mail Address') }}" required autocomplete="email" autofocus>

        @error('email')
            <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
    </div>

    <div class="form-group">
        <label for="password" class="input-label">{{ _lang('Password') }}</label>
        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="{{ _lang('Password') }}" required autocomplete="new-password">

        @error('password')
            <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
    </div>

    <div class="form-group">
        <label for="password-confirm" class="input-label">{{ _lang('Confirm Password') }}</label>
        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{ _lang('Confirm Password') }}" required autocomplete="new-password">
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block">
            {{ _lang('Reset Password') }}
        </button>
    </div>
</form>

@endsection
