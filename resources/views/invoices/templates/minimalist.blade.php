<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Invoice Weaver</title>
    @include('invoices.templates.assets.minimalist')
</head>
<body>
<div class="invoice" style="margin-top: 20px;">
    <div class="header">
{{--        <div class="logo">IW</div>--}}
        <h1>{{getAppName()}}</h1>
{{--        <p class="subtitle">design & branding</p>--}}
    </div>

    @php
        function percentValue($total, $percent): float | int {
            return ($percent / 100) * $total;
        }

        $formatAmount = function ($amount) use ($currency) {
            return sprintf("%s %s", $currency?->code, $amount);
        };

        function capStr($str) {
          return str(strtolower($str))->title();
        }

    @endphp

    <table class="invoice-details">
        <td width="50%">
            <h2>ISSUED TO:</h2>
            <p>{{capStr($client?->user->first_name. " ". $client?->user->last_name)}}</p>
            <p>{{capStr($client?->company_name)}}</p>
            <p>{{capStr($client->address)}}</p>
        </td>
        <td width="50%" class="text-right">
            <p class="text-right"><strong>INVOICE NO:</strong> {{$invoice->invoice_id}}</p>
            <p><strong>DATE:</strong> {{date('d-m-Y', strtotime($invoice->created_at))}}</p>
            <p><strong>DUE DATE:</strong> {{date('d-m-Y', strtotime($invoice->due_date))}}</p>
        </td>

    </table>

    <table class="invoice-table">
        <thead>
        <tr>
            <th>Description</th>
            <th class="text-right">Unit Price</th>
            <th class="text-right">QTY</th>
            <th class="text-right">Total</th>
        </tr>
        </thead>
        <tbody>

        @foreach($invoice->invoiceItems as $item)
            <tr>
                <td>{{capStr($item?->product?->name)}}</td>
                <td class="text-right">{{$formatAmount($item->price)}}</td>
                <td class="text-right">{{$item->quantity}}</td>
                <td class="text-right">{{$formatAmount($item->total)}}</td>
            </tr>
        @endforeach

        <tr >
           <td colspan="3" class="b-none text-right"><strong>Subtotal:</strong> </td>
            <td class="b-none text-right first">{{$formatAmount($invoice->amount)}}</td>
        </tr>
        @foreach($invoice->invoiceTaxes as $tax)
            <tr>
                <td colspan="3" class="b-none text-right"  style=""><strong>{{$tax->name . "({$tax->value}%)"}} :</strong></td>
                <td class="b-none text-right">{{$formatAmount(percentValue($invoice->amount, $tax->value))}}</td>
            </tr>
        @endforeach
        <tr>
            <td colspan="3" class="b-none text-right"  style=""><strong>Discount:</strong></td>
            <td class="b-none text-right">{{$formatAmount($invoice->discount)}}</td>
        </tr>
        </tbody>
    </table>

    <div class="totals" >
        <p></p>

        <p class="total-row"><strong>Total</strong> {{$formatAmount($invoice->final_amount)}}</p>
    </div>

{{--    <div class="footer">--}}
{{--        <div>--}}
{{--            <h3>BANK DETAILS</h3>--}}
{{--            <p>Borcele Bank</p>--}}
{{--            <p>Account Name: Avery Davis</p>--}}
{{--            <p>Account No.: 0123 4567 8901</p>--}}
{{--        </div>--}}
{{--        <div style="text-align: right;">--}}
{{--            <h3>THANK YOU</h3>--}}
{{--            <div class="signature">Avery Davis</div>--}}
{{--        </div>--}}
{{--    </div>--}}

</div>
</body>
</html>


