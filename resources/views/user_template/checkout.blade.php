@extends('user_template.layouts.template')
@section('main-content')
    <h2>Dernières Vérifications</h2>
    <div class="row">
        <div class="col-8">
            <div class="box_main">
                <h3>La Commande Sera Envoyer -</h3>
                <p>Ville - {{ $shipping_address->city_name }}</p>
                <p>Code Postal - {{ $shipping_address->postal_code }}</p>
                <p>Numéro De Téléphone - {{ $shipping_address->phone_number }}</p>
            </div>
        </div>

        <div class="col-4">
            <div class="box_main">
                <h3>Votre Commande Final -</h3>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>Nom Produit</th>
                            <th>Quantité</th>
                            <th>Prix</th>
                        </tr>
                        @php
                            $total = 0;
                        @endphp
                        @foreach($cart_items as $item)
                            <tr>
                                @php
                                    $product_name = App\Models\Product::where('id', $item->product_id)->value('product_name');
                                @endphp
                                <td>{{ $product_name }}</td>
                                <td>{{ $item->quantity }}</td>
                                <td>{{ $item->price }} €</td>
                            </tr>

                            @php
                                $total = $total + $item->price;
                            @endphp


                        @endforeach
                            <tr>
                                <td></td>
                                <td>Total</td>
                                <td>{{ $total }}</td>

                            </tr>
                    </table>
                </div>
            </div>
        </div>

        <form action="" method="POST">
            @csrf
            <input type="submit" value="Annuler La Commande" class="btn btn-danger mr-3">
        </form>

        <form action="{{ route('placeorder') }}" method="POST">
            @csrf
            <input type="submit" value="Valider La Commande" class="btn btn-primary">
        </form>
    </div>
@endsection
