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

### Implementation Examples

**Card with header, body, and footer**

```erb
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
  }
}) %>

```

**Card with only body**

```erb
<%= content_for :my_card_body do %>
  <p>This is the body of the card</p>
<% end %>

<%= launch_component(:card, {
  body: yield(:my_card_body)
}) %>

```

**Card with image in header**

```erb
<%= content_for :my_card_body do %>
  <p>This is the body of the card</p>
<% end %>

<%= launch_component(:card, {
  header: {
    image: "logo.png"
  },
  body: yield(:my_card_body)
}) %>

```


## Alert

<img src="http://cl.ly/image/27303h403i12/Screenshot%202015-06-24%2019.11.00.png" width="200" alt="Alert" />


### Structure

- Alert
  - Message (success, warning, or info)

### Implementation


**Banner Alert: pushes content down**

```erb
<!-- Error message -->
<%= launch_component("alert/banner", warning_message: "My message which is a bad thing" %>

<!-- Success message -->
<%= launch_component("alert/banner", success_message: "My message which is a good thing" %>

<!-- Info message -->
<%= launch_component("alert/banner", info_message: "My message which is a neither good nor bad" %>

<!-- Catch all using Rails alert and notice helpers -->
<%= launch_component("alert/banner", warning_message: alert, success_message: notice %>
```

**Standard Alert: overlays on top of content**

```erb
<%= launch_component(:alert, warning_message: "My message") %>
```
