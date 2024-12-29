 // Initialize an empty cart
 var cart = JSON.parse(localStorage.getItem('cart')) || [];

 // Function to add item to cart
 function addToCart(item) {
    const quantity = parseInt(item.quantity, 10);

    // Check if the item already exists in the cart
    const existingItemIndex = cart.findIndex(cartItem => cartItem.id === item.id);
  
    if (existingItemIndex >= 0) {
        // Update quantity if item already exists
        cart[existingItemIndex].quantity += quantity;
    } else {
        // Add new item with the selected quantity
        cart.push(item);
    }

    localStorage.setItem('cart', JSON.stringify(cart)); // Save to localStorage
    displayCart(); // Update the cart display
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
        li.setAttribute('data-id', item.id);
        li.setAttribute('data-name', item.name);
        li.setAttribute('data-price', item.price);

        li.textContent = `${item.name} - ${item.price} VND x `;
        
        // Add quantity input
        const quantityInput = document.createElement('input');
        quantityInput.type = 'number';
        quantityInput.classList.add('quantity');
        quantityInput.value = item.quantity;
        li.appendChild(quantityInput);

        cartItemsContainer.appendChild(li);
        totalPrice += parseFloat(item.price) * item.quantity; // Add item price to total
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
        
         const quantityInput = event.target.previousElementSibling;  // Assumes quantity input is right before the button
         const quantity = quantityInput ? parseInt(quantityInput.value, 10) : 1
         // Create an item object
         const item = {
             id: id,
             name: name,
             price: price,
             section: section,
             quantity: quantity
         };
         // Add item to cart
         addToCart(item);
     }
 });

//  function checkout() {
//      if (cart.length === 0) {
//          alert('Your cart is empty!');
//      } else {
//          alert('Checkout successful!');
//          cart = [];
//          localStorage.removeItem('cart');
//          displayCart();
//      }
// }

document.querySelectorAll('.add-to-cart').forEach(button => {
    button.addEventListener('click', function (e) {
        e.preventDefault();

        const cartIcon = document.getElementById('cart-icon'); // Target the cart icon
        const cartRect = cartIcon.getBoundingClientRect(); // Get the position of the cart icon
        const buttonRect = this.getBoundingClientRect(); // Get the position of the clicked button

        // Calculate the distance to fly
        const flyX = cartRect.left - buttonRect.left;
        const flyY = cartRect.top - buttonRect.top;

        // Create a clone element to animate
        const flyItem = document.createElement('div');
        flyItem.classList.add('fly-item');
        flyItem.style.left = `${buttonRect.left + buttonRect.width / 2}px`;
        flyItem.style.top = `${buttonRect.top + buttonRect.height / 2}px`;
        flyItem.style.setProperty('--fly-x', `${flyX}px`);
        flyItem.style.setProperty('--fly-y', `${flyY}px`);
        document.body.appendChild(flyItem);

        // Clean up the clone after animation
        flyItem.addEventListener('animationend', () => {
            flyItem.remove();
        });
    });
});

async function checkout() {
    const cartItems = []; // Array to store cart data
    const cartElements = document.querySelectorAll("#cart-items li");

    cartElements.forEach(item => {
        const id = item.dataset.id;
        const name = item.dataset.name;
        const quantity = item.querySelector(".quantity").value;
        const price = item.dataset.price;

        cartItems.push({ id, name, quantity, price });
    });

    try {
        const response = await fetch("/menu/checkout", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ cartItems }),
        });

        const data = await response.json();

        if (response.ok) {
            alert('Checkout successful!');
            cart = [];
            localStorage.removeItem('cart');
            displayCart();
        } else {
            alert(`Error: ${data.message}`);
        }
    } catch (error) {
        console.error("Error during checkout:", error);
        alert("An error occurred during checkout.");
    }
}

