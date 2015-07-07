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

**SASS**

```sass
// app/assets/stylesheets/settings/components/_card.scss

// Card Variables
// customize these for your app

$card-settings: (
  background-color: $white-base,
  border: 1px solid $grey-light,
  border-radius: 2px,
  margin: 30px 0,
  padding: 20px,
  shadow-color: rgba(0, 0, 0, 0.15),
  shadow-spread: 0 0 10px,
  header-background-colors: (
    primary: $yellow-base
  ),
  footer-margin: 15px,
  footer-padding: 25px
);
```

```sass
// app/assets/stylesheets/settings/settings.scss
@import 'components/card';
```

```sass
// app/assets/stylesheets/application.scss
@import "launch/components/card";
```

**HTML**

```html
<div class="card">
  <header role="banner" class="card--header color--primary">
    <h2>Header area</h2>
  </header>
  <div class="card--body">
    <p>The Earth was small, light blue, and so touchingly alone, our home that must be defended like a holy relic. The Earth was absolutely round. I believe I never knew what the word round meant until I saw Earth from space.</p>
    <footer role="contentinfo" class="card--footer">
      <p>Some footer content...</p>
    </footer>
  </div>
</div>
```

### Launch Component Generator

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

```sass
// app/assets/stylesheets/settings/components/_alerts.scss

// Alert Variables
// customize these for your app

$alerts: (
  success   $green-base   $green-dark,
  danger    $yellow-base  $yellow-dark,
  warning   $red-base     $red-dark,
  default   $blue-base    $blue-dark
);
```

```sass
// app/assets/stylesheets/settings/settings.scss
@import 'components/alerts';
```

```sass
// app/assets/stylesheets/application.scss
@import "launch/components/alerts";
```

```js
// application.js

//= require launch/components/_alerts
```


**Banner Alert: pushes content down**

```erb
<!-- Error message -->
<%= launch_component("alert/banner", warning_message: "My message which is a bad thing") %>

<!-- Success message -->
<%= launch_component("alert/banner", success_message: "My message which is a good thing") %>

<!-- Info message -->
<%= launch_component("alert/banner", info_message: "My message which is a neither good nor bad") %>

<!-- Catch all using Rails alert and notice helpers -->
<%= launch_component("alert/banner", warning_message: alert, success_message: notice) %>
```

**Standard Alert: overlays on top of content**

```erb
<%= launch_component(:alert, warning_message: "My message") %>
```

## Tabs

<img src="http://cl.ly/image/3o4609322q13/Screenshot%202015-07-06%2010.48.35.png" width="400" alt="Simple Tabs" />

```sass
// app/assets/stylesheets/settings/components/_tabs.scss

// Tabs Component
// ========================================

$tabs-settings: (
  link-active-border: 5px solid $yellow-base,
  link-active-offset: -1px,
  link-margin: 20px,
  link-font-settings: (
    type: $secondary-sans-serif,
    style: normal,
    weight: 700
  )
)
```

```sass
// app/assets/stylesheets/settings/settings.scss
@import 'components/tabs';
```

```sass
// app/assets/stylesheets/application.scss
@import "launch/components/tabs";
```

```js
// application.js

//= require launch/components/_tabs
```

```html
<ul class="tabs--menu">
  <li class="tabs--link is-active"><%= link_to 'Truck Profile', '#truck' %></li>
  <li class="tabs--link"><%= link_to 'User Profile', '#user' %></li>
</ul>
<div id="truck" class="tabs--content is-active">
  <p>Content for truck</p>
</div>
<div id="user" class="tabs--content">
  <p>Content for user</p>
</div>
```

## Modal

<img src="http://cl.ly/image/0E1A2U2P2o0N/Screenshot%202015-07-07%2019.03.18.png" width="400" alt="Modal" />

### Implementation

```sass
// app/assets/stylesheets/settings/components/_modal.scss

// Modal Component
// ========================================

$modal-settings: (
  background: $white-base,
  border-radius: 2px,
  padding: 15px
)
```

```sass
// app/assets/stylesheets/settings/settings.scss
@import 'components/modal';
```

```sass
// app/assets/stylesheets/application.scss
@import "launch/components/modal";
```

```js
// application.js

//= require launch/components/_modal
```

```html
<div class="modal">
  <label for="modal-1">
    <div class="modal-trigger">Click for Modal</div>
  </label>
  <input class="modal-state" id="modal-1" type="checkbox" />
  <div class="modal-window">
    <div class="modal-container">
      <header class="modal-header">
        <h4 class="modal-header-title">Some title...</h4>
      </header>
      <div class="modal-inner">
        <div class="modal-body center">
          <p class="modal-body--tag">Modal body tag</p>
          <h3 class="modal-body--title">Modal body title...</h3>
          <p>Do you want to save your load estimate?  <br>Create an account for free today.</p><br>
          <%= link_to 'Sign Up', '#' %>
        </div>
      </div>
      <footer class="modal-footer">
        <%= link_to 'Cancel', '#', class: 'modal-close' %>
      </footer>
    </div>
  </div>
</div>
```
