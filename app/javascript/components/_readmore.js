export function initReadMoreButton(textSelector, buttonSelector, maxTextLength) {
  const textElements = document.querySelectorAll(textSelector);

  textElements.forEach(textElement => {
    const text = textElement.textContent.trim();
    if (text.length > maxTextLength) {
      const truncatedText = text.slice(0, maxTextLength) + '...';
      textElement.textContent = truncatedText;

      const button = textElement.parentElement.querySelector(buttonSelector);
      button.addEventListener('click', () => {
        if (textElement.classList.contains('read-more-expanded')) {
          textElement.textContent = truncatedText;
          textElement.classList.remove('read-more-expanded');
          button.textContent = 'Read more...';
        } else {
          textElement.textContent = text;
          textElement.classList.add('read-more-expanded');
          button.textContent = 'Read less...';
        }
      });
    }
  });
}