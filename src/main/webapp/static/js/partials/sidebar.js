(function() {
    const toggleCollapseIcon = () => {
        const collapseButtons = document.querySelectorAll(`button[data-bs-toggle="collapse"]`);
        collapseButtons.forEach(btn => {
            btn.onclick = () => {
                const ariaExpanded = btn.getAttribute('aria-expanded');
                const icon = btn.querySelector('i');
                if(ariaExpanded == 'true')
                    icon.classList.add('rotate90');
                else icon.classList.remove('rotate90');
            }
        });
    }
    toggleCollapseIcon();
})();