(function () {
    document.addEventListener('DOMContentLoaded', () => {
        const coursePageList = document.querySelector('#coursePageList');
        const sidebar = document.querySelector('.sidebar-wrapper');
        const filterButton = document.getElementById('filterButton');
        const overlay = document.querySelector('.overlay');
        const activeMobileSidebarHandler = function () {
            filterButton.addEventListener('click', function () {
                sidebar.classList.toggle('active');
                overlay.classList.toggle('active');
                filterButton.classList.toggle('active');
            });
        }

        activeMobileSidebarHandler();

        const toggleCollapseIcon = function () {
            const collapseButtons = document.querySelectorAll(`button[data-bs-toggle="collapse"]`);
            collapseButtons.forEach(btn => {
                btn.onclick = () => {
                    const ariaExpanded = btn.getAttribute('aria-expanded');
                    const icon = btn.querySelector('i');
                    if (ariaExpanded == 'true')
                        icon.classList.add('rotate90');
                    else icon.classList.remove('rotate90');
                }
            });
        }
        toggleCollapseIcon();

        const getTotalCourses = async (url) => {
            const response = await fetch(url);
            const json = await response.json();
            if (json.statusCode === 404)
                return 0;
            return json.data.length;
        }

        const renderCourseItem = async function (url, page) {
            const courseTemplate = new CourseTemplate();
            const html = await courseTemplate.render(url, page);
            coursePageList.innerHTML = html;
            price();
        }

        const switchPageHandler = function (url, paginationObj) {
            const pageItems = document.querySelectorAll('.custom-pagination-item');
            pageItems.forEach(item => {
                item.onclick = async () => {
                    const page = item.getAttribute('page');
                    const list = item.parentNode;
                    const oldActiveItem = list.querySelector('.active');
                    oldActiveItem.classList.remove('active');
                    item.classList.add('active');

                    paginationObj.activePage = page;
                    await renderCourseItem(url, page);

                    const elementScrollTo = document.querySelector('.course_container');
                    elementScrollTo.scrollIntoView({
                        block: "start",
                        behavior: "smooth",
                    });
                }

            });
        }

        const filterHandler = async function () {
            const checkboxs = document.querySelectorAll(`input[type="checkbox"]`);
            const checkboxsArray = Array.from(checkboxs);
            let [level, price, time] = ['', '', ''];
            checkboxsArray.forEach(checkbox => {
                checkbox.onclick = async () => {
                    coursePageList.innerHTML = `
                    <div class="d-flex justify-content-center w-100">
                        <div class="spinner-border" role="status">
                        <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                `;
                    switch (checkbox.getAttribute('field')) {
                        case 'level':
                            level = '? IN(';
                            const levelCheckBoxs = document.querySelectorAll(`input[field="level"]`)
                            const levelCheckBoxsArray = Array.from(levelCheckBoxs);
                            const levelArray = levelCheckBoxsArray.map(levelCheckBox => {
                                if (levelCheckBox.checked)
                                    return levelCheckBox.value + ', ';
                                else return '';
                            });
                            level += levelArray.join('');
                            if (level === '? IN(')
                                level = '';
                            else {
                                level = level.substring(0, level.length - 2) + ')';
                            }
                            break;

                        case 'price':
                            price = '';
                            const priceCheckBoxs = document.querySelectorAll(`input[field="price"]`)
                            const priceCheckBoxsArray = Array.from(priceCheckBoxs);
                            const priceArray = priceCheckBoxsArray.map(priceCheckBox => {
                                if (priceCheckBox.checked)
                                    return '? ' + priceCheckBox.value + ' OR ';
                                else return '';
                            });
                            price += priceArray.join('');
                            if (price !== '')
                                price = price.substring(0, price.length - 4);
                            break;

                        case 'time':
                            time = '? IN(';
                            const timeCheckBoxs = document.querySelectorAll(`input[field="time"]`)
                            const timeCheckBoxsArray = Array.from(timeCheckBoxs);
                            const timeArray = timeCheckBoxsArray.map(timeCheckBox => {
                                if (timeCheckBox.checked)
                                    return timeCheckBox.value + ', ';
                                else return '';
                            });
                            time += timeArray.join('');
                            if (time === '? IN(')
                                time = '';
                            else
                                time = time.substring(0, time.length - 2) + ')';
                            break;
                    }
                    const pathname = window.location.pathname;
                    const pathnameSplit = pathname.split('/');
                    const FIELD = 'courses';
                    const COURSE_API_URL = API_URL + `/${FIELD}`
                    const categoryCode = (pathnameSplit.length == 3) ? pathnameSplit[pathnameSplit.length - 1] : "";
                    const url = COURSE_API_URL + `/?level=${level}&price=${price}&time=${time}&categoryCode=${categoryCode}`;
                    const elements = await getTotalCourses(url);
                    const paginationObj = pagination({
                        selector: '.custom-pagination',
                        elements: elements,
                        limit: 6
                    });

                    paginationObj.render();
                    const activePage = paginationObj.activePage;
                    await renderCourseItem(url, activePage);
                    switchPageHandler(url, paginationObj);
                }
            })

        }
        filterHandler();

        const getFirstPagination = async function () {
            const FIELD = 'courses';
            const COURSE_API_URL = API_URL + `/${FIELD}`
            const pathname = window.location.pathname;
            const pathnameSplit = pathname.split('/');
            const categoryCode = (pathnameSplit.length == 3) ? pathnameSplit[pathnameSplit.length - 1] : "";
            const paginationObj = pagination({
                selector: '.custom-pagination',
                elements: await getTotalCourses(`${COURSE_API_URL}/?categoryCode=${categoryCode}`),
                limit: 6
            });

            paginationObj.render();
            switchPageHandler(COURSE_API_URL + `?q=`, paginationObj);
        }

        getFirstPagination();
    })

})();
