@extends('layouts.auth')

@section('content')

                <div class="card-body text-center">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ _lang('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif

                    {{ _lang('Before proceeding, please check your email for a verification link.') }}
                    {{ _lang('If you did not receive the email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ _lang('click here to request another') }}</button>.
                    </form>
				</div>
           
@endsection
