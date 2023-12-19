require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
    it 'displays the first three posts with the right content' do
        posts = [
            create(:post, image_link: 'image1.jpeg', title: 'post 1'),
            create(:post, image_link: 'image2.jpeg', title: 'post 2'),
            create(:post, image_link: 'image3.jpeg', title: 'post 3')
        ]
        allow(Post).to receive(:first).with(3).and_return(posts)

        render

        posts.each do |post|
            expect(rendered).to have_selector("a.block[href='#{post_path(post)}']") do
                expect(rendered).to have_selector("img.h-56.xl\\:h-96.w-full.object-cover[src='#{post.image_link}']")
                expect(rendered).to have_selector("h1.text-xl.font-bold.xl\\:text-2xl.space-y-9", text: post.title)
              end
        end
    end
end