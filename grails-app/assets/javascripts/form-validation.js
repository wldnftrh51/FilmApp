document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('form.needs-validation').forEach(form => {
        const popup = document.getElementById('errorPopup');

        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const requiredFields = form.querySelectorAll('.validate-required');
            for (const field of requiredFields) {
                if (!field.value.trim()) {
                    const label = field.dataset.label || field.name;
                    showError(`${label} cannot be blank`);
                    return;
                }
            }

            form.submit();
        });

        function showError(msg) {
            popup.textContent = msg;
            popup.classList.remove('hidden');
            setTimeout(() => popup.classList.add('hidden'), 3000);
        }
    });
});
