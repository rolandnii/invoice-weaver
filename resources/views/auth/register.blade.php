@extends('layouts.auth')
@section('title')
    Register
@endsection
@section('content')
    <div class="container-fluid p-0 h-100 overflow-hidden">
        <div class="row h-100">
            <div class="col-md-7 d-none d-sm-block d-sm-none d-md-flex align-content-center justify-content-center h-100 p-lg-0 position-fixed auth-image"
            style="background-image: url('{{asset('images/auth-image.jpg')}}')">
            </div>
            <div class="col-md-5 align-content-center h-100" style="margin-left: auto">
                <div class="w-full px-5 mt-4">
                    @include('flash::message')
                    @include('layouts.errors')
                </div>
                <div class="bg-white rounded-15 shadow-md width-540 px-5 px-sm-7 py-10 mx-auto my-10">
                    <h1 class="text-center mb-7">{{ __('Register ') }}</h1>
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="row">
                            <div class="mb-sm-7 col-md-6 mb-2">
                                <label for="email" class="form-label">
                                    {{ __('First Name') . ':' }} <span class="required"></span>
                                </label>
                                <input class="form-control"   value="{{ old('first_name') }}" type="text" name="first_name" aria-describedby="emailHelp" required placeholder="Mark">
                            </div>
                            <div class="mb-sm-7 mb-2 col-md-6">
                                <label for="email" class="form-label">
                                    {{ __('Last Name') . ':' }} <span class="required"></span>
                                </label>
                                <input value="{{ old('last_name') }}" name="last_name" class="form-control" autofocus id="email"
                                       aria-describedby="emailHelp" required placeholder=" {{ 'Flick'}}">
                            </div>
                        </div>

                        <div class="mb-sm-7 mb-2">
                            <label for="email" class="form-label">
                                {{ __('Email') . ':' }} <span class="required"></span>
                            </label>
                            <input name="email" type="email" value="{{old('email')}}" class="form-control" autofocus id="email"
                                   aria-describedby="emailHelp" required placeholder="example@gmail.com">
                        </div>
                       <div class="row">
                           <div class="mb-sm-7 mb-4 col-md-6">
                               <div class="d-flex justify-content-between">
                                   <label for="password" class="form-label">{{ __('messages.login.password') . ':' }}<span
                                           class="required"></span></label>
                               </div>

                               <div class="mb-3 position-relative">
                                   <input name="password" type="password" class="form-control" id="password" required
                                          placeholder="{{ __('messages.login.password') }}" aria-label="Password" data-toggle="password">
                                   <span
                                       class="position-absolute d-flex align-items-center top-0 bottom-0 end-0 me-4 input-icon input-password-hide cursor-pointer text-gray-600">
                                        <i class="bi bi-eye-slash-fill"></i>
                                    </span>
                               </div>
                           </div>
                           <div class="mb-sm-7 mb-4 col-md-6">
                               <div class="d-flex justify-content-between">
                                   <label for="password" class="form-label">Password Confirmation: <span
                                           class="required"></span></label>
                               </div>

                               <div class="mb-3 position-relative">
                                   <input name="password_confirmation" type="password" class="form-control" id="password" required
                                          placeholder="{{ __('messages.login.password') }}" aria-label="Password" data-toggle="password">
                                   <span
                                       class="position-absolute d-flex align-items-center top-0 bottom-0 end-0 me-4 input-icon input-password-hide cursor-pointer text-gray-600">
                                        <i class="bi bi-eye-slash-fill"></i>
                                    </span>
                               </div>
                           </div>
                       </div>
                        <div class="mb-sm-7 mb-4 form-check">
                            <input type="checkbox" name="toc" class="form-check-input" id="toc">
                            <label class="form-check-label" for="toc">I Agree <a href="#" class="ms-1 link-primary">Terms and conditions</a></label>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">{{ __('Register') }}</button>
                        </div>
                        <div class="d-flex align-items-center mb-10 mt-4">
                            <span class="text-gray-700 me-2">{{ __('Already have an account?') }}</span>
                            <a href="{{ route('login') }}" class="link-info fs-6 text-decoration-none">
                                {{ __('Login here') }}
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection




