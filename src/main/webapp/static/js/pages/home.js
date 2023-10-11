import { getById } from "../services/categoryService.js";
import { getById as getByIdLevel } from "../services/levelService.js";
import { get } from "../services/courseService.js";

(function () {
    // function setWidthCourseItem() {
    //     const courseItems = document.querySelectorAll('.course-item');
    //     courseItems.forEach(item => {
    //         item.style.width = window.screen.width < 1200 ? `${1200 / 3 - 20}px` : `${window.screen.width / 3 - 20}px`;
    //     })
    // }
    // setWidthCourseItem();

    // window.onresize = () => {
    //     setWidthCourseItem();
    // }

    function renderCourseItem() {
        const navItems = document.querySelectorAll('.nav-item[code]');
        navItems.forEach(item => {
            item.onclick = async () => {
                const code = item.getAttribute('code');
                const tabPane = document.querySelector(`.tab-pane[code="${code}"]`)
                const obj = await get(code);
                if(obj.statusCode == 200)  {
                    let htmls = '';
                    const courses = obj.data;
                    courses.forEach(async course => {
                        const categoryObj = await getById(course.categoryId);
                        const levelObj = await getByIdLevel(course.levelId);
                        const category = categoryObj.data;
                        const level = levelObj.data;
                        htmls += `
                        <div class="col course-item">
                            <a href="">
                                <div class="course-item-thumbnail">
                                    <img class="w-100"
                                        src="${course.thumbnails[0].img}" alt="">
                                </div>
                                <div class="course-item-level basic">
                                    ${level.name}
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
                        `;

                        tabPane.innerHTML = `<div class="row row-cols-lg-3 row-cols-md-2 row-cols-1">${htmls}</div>`;
                        price();
                    });

                } else {
                    tabPane.innerHTML = `
                    <div class="w-100 text-center alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Chưa có bài viết cho thể loại này!</strong>
                    </div>
                    `;
                }
            }
        })
        
    }
    renderCourseItem();
})();