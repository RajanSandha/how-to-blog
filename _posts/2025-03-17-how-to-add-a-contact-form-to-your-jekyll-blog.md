---
layout: post
title: "How to Add a Contact Form to Your Jekyll Blog"
date: 2025-03-17
categories: [tutorials, how-to]
tags: [tutorial, guide, contact-form, formspree, jekyll, static-site, html]
author: Rajan Sandha
featured_image: /assets/images/contact-form.png
image_alt: Close up of a computer screen displaying a contact form with a cursor hovering over the "Submit" button.
difficulty: beginner
time_required: 30 minutes
---

A contact form is an essential feature for any blog or website. It provides a simple way for your readers to get in touch with you, ask questions, offer feedback, or report issues. While Jekyll is a static site generator and doesn't inherently support dynamic form processing, we can easily integrate a contact form using third-party services. This tutorial will guide you through adding a functional contact form to your Jekyll blog using Formspree, a popular and easy-to-use form backend service.

## The Problem: No Native Form Handling in Jekyll

Jekyll generates static HTML, CSS, and JavaScript files. It doesn't have a built-in mechanism for handling form submissions. This means you can't directly process form data on your Jekyll site without external help. Traditionally, handling form data involves server-side scripting (like PHP or Python) and database integration.

## The Solution: Using a Third-Party Form Backend (Formspree)

We'll use Formspree to bridge this gap. Formspree is a service that receives form submissions from your website and then forwards them to your email address. It’s a simple, cost-effective, and quick way to implement contact forms on static sites like Jekyll blogs. While this tutorial focuses on Formspree, the general principles can be adapted to other similar services like Netlify Forms or Google Forms.

## Prerequisites

Before you begin, make sure you have the following:

*   A Jekyll blog: You should have a functioning Jekyll blog set up and running. If not, you'll need to create one first. Refer to the official [Jekyll documentation](https://jekyllrb.com/docs/) for setup instructions.
*   A Formspree account: Sign up for a free account on [Formspree](https://formspree.io/). The free plan is sufficient for most personal blogs and small websites.
*   Basic HTML knowledge:  You should have a basic understanding of HTML to create the form structure.
*   Text editor:  A text editor or IDE to edit your Jekyll files.

## Step-by-Step Guide

Here's how to add a contact form to your Jekyll blog:

### 1. Create a New Page or Modify an Existing One

First, decide where you want to include your contact form. You can either create a new page specifically for the contact form (e.g., `contact.md` or `contact.html`) or add the form to an existing page like your "About" page.

*   **Creating a new page (contact.md):** In your Jekyll site's root directory, create a new file named `contact.md`.

    ```bash
    touch contact.md
    ```

*   **Adding Front Matter:** Add the following front matter to the `contact.md` file. Replace the title and other relevant details as needed.

    ```yaml
    ---
    layout: default
    title: Contact Me
    permalink: /contact/
    ---
    ```

    *   `layout: default`: Specifies the layout to use for this page. Ensure you have a `default.html` layout in your `_layouts` directory.
    *   `title: Contact Me`: Sets the title of the page.
    *   `permalink: /contact/`: Defines the URL where the contact page will be accessible.

### 2.  Build the HTML Form Structure

Now, add the HTML markup for your contact form.  The following is a basic example:

```html
<form action="https://formspree.io/f/{your-formspree-id}" method="POST">
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name"><br><br>

  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email"><br><br>

  <label for="message">Message:</label><br>
  <textarea id="message" name="message" rows="5" cols="30"></textarea><br><br>

  <button type="submit">Send</button>
</form>
```

*   **`action="https://formspree.io/f/{your-formspree-id}"`**:  This is the most important part.  Replace `{your-formspree-id}` with the Formspree ID that you'll get from the Formspree dashboard (explained in the next step).  This attribute tells the form where to send the data when the user submits it.
*   **`method="POST"`**:  Specifies the HTTP method used to submit the form.  `POST` is the standard method for submitting form data.
*   **`<label for="name">Name:</label>`**:  A label associated with the input field for the user's name.  The `for` attribute should match the `id` of the corresponding input.
*   **`<input type="text" id="name" name="name">`**: A text input field for the user's name.
    *   `type="text"` specifies that it's a text input field.
    *   `id="name"` provides a unique identifier for the input field.
    *   `name="name"` is the name of the input field, which Formspree uses to identify the data.
*   **`<input type="email" id="email" name="email">`**:  An email input field for the user's email address.  The `type="email"` attribute will trigger basic email validation in modern browsers.
*   **`<textarea id="message" name="message" rows="5" cols="30"></textarea>`**: A multi-line text input field for the user's message.
    *   `rows="5"` and `cols="30"` specify the initial dimensions of the text area.
*   **`<button type="submit">Send</button>`**:  A button that triggers the form submission.

Paste this code within your `contact.md` file, below the front matter.

### 3. Get Your Formspree Form ID

1.  **Log into Formspree:** Go to [Formspree](https://formspree.io/) and log into your account.
2.  **Create a New Form:** Click the "New Form" button.
3.  **Give your form a name.** This will help you identify it later if you have multiple forms.
4.  **Customize:** Add your email to "Send submissions to".  This is where Formspree will send the form submissions.
5.  **Copy the endpoint URL:** After creating the form, Formspree will provide you with an endpoint URL that looks like `https://formspree.io/f/{your-formspree-id}`.  Copy this URL.  This is your Formspree Form ID.

### 4. Update the Form `action` Attribute

Replace `{your-formspree-id}` in the `action` attribute of your HTML form with the Formspree endpoint URL you copied in the previous step. For example:

```html
<form action="https://formspree.io/f/YOUR_ACTUAL_ID" method="POST">
  <!-- Form fields here -->
</form>
```

**Important:** Double-check that you've replaced the placeholder with your actual Formspree ID.

### 5. Customize Your Form (Optional)

You can customize your form by adding more input fields, changing the styling, and adding client-side validation.

*   **Adding More Fields:**  You can add more input fields to your form as needed.  For example, you might want to add a subject field:

    ```html
    <label for="subject">Subject:</label><br>
    <input type="text" id="subject" name="subject"><br><br>
    ```

*   **Styling with CSS:** You can style your form using CSS. You can either add inline styles, embed CSS in your `contact.md` file within `<style>` tags, or link to an external stylesheet.

    ```html
    <style>
    form {
      max-width: 500px;
      margin: 0 auto;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    input[type="text"],
    input[type="email"],
    textarea {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    </style>
    ```

*   **Client-Side Validation:** You can add client-side validation using JavaScript to ensure that users enter valid data before submitting the form. However, remember that client-side validation can be bypassed, so it's essential to also have server-side validation (which Formspree handles to some extent).

### 6. Test Your Form

1.  **Build and Serve Your Jekyll Site:** Run the following command in your terminal to build and serve your Jekyll site locally:

    ```bash
    bundle exec jekyll serve
    ```

2.  **Access the Contact Page:** Open your web browser and navigate to the URL you specified in the `permalink` front matter (e.g., `http://localhost:4000/contact/`).

3.  **Fill Out and Submit the Form:** Fill out the contact form with your information and click the "Send" button.

4.  **Check Your Email:** Check the email address you configured in Formspree. You should receive an email containing the form submission data. If you don't see the email, check your spam folder.

### 7. (Optional) Implement a Thank You Page

After a user submits the form, it's a good practice to redirect them to a "Thank You" page. You can achieve this using JavaScript or by configuring Formspree to redirect after submission.  The following method uses JavaScript.

1.  **Create a Thank You Page:** Create a new page in your Jekyll site (e.g., `thank-you.md`) with a simple thank you message.

    ```yaml
    ---
    layout: default
    title: Thank You
    permalink: /thank-you/
    ---

    <h1>Thank You!</h1>
    <p>Your message has been sent successfully. We will get back to you as soon as possible.</p>
    ```

2.  **Add JavaScript Redirection:** Add the following JavaScript code to your contact form page, *after* the closing `</form>` tag.  This script will only run after the form is successfully submitted to Formspree, indicated by the `_next` variable that Formspree uses.

    ```html
    <script>
        const form = document.querySelector('form');
        form.addEventListener('submit', (event) => {
            // Check for Formspree's success indicator in the URL
            if (window.location.href.includes('_next')) {
                window.location.href = '/thank-you/'; // Replace with your actual Thank You page URL
            }
        });
    </script>
    ```

    *Explanation:*  This JavaScript code listens for the form submission event. After the form is submitted, it checks if the URL contains `_next` (a Formspree indicator of successful submission). If found, it redirects the user to your "Thank You" page.

    You will likely have to reload the page after the redirect occurs (usually pressing F5 or Ctrl+F5 should work), since Jekyll will not have re-built the site.

### Troubleshooting

*   **Form Not Submitting:**
    *   Double-check that the `action` attribute of your form is correctly set to your Formspree Form ID.
    *   Ensure that you have included the `method="POST"` attribute in your form tag.
*   **Not Receiving Emails:**
    *   Check your spam folder.
    *   Verify that the email address you configured in Formspree is correct.
    *   Formspree may require you to confirm your email address. Check your inbox for a confirmation email from Formspree.
*   **Form Styles Not Applied:**
    *   Make sure your CSS is correctly linked or embedded in your `contact.md` file.
    *   Check for any CSS conflicts or errors in your browser's developer console.
*   **Redirect Issues:**
    *   Ensure the JavaScript code for redirection is correctly placed *after* the `</form>` tag.
    *   Double-check the URL of your "Thank You" page in the JavaScript code.
    *   If the Thank You page isn't loading after the redirect, it may be that you must manually reload the page.

## Conclusion

By following these steps, you've successfully added a functional contact form to your Jekyll blog using Formspree. You've learned how to create an HTML form, integrate it with a third-party form backend service, and customize the form with CSS. This will enable your readers to easily contact you and enhance the overall user experience of your blog. Remember to regularly check your email for new form submissions and promptly respond to your readers' inquiries. You can further enhance your contact form by adding more advanced features like CAPTCHA for spam protection, custom error messages, and more sophisticated styling. Good luck!
