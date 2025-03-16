#!/usr/bin/env ruby
# publish_post.rb - A script to easily add new posts to the Jekyll blog
# Usage: ruby publish_post.rb "Your Post Title" [category]

require 'date'
require 'fileutils'

# Get post title from command line argument
post_title = ARGV[0]
category = ARGV[1] || "general"

if post_title.nil? || post_title.empty?
  puts "Error: Please provide a post title"
  puts "Usage: ruby publish_post.rb \"Your Post Title\" [category]"
  exit 1
end

# Create slug from title
slug = post_title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

# Create filename with date
date = Date.today.strftime('%Y-%m-%d')
filename = "_posts/#{date}-#{slug}.md"

# Create the _posts directory if it doesn't exist
FileUtils.mkdir_p("_posts")

# Create front matter
front_matter = <<~FRONT_MATTER
---
layout: post
title: "#{post_title}"
date: #{date} #{Time.now.strftime('%H:%M:%S')} -0000
categories: #{category}
---

Write your post content here.

## Add a heading

Add some content below the heading.

### Add a subheading

- List item 1
- List item 2
- List item 3

```ruby
# Add some code
puts "Hello, Jekyll!"
```

![Add an image description](/assets/images/placeholder.svg)

> Add a blockquote

FRONT_MATTER

# Write the file
File.open(filename, 'w') { |file| file.write(front_matter) }

puts "Post created: #{filename}"
puts "You can now edit this file to add your content." 