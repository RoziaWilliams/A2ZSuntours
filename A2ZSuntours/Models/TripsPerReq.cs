//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace A2ZSuntours.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TripsPerReq
    {
        public int TripsPerReqID { get; set; }
        public int TripReqID { get; set; }
        public Nullable<System.DateTime> TripDate { get; set; }
        public Nullable<System.TimeSpan> Triptime { get; set; }
        public int CustCount { get; set; }
        public string CustLoc { get; set; }
    
        public virtual TripRequest TripRequest { get; set; }
    }
}
