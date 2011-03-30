# rfreechart

* [Homepage](https://github.com/sundbp/rfreechart)
* [Documentation](http://rubydoc.info/gems/rfreechart/frames)

## Description

A simple jruby wrapper around the java library [jfreechart](http://www.jfree.org/jfreechart/).
All it does is provide a structured way to require the jar files. The user refers to the java
classes as usual (i.e. org.jfree.chart.ChartPanel).

Potentially some utilities to enhance productivity and make it more ruby friendly will be added
later as well.

## Examples

This is an excerpts of examples/pie_chart_demo_1.rb:
    
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

## Requirements

* jfreechart jars
* setting the environment variable **RFREECHART_JAR_PATH** as described below

## Install

    $ gem install rfreechart

Download and unpack [jfreechart](http://www.jfree.org/jfreechart/download.html), and
set the environment variable **RFREECHART_JAR_PATH** to the path containg the
jfreechar jars.

## Copyright

Copyright (c) 2011 Patrik Sundberg

See {file:LICENSE.txt} for details.
