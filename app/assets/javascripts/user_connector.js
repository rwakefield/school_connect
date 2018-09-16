function checkAll(boxes) {
  boxes.each(function() {
    $(this).prop('checked', true);
  });
}

function uncheckAll(boxes) {
  boxes.each(function() {
    $(this).prop('checked', false);
  });
}

$(document).on('turbolinks:load', function() {
  var schoolCheckboxes = $('#school-checks input[type=checkbox]');
  var checkAllSchoolsButton = $('#checkAllSchools');
  var uncheckAllSchoolsButton = $('#uncheckAllSchools');

  checkAllSchoolsButton.removeClass('d-none');
  uncheckAllSchoolsButton.removeClass('d-none');

  checkAllSchoolsButton.click(function(event) {
    event.preventDefault();
    checkAll(schoolCheckboxes);
  });

  uncheckAllSchoolsButton.click(function(event) {
    event.preventDefault();
    uncheckAll(schoolCheckboxes);
  });
})
