using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace A2ZSuntours.ViewModels
{
    public class ContactUsViewModel
    {
        
        public string Name { get; set; }
        
        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public string Subject { get; set; }

        [DataType(DataType.MultilineText)]
        public string Message { get; set; }
    }

}