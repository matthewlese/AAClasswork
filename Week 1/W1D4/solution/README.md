### HTML Head Section Exercise

Take [yesterday's solution][prev-solution] from HTML Forms Exercise and add elements to the `head` section:

1. Add a `title` tag to the head section of your recipe
2. Add a `meta` description to your page. Keep in mind user search keywords.
3. Define the `charset` for your page as the common HTML5 default: `utf-8`
4. Use the Google Analytics Script from the reading to add a script element at the bottom of your head section. (This will not be functional but is good practice)
5. Add an `id` attribute to your reviews section element with the value "reviews" and an `id` attribute to your form element with the value "review-form" (These are used in the external JavaScript file loaded in the following step)
6. Download the [following script][external-javascript-example] and add it as an external JavaScript file to your page (check the `src` attribute!)
7. Download the [following stylesheet][reset] and add it to your page with a `link` tag (check the `href` attribute!)

The stylesheet file that we added is called a CSS reset. It is used to start us off with a clean slate in regards to the look and layout of our page. We will go over this in more detail in the CSS curriculum.

The JavaScript file that we added uses some fun document manipulation to provide functionality to our form. Go ahead and test it out by making a review of your recipe.

After coding your recipe page, compare your html to [this example][solution].

[prev-solution]: ../html-forms/solution.html?raw=true
[external-javascript-example]: ../../assets/external_javascript_example.js
[reset]: ../../assets/css_reset.css
[solution]: ./solution.html
