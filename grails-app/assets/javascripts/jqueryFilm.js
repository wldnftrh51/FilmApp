$(document).ready(function() {
    function toggleSource() {
        if ($('#filmType').val() === 'Documentary') {
            $('#sourceDiv').show();
        } else {
            $('#sourceDiv').hide();
        }
    }

    function toggleSynopsis() {
        if ($('#hasSynopsis').val() === 'YES') {
            $('#synopsisDiv').show();
        } else {
            $('#synopsisDiv').hide();
        }
    }

    // Initial toggle
    toggleSource();
    toggleSynopsis();

    // Event listeners
    $('#filmType').change(toggleSource);
    $('#hasSynopsis').change(toggleSynopsis);
});