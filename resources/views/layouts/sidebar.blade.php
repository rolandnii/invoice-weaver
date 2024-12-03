<div class="aside-menu-container" id="sidebar">
    <div class="aside-menu-container__aside-logo flex-column-auto">
        <a href="{{ url('/') }}" class="text-decoration-none sidebar-logo d-flex align-items-center justify-content-center">
            <div class="image image-lg-medium ">
                <img src="{{ asset('images/white-logo.png') }}"
                     class="img-fluid object-contain" alt="profile image">
            </div>
        </a>
    </div>
    <div class="aside-menu-container__sidebar-scrolling overflow-auto">
        <ul class="aside-menu-container__aside-menu nav flex-column">
            @include('layouts.menu')
        </ul>
    </div>
</div>
<div class="bg-overlay" id="sidebar-overly"></div>
