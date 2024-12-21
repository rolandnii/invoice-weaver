<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice weaver</title>
    <style>
        @page {
            margin: 0;
            size: 80mm 297mm;
        }
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: 12px;
            line-height: 1.4;
            margin: 0;
            padding: 10px  20px;
            width: 100%;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .receipt {
            width: 80mm;
        }
        .logo, .header, .footer {
            text-align: center;
            margin: 10px 0;
        }
        .divider {
            border-top: 1px dashed #000;
            margin: 5px 0;
        }
        .item-row, .total-row {
            display: flex;
            justify-content: space-between;
            margin: 1px 0;
        }
        .item-details {
            flex: 1;
        }
        .price {
            text-align: right;
            min-width: 60px;
        }
        .total-section {
            margin-top: 10px;
        }
        .bold {
            font-weight: bold;
        }
        .small-text {
            font-size: 10px;
        }
        .barcode {
            text-align: center;
            margin: 20px 0;
        }
        .print-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        @media print {
            body {
                width: 100%;
                margin: 0;
                padding: 0 10px;
            }
            .print-button {
                display: none;
            }

            .receipt {
                width: 100%;
            }

        }
    </style>
</head>
<body>
@php
    $currency = currency() ?? $currency;
       $format_amount = function($amount)  use ($currency){
          if ($amount == null)return "{$currency}0.00";
          $amount = floatval($amount);

          if ($amount == 0) {
              return "{$currency}0.00";
          }
          return $currency.number_format($amount,2);
      };

       $discount = 0;
       $taxes = [];
       $quantity = 0;
       foreach ($invoice->taxes as $i_tax) {
           if (!isset($taxes[$i_tax->name])) {
               $taxes[$i_tax->name] = $i_tax->amount;
               continue;
           }
           $taxes[$i_tax->name] += $i_tax->amount;
       }

@endphp
<div class="receipt">
    <div class="logo">
        <h1>{{$company_name}}</h1>
    </div>

    <div class="header">
        <h2>SALES RECEIPT</h2>
    </div>

    <div class="divider"></div>

    <div class="items">

        @foreach($invoice->invoice_items as $invoice_item)
            <div class="item-row">
                <div class="item-details">{{(int)$invoice_item->quantity}}x {{$invoice_item->item->item_name}}</div>
                <div class="price">{{$format_amount($invoice_item->sub_total)}}</div>
            </div>
            <div class="item-row small-text">
                <div class="item-details">{{$invoice_item->unit_cost}}</div>
                <div class="price">-{{$format_amount($invoice_item->discount)}}</div>
            </div>
            @php
                $discount += $invoice_item->discount;
                $quantity += $invoice_item->quantity;
            @endphp
        @endforeach
    </div>

    <div class="divider"></div>

    <div class="total-section">
        <div class="item-row bold">
            <div class="item-details">{{$quantity}}x Items Sold</div>
        </div>
        <div class="total-row">
            <span>Sub Total:</span>
            <span class="price">{{$format_amount($invoice->grand_total - $invoice->tax_total)}}</span>
        </div>

        @foreach($taxes as $name => $value)
            <div class="total-row">
                <span>{{$name}}:</span>
                <span class="price">{{$format_amount($value)}}</span>
            </div>
        @endforeach

        <div class="total-row">
            <span>Total Tax:</span>
            <span class="price">{{$format_amount($invoice->tax_total)}}</span>
        </div>
        {{--        <div class="total-row">--}}
        {{--            <span>Total Discount:</span>--}}
        {{--            <span class="price">-{{$format_amount($discount)}}</span>--}}
        {{--        </div>--}}
        <div class="total-row bold">
            <span>Total:</span>
            <span class="price">{{$format_amount($invoice->grand_total)}}</span>
        </div>
        <div class="total-row">
            <span>Amount Paid</span>
            <span class="price">{{$format_amount($invoice->paid)}}</span>
        </div>

        {{--        <div class="total-row">--}}
        {{--            <span>Change:</span>--}}
        {{--            <span class="price">£0.50</span>--}}
        {{--        </div>--}}
    </div>

    <div class="divider"></div>

    <div  class="footer">
        <p>THANK YOU</p>
    </div>

    <div class="barcode" style="display: flex; justify-content: center">
        {{--        <img src="{{$barcode}}" alt="barcode"   />--}}
        {!! $barcode !!}
    </div>

    <div class="footer small-text">
        <span>{{$invoice->invoice_number ? '#'.$invoice->invoice_number: ''}}</span>
        <span>{{date('d/m/Y H:i:s', strtotime($invoice->created_at))}}</span>
        <span> By Invoice Weaver</span>
    </div>
</div>

<script>
    window.onload = function () {
        window.print();
    }
</script>
</body>
</html>
