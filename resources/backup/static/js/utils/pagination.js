const pagination = function(obj = { selector: '', elements: 0, limit: 0}) {

    const getPages = function() {
        const rawPages = obj.elements / obj.limit;
        const floorPages = Math.floor(rawPages);
        if(rawPages - floorPages > 0)
            return floorPages + 1;
        return floorPages;
    }

    return {
        selector: obj.selector,
        elements: obj.elements,
        limit: obj.limit,
        activePage: 1,

        removeChild: function(element) {
            element.innerHTML = '';
        },
        
        render: function() {
            const renderDOM = document.querySelector(this.selector);
            this.removeChild(renderDOM);
            const pages = getPages();
            const list = document.createElement('ul');
            list.classList.add('custom-pagination-list');
            for(let i = 0; i < pages; i++) {
                const item = document.createElement('li');
                item.classList.add('custom-pagination-item');
                item.setAttribute('page', i+1);
                if(i+1 == this.activePage) item.classList.add('active');

                item.innerText = (i + 1);
                list.appendChild(item);
            }

            renderDOM.appendChild(list);
        }
    }
}