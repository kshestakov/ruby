# Про dsl на блоках:
# Реализовать DSL, генерирующий html(json, xml, u2y) разметку. Пример использования:
# builder = HtmlBuilder.draw do
#   html do
#     form(action: '/', method: 'POST') do
#       label 'First name:', for: 'first_name'
#       input type: 'text', id: 'first_name', name: 'first_name', value: 'John'
#       label 'Last name:', for: 'last_name'
#       input type: 'text', id: 'last_name', name: 'last_name', value: 'Doe'
#       input type: 'submit', value: 'Submit'
#     end
#   end
# end

# builder.to_s

# <html>
#   <form action="/" method="POST">
#     <label for="first_name">First name:</label>
#     <input type="text" id="first_name" name="first_name" value="John">
#     <label for="last_name">Last name:</label>
#     <input type="text" id="last_name" name="last_name" value="Doe">
#     <input type="submit" value="Submit">
#   </form>
# </html>

class HtmlBuilder
  def initialize(indent_level = 0, &block)
    @level = indent_level
    @result = ''
    instance_eval(&block) if block_given?
  end

  def self.draw(&block)
    new(&block)
  end

  def method_missing(tag, *args, &block)
    arguments = args.clone
    attributes = arguments.last.is_a?(Hash) ? arguments.pop : {}
    content = arguments.first || ''
    indentation = '  ' * @level

    @result << "#{indentation}<#{tag}#{attributes_to_s attributes}>"
    @result << "\n#{HtmlBuilder.new(@level + 1, &block)}" if block_given?
    @result << "#{content}#{block_given? ? indentation : ''}</#{tag}>\n"
  end

  def attributes_to_s(attributes)
    return '' if attributes.empty?

    ' ' + attributes.map { |attr, value| "#{attr}=\"#{value}\"" }.join(' ')
  end

  def to_s
    @result
  end

  def respond_to_missing?(tag)
    %w[a
       abbr
       acronym
       address
       applet
       area
       article
       aside
       audio
       b
       base
       basefont
       bdi
       bdo
       bgsound
       big
       blink
       blockquote
       body
       br
       button
       canvas
       caption
       center
       cite
       code
       col
       colgroup
       content
       data
       datalist
       dd
       decorator
       del
       details
       dfn
       dir
       div
       dl
       dt
       element
       em
       embed
       fieldset
       figcaption
       figure
       font
       footer
       form
       frame
       frameset
       h1
       h2
       h3
       h4
       h5
       h6
       head
       header
       hgroup
       hr
       html
       i
       iframe
       img
       input
       ins
       isindex
       kbd
       keygen
       label
       legend
       li
       link
       listing
       main
       map
       mark
       marquee
       menu
       menuitem
       meta
       meter
       nav
       nobr
       noframes
       noscript
       object
       ol
       optgroup
       option
       output
       p
       param
       plaintext
       pre
       progress
       q
       rp
       rt
       ruby
       s
       samp
       script
       section
       select
       shadow
       small
       source
       spacer
       span
       strike
       strong
       style
       sub
       summary
       sup
       table
       tbody
       td
       template
       textarea
       tfoot
       th
       thead
       time
       title
       tr
       track
       tt
       u
       ul
       var
       video
       wbr
       xmp].include?(tag.to_s)
  end
end
