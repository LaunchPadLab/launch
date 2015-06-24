# Launch

Launch is a repository of frontend components that are extendable and customizable. Each component includes necessary sass and javascript and offer an html generator for consistent, centralized generation of the component.

# Components

## Card

<img src="http://cl.ly/image/1y052J2Q3j2l/Screenshot%202015-06-24%2018.39.24.png" width="200" alt="Sign In" />
<img src="http://cl.ly/image/1s283i2M2E2J/Screenshot%202015-06-24%2018.45.21.png" width="200" alt="Trip Form" />
<img src="http://cl.ly/image/1K3w2G0d3E1S/Screenshot%202015-06-24%2018.45.28.png" width="200" / alt="Generic" />

### Structure

- Card
  - Header (optional)
    - Title or Image
  - Body
    - Content
    - Footer (optional)

### Implementation

```html
<%= content_for :my_card_body do %>
  <p>This is the body of the card</p>
  <div>
    <p>I can put as much information</div>
    <p>in the body of this card as I want</p>
  </p>
<% end %>

<%= content_for :my_card_footer do %>
  <p>This is the footer of the card</p>
<% end %>

<%= launch_component(:card, {
  add_class: "card__is-hidden", # hides card on mobile
  header: {
    title: "My great card"
  },
  body: {
    content: yield(:my_card_body),
    footer: yield(:my_card_footer)
}) %>

```