@extends('layouts.auth')

@section('content')

<form method="POST" class="form-signup" autocomplete="off" action="{{ route('register') }}">
    @csrf

    <div class="form-group">
        <label for="name" class="input-label">{{ _lang('Name') }}</label>
        <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" placeholder="{{ _lang('Name') }}" required autofocus>

        @if ($errors->has('name'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('name') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group">
        <label for="email" class="input-label">{{ _lang('Email Address') }}</label>
        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="{{ _lang('E-Mail Address') }}" required>

        @if ($errors->has('email'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group">
        <label for="password" class="input-label">{{ _lang('Password') }}</label>
        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="{{ _lang('Password') }}" required>

        @if ($errors->has('password'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group">
        <label for="password-confirm" class="input-label">{{ _lang('Confirm Password') }}</label>
        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{ _lang('Confirm Password') }}" required>
    </div>

    <div class="form-group">
        <button type="submit" class="fxt-btn-fill">{{ _lang('Create My Account') }}</button>
    </div>

 
</form>
<div class="fxt-footer">
    <p>Already Have An Account?<a href="{{ route('login') }}" class="switcher-text2 inline-text">Log In Here</a></p>
</div>
@endsection
