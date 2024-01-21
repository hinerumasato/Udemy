import { getById } from "../services/categoryService.js";
import { getById as getByIdLevel } from "../services/levelService.js";
import { getByTeacherId } from "../services/teacherService.js";
import { COURSE_API_URL, getCourses } from "../services/courseService.js";


(function () {
    const coursePageList = document.querySelector('#coursePageList');
    const sidebar = document.querySelector('.sidebar-wrapper');
    const filterButton = document.getElementById('filterButton');
    const overlay = document.querySelector('.overlay');

    const activeMobileSidebarHandler = function () {
        filterButton.addEventListener('click', function() {
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
        url += `&page=${page}`;
        const response = await fetch(url);
        const obj = await response.json();
        if (obj.statusCode === 200) {
            const courses = obj.data;
            const htmlPromises = courses.map(async course => {
                const categoryObj = await getById(course.categoryId);
                const levelObj = await getByIdLevel(course.levelId);
                const teacherObj = await getByTeacherId(course.teacherId);
                const category = categoryObj.data;
                const level = levelObj.data;
                const teacher = teacherObj.data;

                const categoryByTeacherObj = await getById(teacher.categoryId);
                const categoryByTeacher = categoryByTeacherObj.data;

                return /* html */`
                    <div class="col">
                        <div class="course-item">
                            <a href="/courses/details/${course.slug}">
                                <div class="course-item-thumbnail">
                                    <img class="w-100"
                                        src="${course.thumbnails[0].img}" alt="${course.name}">
                                </div>
                                <div class="course-item-level ${level.code}">
                                    ${level.value}
                                </div>
                                <div class="course-item-info">
                                    <h4 class="course-item-info-title">
                                        ${course.name}
                                    </h4>
                                    <div class="course-item-info-category">
                                        ${category.name}
                                    </div>
                                    <div class="course-item-info-prices d-flex gap-2 align-items-center">
                                        <div class="format-price course-item-info-prices-new-price">
                                            ${course.salePrice}</div>
                                        <div class="format-price course-item-info-prices-old-price">${course.price}
                                        </div>
                                    </div>
                                </div>

                                <div class="course-backside">
                                    <div class="course-teacher">
                                        <div class="course-teacher-info d-md-flex d-block gap-2 align-items-center">
                                            <img src="${teacher.avatar}"
                                                class="rounded-circle" style="width: 60px; height: 60px;" alt="Avatar" />
                                            <div>
                                                <h6 class="fw-bold teacher-name">${teacher.name}</h6>
                                                <span>${categoryByTeacher.name}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <h4 class="fw-bold mt-3 text-main">${course.name}</h4>
                                    <div class="course-backside-description">${course.description}</div>
                                    <div class="backside-data d-block d-md-flex justify-content-between align-items-center">
                                        <div class="backside-level">
                                            <i class="fa-solid fa-chart-line"></i>
                                            <span>${level.value}</span>
                                        </div>

                                        <div class="backside-lesson">
                                            <i class="fa fa-video-camera" aria-hidden="true"></i>
                                            <span>7 bài giảng</span>
                                        </div>

                                        <div class="backside-time">
                                            <i class="fa-solid fa-clock"></i>
                                            <span>7 giờ</span>
                                        </div>
                                    </div>

                                    <div class="mt-5">
                                        <button class="btn-main-course w-100">Preview về khoá học</button>
                                    </div>

                                    <div class="d-block d-md-flex justify-content-between mt-3">
                                        <div class="like rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-heart"></i>
                                        </div>
                                        <div class="share rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-share-from-square"></i>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                `;
            });
            const htmls = await Promise.all(htmlPromises);
            coursePageList.innerHTML = htmls.join('');
            price();
        } else if (obj.statusCode === 404) {
            coursePageList.innerHTML = `
            <div class="alert alert-warning w-100 text-center" role="alert">
                <strong>Không tìm thấy kết quả!</strong>
            </div>
            `
        }
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

})();
