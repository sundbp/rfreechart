require 'rfreechart/version'

require 'java'

module Rfree
  
  def self.jars
    [
      'jcommon-1.0.16',
      'swtgraphics2d',
      'jfreechart-1.0.13',
      'jfreechart-1.0.13-swt',
      'jfreechart-1.0.13-experimental',
      'iText-2.1.5'
    ]
  end

  Rfree.jars.each do |jar|
    raise "You must set RFREECHART_JAR_PATH!" if ENV['RFREECHART_JAR_PATH'].nil?
    begin
      require File.join(ENV['RFREECHART_JAR_PATH'], jar)
    rescue LoadError => e
      STDERR.puts e.message
      STDERR.puts "Make sure you have set RFREECHART_JAR_PATH to the path where your jfreechart jars are stored."
      exit -1
    end
  end
end