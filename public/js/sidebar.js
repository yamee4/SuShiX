document.addEventListener("DOMContentLoaded", function () {
    // Reference to dropdown elements
    const branchMenu = document.getElementById("branchMenu");
    const branchInput = document.getElementById("branchInput");
    const selectedBranch = document.getElementById("selectedBranch");

    // Function to handle branch selection
    window.selectBranch = function (branchID, branchName) {
        // Update the hidden input field with the selected branch ID
        branchInput.value = branchID;

        // Update the dropdown button text with the selected branch name
        selectedBranch.textContent = branchName;
    };

    // Ensure the form includes the selected branch when submitted
    const searchForm = document.querySelector(".search-form");

    searchForm.addEventListener("submit", function (event) {
        const keywordInput = searchForm.querySelector(".search-input");

        if (!branchInput.value && !keywordInput.value.trim()) {
            event.preventDefault();
            alert("Please select a branch or enter a keyword to search.");
        }
    });
});
