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
    
    public partial class Report
    {
        public int Report_ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<int> User_ID { get; set; }
        public string Report_type { get; set; }
        public string Report_data { get; set; }
        public Nullable<int> Department_ID { get; set; }
        public Nullable<int> Project_ID { get; set; }
        public System.DateTime Created_at { get; set; }
        public System.DateTime Updated_at { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual Project Project { get; set; }
        public virtual User User { get; set; }
    }
}