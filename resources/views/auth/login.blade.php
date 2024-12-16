@extends('layouts.auth')

@section('content')

                    @if(Session::has('error'))
                        <div class="alert alert-danger text-center">
                            <strong>{{ session('error') }}</strong>
                        </div>
                    @endif
					
					@if(Session::has('registration_success'))
                        <div class="alert alert-success text-center">
                            <strong>{{ session('registration_success') }}</strong>
                        </div>
                    @endif

					<form method="POST" class="form-signin" action="{{ route('login') }}">
                        @csrf
                    
                        <div class="form-group">
                            <label for="email" class="input-label">{{ _lang('Email Address') }}</label>
                            <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="demo@gmail.com" required autofocus>
                    
                            @if ($errors->has('email'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
                    
                        <div class="form-group">
                            <label for="password" class="input-label">{{ _lang('Password') }}</label>
                            <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="********" required>
                    
                            @if ($errors->has('password'))
                                <span class="invalid-feedback">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                    
                            <i toggle="#password" class="fa fa-fw fa-eye toggle-password field-icon"></i>
                        </div>
                    
                        <div class="form-group">
                            <div class="fxt-checkbox-area">
                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" name="remember" class="custom-control-input" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                    <label class="custom-control-label" for="remember">{{ _lang('Keep me logged in') }}</label>
                                </div>
                                <a href="{{ route('password.request') }}" class="switcher-text">{{ _lang('Forgot Password') }}</a>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <button type="submit" class="fxt-btn-fill">{{ _lang('Log in') }}</button>
                        </div>
                    
                      
                    </form>

                    <div class="fxt-footer">
                        <p>Don't have an account?<a href="{{ url('register') }}" class="switcher-text2 inline-text">Register</a></p>
                    </div>
                    
                
@endsection
