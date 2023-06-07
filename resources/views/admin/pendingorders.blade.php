@extends('admin.layouts.template')
@section('page_title')
    Pending Orders - WoodyShop
@endsection
@section('content')
    <div class="container my-5">
        <div class="card p-4">
            <div class="card-title">
                <h2 class="text-center">Commandes en Cours</h2>
            </div>
            <div class="card-body">
                <table class="table">
                    <tr>
                        <th>Id Client</th>
                        <th>Informations De Livraison</th>
                        <th>Id Produit</th>
                        <th>Quantité</th>
                        <th>Prix Total</th>
                        <th>Action</th>
                        <th></th>
                    </tr>
                @foreach($pending_orders as $order)
                    <tr>
                        <td>{{ $order->userid }}</td>
                        <td>
                            <ul>
                                <li>Ville - {{ $order->shipping_city }}</li>
                                <li>Code Postal - {{ $order->shipping_postalcode }}</li>
                                <li>Numéro de Téléphone - {{ $order->shipping_phoneNumber }}</li>
                            </ul>
                        </td>
                        <td>{{ $order->product_id }}</td>
                        <td>{{ $order->quantity }}</td>
                        <td>{{ $order->total_price }} €</td>
                        <td><a href="" class="btn btn-success">Accepter la commande</a> </td>
                    </tr>

                @endforeach
                </table>
            </div>
        </div>
    </div>
@endsection
