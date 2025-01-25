module DatoQueries
  def homepage_query
    GQLi::DSL.query do
      __node('site: _site') {
        __node('favicon: faviconMetaTags') {
          ___ Dato::Fragments::MetaTags
        } }
      allPosts(orderBy: [:date_DESC], first: 20) {
        title
        slug
        excerpt
        date
        coverImage {
          responsiveImage(imgixParams: { fm: :jpg, fit: :crop, w: 2000, h: 1000 }) {
            ___ Dato::Fragments::ResponsiveImage
          }
        }
        author {
          name
          picture {
            responsiveImage(imgixParams: { fm: :jpg, fit: :crop, w: 100, h: 100, sat: -100 }) {
              ___ Dato::Fragments::ResponsiveImage
            }
          }
        }
      }
    end
  end

  def blog_post_query(slug)
    GQLi::DSL.query do
      post(filter: { slug: { eq: slug } }) {
        title
        slug
        date
        author {
          name
          picture {
            responsiveImage(imgixParams: { fm: :jpg, fit: :crop, w: 100, h: 100, sat: -100 }) {
              ___ Dato::Fragments::ResponsiveImage
            }
          }
        }
        coverImage {
          responsiveImage(imgixParams: { fm: :jpg, fit: :crop, w: 2000, h: 1000 }) {
            ___ Dato::Fragments::ResponsiveImage
          }
        }
        content {
          value
          blocks {
            __typename
            __on('ImageBlockRecord') do
              id
              image {
                responsiveImage(imgixParams: { fm: :jpg, fit: :crop, w: 2000, h: 1000 }) {
                  ___ Dato::Fragments::ResponsiveImage
                }
              }
            end
          }
        }
      }
    end
  end
end
