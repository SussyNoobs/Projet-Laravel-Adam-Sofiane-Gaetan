@extends('user_template.layouts.template')
@section('main-content')
<div class="container">
    <div class="row">
        <div class="col-lg-4">
            <div class="box_main">
                <div class="tshirt_img"><img src="{{ asset($product->product_img) }}"></div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="box_main">
                <div class="product-info">
                    <h4 class="shirt_text text-left">{{$product->product_name}}</h4>
                    <p class="price_text text-left">Prix  <span style="color: #262626;">{{ $product->price }} €</span></p>
                </div>
                <div class="my-3 product-details">
                    <p class="lead">{{$product->product_long_des}}</p>
                    <ul class="p-2 bg-light my-2">
                        <li>Categorie - {{$product->product_category_name}}</li>
                        <li>Sous-Categorie - {{$product->product_subcategory_name}}</li>
                        <li>Quantité disponible - {{$product->quantity}}</li>
                    </ul>
                </div>

                <div class="btn_main">
                    <form action="{{ route('addproducttocart') }}" method="POST">
                        @csrf
                        <input type="hidden" value="{{$product->id}}" name="product_id">
                        <div class="form-group">
                            <input type="hidden" value="{{$product->price}}" name="price">
                            <label for="quantity">Nombre d'article : </label>
                            <input class="form-control" type="number" min='1' placeholder="1" name="quantity">
                        </div>
                        <br>
                        <input class="btn btn-warning" type="submit" value="Ajouter Au Panier">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="fashion_section">
        <div id="main_slider">
            <div class="container">
                <h1 class="fashion_taital">Produits qui pourraient vous interesser</h1>
                <div class="fashion_section_2">
                    <div class="row">

                        @foreach($related_products as $product)
                            <div class="col-lg-4 col-sm-4">
                                <div class="box_main">
                                    <h4 class="shirt_text">{{ $product->product_name }}</h4>
                                    <p class="price_text">Prix  <span style="color: #262626;">{{ $product->price }} €</span></p>
                                    <div class="tshirt_img"><img  style="max-height: 300px;" src="{{ asset($product->product_img) }}"></div>
                                    <div class="btn_main">
                                        <div class="buy_bt"><form action="{{ route('addproducttocart') }}" method="POST">
                                                @csrf
                                                <input type="hidden" value="{{$product->id}}" name="product_id">
                                                <input type="hidden" value="{{$product->price}}" name="price">
                                                <input type="hidden" value="1" name="quantity">
                                                <br>
                                                <input class="btn btn-warning" type="submit" value="Ajouter Au Panier">
                                            </form></div>
                                        <div class="seemore_bt"><a href="{{ route('singleproduct', ([$product->id, $product->slug])) }}">Voir les Détails</a></div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
