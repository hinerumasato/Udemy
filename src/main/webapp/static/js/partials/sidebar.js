import { getById } from "../services/categoryService.js";
import { getById as getByIdLevel } from "../services/levelService.js";
import { COURSE_API_URL } from "../services/courseService.js";

(function () {
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

    const renderCourseItem = async function (url) {
        const response = await fetch(url);
        const obj = await response.json();
        const coursePageList = document.querySelector('#coursePageList');
        if(obj.statusCode === 200) {
            const courses = obj.data;
            const htmlPromises = courses.map(async course => {
                const categoryObj = await getById(course.categoryId);
                const levelObj = await getByIdLevel(course.levelId);
                const category = categoryObj.data;
                const level = levelObj.data;
                return `
                    <div class="col">
                        <div class="course-item">
                            <a href="">
                                <div class="course-item-thumbnail">
                                    <img class="w-100"
                                        src="${course.thumbnails[0].img}" alt="">
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
                            </a>
                        </div>
                    </div>
                `;
            });
            const htmls = await Promise.all(htmlPromises);
            coursePageList.innerHTML = htmls.join('');
            price();
        } else if(obj.statusCode === 404) {
            coursePageList.innerHTML = `
            <div class="alert alert-warning w-100 text-center" role="alert">
                <strong>Không tìm thấy kết quả!</strong>
            </div>
            `
        }
    }

    const renderSearchQuery = async function () {
        const checkboxs = document.querySelectorAll(`input[type="checkbox"]`);
        const checkboxsArray = Array.from(checkboxs);
        let [level, price, time] = ['', '', ''];
        checkboxsArray.forEach(checkbox => {
            checkbox.onclick = async () => {
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
                const url = COURSE_API_URL + `/?level=${level}&price=${price}&time=${time}`;
                await renderCourseItem(url);
            }
        })

    }
    renderSearchQuery();
})();