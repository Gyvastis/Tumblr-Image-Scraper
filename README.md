# Tumblr Image Scraper
## A simple Tumblr image scraper based on Ruby 

Every now and then, you find a [Tumblr](https://tumblr.com) blog which is just *awesome*.

*Tumblr Image Scraper* allows you to quickly and easily download an entire image archive of a specified Tumblr blog.

The only required parameter is the *username* (Tumblr blog name). 

Basic usage:

`ruby tumblr_scraper.rb <username> <directory to save images to> <number of images to download>`

Script sleeps up to 3 seconds after every page opened in order of Tumblr to be less suspicious. Consider using proxies on your own knowledge.

Happy scraping!