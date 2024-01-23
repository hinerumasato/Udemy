const createBreadcrumb = (selector, options) => {
    document.addEventListener('DOMContentLoaded', () => {
        const element = document.querySelector(selector);
        const breadcrumbTemplate = new BreadcrumbTemplate(options);
        const html = breadcrumbTemplate.render();
        element.innerHTML = html;
    })
}