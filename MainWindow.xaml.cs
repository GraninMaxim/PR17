using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PR17
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Entities db = Entities.GetContext();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            db.Бухгалтерия.Load();
            DataGrid1.ItemsSource = db.Бухгалтерия.Local.ToBindingList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            Window1 window = new Window1();
            window.Show();
            DataGrid1.Items.Refresh();
        }

        private void Change_Click(object sender, RoutedEventArgs e)
        {

            int indexRow = DataGrid1.SelectedIndex;
            if (indexRow != -1)
            {
                Бухгалтерия row = (Бухгалтерия)DataGrid1.Items[indexRow];
                KodZapisi.id = row.ID;
                Change change = new Change();
                change.ShowDialog();
                DataGrid1.Items.Refresh();
                DataGrid1.Focus();
            }
        }

        private void Delete_CLick(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result;
            result = MessageBox.Show("Вы действительно хотите удалить запись ?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    Бухгалтерия row = (Бухгалтерия)DataGrid1.SelectedItems[0];
                    db.Бухгалтерия.Remove(row);
                    db.SaveChanges();

                }
                catch (ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберете запись");
                }
            }
        }

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                var row = (Бухгалтерия)DataGrid1.Items[i];
                string findContent = row.НазваниеОрг;
                try
                {
                    if (findContent != null && findContent.Contains(find.Text))
                    {
                        object item = DataGrid1.Items[i];
                        DataGrid1.SelectedItem = item;
                        DataGrid1.ScrollIntoView(item);
                        DataGrid1.Focus();
                        break;
                    }
                }
                catch
                {

                }
            }
        }

        List<Бухгалтерия> _sum;
        private void filter_Click(object sender, RoutedEventArgs e)
        {
            _sum = db.Бухгалтерия.ToList();
            var filtered = _sum.Where(_sum => Convert.ToString(_sum.Коммерческая) == filterbox.Text);
            DataGrid1.ItemsSource = filtered;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void Clear (object sender, RoutedEventArgs e)
        {
            DataGrid1.ItemsSource = db.Бухгалтерия.Local.ToBindingList();
            filterbox.Clear();
        }
    }
}
