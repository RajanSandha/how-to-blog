// This script injects critical styles directly into the page
// when external stylesheets fail to load due to CORS or other issues
document.addEventListener('DOMContentLoaded', function() {
  console.log('Inline styles script loaded');
  
  // Check if page styling looks correct
  setTimeout(function() {
    const body = document.body;
    const bodyBgColor = window.getComputedStyle(body).backgroundColor;
    
    // If default white background, assume CSS didn't load
    if (bodyBgColor === 'rgba(0, 0, 0, 0)' || 
        bodyBgColor === 'rgb(255, 255, 255)' || 
        bodyBgColor === 'transparent') {
      console.log('CSS appears to be missing, applying emergency inline styles');
      applyInlineStyles();
    } else {
      console.log('CSS appears to be loaded properly');
    }
  }, 1000);
  
  function applyInlineStyles() {
    const styles = `
      /* Critical styles */
      body {
        font-family: -apple-system, BlinkMacSystemFont, 'Open Sans', 'Segoe UI', Roboto, Oxygen-Sans, Ubuntu, Cantarell, 'Helvetica Neue', sans-serif;
        color: #f0e7d5;
        background-color: #252525;
        line-height: 1.6;
        padding: 0;
        margin: 0;
      }
      
      .page-container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
      }
      
      .wrapper {
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
      }
      
      h1, h2, h3, h4, h5, h6 {
        color: #e8e8e8;
        margin: 1em 0 0.5em;
      }
      
      h1 {
        font-size: 2em;
        color: #ffcc00;
      }
      
      a {
        color: #ffcc00;
        text-decoration: none;
      }
      
      a:hover {
        color: #ffeb9b;
        text-decoration: underline;
      }
      
      #header {
        background-color: #111;
        border-bottom: 4px solid #2c2c2c;
        width: 100%;
        padding: 10px 0;
      }
      
      #header nav ul {
        list-style: none;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin: 0;
        padding: 0;
      }
      
      #header nav ul li {
        margin: 0 10px;
      }
      
      #header nav ul li a {
        color: #bbbbbb;
        padding: 8px 12px;
        display: block;
      }
      
      .site-title a {
        color: #ffcc00 !important;
        font-weight: bold;
      }
      
      footer {
        background-color: #111;
        color: #666;
        padding: 20px 0;
        margin-top: 40px;
        text-align: center;
        width: 100%;
      }
    `;
    
    const styleTag = document.createElement('style');
    styleTag.id = 'emergency-inline-styles';
    styleTag.textContent = styles;
    document.head.appendChild(styleTag);
    
    // Also fix the nav items if needed
    const siteTitle = document.querySelector('#header nav ul li:first-child');
    if (siteTitle) {
      siteTitle.classList.add('site-title');
    }
  }
}); 