<?php

namespace App\Providers;


use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();

        Schema::defaultStringLength(191);

        // Map the models namespace
        $this->app->bind('App\Models', function () {
           return new \App\Models;
        });

        $fromAddress = config('mail.from.address');

        VerifyEmail::toMailUsing(function (object $notifiable, string $url) use ($fromAddress) {

            return (new MailMessage)
                ->subject('Verify Email Address')
                ->from($fromAddress, 'Invoice Weaver')
                ->line('Click the button below to verify your email address.')
                ->action('Verify Email Address', $url);
        });
    }
}
