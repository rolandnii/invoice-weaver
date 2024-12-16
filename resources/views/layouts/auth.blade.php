<!doctype html>
<html class="no-js" lang="">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>{{config('app.name')}} | Manage your business efficiently with our powerful suite of tools </title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="{{ asset('uploads/media/fvicon.png') }}">
	<!-- Bootstrap CSS -->
    <link href="{{ asset('auth/asset/css/bootstrap.min.css') }}" rel="stylesheet">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="{{asset('auth/asset/css/fontawesome-all.min.css')}}">
	<!-- Flaticon CSS -->
	<link rel="stylesheet" href="{{asset('auth/asset/font/flaticon.css')}}">
	
	<link rel="stylesheet" href="{{asset('auth/asset/style.css')}}">
</head>

<body>
	
	<section class="fxt-template-animation fxt-template-layout4 loaded">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-12 fxt-bg-wrap">
					<div class="fxt-bg-img" style="background-image: url('{{ asset('auth/images/loginbg.jpg') }}');">
						<div class="fxt-header">
							<div class="fxt-transformY-50 fxt-transition-delay-1">
								<a href="/" class="fxt-logo"><img src="{{asset('uploads/media/white-logo.png')}}" alt="Logo"></a>
							</div>
							<div class="fxt-transformY-50 fxt-transition-delay-2" style="color: white;">
                                <h1>Welcome To Our {{ config('app.name') }}</h1>
                            </div>
                            <div class="fxt-transformY-50 fxt-transition-delay-3" style="color: #ffffff;">
                                <p>Manage your business efficiently with our powerful suite of tools. From invoicing and expense tracking to customer management and reporting.</p>
                            </div>
                            
						</div>
						
					</div>
				</div>
				<div class="col-md-6 col-12 fxt-bg-color">
					<div class="fxt-content">
						<div class="fxt-form">
							@yield('content')
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- jquery-->
	<script src="{{ asset('auth/asset/js/jquery.min.js')}}"></script>
	<!-- Bootstrap js -->
	<script src="{{ asset('auth/asset/js/bootstrap.min.js')}}"></script>



</body>

</html>