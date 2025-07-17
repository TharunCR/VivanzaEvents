<jsp:include page="includes/header.jsp" />

<!-- Simple Back Link (Top Left without strip) -->
<a href="/" class="position-fixed top-0 start-0 m-4 text-dark z-3" style="font-size: 1.2rem; text-decoration: none;">
    <i class="fas fa-arrow-left me-2"></i>Back to Home
</a>

<!-- Hero Section with Full-width Image -->
<section class="hero-section vh-100 d-flex align-items-center" style="
    background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
                url('https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
    background-size: cover;
    background-position: center;
">
    <div class="container text-white">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h1 class="display-3 mb-4" style="font-family: 'Playfair Display', serif; font-weight: 700; text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">Elegant Events<br>Unforgettable Moments</h1>
                <p class="lead mb-5" style="font-size: 1.5rem; text-shadow: 1px 1px 2px rgba(0,0,0,0.5);">Discover our exquisite venue for weddings, corporate events, and special celebrations</p>
                <a href="#about" class="btn btn-light btn-lg px-5 py-3 rounded-pill shadow">Explore Our Venue</a>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about" class="py-6 bg-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-5 mb-lg-0">
                <img src="https://images.unsplash.com/photo-1555244162-803834f70033?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-lg" alt="Luxury Venue">
            </div>
            <div class="col-lg-6 ps-lg-5">
                <h6 class="text-uppercase text-muted mb-3">Our Story</h6>
                <h2 class="display-5 mb-4" style="font-family: 'Playfair Display', serif;">A Legacy of <span class="text-primary">Excellence</span></h2>
                <p class="lead text-muted mb-4">Founded in 2010, our venue has become synonymous with sophistication and impeccable service. We've hosted over 1,000 events, each crafted with meticulous attention to detail.</p>
                <div class="d-flex mb-4">
                    <div class="pe-4">
                        <div class="bg-light p-3 rounded-circle d-inline-flex mb-3">
                            <i class="fas fa-calendar-check text-primary fa-lg"></i>
                        </div>
                        <h5 class="mb-1">10+ Years</h5>
                        <p class="text-muted mb-0">Of experience</p>
                    </div>
                    <div>
                        <div class="bg-light p-3 rounded-circle d-inline-flex mb-3">
                            <i class="fas fa-users text-primary fa-lg"></i>
                        </div>
                        <h5 class="mb-1">5,000+</h5>
                        <p class="text-muted mb-0">Satisfied clients</p>
                    </div>
                </div>
                <a href="/signin" class="btn btn-outline-dark px-4 py-2 rounded-pill">Book a Tour</a>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="py-6 bg-light">
    <div class="container">
        <div class="text-center mb-6">
            <h6 class="text-uppercase text-muted mb-3">Our Services</h6>
            <h2 class="display-5 mb-4" style="font-family: 'Playfair Display', serif;">Creating <span class="text-primary">Perfect</span> Events</h2>
            <p class="lead text-muted w-75 mx-auto">From intimate gatherings to grand celebrations, we provide everything you need for a flawless event.</p>
        </div>

        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="card border-0 h-100 overflow-hidden" style="border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05);">
                    <div class="card-img-top overflow-hidden" style="height: 250px;">
                        <img src="https://images.unsplash.com/photo-1519225421980-715cb0215aed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                             class="img-fluid w-100 h-100" style="object-fit: cover; transition: transform 0.5s;" alt="Weddings">
                    </div>
                    <div class="card-body p-4">
                        <h4 class="card-title mb-3" style="font-family: 'Playfair Display', serif;">Weddings</h4>
                        <p class="card-text text-muted mb-4">Your dream wedding brought to life with our exquisite venues and dedicated planning team.</p>
                        <a href="/signin" class="btn btn-link text-primary ps-0">Learn More <i class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card border-0 h-100 overflow-hidden" style="border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05);">
                    <div class="card-img-top overflow-hidden" style="height: 250px;">
                        <img src="https://images.unsplash.com/photo-1431540015161-0bf868a2d407?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                             class="img-fluid w-100 h-100" style="object-fit: cover; transition: transform 0.5s;" alt="Corporate Events">
                    </div>
                    <div class="card-body p-4">
                        <h4 class="card-title mb-3" style="font-family: 'Playfair Display', serif;">Corporate Events</h4>
                        <p class="card-text text-muted mb-4">Professional spaces equipped with cutting-edge technology for productive meetings and conferences.</p>
                        <a href="/signin" class="btn btn-link text-primary ps-0">Learn More <i class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card border-0 h-100 overflow-hidden" style="border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05);">
                    <div class="card-img-top overflow-hidden" style="height: 250px;">
                        <img src="https://images.unsplash.com/photo-1511795409834-ef04bbd61622?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80"
                             class="img-fluid w-100 h-100" style="object-fit: cover; transition: transform 0.5s;" alt="Social Gatherings">
                    </div>
                    <div class="card-body p-4">
                        <h4 class="card-title mb-3" style="font-family: 'Playfair Display', serif;">Social Gatherings</h4>
                        <p class="card-text text-muted mb-4">Celebrate life's special moments in our beautifully designed spaces with custom catering options.</p>
                        <a href="/signin" class="btn btn-link text-primary ps-0">Learn More <i class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Gallery Section -->
<section class="py-6 bg-white">
    <div class="container">
        <div class="text-center mb-6">
            <h6 class="text-uppercase text-muted mb-3">Gallery</h6>
            <h2 class="display-5 mb-4" style="font-family: 'Playfair Display', serif;">Our <span class="text-primary">Venue</span> in Pictures</h2>
        </div>

        <div class="row g-3">
            <div class="col-md-4">
                <img src="https://images.unsplash.com/photo-1530103862676-de8c9debad1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-sm w-100" style="height: 300px; object-fit: cover;" alt="Grand Ballroom">
            </div>
            <div class="col-md-4">
                <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-sm w-100" style="height: 300px; object-fit: cover;" alt="Outdoor Ceremony">
            </div>
            <div class="col-md-4">
                <img src="https://images.unsplash.com/photo-1511578314322-379afb476865?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-sm w-100" style="height: 300px; object-fit: cover;" alt="Dining Area">
            </div>
            <div class="col-md-6 mt-3">
                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-sm w-100" style="height: 350px; object-fit: cover;" alt="Building Exterior">
            </div>
            <div class="col-md-6 mt-3">
                <img src="https://images.unsplash.com/photo-1601924994987-69e26d50dc26?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                     class="img-fluid rounded-3 shadow-sm w-100" style="height: 350px; object-fit: cover;" alt="Conference Room">
            </div>
        </div>
    </div>
</section>

<!-- Testimonials -->
<section class="py-6 bg-light">
    <div class="container">
        <div class="text-center mb-6">
            <h6 class="text-uppercase text-muted mb-3">Testimonials</h6>
            <h2 class="display-5 mb-4" style="font-family: 'Playfair Display', serif;">What Our <span class="text-primary">Clients</span> Say</h2>
        </div>

        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 15px;">
                    <div class="card-body p-5">
                        <div class="mb-4">
                            <img src="https://randomuser.me/api/portraits/women/43.jpg" class="rounded-circle mb-3" width="80" alt="Sarah Johnson">
                            <h5 class="mb-1">Sarah Johnson</h5>
                            <p class="text-muted">Wedding Client</p>
                        </div>
                        <p class="card-text text-muted mb-4">"Our wedding was absolutely magical thanks to the incredible team at this venue. Every detail was perfect!"</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 15px;">
                    <div class="card-body p-5">
                        <div class="mb-4">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" class="rounded-circle mb-3" width="80" alt="Michael Chen">
                            <h5 class="mb-1">Michael Chen</h5>
                            <p class="text-muted">Corporate Client</p>
                        </div>
                        <p class="card-text text-muted mb-4">"The professionalism and attention to detail made our annual conference the best one yet. Highly recommended!"</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 15px;">
                    <div class="card-body p-5">
                        <div class="mb-4">
                            <img src="https://randomuser.me/api/portraits/women/65.jpg" class="rounded-circle mb-3" width="80" alt="Emily Rodriguez">
                            <h5 class="mb-1">Emily Rodriguez</h5>
                            <p class="text-muted">Birthday Party</p>
                        </div>
                        <p class="card-text text-muted mb-4">"My daughter's quinceañera was breathtaking. The venue transformed our vision into reality beyond our expectations."</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-6 bg-primary text-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <h2 class="display-5 mb-3" style="font-family: 'Playfair Display', serif;">Ready to Plan Your Event?</h2>
                <p class="lead mb-0">Contact us today to schedule a tour or discuss your event requirements.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a href="/signin" class="btn btn-light btn-lg px-5 py-3 rounded-pill shadow">Get Started</a>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="py-6 bg-dark text-white">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h5 class="text-uppercase mb-4" style="font-family: 'Playfair Display', serif;">Event Horizon</h5>
                <p class="text-muted mb-4">Creating extraordinary experiences through exceptional service and stunning venues.</p>
                <div class="d-flex">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f fa-lg"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram fa-lg"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-linkedin-in fa-lg"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4">Quick Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="/" class="text-muted">Home</a></li>
                    <li class="mb-2"><a href="/about" class="text-muted">About</a></li>
                    <li class="mb-2"><a href="/services" class="text-muted">Services</a></li>
                    <li class="mb-2"><a href="/gallery" class="text-muted">Gallery</a></li>
                    <li class="mb-2"><a href="/contact" class="text-muted">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4">Contact Info</h5>
                <ul class="list-unstyled text-muted">
                    <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> 123 Event Street, Chennai</li>
                    <li class="mb-2"><i class="fas fa-phone me-2"></i> +1 234 567 8900</li>
                    <li class="mb-2"><i class="fas fa-envelope me-2"></i> info@eventhorizon.com</li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h5 class="text-uppercase mb-4">Newsletter</h5>
                <p class="text-muted mb-3">Subscribe for updates and special offers</p>
                <div class="input-group mb-3">
                    <input type="email" class="form-control bg-dark border-secondary" placeholder="Your Email" style="color: white;">
                    <button class="btn btn-primary" type="button">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        </div>
        <hr class="my-5 bg-secondary">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="text-muted mb-0">&copy; 2023 Event Horizon. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="text-muted mb-0">Designed with <i class="fas fa-heart text-danger"></i></p>
            </div>
        </div>
    </div>
</footer>

<jsp:include page="includes/footer.jsp" />

<style>
    @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap');

    body {
        font-family: 'Roboto', sans-serif;
        overflow-x: hidden;
    }

    h1, h2, h3, h4, h5, h6 {
        font-family: 'Playfair Display', serif;
    }

    .hero-section {
        position: relative;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-5px);
        transition: transform 0.3s ease;
    }

    .card-img-top img {
        transition: transform 0.5s ease;
    }

    .card:hover .card-img-top img {
        transform: scale(1.05);
    }

    .btn {
        transition: all 0.3s ease;
    }

    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    a {
        transition: color 0.3s ease;
    }

    a:hover {
        text-decoration: none;
    }

    .z-3 {
        z-index: 3;
    }

    .py-6 {
        padding-top: 5rem;
        padding-bottom: 5rem;
    }

    .mb-6 {
        margin-bottom: 5rem;
    }
</style>