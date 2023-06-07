@extends('admin.layouts.template')
@section('page_title')
    Edit Product - WoodyShop
@endsection
@section('content')
    <!-- Basic Layout -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Pages/</span> Modifier Image Produit</h4>
        <div class="col-xxl">
            <div class="card mb-4">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="mb-0">Modifier image produit</h5>
                    <small class="text-muted float-end">Saisir information</small>
                </div>
                <div class="card-body">
                    <form action="{{ route('updateproductimg') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Ancienne image</label>
                            <div class="col-sm-10">
                                <img src="{{ asset($productinfo->product_img) }}" alt="">
                            </div>
                        </div>

                        <input type="hidden" value="{{ $productinfo->id }}" name="id">

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Charger une nouvelle image</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="file" id="product_img" name="product_img" />
                            </div>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Modifier l'image du produit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection