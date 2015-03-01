# Tumblr Image Scraper
## A simple Tumblr image scraper based on Ruby 

Every now and then, you find a [Tumblr](https://tumblr.com) blog which is just *awesome*.

*Tumblr Image Scraper* allows you to quickly and easily download an entire image archive of a specified Tumblr blog.

Basic usage:
`ruby tumblr_scrape.rb <username> <directory to download> <number of images to download>`

The only required parameter is the Tumblr username: the current working directory is the default download location, and 9000 is (currently) the default max images. There is a random few-second pause between images so that no one accidentally slams Tumblrs servers.

Happy scraping!
