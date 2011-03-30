$LOAD_PATH << File.dirname(__FILE__) + "/../lib"
require 'rfreechart'

java_import javax.swing.JPanel

java_import org.jfree.chart.ChartFactory
java_import org.jfree.chart.ChartPanel
java_import org.jfree.data.general.DefaultPieDataset
java_import org.jfree.ui.ApplicationFrame
java_import org.jfree.ui.RefineryUtilities

class PieChartDemo1 < ApplicationFrame

  def create_dataset
    dataset = DefaultPieDataset.new
    dataset.setValue("One", 43.2)
    dataset.setValue("Two", 10.0)
    dataset.setValue("Three", 27.5)
    dataset.setValue("Four", 17.5)
    dataset.setValue("Five", 11.0)
    dataset.setValue("Six", 19.4)
    dataset
  end

  def create_chart(dataset)
    chart = ChartFactory.createPieChart(
      "Pie Chart Demo 1",   # chart title
      dataset,              # data
      true,                 # include legend
      true,
      false
    )

    plot = chart.getPlot()
    plot.setSectionOutlinesVisible(false);
    plot.setNoDataMessage("No data available");
  
    chart
  end

  def create_demo_panel
    chart = create_chart(create_dataset)
    ChartPanel.new(chart)
  end

  def initialize(title)
    super(title)
    setContentPane(create_demo_panel)
  end
end
  
demo = PieChartDemo1.new("Pie Chart Demo 1")
demo.pack()
RefineryUtilities.centerFrameOnScreen(demo)
demo.setVisible(true)
