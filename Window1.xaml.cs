using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PR17
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        Entities db = Entities.GetContext();
        Бухгалтерия p1 = new Бухгалтерия();
        public Window1()
        {
            InitializeComponent();
        }

        private void AddOrg_Click(object sender, RoutedEventArgs e)
        {
            int.TryParse(Id.Text, out int d);
            DateTime DT = Convert.ToDateTime(date.SelectedDate);
            int.TryParse(sum.Text, out int s);
            StringBuilder errors = new StringBuilder();
            if (Id.Text.Length == 0) errors.AppendLine("Введите номер ID");
            if (date.Text.Length == 0) errors.AppendLine("Введите дату");
            if (name.Text.Length == 0) errors.AppendLine("Введите название организации");
            if (adres.Text.Length == 0) errors.AppendLine("Введите адрес Организации");
            if (vid.Text.Length == 0) errors.AppendLine("Введите вид расходов");
            if (Kom.Text.Length == 0) errors.AppendLine("Введите вид организации");
            if (s == 0 && s < 0) errors.AppendLine("Задайте правильную сумму");
            p1.ID = d;
            p1.Дата = DT;
            p1.НазваниеОрг = name.Text;
            p1.АдресОрг = adres.Text;
            p1.ВидЗатрат = vid.Text;
            p1.Коммерческая = Kom.Text;
            p1.Сумма = s;
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            try
            {
                db.Бухгалтерия.Add(p1);
                db.SaveChanges();
                this.Close();  

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
