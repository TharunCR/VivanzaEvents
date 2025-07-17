<jsp:include page="includes/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    :root {
        --black: #222;
        --gray-dark: #555;
        --gray-medium: #999;
        --gray-light: #eee;
        --white: #fff;
    }

    body {
        font-family: 'Helvetica Neue', sans-serif;
        background: var(--white);
        color: var(--black);
        line-height: 1.6;
    }

    .back-btn {
        position: fixed;
        top: 20px;
        left: 20px;
        color: var(--gray-dark);
        text-decoration: none;
        font-size: 14px;
        z-index: 100;
        background: var(--white);
        padding: 8px 12px;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transition: all 0.2s ease;
    }

    .back-btn:hover {
        color: var(--black);
        transform: translateX(-2px);
    }

    .contact-hero {
        background: var(--black);
        color: var(--white);
        padding: 100px 0 60px;
        text-align: center;
    }

    .contact-container {
        max-width: 1000px;
        margin: -40px auto 0;
        padding: 0 20px;
    }

    .contact-card {
        background: var(--white);
        border-radius: 8px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        padding: 40px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 40px;
    }

    .contact-form input,
    .contact-form textarea {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid var(--gray-light);
        border-radius: 4px;
        font-family: inherit;
    }

    .contact-form textarea {
        min-height: 120px;
    }

    .submit-btn {
        background: var(--black);
        color: var(--white);
        border: none;
        padding: 12px 25px;
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .submit-btn:hover {
        background: var(--gray-dark);
    }

    .contact-info {
        background: var(--gray-light);
        padding: 30px;
        border-radius: 8px;
    }

    .info-item {
        margin-bottom: 25px;
    }

    .info-item i {
        margin-right: 10px;
        color: var(--gray-dark);
    }

    .alert {
        padding: 12px;
        margin-bottom: 20px;
        border-radius: 4px;
    }

    .alert-error {
        background: #ffeeee;
        color: #c00;
    }

    .alert-success {
        background: #eeffee;
        color: #090;
    }

    @media (max-width: 768px) {
        .contact-card {
            grid-template-columns: 1fr;
        }
    }
</style>

<a href="/" class="back-btn">
    <i class="fas fa-chevron-left"></i> Back to Home
</a>

<section class="contact-hero">
    <h1>Get in Touch</h1>
    <p>We'd love to hear from you</p>
</section>

<div class="contact-container">
    <div class="contact-card">
        <div class="contact-form">
            <c:if test="${error != null}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form action="/contactForm" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="text" name="FirstName" placeholder="First Name" required>
                <input type="text" name="LastName" placeholder="Last Name" required>
                <input type="email" name="Email" placeholder="Email Address" required>
                <textarea name="Message" placeholder="Your message..." required></textarea>
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>

        <div class="contact-info">
            <div class="info-item">
                <h3><i class="fas fa-map-marker-alt"></i> Our Office</h3>
                <p>123 Business Avenue, San Francisco</p>
            </div>
            <div class="info-item">
                <h3><i class="fas fa-phone"></i> Phone</h3>
                <p>+1 (555) 123-4567</p>
            </div>
            <div class="info-item">
                <h3><i class="fas fa-envelope"></i> Email</h3>
                <p>contact@example.com</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />