namespace PR17
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

     public partial class Entities : DbContext
    {
        private static Entities context;

        public static Entities GetContext()
        {
            if (context == null) context = new Entities();
            return context;
        }

    }
}
