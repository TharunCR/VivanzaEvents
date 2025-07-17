<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container-fluid">
    <!-- Brand on the far left -->
    <a class="navbar-brand me-auto" href="#" style="font-family: 'Montserrat', sans-serif; font-weight: 600;">
      <span style="color: #4e9af1">Viva</span><span style="color: #f8f9fa">nza</span>
    </a>

    <!-- Toggler button (for mobile) -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navigation items pushed to far right -->
    <div class="collapse navbar-collapse" id="navbarContent">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="signin">Sign In</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup">Sign Up</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactus">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="aboutus">About</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<style>
  /* Transparent background with blur effect */
  .navbar {
    background-color: rgba(15, 15, 15, 0.2) !important;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    padding: 1rem 2rem;
    transition: all 0.4s ease;
  }

  /* Scrolled state */
  .navbar.scrolled {
    background-color: rgba(15, 15, 15, 0.95) !important;
    padding: 0.7rem 2rem;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  }

  .nav-link {
    color: rgba(255, 255, 255, 0.9) !important;
    font-weight: 500;
    margin: 0 0.8rem;
    position: relative;
    padding: 0.5rem 0;
  }

  .nav-link::after {
    content: '';
    position: absolute;
    width: 0;
    height: 2px;
    bottom: 0;
    left: 0;
    background-color: #4e9af1;
    transition: width 0.3s ease;
  }

  .nav-link:hover::after {
    width: 100%;
  }

  .navbar-brand {
    font-size: 1.7rem;
    letter-spacing: 0.5px;
  }
</style>

<script>
  // Scroll effect
  window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    navbar.classList.toggle('scrolled', window.scrollY > 20);
  });
</script>