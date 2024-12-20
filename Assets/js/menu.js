 // Initialize an empty cart
 var cart = JSON.parse(localStorage.getItem('cart')) || [];

 // Function to add item to cart
 function addToCart(item) {
     cart.push(item);
     localStorage.setItem('cart', JSON.stringify(cart));
     //alert(item.name + ' has been added to your cart!');
     displayCart();
 }

 // Function to open the cart popup
 function openCart() {
     document.getElementById('cart-popup').style.display = 'flex';
     displayCart();
 }

 // Function to close the cart popup
 function closeCart() {
     document.getElementById('cart-popup').style.display = 'none';
 }

 // Function to display cart items in the popup
 // Function to display cart items in the popup
 function displayCart() {
     const cartItemsContainer = document.getElementById('cart-items');
     cartItemsContainer.innerHTML = ''; // Clear previous items
     let totalPrice = 0; // Initialize total price

     cart.forEach(item => {
         const li = document.createElement('li');
         li.textContent = `${item.name} - ${item.price} VND`;
         cartItemsContainer.appendChild(li);
         totalPrice += parseFloat(item.price); // Add item price to total
     });

     // Display total price
     const totalElement = document.getElementById('total-price');
     totalElement.textContent = `Total: ${totalPrice} VND`; // Format to 2 decimal places
 }

 // Function to clear the cart
 function clearCart() {
     cart = [];
     localStorage.removeItem('cart');
     displayCart(); // Update the cart display
     alert('Cart has been cleared!');
 }

 // Event delegation to handle clicks on dynamically generated buttons
 document.addEventListener('click', function(event) {
     if (event.target.classList.contains('add-to-cart')) {
         event.preventDefault(); // Prevent default anchor behavior

         // Get data attributes from the button
         const id = event.target.getAttribute('data-id');
         const name = event.target.getAttribute('data-name');
         const price = event.target.getAttribute('data-price');
         const section = event.target.getAttribute('data-section');

         // Create an item object
         const item = {
             id: id,
             name: name,
             price: price,
             section: section
         };
         // Add item to cart
         addToCart(item);
     }
 });

 function checkout() {
     if (cart.length === 0) {
         alert('Your cart is empty!');
     } else {
         alert('Checkout successful!');
         cart = [];
         localStorage.removeItem('cart');
         displayCart();
     }
 }