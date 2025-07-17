<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/homeNav.jsp"/>

<style>
  /* Neutral Color Palette */
  :root {
    --light-brown: #d7ccc8;
    --medium-brown: #a1887f;
    --dark-brown: #5d4037;
    --light-grey: #f5f5f5;
    --medium-grey: #9e9e9e;
    --dark-grey: #424242;
    --white: #ffffff;
    --black: #212121;
    --transition: all 0.3s ease-in-out;
  }

  body {
    font-family: 'Playfair Display', serif;
    background-color: var(--light-grey);
    color: var(--black);
  }

  /* Carousel Styles */
  .carousel-item {
    height: 100vh;
    min-height: 300px;
    background: no-repeat center center scroll;
    background-size: cover;
    position: relative;
  }

  .carousel-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4);
  }

  .carousel-caption {
    bottom: 30%;
    text-align: center;
    transform: translateY(50%);
  }

  .carousel-caption h3 {
    font-size: 4rem;
    font-weight: 700;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    margin-bottom: 1rem;
    letter-spacing: 2px;
    color: var(--white);
  }

  .carousel-caption p {
    font-size: 1.5rem;
    max-width: 700px;
    margin: 0 auto;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
    color: var(--light-grey);
  }

  /* Services Section */
  #service-section {
    padding: 5rem 0;
    background-color: var(--white);
  }

  .marketing {
    padding: 0 2rem;
  }

  .marketing h2 {
    font-weight: 600;
    margin: 1.5rem 0;
    color: var(--dark-brown);
    letter-spacing: 1px;
  }

  .rounded-circle {
    width: 240px;
    height: 240px;
    object-fit: cover;
    border: 8px solid var(--light-brown);
    transition: var(--transition);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  }

  .rounded-circle:hover {
    transform: scale(1.05);
    border-color: var(--medium-brown);
  }

  .marketing p {
    font-size: 1.1rem;
    line-height: 1.6;
    color: var(--dark-grey);
  }

  /* Featurette Sections */
  .featurette-divider {
    margin: 5rem 0;
    border-color: var(--light-brown);
  }

  .featurette {
    padding: 0 2rem;
    margin-bottom: 5rem;
  }

  .featurette-heading {
    font-weight: 600;
    letter-spacing: 1px;
    color: var(--dark-brown);
  }

  .featurette-heading .text-muted {
    font-size: 1.5rem;
    font-weight: 400;
    font-style: italic;
    color: var(--medium-brown) !important;
  }

  .lead {
    font-size: 1.1rem;
    line-height: 1.8;
    color: var(--dark-grey);
  }

  .featurette-image {
    border-radius: 8px;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    transition: var(--transition);
  }

  .featurette-image:hover {
    transform: scale(1.02);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
  }

  /* Footer Section */
  .footer-section {
    background-color: var(--dark-brown);
    color: var(--white);
    padding: 3rem 0;
    margin-top: 5rem;
  }

  /* Testimonial Section */
  .testimonial-section {
    background-color: var(--light-brown);
  }

  /* Buttons */
  .btn-primary {
    background-color: var(--medium-brown);
    border-color: var(--medium-brown);
    color: var(--white);
  }

  .btn-primary:hover {
    background-color: var(--dark-brown);
    border-color: var(--dark-brown);
  }

  /* Responsive Adjustments */
  @media (max-width: 992px) {
    .carousel-caption h3 {
      font-size: 3rem;
    }

    .carousel-caption p {
      font-size: 1.2rem;
    }

    .marketing .col-lg-4 {
      margin-bottom: 3rem;
    }
  }

  @media (max-width: 768px) {
    .carousel-caption h3 {
      font-size: 2.5rem;
    }

    .carousel-caption p {
      font-size: 1rem;
      max-width: 90%;
    }

    .featurette-heading {
      font-size: 2rem;
    }

    .featurette-heading .text-muted {
      font-size: 1.2rem;
    }
  }

  /* Animation Effects */
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .marketing .col-lg-4,
  .featurette {
    animation: fadeIn 1s ease-out forwards;
  }

  /* Custom Scrollbar */
  ::-webkit-scrollbar {
    width: 10px;
  }

  ::-webkit-scrollbar-track {
    background: var(--light-grey);
  }

  ::-webkit-scrollbar-thumb {
    background: var(--medium-brown);
    border-radius: 10px;
  }

  ::-webkit-scrollbar-thumb:hover {
    background: var(--dark-brown);
  }
</style>

<!-- Hero Carousel -->
<header style="margin-top: -40px;">
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Elegant Ballroom -->
      <div class="carousel-item active" style="background-image: url('https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <div class="carousel-caption d-none d-md-block">
          <h3>ELEGANCE REDEFINED</h3>
          <p>Crafting Unforgettable Wedding Experiences</p>
        </div>
      </div>
      <!-- Slide Two - Grand Entrance -->
      <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <div class="carousel-caption d-none d-md-block">
          <h3>GRAND BALLROOMS</h3>
          <p>Elegant spaces designed for your special day</p>
        </div>
      </div>
      <!-- Slide Three - Table Setting -->
      <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1511795409834-ef04bbd61622?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <div class="carousel-caption d-none d-md-block">
          <h3>ATTENTION TO DETAIL</h3>
          <p>Every element perfectly arranged for your celebration</p>
        </div>
      </div>
      <!-- Slide Four - Outdoor Wedding -->
      <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1513151233558-d860c5398176?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <div class="carousel-caption d-none d-md-block">
          <h3>PICTURE PERFECT</h3>
          <p>Create memories that will last a lifetime</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</header>

<!-- Services Section -->
<section id="service-section" class="py-5">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="display-4">Our Services</h2>
      <p class="lead" style="color: var(--medium-brown);">Everything you need for your perfect wedding day</p>
      <div class="divider" style="width: 100px; height: 2px; background: var(--medium-brown); margin: 1rem auto;"></div>
    </div>

    <div class="row text-center">
      <div class="col-lg-4 mb-5 mb-lg-0">
        <div class="service-item">
          <img class="rounded-circle" src="https://images.unsplash.com/photo-1513151233558-d860c5398176?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Wedding Hall">
          <h2 class="mt-4">VENUES</h2>
          <p class="px-4">Discover our Vivánzá selection of wedding venues, from grand ballrooms to intimate garden settings. Each space is meticulously maintained to provide the perfect backdrop.</p>
          <a href="#" class="btn btn-primary mt-3">Explore Venues</a>
        </div>
      </div>

      <div class="col-lg-4 mb-5 mb-lg-0">
        <div class="service-item">
          <img class="rounded-circle" src="https://images.unsplash.com/photo-1547592180-85f173990554?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Catering">
          <h2 class="mt-4">CATERING</h2>
          <p class="px-4">Indulge in our gourmet catering services featuring customizable menus prepared by award-winning chefs. We accommodate all dietary needs while ensuring exceptional quality.</p>
          <a href="#" class="btn btn-primary mt-3">View Menus</a>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="service-item">
          <img class="rounded-circle" src="https://images.unsplash.com/photo-1527525443983-6e60c75fff46?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Vendors">
          <h2 class="mt-4">VENDORS</h2>
          <p class="px-4">Our curated network of trusted vendors includes florists, photographers, and musicians. Each professional is vetted to meet our high standards of quality and service.</p>
          <a href="#" class="btn btn-primary mt-3">Meet Vendors</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Featurette Sections -->
<div class="container">
  <hr class="featurette-divider">

  <div class="row featurette align-items-center">
    <div class="col-md-7">
      <div class="text-center">
        <h2 class="featurette-heading">VENUES <span class="text-muted">Elegance Redefined</span></h2>
      </div>
      <p class="lead">Our venues are more than just spaces - they're canvases for your dreams. From historic mansions to modern lofts, each location offers unique architectural details and customizable layouts.</p>
      <ul class="list-unstyled mt-4">
        <li><i class="fas fa-check-circle mr-2" style="color: var(--medium-brown);"></i> Capacity from 50 to 500+ guests</li>
        <li><i class="fas fa-check-circle mr-2" style="color: var(--medium-brown);"></i> Indoor and outdoor options available</li>
        <li><i class="fas fa-check-circle mr-2" style="color: var(--medium-brown);"></i> Full technical support and lighting</li>
        <li><i class="fas fa-check-circle mr-2" style="color: var(--medium-brown);"></i> Bridal suites and groom's lounges</li>
      </ul>
    </div>
    <div class="col-md-5">
      <img class="featurette-image img-fluid mx-auto" src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Wedding Hall">
    </div>
  </div>

  <hr class="featurette-divider">

  <div class="row featurette align-items-center">
    <div class="col-md-7 order-md-2">
      <div class="text-center">
        <h2 class="featurette-heading">CATERING <span class="text-muted">A Feast for the Senses</span></h2>
      </div>
      <p class="lead">Our culinary team creates memorable dining experiences that reflect your personal taste and style. From passed hors d'oeuvres to multi-course plated dinners, we focus on seasonal ingredients and artistic presentation.</p>
      <div class="row mt-4">
        <div class="col-6">
          <h5 style="color: var(--medium-brown);">Menu Options</h5>
          <ul class="list-unstyled">
            <li>Plated dinners</li>
            <li>Buffet stations</li>
            <li>Cocktail receptions</li>
            <li>Family-style service</li>
          </ul>
        </div>
        <div class="col-6">
          <h5 style="color: var(--medium-brown);">Specialties</h5>
          <ul class="list-unstyled">
            <li>Local & seasonal cuisine</li>
            <li>International flavors</li>
            <li>Custom cake design</li>
            <li>Wine pairings</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-5 order-md-1">
      <img class="featurette-image img-fluid mx-auto" src="https://images.unsplash.com/photo-1547592180-85f173990554?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Catering">
    </div>
  </div>

  <hr class="featurette-divider">

  <div class="row featurette align-items-center">
    <div class="col-md-7">
      <div class="text-center">
        <h2 class="featurette-heading">VENDORS <span class="text-muted">Your Dream Team</span></h2>
      </div>
      <p class="lead">We've partnered with the industry's top professionals to bring every aspect of your wedding to life. Our vendor network includes creative professionals who share our commitment to excellence.</p>
      <div class="row mt-4">
        <div class="col-md-6">
          <div class="vendor-category mb-4">
            <h5 style="color: var(--medium-brown);">Creative</h5>
            <p>Photographers, Videographers, Florists, Stationery</p>
          </div>
          <div class="vendor-category">
            <h5 style="color: var(--medium-brown);">Entertainment</h5>
            <p>Live Bands, DJs, String Quartets, Performers</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="vendor-category mb-4">
            <h5 style="color: var(--medium-brown);">Beauty</h5>
            <p>Hair Stylists, Makeup Artists, Spa Services</p>
          </div>
          <div class="vendor-category">
            <h5 style="color: var(--medium-brown);">Logistics</h5>
            <p>Transportation, Rentals, Lighting, Security</p>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-5">
      <img class="featurette-image img-fluid mx-auto" src="https://images.unsplash.com/photo-1527525443983-6e60c75fff46?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Vendors">
    </div>
  </div>
</div>

<!-- Testimonial Section -->
<section class="py-5 testimonial-section">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="display-4">Kind Words</h2>
      <p class="lead" style="color: var(--medium-brown);">What our couples say about us</p>
    </div>

    <div class="row">
      <div class="col-md-4 mb-4 mb-md-0">
        <div class="card h-100 border-0 shadow-sm">
          <div class="card-body p-4">
            <div class="mb-3" style="color: var(--medium-brown);">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
            </div>
            <p class="card-text mb-4">"They made our wedding dreams come true. Every detail was perfect, from the stunning venue to the delicious food. Our guests are still talking about it!"</p>
            <div class="d-flex align-items-center">
              <div>
                <h6 class="mb-0">Sarah & Michael</h6>
                <small class="text-muted">June Wedding</small>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-4 mb-4 mb-md-0">
        <div class="card h-100 border-0 shadow-sm">
          <div class="card-body p-4">
            <div class="mb-3" style="color: var(--medium-brown);">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
            </div>
            <p class="card-text mb-4">"The team's attention to detail was incredible. They anticipated our needs before we even knew we had them. Our wedding was absolutely flawless."</p>
            <div class="d-flex align-items-center">
              <div>
                <h6 class="mb-0">Jessica & David</h6>
                <small class="text-muted">September Wedding</small>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="card h-100 border-0 shadow-sm">
          <div class="card-body p-4">
            <div class="mb-3" style="color: var(--medium-brown);">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
            </div>
            <p class="card-text mb-4">"Working with them was the best decision we made. They took all the stress out of planning and created a day that perfectly reflected our personalities."</p>
            <div class="d-flex align-items-center">
              <div>
                <h6 class="mb-0">Emily & Robert</h6>
                <small class="text-muted">August Wedding</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Call to Action -->
<section class="py-5" style="background-color: var(--dark-brown); color: var(--white);">
  <div class="container text-center">
    <h2 class="mb-4">Ready to Begin Your Journey?</h2>
    <p class="lead mb-5">Let's create something extraordinary together. Contact us today to start planning your perfect wedding.</p>
    <a href="#" class="btn btn-light btn-lg px-5" style="background-color: var(--light-brown); color: var(--dark-brown); border: none;">Schedule Consultation</a>
  </div>
</section>

<!-- Footer Section -->
<section class="footer-section">
  <footer class="footer">
    <p class="footer_title">Connect With Us</p>
    <div class="footer_social">
      <a href="#" class="footer_icon"><i class="fab fa-facebook-f"></i></a>
      <a href="#" class="footer_icon"><i class="fab fa-instagram"></i></a>
      <a href="#" class="footer_icon"><i class="fab fa-twitter"></i></a>
      <a href="#" class="footer_icon"><i class="fab fa-pinterest"></i></a>
    </div>
    <div class="footer_links mt-3">
      <a href="#" class="text-white mx-2">Privacy Policy</a>
      <a href="#" class="text-white mx-2">Terms of Service</a>
      <a href="#" class="text-white mx-2">Careers</a>
    </div>
    <p class="mt-4">&copy; 2023 Elegant Weddings. All rights reserved.</p>
  </footer>
</section>

<jsp:include page="includes/footer.jsp" />

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">