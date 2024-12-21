<?php

namespace App\Http\Controllers;


use App\Models\Invoice;
use App\Models\Transaction;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Milon\Barcode\Facades\DNS1DFacade;


class POSController extends Controller
{
    public function show(Transaction  $transaction): View
    {
        $company_id = company_id();

        if ($company_id != $transaction->company_id) {
            abort(404);
        }
        $barcode = new \Illuminate\Support\HtmlString(DNS1DFacade::getBarcodeSVG("$transaction->id",'UPCA', 1, 30,'black',false ));
        $transaction->load(['invoice','invoice.invoice_items.item','invoice.taxes' ,]);

        return view('backend.accounting.pos.show', [
            'barcode' => $barcode,
            'transaction' => $transaction,
            'company_name' => get_company_field($company_id, 'company_name') ?: config('app.name'),
            'currency' => get_company_field($company_id,'currency' ) ?: '₵'
        ]);
    }

    public function downloadInvoicePOS(Invoice $invoice)
    {
        $company_id = company_id();


        if ($company_id != $invoice->company_id) {
            abort(404);
        }
        $barcode = new \Illuminate\Support\HtmlString(DNS1DFacade::getBarcodeSVG("$invoice->id",'UPCA', 1, 30,'black',false ));
        $invoice->load(['invoice_items.item','taxes' ,]);

        return view('backend.accounting.pos.invoice', [
            'barcode' => $barcode,
            'invoice' => $invoice,
            'company_name' => get_company_field($company_id, 'company_name') ?: config('app.name'),
            'currency' => get_company_field($company_id,'currency' ) ?: '₵'
        ]);
    }

}
