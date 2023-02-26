function toggleText(event) {
  event.preventDefault();
  const reviewContainer = event.target.closest('.card-text');
  const hiddenText = reviewContainer.querySelector('.card-review-hidden');
  const reviewContent = reviewContainer.querySelector('.review-content');
  const readMoreLink = reviewContainer.querySelector('.review-read-more');

  if (getComputedStyle(hiddenText).display === 'none') {
    hiddenText.style.display = 'block';
    reviewContent.style.display = 'none';
    readMoreLink.textContent = 'Read less';
  } else {
    hiddenText.style.display = 'none';
    reviewContent.style.display = 'block';
    readMoreLink.textContent = 'Read more...';
  }
}

const readMoreLinks = document.querySelectorAll('.review-read-more');
readMoreLinks.forEach(link => link.addEventListener('click', toggleText));