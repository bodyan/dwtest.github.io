require 'feedjira'
require 'httparty'

module Jekyll
    class RSSCareersDisplay < Generator
        safe true
        priority :high
        def generate(site)

            jekyll_coll = Jekyll::Collection.new(site, 'dw_careers')
            site.collections['dw_careers'] = jekyll_coll

            url = site.config['params']['rssPage']
            xml = HTTParty.get(url).body

            Feedjira::Feed.add_common_feed_entry_element('tt:city', :as => :city)
            Feedjira.parse(xml).entries.each do |entry|
                title = entry.title;
                path = "./_dw_careers/" + title + ".md"
                path = site.in_source_dir(path)
                doc = Jekyll::Document.new(path, { :site => site, :collection => jekyll_coll })
                doc.data['title'] = title;
                doc.data['link'] = entry.url;
                doc.data['city'] = entry.city;
                jekyll_coll.docs << doc
            end
            
        end
    end
end