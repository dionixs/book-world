export function initReadMoreButton(textSelector, buttonSelector, maxTextLength) {
  const textElements = document.querySelectorAll(textSelector);
  textElements.forEach((textElement) => {
    const text = textElement.textContent;
    if (text.length > maxTextLength) {
      const trimmedText = text.slice(0, maxTextLength);
      const remainingText = text.slice(maxTextLength);
      textElement.innerHTML = `${trimmedText}<span class="remaining-text" style="display:none">${remainingText}</span>`;
      const readMoreButton = textElement.parentNode.querySelector(buttonSelector);
      readMoreButton.addEventListener('click', (event) => {
        event.preventDefault();
        const remainingTextElement = textElement.querySelector('.remaining-text');
        if (remainingTextElement.style.display === 'none') {
          remainingTextElement.style.display = 'inline';
          readMoreButton.textContent = 'Read less...';
        } else {
          remainingTextElement.style.display = 'none';
          readMoreButton.textContent = 'Read more...';
        }
      });
    }
  });
}