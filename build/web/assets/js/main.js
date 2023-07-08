import Header from "./header.js";
import Detail from "./detail.js";
import Cart from "./cart.js";
import User from "./user.js";
import Checkout from "./checkout.js";
import Admin from "./admin.js";
import { Product } from "../Components/index.js";
import scrollToTop from "./scroll.js";

scrollToTop();
Header.start();
Detail.start();
Cart.start();
User.start();
Checkout.start();
Admin.start();
Product.start();
