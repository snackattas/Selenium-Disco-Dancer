require "selenium-webdriver"
require 'securerandom'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'http://google.com'

driver.manage.window.move_to(0,0)
driver.manage.window.maximize
max_height = driver.manage.window.size.height
max_width = driver.manage.window.size.width

driver.manage.window.resize_to(0, 0)
min_height = driver.manage.window.size.height
min_width = driver.manage.window.size.width

times = 100
width_range = max_width - min_width
height_range = max_height - min_height
width_step = width_range / times
height_step = height_range / times

width_interval = Range.new(min_width, max_width).step(width_step).to_a
height_interval = Range.new(min_width, max_width).step(height_step).to_a



times.times do |i|
  driver.manage.window.move_to(
    Random.rand(200..600), Random.rand(200..600))

  driver.manage.window.resize_to(width_interval[i], height_interval[i])
  driver.execute_script("document.body.style.backgroundColor = '##{SecureRandom.hex(3)}';")
end
