const CARET_HIDDEN = "fa-caret-down";
const CARET_EXPANDED = "fa-caret-up";

document.querySelectorAll(".contact").forEach((contact) => {
  contact.addEventListener("click", (e) => {
    // traverse to parent
    let outerDiv = e.target;
    while (!outerDiv.classList.contains("contact")) {
      outerDiv = outerDiv.parentNode;
    }

    const caret = outerDiv.querySelector(".caret-icon");
    const contactDetails = outerDiv.querySelector(".contact-details");

    if (caret.classList.contains(CARET_HIDDEN)) {
      caret.classList.remove(CARET_HIDDEN);
      caret.classList.add(CARET_EXPANDED);

      expandSection(contactDetails);
    } else {
      caret.classList.remove(CARET_EXPANDED);
      caret.classList.add(CARET_HIDDEN);

      collapseSection(contactDetails);
    }
  });
});

/* from: https://css-tricks.com/using-css-transitions-auto-dimensions/ */

function collapseSection(element) {
  // get the height of the element's inner content, regardless of its actual size
  var sectionHeight = element.scrollHeight;

  // temporarily disable all css transitions
  var elementTransition = element.style.transition;
  element.style.transition = "";

  // on the next frame (as soon as the previous style change has taken effect),
  // explicitly set the element's height to its current pixel height, so we
  // aren't transitioning out of 'auto'
  requestAnimationFrame(function () {
    element.style.height = sectionHeight + "px";
    element.style.transition = elementTransition;

    // on the next frame (as soon as the previous style change has taken effect),
    // have the element transition to height: 0
    requestAnimationFrame(function () {
      element.style.height = 0 + "px";
    });
  });
}

function expandSection(element) {
  // get the height of the element's inner content, regardless of its actual size
  var sectionHeight = element.scrollHeight;

  // have the element transition to the height of its inner content
  element.style.height = sectionHeight + "px";

  // when the next css transition finishes (which should be the one we just triggered)
  element.addEventListener("transitionend", function (e) {
    // remove this event listener so it only gets triggered once
    element.removeEventListener("transitionend", arguments.callee);
  });
}
