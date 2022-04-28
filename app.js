const menu = [
  {
    id: 1,
    title: "Tic-Tac-Toe (O - X)",
    img: "./images/tictactoe.jpeg",
    desc: `Tic-Tac-Toe`,
    link:"./Games/Tic Tac Toe/index.html"
  },
  {
    id: 2,
    title: "Ludo",
    img: "./images/Ludo.png",
    desc: `Ludo - Multiplayer Game`,
    link: "./Games/Simple Ludo Game/index.html"
  },
  {
    id: 3,
    title: "Biker Game",
    img: "./images/Biker.png",
    desc: `Biker Game`,
    link: "./Games/Biker Game/index.jsp"
  },
  {
    id: 4,
    title: "Space Shooter",
    img: "./images/sapceshooter.png",
    desc: `Shoot Aliens Out Of The Sky`,
    link: "./Games/Space Shooter Game/index.jsp"
  },
  {
    id: 5,
    title: "Pacman",
    img: "./images/pacman.png",
    desc: `Pacman Game`,
    link:"./Games/Pacman/index.jsp"
  }
];


const sectionCenter = document.querySelector(".section-center");
const btnContainer = document.querySelector(".btn-container");


window.addEventListener("DOMContentLoaded", function () {
  diplayMenuItems(menu);
});

function diplayMenuItems(menuItems) {
  let displayMenu = menuItems.map(function (item) {
    // console.log(item);
    return `<article class="menu-item">
      <a href="${item.link}" target="_self" >
      <img src=${item.img} alt=${item.title} class="photo" />
      <div class="item-info">
      <header>
      <h4>${item.title}</h4>
      </header>
      </a>
      <p class="item-text">
      ${item.desc}
      </p>
      </div>
    </article>`;
  });
  displayMenu = displayMenu.join("");
  console.log(displayMenu);
  sectionCenter.innerHTML = displayMenu;
}

