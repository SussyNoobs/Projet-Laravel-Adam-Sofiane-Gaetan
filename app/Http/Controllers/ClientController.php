<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Admin\OrderController;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\ShippingInfo;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClientController extends Controller
{
    public function CategoryPage($id){
        $category = Category::findOrFail($id);
        $products = Product::where('product_category_id', $id)->latest()->get();
        return view('user_template.category', compact('category', 'products'));
    }

    public function SubCategoryPage($id){
        $category = Subcategory::findOrFail($id);
        $products = Product::where('product_subcategory_id', $id)->latest()->get();
        return view('user_template.subcategory', compact('category', 'products'));
    }

    public function SingleProduct($id){
        $product = Product::findOrFail($id);
        $subcat_id = Product::where('id', $id)->value('product_subcategory_id');
        $related_products = Product::where('product_subcategory_id', $subcat_id)->latest()->get();
        return view('user_template.product', compact('product', 'related_products'));
    }

    public function AddToCart(){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->latest()->get();
        return view('user_template.addtocart', compact('cart_items'));
    }

    public function AddProductToCart(Request $request){
        $product_price = $request->price;
        $quantity = $request->quantity;
        $price = $product_price * $quantity;
        Cart::insert([
            'product_id' => $request->product_id,
            'user_id' => Auth::id(),
            'quantity' => $request->quantity,
            'price' => $price
        ]);

        return redirect()->route('addtocart')->with('message', 'Article ajouté au panier !');
    }

    public function RemoveCartItem($id){
        Cart::findOrFail($id)->delete();
        return redirect()->route('addtocart')->with('message', 'Un article à été supprimé du panier !');
    }

    public function GetShippingAddress(){
        return view('user_template.shippingaddress');
    }

    public function AddShippingAddress(Request $request){
        ShippingInfo::insert([
            'user_id' => Auth::id(),
            'phone_number' => $request->phone_number,
            'city_name' => $request->city_name,
            'postal_code' => $request->postal_code,
        ]);

        return redirect()->route('checkout');
    }

    public function Checkout()
    {
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->latest()->get();
        $shipping_address = ShippingInfo::where('user_id', $userid)->first();
        return view('user_template.checkout', compact('cart_items', 'shipping_address'));
    }

    public function PlaceOrder(){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->latest()->get();
        $shipping_address = ShippingInfo::where('user_id', $userid)->first();

        foreach ($cart_items as $item){
            Order::insert([
                'userid' => $userid,
                'shipping_phoneNumber' => $shipping_address->phone_number,
                'shipping_city' => $shipping_address->city_name,
                'shipping_postalcode' => $shipping_address->postal_code,
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'total_price' => $item->price,
            ]);

            $id = $item->id;
            Cart::findOrFail($id)->delete();
        }

        ShippingInfo::where('user_id', $userid)->first()->delete();

        return redirect()->route('pendingorders')->with('message', 'Votre commande à bien été prise en compte !');
    }

    public function UserProfile(){
        return view('user_template.userprofile');
    }

    public function PendingOrders(){
        $userid = Auth::id();
        $pending_orders = Order::where('userid', $userid)->where('status', 'pending')->latest()->get()
;        return view('user_template.pendingorders', compact('pending_orders'));
    }

    public function Deconnexion()
    {
        auth()->logout();

        return redirect('/');
    }

    public function History(){
        return view('user_template.history');
    }

    public function NewRelease(){
        return view('user_template.newrelease');
    }

    public function TodaysDeal(){
        return view('user_template.todaysdeal');
    }

    public function CustomerService(){
        return view('user_template.customerservice');
    }
}
