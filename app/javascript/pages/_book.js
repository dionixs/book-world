import { initReadMoreButton } from '../components/_readmore';

const textSelector = '.description-text';
const buttonSelector = '.read-more';
const maxTextLength = 240;

initReadMoreButton(textSelector, buttonSelector, maxTextLength);