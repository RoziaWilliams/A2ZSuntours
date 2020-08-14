using A2ZSuntours.ViewModels;
using System;
using System.Net.Mail;
using System.Web.Mvc;


namespace A2ZSuntours.Controllers
{
    public class ContactUsController : Controller
    {
        [HttpGet]
        public ActionResult ContactUs()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ContactUs(ContactUsViewModel vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    MailMessage msz = new MailMessage();
                    msz.From = new MailAddress(vm.Email);//Email which you are getting 
                                                         //from contact us page 
                    msz.To.Add("rjoseph288@gmail.com");//Where mail will be sent 
                    msz.Subject = " A2ZSuntours Form-Client Name: " + vm.Name + " Subject- " + vm.Subject;                  
                    msz.Body = vm.Name + " is trying to contact you through A2ZSuntours Contact Us Form. With the following message: '" 
                        + vm.Message + ".' Please Contact "+ vm.Name + " at " + vm.Email + " or at phone number:  " + vm.PhoneNumber + "." ;
                    SmtpClient smtp = new SmtpClient();

                    smtp.Host = "smtp.gmail.com";

                    smtp.Port = 587;

                    smtp.Credentials = new System.Net.NetworkCredential
                    ("rjoseph288@gmail.com", "roseprincess.12");

                    smtp.EnableSsl = true;
                    smtp.Send(msz);

                    //ViewBag.Message = $"Thank you for Contacting us ";

                    ModelState.Clear();
                    ViewBag.result = "Record Inserted Successfully!";
                    RedirectToAction("ContactUs");
                }
                catch (Exception ex)
                {
                    ModelState.Clear();
                    ViewBag.Message = $" Sorry we are facing Problem here {ex.Message}";
                }
            }
            
          return View();
           
        }
        public ActionResult Error()
        {
            return View();
        }
    }
}