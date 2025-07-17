package com.app.demo.controller;


import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.app.demo.model.User;
import com.app.demo.services.BookingServices;
import com.app.demo.services.CateringServices;
import com.app.demo.services.EventServices;
import com.app.demo.services.HotelServices;
import com.app.demo.services.UserServices;
import com.app.demo.services.VendorServices;


@Controller
@RequestMapping
public class GeneralController {

	private final UserServices userservice;
	private final HotelServices hotelservice;
	private final EventServices eventservice;
	private final CateringServices caterservice;
	private final VendorServices vendorservice;
	private final BookingServices bookingservice;
	private final JavaMailSender mailSender;

	public GeneralController(UserServices userservice, HotelServices hotelservice,
							 EventServices eventservice, CateringServices caterservice,
							 VendorServices vendorservice, BookingServices bookingservice,
							 JavaMailSender mailSender) {
		this.userservice = userservice;
		this.hotelservice = hotelservice;
		this.eventservice = eventservice;
		this.caterservice = caterservice;
		this.vendorservice = vendorservice;
		this.bookingservice = bookingservice;
		this.mailSender = mailSender;
	}

	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/signin")
	public String login() {
		return "Login";
	}

	@GetMapping("/signup")
	public String register() {
		return "UserRegisteration";
	}

	@GetMapping("/contactus")
	public String contactus() {
		return "ContactUs";
	}

	@GetMapping("/aboutus")
	public String aboutus() {
		return "Aboutus";
	}

	@GetMapping("/userhome")
	public String userhome(ModelMap model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("User_id");
		if (id == null) return "redirect:/signin";

		model.addAttribute("user_hotel_count", hotelservice.hotelCount());
		model.addAttribute("user_event_count", eventservice.eventCount());
		model.addAttribute("user_catering_count", caterservice.cateringcount());
		model.addAttribute("user_vendor_count", vendorservice.vendorcount());
		model.addAttribute("user_booking_count", bookingservice.bookingcountById(id));
		model.addAttribute("user_bookingpaid_count", bookingservice.bookingcountPaidById(id));
		model.addAttribute("user_bookingunpaid_count", bookingservice.bookingcountunPaidById(id));
		model.addAttribute("user_bookingcancelbyadmin_count", bookingservice.bookingcountcancelByAdminById(id));
		model.addAttribute("user_bookingcancelbyuser_count", bookingservice.bookingcountcancelByUserById(id));
		model.addAttribute("user_bookingpending_count", bookingservice.bookingPendingcountById(id));

		return "Userhome";
	}

	@GetMapping("/adminhome")
	public String adminhome(ModelMap model) {
		model.addAttribute("admin_user_count", userservice.userCount());
		model.addAttribute("admin_hotel_count", hotelservice.hotelCount());
		model.addAttribute("admin_event_count", eventservice.eventCount());
		model.addAttribute("admin_catering_count", caterservice.cateringcount());
		model.addAttribute("admin_vendor_count", vendorservice.vendorcount());
		model.addAttribute("admin_booking_count", bookingservice.bookingcount());
		model.addAttribute("admin_bookingpaid_count", bookingservice.bookingcountPaid());
		model.addAttribute("admin_bookingunpaid_count", bookingservice.bookingcountunPaid());
		model.addAttribute("admin_bookingcancelbyadmin_count", bookingservice.bookingcountcancelByAdmin());
		model.addAttribute("admin_bookingcancelbyuser_count", bookingservice.bookingcountcancelByUser());
		model.addAttribute("admin_bookingpending_count", bookingservice.bookingpendingcount());

		return "AdminHome";
	}

	@GetMapping("/subadminhome")
	public String subAdminHome(ModelMap model) {
		model.addAttribute("subadmin_user_count", userservice.userCount());
		model.addAttribute("subadmin_hotel_count", hotelservice.hotelCount());
		model.addAttribute("subadmin_event_count", eventservice.eventCount());
		model.addAttribute("subadmin_catering_count", caterservice.cateringcount());
		model.addAttribute("subadmin_vendor_count", vendorservice.vendorcount());
		model.addAttribute("subadmin_booking_count", bookingservice.bookingcount());
		model.addAttribute("subadmin_bookingpaid_count", bookingservice.bookingcountPaid());
		model.addAttribute("subadmin_bookingunpaid_count", bookingservice.bookingcountunPaid());
		model.addAttribute("subadmin_bookingcancelbyadmin_count", bookingservice.bookingcountcancelByAdmin());
		model.addAttribute("subadmin_bookingcancelbyuser_count", bookingservice.bookingcountcancelByUser());
		model.addAttribute("subadmin_bookingpending_count", bookingservice.bookingpendingcount());

		return "SubAdminHome";
	}

	@GetMapping("/superadminhome")
	public String superAdminHome(ModelMap model) {
		model.addAttribute("superadmin_user_count", userservice.userCount());
		model.addAttribute("superadmin_hotel_count", hotelservice.hotelCount());
		model.addAttribute("superadmin_event_count", eventservice.eventCount());
		model.addAttribute("superadmin_catering_count", caterservice.cateringcount());
		model.addAttribute("superadmin_vendor_count", vendorservice.vendorcount());
		model.addAttribute("superadmin_booking_count", bookingservice.bookingcount());
		model.addAttribute("superadmin_bookingpaid_count", bookingservice.bookingcountPaid());
		model.addAttribute("superadmin_bookingunpaid_count", bookingservice.bookingcountunPaid());
		model.addAttribute("superadmin_bookingcancelbyadmin_count", bookingservice.bookingcountcancelByAdmin());
		model.addAttribute("superadmin_bookingcancelbyuser_count", bookingservice.bookingcountcancelByUser());
		model.addAttribute("superadmin_bookingpending_count", bookingservice.bookingpendingcount());

		return "SuperAdminHome";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/signin";
	}

	@GetMapping("/loginfailed")
	public String loginfailed() {
		return "LoginFailed";
	}

	@PostMapping("/contactForm")
	public String contactusHandler(@RequestParam("FirstName") String fName,
								   @RequestParam("LastName") String lName,
								   @RequestParam("Email") String email,
								   @RequestParam("Message") String messageText,
								   ModelMap model) {

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			User adminUser = userservice.findByRole("Admin");

			helper.setFrom(email, "EXQUISITE");
			helper.setTo(adminUser.getEmail());
			helper.setSubject("User Query");

			String content = """
                <p>First Name : %s</p>
                <p>Last Name : %s</p>
                <p>Email : %s</p>
                <br>
                <p>Message / Query / Feedback:</p>
                <h1 style='color:orange'>%s</h1>
            """.formatted(fName, lName, email, messageText);

			helper.setText(content, true);
			mailSender.send(message);

			model.addAttribute("success", "Your message was sent successfully. We'll respond shortly.");
		} catch (Exception e) {
			model.addAttribute("error", "Message sending failed. Please try again.");
		}

		return "ContactUs";
	}
}
