//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web_Based_Task_Manger.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Dashboard
    {
        public int Dashboard_ID { get; set; }
        public string Task_summary { get; set; }
        public string Team_summary { get; set; }
        public string User_summary { get; set; }
        public string Progress_status { get; set; }
        public string Project_summary { get; set; }
        public Nullable<int> User_ID { get; set; }
    
        public virtual User User { get; set; }
    }
}
