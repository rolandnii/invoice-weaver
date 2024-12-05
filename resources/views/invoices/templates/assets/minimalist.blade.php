
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: white;
        margin: 0;
        /*padding: 20px;*/
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .invoice {
        background-color: white;
        max-width: 1000px;
        padding: 10px;
        font-size: 12px;
    }
    .header {
        text-align: center;
        margin-bottom: 40px;
    }
    .logo {
        width: 64px;
        height: 64px;
        background-color: #E5E0DD;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 16px;
        font-size: 24px;
        font-style: italic;
    }
    h1 {
        font-size: 24px;
        letter-spacing: 2px;
        text-transform: uppercase;
        margin: 0 0 4px;
    }
    .subtitle {
        color: #666;
        font-size: 14px;
    }
    .invoice-details {
        width: 100%;
        margin-bottom: 40px;
    }
    .invoice-details td {
        vertical-align: top;
        padding-bottom: 10px;
    }
    .invoice-details h2 {
        font-size: 14px;
        margin: 0 0 8px;
    }
    .invoice-details p {
        margin: 0 0 4px;
    }
    .invoice-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 40px;
    }
    .invoice-table th {
        background-color: #E5E0DD;
        padding: 12px;
        text-align: left;
    }
    .invoice-table td {
        padding: 12px;
        border-bottom: 1px solid #E5E0DD;
    }

    .invoice-table .b-none td {
        border-bottom: 0;
    }
    .invoice-table .text-right {
        text-align: right;
    }
    .totals {
        text-align: right;
    }
    .total-row {
        background-color: #E5E0DD;
        display: inline-block;
        padding: 8px 16px;
        margin-top: 4px;
    }
    .footer {
        display: flex;
        justify-content: space-between;
    }
    .signature {
        font-style: italic;
        font-size: 24px;
        color: #666;
    }

    .text-right {
        text-align: right !important;
    }

    .b-none {
        border: none !important;
        padding: 0.3rem 12px !important;
        text-transform: capitalize;
    }
   .invoice-table td.b-none.first{
        border: none !important;
        padding:  12px 12px 0.3rem !important;
       /*background: red;*/
    }


</style>
