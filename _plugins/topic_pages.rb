# frozen_string_literal: true

# Auto-generates a topic page (/topics/<tag>/) for every tag used in _notes.
# Add a new tag to any note in Obsidian, publish, and its page exists.
module Jekyll
  class TopicPagesGenerator < Generator
    safe true
    priority :low

    def generate(site)
      return unless site.collections.key?('notes')
      return if site.collections['notes'].docs.nil?

      tags = {}
      site.collections['notes'].docs.each do |doc|
        Array(doc.data['tags']).each do |t|
          t = t.to_s.strip
          tags[t] = true unless t.empty?
        end
      end

      tags.keys.sort.each do |tag|
        slug = Utils.slugify(tag)
        next if slug.empty?
        next if site.pages.any? { |p| p.data['tag'] == tag }

        page = PageWithoutAFile.new(site, site.source, '', "topic-#{slug}.md")
        page.content = ''
        page.data['layout'] = 'topic'
        page.data['tag'] = tag
        page.data['title'] = tag
        page.data['permalink'] = "/topics/#{slug}/"
        site.pages << page
      end
    end
  end
end