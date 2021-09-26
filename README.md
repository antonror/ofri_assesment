# README

Test assessment with refactoring of existing `model.rb`, `controller.rb` and `jquery.js`

## Versions:

**Ruby:** 3.0.0

**Rails:** 6

### Description

Initialized in a context of barebone Rails API to be able to launch and check the assessment solution.

### Changelog

jQuery file is a simple datepicker library integration [Datepicker](https://api.jqueryui.com/datepicker/)

The file has a select field with pre-populated dates supplied as a string.

At the very beginning it hides the input field, splits the pre-populated data and adds a class to `<select>` element:

```
 var values = $dateInput.data("values").split(",");
 var $select = $("<select>").addClass("select-date");
```

Then it declares additional elements like Button and Input fields:

```
var $datePickerBtn = $("<button>", {
    html: '<i class="fa fa-calendar" aria-hidden="true"></i>', class: "open-date-picker"
});

var $datePicker = $("<input>", {
    type: "text",
    readonly: true
});
```

After that it mounts a `Datepicker` widget to the input element and appends pre-populated values:

```
 $datePicker.datepicker({
    minDate: 0
});
```

```
$select.append(values.map(function (c, i) {
    return $("<option>", { text: c, value: c, "data-index": i });
}));
```

The snippet has a mysterious variable `DatePickerIndex` and it equals to `3`. I could not understand its purpose.
The code compares an index of selected value with previously defined index. In case the index is matching, it sets input value to blank string. 
If it is not, the code prompts to select data.

```
var existingValue = $dateInput.val();
```

After this piece of code the `Datepicker` is shown with existing value or otherwise it populates
the `dateInput` field with pre-defined `datePickerIndex` again.

The jquery file is completely out of context and it was difficult to guess is it a piece of a bigger
file or a separate function. Requires discussion.