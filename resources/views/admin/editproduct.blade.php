@extends('admin.layouts.template')
@section('page_title')
    Edit Product - WoodyShop
@endsection
@section('content')
    <!-- Basic Layout -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Pages/</span> Modifier Produit</h4>
        <div class="col-xxl">
            <div class="card mb-4">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="mb-0">Modifier un produit</h5>
                    <small class="text-muted float-end">Saisir information</small>
                </div>
                <div class="card-body">
                    <form action="{{ route('updateproduct') }}" method="POST">
                        @csrf
                        <input type="hidden" value="{{$productinfo->id}}" name="id">
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Nom Produit</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="product_name" name="product_name" value="{{ $productinfo->product_name }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Prix Produit</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="price" name="price" value="{{ $productinfo->price }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Quantité Produit</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="quantity" name="quantity" value="{{ $productinfo->quantity }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Description courte Produit</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="product_short_des" id="product_short_des" cols="30" rows="10">{{ $productinfo->product_short_des }}</textarea>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Description longue Produit</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="product_long_des" id="product_long_des" cols="30" rows="10">{{ $productinfo->product_long_des }}</textarea>
                            </div>
                        </div>



                        <div class="row justify-content-end">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Modifier Produit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
