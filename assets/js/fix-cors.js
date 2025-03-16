// Script to help diagnose and fix CORS issues with stylesheet loading
document.addEventListener('DOMContentLoaded', function() {
  console.log('CORS Fix: Script loaded');
  
  // Function to check if stylesheets loaded properly
  function checkStylesheets() {
    // Get the base URL from meta tag
    const baseUrl = document.querySelector('meta[name="base-url"]')?.content || '';
    
    const cssFiles = [
      baseUrl + '/assets/css/base.css',
      baseUrl + '/assets/css/direct.css',
      baseUrl + '/assets/css/style.css',
      baseUrl + '/assets/css/custom.css'
    ];
    
    // Check each CSS file
    cssFiles.forEach(file => {
      const fullPath = file;
      const link = document.createElement('link');
      link.setAttribute('rel', 'stylesheet');
      link.setAttribute('type', 'text/css');
      link.setAttribute('href', fullPath + '?v=' + new Date().getTime());
      
      // Add error handling
      link.onerror = function() {
        console.error('Failed to load CSS:', fullPath);
        // Try alternative loading method (inline CSS fetch)
        fetchAndInjectCSS(fullPath);
      };
      
      link.onload = function() {
        console.log('Successfully loaded CSS:', fullPath);
      };
      
      // Append to head
      document.head.appendChild(link);
    });
  }
  
  // Function to fetch CSS as text and inject as inline styles
  function fetchAndInjectCSS(url) {
    fetch(url)
      .then(response => {
        if (!response.ok) {
          throw new Error(`Failed to fetch ${url}: ${response.status} ${response.statusText}`);
        }
        return response.text();
      })
      .then(css => {
        const style = document.createElement('style');
        style.textContent = css;
        document.head.appendChild(style);
        console.log('Injected inline CSS from:', url);
      })
      .catch(error => {
        console.error('Error fetching CSS:', error);
      });
  }
  
  // Report loaded style sheets
  function reportLoadedStylesheets() {
    const styleSheets = Array.from(document.styleSheets);
    console.log('Currently loaded stylesheets:');
    styleSheets.forEach((sheet, index) => {
      try {
        const href = sheet.href || 'inline';
        const rules = sheet.cssRules ? sheet.cssRules.length : 'no access (CORS)';
        console.log(`${index}: ${href} - ${rules} rules`);
      } catch (e) {
        console.log(`${index}: ${sheet.href} - blocked by CORS`);
      }
    });
  }
  
  // Run the checks
  setTimeout(reportLoadedStylesheets, 1000);
  
  // If we still have issues, try emergency fix
  setTimeout(function() {
    const body = document.body;
    // If the body has default browser styling (white background),
    // our CSS hasn't loaded properly
    const bodyBg = window.getComputedStyle(body).backgroundColor;
    if (bodyBg === 'rgba(0, 0, 0, 0)' || bodyBg === 'transparent' || bodyBg === 'rgb(255, 255, 255)') {
      console.log('Emergency CSS fix activated - CSS not loading properly');
      checkStylesheets();
    }
  }, 2000);
}); 