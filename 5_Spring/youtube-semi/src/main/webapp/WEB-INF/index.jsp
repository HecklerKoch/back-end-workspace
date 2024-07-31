<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>YouTube</title>
    <link
      rel="icon"
      href="https://www.youtube.com/s/desktop/ae4ecf92/img/favicon_144x144.png"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script
      src="https://kit.fontawesome.com/ef885bd654.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="progress-bar-container"></div>
    <div class="prograss- bar"></div>
    <header>
      <div class="header-start">
        <i class="fa-solid fa-bars"></i>
        <a href="">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            id="yt-logo-updated-svg_yt1"
            class="external-icon"
            viewBox="0 0 90 20"
            focusable="false"
            style="
              pointer-events: none;
              display: inherit;
              width: 100%;
              height: 100%;
            "
          >
            <svg
              id="yt-logo-updated_yt1"
              viewBox="0 0 90 20"
              preserveAspectRatio="xMidYMid meet"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g>
                <path
                  d="M27.9727 3.12324C27.6435 1.89323 26.6768 0.926623 25.4468 0.597366C23.2197 2.24288e-07 14.285 0 14.285 0C14.285 0 5.35042 2.24288e-07 3.12323 0.597366C1.89323 0.926623 0.926623 1.89323 0.597366 3.12324C2.24288e-07 5.35042 0 10 0 10C0 10 2.24288e-07 14.6496 0.597366 16.8768C0.926623 18.1068 1.89323 19.0734 3.12323 19.4026C5.35042 20 14.285 20 14.285 20C14.285 20 23.2197 20 25.4468 19.4026C26.6768 19.0734 27.6435 18.1068 27.9727 16.8768C28.5701 14.6496 28.5701 10 28.5701 10C28.5701 10 28.5677 5.35042 27.9727 3.12324Z"
                  fill="#FF0000"
                ></path>
                <path
                  d="M11.4253 14.2854L18.8477 10.0004L11.4253 5.71533V14.2854Z"
                  fill="white"
                ></path>
              </g>
              <g>
                <g id="youtube-paths_yt1">
                  <path
                    d="M34.6024 13.0036L31.3945 1.41846H34.1932L35.3174 6.6701C35.6043 7.96361 35.8136 9.06662 35.95 9.97913H36.0323C36.1264 9.32532 36.3381 8.22937 36.665 6.68892L37.8291 1.41846H40.6278L37.3799 13.0036V18.561H34.6001V13.0036H34.6024Z"
                  ></path>
                  <path
                    d="M41.4697 18.1937C40.9053 17.8127 40.5031 17.22 40.2632 16.4157C40.0257 15.6114 39.9058 14.5437 39.9058 13.2078V11.3898C39.9058 10.0422 40.0422 8.95805 40.315 8.14196C40.5878 7.32588 41.0135 6.72851 41.592 6.35457C42.1706 5.98063 42.9302 5.79248 43.871 5.79248C44.7976 5.79248 45.5384 5.98298 46.0981 6.36398C46.6555 6.74497 47.0647 7.34234 47.3234 8.15137C47.5821 8.96275 47.7115 10.0422 47.7115 11.3898V13.2078C47.7115 14.5437 47.5845 15.6161 47.3329 16.4251C47.0812 17.2365 46.672 17.8292 46.1075 18.2031C45.5431 18.5771 44.7764 18.7652 43.8098 18.7652C42.8126 18.7675 42.0342 18.5747 41.4697 18.1937ZM44.6353 16.2323C44.7905 15.8231 44.8705 15.1575 44.8705 14.2309V10.3292C44.8705 9.43077 44.7929 8.77225 44.6353 8.35833C44.4777 7.94206 44.2026 7.7351 43.8074 7.7351C43.4265 7.7351 43.156 7.94206 43.0008 8.35833C42.8432 8.77461 42.7656 9.43077 42.7656 10.3292V14.2309C42.7656 15.1575 42.8408 15.8254 42.9914 16.2323C43.1419 16.6415 43.4123 16.8461 43.8074 16.8461C44.2026 16.8461 44.4777 16.6415 44.6353 16.2323Z"
                  ></path>
                  <path
                    d="M56.8154 18.5634H54.6094L54.3648 17.03H54.3037C53.7039 18.1871 52.8055 18.7656 51.6061 18.7656C50.7759 18.7656 50.1621 18.4928 49.767 17.9496C49.3719 17.4039 49.1743 16.5526 49.1743 15.3955V6.03751H51.9942V15.2308C51.9942 15.7906 52.0553 16.188 52.1776 16.4256C52.2999 16.6631 52.5045 16.783 52.7914 16.783C53.036 16.783 53.2712 16.7078 53.497 16.5573C53.7228 16.4067 53.8874 16.2162 53.9979 15.9858V6.03516H56.8154V18.5634Z"
                  ></path>
                  <path
                    d="M64.4755 3.68758H61.6768V18.5629H58.9181V3.68758H56.1194V1.42041H64.4755V3.68758Z"
                  ></path>
                  <path
                    d="M71.2768 18.5634H69.0708L68.8262 17.03H68.7651C68.1654 18.1871 67.267 18.7656 66.0675 18.7656C65.2373 18.7656 64.6235 18.4928 64.2284 17.9496C63.8333 17.4039 63.6357 16.5526 63.6357 15.3955V6.03751H66.4556V15.2308C66.4556 15.7906 66.5167 16.188 66.639 16.4256C66.7613 16.6631 66.9659 16.783 67.2529 16.783C67.4974 16.783 67.7326 16.7078 67.9584 16.5573C68.1842 16.4067 68.3488 16.2162 68.4593 15.9858V6.03516H71.2768V18.5634Z"
                  ></path>
                  <path
                    d="M80.609 8.0387C80.4373 7.24849 80.1621 6.67699 79.7812 6.32186C79.4002 5.96674 78.8757 5.79035 78.2078 5.79035C77.6904 5.79035 77.2059 5.93616 76.7567 6.23014C76.3075 6.52412 75.9594 6.90747 75.7148 7.38489H75.6937V0.785645H72.9773V18.5608H75.3056L75.5925 17.3755H75.6537C75.8724 17.7988 76.1993 18.1304 76.6344 18.3774C77.0695 18.622 77.554 18.7443 78.0855 18.7443C79.038 18.7443 79.7412 18.3045 80.1904 17.4272C80.6396 16.5476 80.8653 15.1765 80.8653 13.3092V11.3266C80.8653 9.92722 80.7783 8.82892 80.609 8.0387ZM78.0243 13.1492C78.0243 14.0617 77.9867 14.7767 77.9114 15.2941C77.8362 15.8115 77.7115 16.1808 77.5328 16.3971C77.3564 16.6158 77.1165 16.724 76.8178 16.724C76.585 16.724 76.371 16.6699 76.1734 16.5594C75.9759 16.4512 75.816 16.2866 75.6937 16.0702V8.96062C75.7877 8.6196 75.9524 8.34209 76.1852 8.12337C76.4157 7.90465 76.6697 7.79646 76.9401 7.79646C77.2271 7.79646 77.4481 7.90935 77.6034 8.13278C77.7609 8.35855 77.8691 8.73485 77.9303 9.26636C77.9914 9.79787 78.022 10.5528 78.022 11.5335V13.1492H78.0243Z"
                  ></path>
                  <path
                    d="M84.8657 13.8712C84.8657 14.6755 84.8892 15.2776 84.9363 15.6798C84.9833 16.0819 85.0821 16.3736 85.2326 16.5594C85.3831 16.7428 85.6136 16.8345 85.9264 16.8345C86.3474 16.8345 86.639 16.6699 86.7942 16.343C86.9518 16.0161 87.0365 15.4705 87.0506 14.7085L89.4824 14.8519C89.4965 14.9601 89.5035 15.1106 89.5035 15.3011C89.5035 16.4582 89.186 17.3237 88.5534 17.8952C87.9208 18.4667 87.0247 18.7536 85.8676 18.7536C84.4777 18.7536 83.504 18.3185 82.9466 17.446C82.3869 16.5735 82.1094 15.2259 82.1094 13.4008V11.2136C82.1094 9.33452 82.3987 7.96105 82.9772 7.09558C83.5558 6.2301 84.5459 5.79736 85.9499 5.79736C86.9165 5.79736 87.6597 5.97375 88.1771 6.32888C88.6945 6.684 89.059 7.23433 89.2707 7.98457C89.4824 8.7348 89.5882 9.76961 89.5882 11.0913V13.2362H84.8657V13.8712ZM85.2232 7.96811C85.0797 8.14449 84.9857 8.43377 84.9363 8.83593C84.8892 9.2381 84.8657 9.84722 84.8657 10.6657V11.5641H86.9283V10.6657C86.9283 9.86133 86.9001 9.25221 86.846 8.83593C86.7919 8.41966 86.6931 8.12803 86.5496 7.95635C86.4062 7.78702 86.1851 7.7 85.8864 7.7C85.5854 7.70235 85.3643 7.79172 85.2232 7.96811Z"
                  ></path>
                </g>
              </g>
            </svg>
          </svg>
        </a>
      </div>
      <div class="header-center">
        <input type="text" placeholder="검색" />
        <button type="button">
          <i class="fa-solid fa-magnifying-glass"></i>
        </button>
      </div>
      <div class="header-end">
        <button type="button"><i class="fa-solid fa-user"></i></button>
      </div>
    </header>
    <main>
      <aside>
        <a href=""><i class="fa-solid fa-house"></i> <span>홈</span></a>
        <a href=""><i class="fa-solid fa-folder"></i><span>구독</span></a>
      </aside>
      <div class="main-content">
        <nav>
          <a href="" class="active">전체</a>
          <a href="">음악</a>
          <a href="">게임</a>
          <a href="">뉴스</a>
          <a href="">라이브</a>
          <a href="">야생생물</a>
        </nav>
        <section>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Itaque
            nostrum repellendus consequatur beatae nobis fugit molestias ducimus
            alias, rem omnis dolorum aliquid sequi sit excepturi ea laudantium
            dolore porro exercitationem! Voluptate expedita saepe odit accusamus
            cupiditate cum ipsum enim consectetur eveniet suscipit tempora amet
            consequuntur assumenda perspiciatis dolore, tempore illo labore
            possimus sequi aspernatur, voluptatum obcaecati libero. Velit, aut
            nesciunt. Amet veniam omnis officiis asperiores quisquam cumque
            iusto, porro, ratione nemo, culpa quibusdam! Officia dignissimos
            beatae quia error harum eveniet dolorem qui eum vitae, dolor
            incidunt, provident obcaecati, dolores quos? Qui sit temporibus
            voluptates, nemo officiis quod soluta voluptatum? Nobis perspiciatis
            odio in corrupti aut similique atque at dolorem doloribus quidem
            eveniet ratione veniam est amet, architecto repellendus. Obcaecati,
            delectus! Quibusdam ratione debitis excepturi deleniti accusamus
            magni aperiam error sint, impedit quod doloremque rem dolorum soluta
            ex eaque vero praesentium corrupti, expedita quisquam sed nam
            architecto! Iusto nam corporis assumenda. Voluptatem tempore sed
            iusto, nulla maiores repudiandae quod animi nisi illum quae,
            placeat, repellat libero! Dolore aperiam totam alias ex quam sunt
            odit vero accusantium, adipisci, assumenda, officia nam voluptates.
            Quae voluptatibus animi culpa ab temporibus laborum dignissimos
            magni aliquam est commodi, alias neque nulla incidunt facere
            voluptate labore repellat vero unde totam. Sed reprehenderit fuga,
            culpa adipisci voluptates maiores! Ut, repellendus iusto sit, totam
            tempora perferendis accusamus aliquam voluptate modi in nihil.
            Delectus nesciunt dignissimos, labore inventore soluta aliquam
            itaque id saepe vero quod, aut vitae veritatis, illo possimus!
            Incidunt quidem eum beatae magni quia voluptates minus alias
            accusamus nemo inventore illum labore illo cupiditate placeat,
            dolorem magnam itaque possimus, doloremque omnis eveniet velit.
            Fugiat nostrum dolor alias est. Veritatis rem, laboriosam eum cumque
            maiores, dolorem sequi molestias qui neque consectetur, eligendi vel
            non distinctio eaque veniam! Cupiditate ex deserunt eius odio culpa
            odit vero asperiores at accusantium iste! Quasi maiores unde
            necessitatibus quidem eveniet animi iusto expedita aspernatur iste,
            autem fugit, id, repellendus perferendis tenetur adipisci reiciendis
            quos laudantium sed molestiae veritatis tempora et fuga illo eum?
            Fuga? Deserunt ad voluptate ipsam velit dolorem! Consequatur at,
            animi perferendis consequuntur incidunt deserunt eligendi molestiae
            nam minima nobis recusandae, saepe quae quibusdam voluptatum totam
            officiis dolores maiores repudiandae consectetur. Aspernatur! Labore
            eligendi tempora ipsum maxime cum qui nemo inventore voluptate, odio
            fuga cumque consequatur sit cupiditate nostrum itaque nam voluptatum
            eos, ut dolores sapiente. Numquam placeat iusto expedita rem sunt.
            Ipsa, explicabo vel. Possimus nulla earum enim, dignissimos
            excepturi ex, eum commodi fugiat accusamus natus officia ut facilis
            reiciendis veniam nostrum sint, delectus odio culpa? Veniam ab
            corporis nobis tenetur? Nam velit minima hic a optio amet, facilis,
            magni fugiat minus tempore praesentium molestias provident dolorem
            repellat libero quod animi iusto eaque rem laboriosam qui corporis
            aliquid sed? Quos, at. Enim eligendi eos veniam quo delectus in
            ducimus quaerat, nam, eum labore quia hic autem assumenda dolor
            nesciunt, alias distinctio cumque illum iusto repudiandae? Nobis
            quis voluptates porro quisquam omnis? Accusamus suscipit officiis,
            possimus ex quas voluptates maiores eius, quos modi fuga earum
            doloribus dolores architecto error voluptatibus ea illo nulla
            laborum esse iste pariatur itaque minima odio. Fugit, nisi!
            Corporis, deleniti, ipsam accusamus dolorum voluptas eum pariatur
            doloremque dicta eius, et necessitatibus fuga ea sapiente doloribus
            temporibus dolor illum labore unde veniam sit quam alias. Libero
            enim nesciunt cupiditate! Debitis quisquam nam illo dignissimos sunt
            excepturi ipsum inventore dicta veritatis. Recusandae molestias
            minus, rerum, qui sunt eligendi quia ducimus blanditiis minima eos
            quod, sit vel eum doloribus distinctio ad. Ipsum architecto sed,
            nihil exercitationem voluptatum voluptatem aspernatur expedita eius,
            voluptate, eum doloremque praesentium odio pariatur eveniet quis
            cumque? Libero, quod suscipit similique hic sed saepe commodi
            tempore exercitationem a! Beatae animi ab illum quia fugiat
            accusamus molestiae, fuga eos magnam! Architecto ipsum voluptate
            exercitationem consequatur amet nobis similique at officiis
            repellendus cum velit explicabo libero quisquam, aliquam atque
            delectus. Sed tempora excepturi libero, dolore officiis at veniam
            hic assumenda soluta deserunt culpa et beatae praesentium fugiat
            corporis saepe alias atque magni incidunt quos voluptas doloremque
            repudiandae expedita nemo. Illo. Iure eveniet unde officiis vitae
            praesentium voluptate, tenetur fugiat, ullam iusto assumenda nam
            fuga rem quae. Nam eius sed ducimus facere illum incidunt vero,
            aspernatur tempora eveniet mollitia, voluptatem culpa. Aliquam
            beatae, odit aliquid perspiciatis optio ullam, recusandae itaque
            quisquam eaque molestiae necessitatibus, nesciunt similique
            perferendis repudiandae temporibus impedit delectus! Expedita nemo
            molestias voluptates! Sequi corrupti est aperiam ex molestias.
            Beatae illum est voluptates numquam vel enim, nisi eligendi incidunt
            vitae totam ipsum mollitia error in facilis, quam at quasi similique
            veritatis laudantium deserunt molestiae quibusdam? Delectus eligendi
            esse laborum? Eaque maiores quas, minima error fugiat placeat quos
            odit, consequatur modi explicabo ex debitis! A ducimus tenetur
            quaerat illum, sequi sed sit vero? Aliquam odit, inventore ipsa
            possimus quod aspernatur. Quisquam, excepturi dolorum fuga enim sint
            minus at commodi mollitia, tempora velit esse, distinctio amet hic
            non fugiat adipisci odio? Sit impedit ad excepturi veniam dolores
            voluptatum deserunt deleniti. Voluptas! Doloremque, nesciunt at!
            Quas minima, corporis laborum illo quibusdam voluptatum, totam quia
            minus atque voluptate, soluta maxime aperiam possimus aspernatur
            repellendus! Iusto esse ut totam, tempora animi corporis?
            Exercitationem, dolore. Expedita non nemo cumque porro blanditiis
            molestias atque amet perspiciatis. Ducimus doloribus saepe maxime,
            vero laboriosam dolor excepturi ipsa odio beatae cumque in optio, ut
            veritatis minima asperiores ipsum ad! Debitis odio vel cumque
            accusamus sit accusantium, corporis at ut, reiciendis aspernatur
            quisquam autem excepturi quod facere! Assumenda inventore optio
            voluptatem, cupiditate minima culpa illum quisquam ex, aliquid nobis
            id. Odit eligendi iure iusto placeat expedita ea dolorem animi?
            Laudantium ratione earum quam aspernatur. Nostrum debitis quod
            deleniti assumenda earum! Cum aliquid sint soluta commodi molestias
            totam repellendus, nostrum reiciendis? Ea architecto quae ducimus
            ullam sequi nulla at dignissimos accusamus magnam, pariatur sit ab
            nobis eligendi? Assumenda, velit? Numquam excepturi porro
            repellendus omnis illo architecto expedita accusantium error ipsam.
            Nostrum. Ipsum ipsa quisquam facilis corporis temporibus rerum
            minima illo magni labore repellat unde ducimus modi, obcaecati
            autem! Minima, error, est molestias nihil quia maiores magnam id
            cupiditate libero enim sit. Tempora ea eaque recusandae a itaque?
            Totam dolore eveniet laborum cupiditate at fugit, sequi omnis,
            architecto tenetur voluptatum, molestias animi soluta consectetur
            ullam deserunt nulla id? Neque assumenda ab pariatur! Ea similique
            fuga maxime modi voluptatem sapiente tempore id sed! Nobis provident
            nostrum inventore, assumenda veniam autem consequuntur, numquam
            eveniet odio repudiandae at commodi dolor repellat. Illo laborum
            minima error. Molestias sapiente repellat veniam ut hic animi illum.
            Voluptatum recusandae odio facilis incidunt alias amet delectus
            laboriosam suscipit? Deserunt est voluptatum tenetur ex laborum
            quaerat accusamus dolorum laudantium possimus ullam? Quidem eius
            maxime autem culpa ipsum enim et quas consequuntur consectetur minus
            sequi ex, delectus natus voluptas ducimus architecto quo nobis
            repudiandae! Incidunt ipsa sed eos quidem rerum laudantium odit!
            Laborum, voluptatibus! Eius animi quaerat aspernatur dolorum minus
            officiis ducimus fugit, in cumque accusamus dolores magnam
            reprehenderit expedita labore voluptates eum illo veritatis
            reiciendis sint nobis culpa. Eius, iure molestias. Animi adipisci
            nisi natus iusto odio officiis aperiam molestiae enim laboriosam,
            rerum voluptate quam odit a numquam labore cumque, iste modi dicta.
            Eveniet quo debitis culpa eos expedita molestias explicabo. Quas aut
            deserunt sint doloremque modi qui sed corporis enim molestiae
            aliquid quibusdam quos hic debitis repellat voluptate odio maxime
            quasi, veniam eaque rem ad voluptates autem. Ad, eos ipsam.
            Laudantium consectetur omnis est officia impedit vitae deserunt eos
            dicta doloremque optio, sequi cumque delectus reprehenderit, unde
            ratione itaque. Cumque, accusamus. Debitis atque ex consequatur
            obcaecati numquam in odit beatae. Maiores possimus, alias ipsam
            consequuntur natus minus nam nobis voluptatum impedit voluptates ex
            distinctio consectetur exercitationem sequi, nisi laboriosam officia
            deleniti deserunt, sit assumenda tenetur cupiditate est provident
            reiciendis. Blanditiis. Possimus incidunt excepturi quo vero
            facilis! Cupiditate nihil magni voluptatem quibusdam corrupti autem,
            vel in impedit voluptates, placeat odio error architecto ipsa
            tempora reprehenderit perspiciatis consequatur voluptate rem sunt
            totam? Odit nesciunt voluptate numquam laborum facere a totam nisi
            doloribus nostrum pariatur repellat iure, aperiam nulla explicabo.
            Ea hic, cumque, ducimus vitae nostrum eius laudantium quasi
            perspiciatis, quo mollitia est? In earum iusto similique soluta
            dolor ipsa optio veritatis corrupti, expedita blanditiis nobis sit
            doloremque maiores nihil molestiae dignissimos? Libero neque quas
            dolorum at assumenda repudiandae ab fuga ut. Voluptatem. Natus culpa
            aliquid, fugiat temporibus id necessitatibus voluptas, distinctio
            magni eaque explicabo quisquam molestiae incidunt perspiciatis
            labore voluptatum amet pariatur rerum nemo obcaecati architecto
            voluptate, quia nihil quis accusantium! Dolorem? Doloremque,
            deserunt sapiente quibusdam at veritatis dolorem eos cumque velit
            reiciendis ad harum non autem dolorum reprehenderit maiores magni
            ut. Magnam laudantium velit perferendis dolore aut! Illo perferendis
            praesentium temporibus. Doloribus, aut veritatis voluptatibus
            placeat in blanditiis mollitia. Nostrum quis velit ratione. Id
            exercitationem reprehenderit placeat animi. Officiis amet, cumque
            expedita, voluptate eum temporibus nemo excepturi voluptates
            repellat itaque laboriosam. Quos, quisquam alias? Eaque quam
            adipisci non eveniet molestias voluptatum repellat voluptates
            dolores unde dolorum a aut soluta id eos repudiandae quia at, saepe
            aspernatur? Laudantium ab dolores voluptates non. Fugit suscipit
            distinctio adipisci reiciendis debitis vel error ducimus incidunt
            obcaecati facere nostrum sunt aut, illum assumenda laborum iusto!
            Alias eius odio deserunt ut tempora magnam possimus, unde quaerat
            corrupti. Tempore exercitationem excepturi natus, culpa saepe a hic.
            Nemo soluta perferendis ut aperiam earum harum eos ipsa error
            sapiente eveniet! Quidem doloremque ipsum nostrum odio fugit iure
            cum qui nemo. Excepturi rerum recusandae fuga neque labore ex
            tempora corporis, est dicta in aliquam perspiciatis nobis, autem qui
            inventore natus animi soluta facere? Blanditiis impedit a
            voluptatibus quia cumque, quos excepturi. Dignissimos ducimus ullam
            officia quidem cum, tempore sunt laborum nulla, eveniet eius
            similique magnam. Placeat ullam numquam culpa rem non modi unde
            vitae praesentium, voluptatum enim id. Suscipit, provident culpa.
            Cumque quis officiis sunt obcaecati doloremque voluptate, quibusdam
            maxime rem tempora accusantium harum blanditiis veritatis suscipit
            cum similique sed impedit amet, debitis necessitatibus eligendi,
            vero facere. Quos blanditiis architecto laudantium. Debitis, aliquam
            temporibus! Explicabo officia illum animi! Delectus, recusandae!
            Iusto tempora est deserunt adipisci consequatur libero vel
            assumenda, quibusdam ipsam non cum excepturi sapiente praesentium
            amet reiciendis. Quo, molestias officia? Ut quisquam culpa quam unde
            modi quo dignissimos, dolor rem, impedit iure dolores. Quae fugiat,
            distinctio, praesentium ea, obcaecati reiciendis minus amet quis
            quas libero quisquam officia dignissimos excepturi doloribus?
            Excepturi rem, minus sequi ab maiores doloremque officia quas
            consequatur, blanditiis amet qui nemo cupiditate eaque dolor minima
            sit sunt dolore nostrum labore? Aliquam architecto eveniet eligendi
            debitis corrupti dignissimos! Quia itaque hic provident beatae
            corrupti facere, perspiciatis impedit deleniti libero atque
            veritatis vel soluta magnam repudiandae distinctio consequatur
            pariatur? Distinctio, cumque aut qui eaque autem sint dolorum fuga
            corporis! Et iure obcaecati quod rem alias, at delectus nam
            voluptatibus cupiditate vitae dolores itaque, mollitia ex explicabo
            laboriosam sint blanditiis enim similique? Debitis aut quo porro
            iste consequuntur dolore obcaecati! Ducimus aut repudiandae enim
            unde illo modi voluptate delectus quis, corporis corrupti
            exercitationem itaque doloremque magnam perspiciatis necessitatibus
            quia obcaecati. Vel nostrum reprehenderit corrupti aspernatur,
            voluptate voluptatibus beatae hic suscipit? Ullam quo dolorum dolor
            labore adipisci nobis laboriosam molestiae, hic quam. Unde sed
            consequuntur rerum sunt voluptas similique perferendis. Aut error
            doloribus laudantium id veritatis nihil dolores impedit nemo
            consectetur. Officiis quidem debitis, earum dolorem voluptatem odio
            hic! Maxime ipsam illo temporibus id, in est aperiam consectetur
            numquam placeat enim quaerat iste blanditiis sed! Unde sed quae
            reprehenderit error quos. Ut laborum maxime natus odit eum quasi
            nisi id incidunt tempore, illo est et vero adipisci consequatur odio
            voluptatem! Nam doloremque repudiandae laboriosam ipsam animi eius
            officiis, iusto quod dicta. Placeat fuga reprehenderit pariatur
            ipsam vel laborum repellendus nam qui dignissimos soluta inventore
            quam ipsum obcaecati aperiam, doloremque quia iste quidem incidunt
            aspernatur. Ipsa amet molestias fugit voluptatibus ullam atque!
            Nobis nihil tenetur reprehenderit quae blanditiis illum earum
            laborum iste! Excepturi, ratione saepe! Rerum corrupti animi eaque
            temporibus culpa esse eveniet vero, explicabo quisquam! Impedit
            voluptatibus quod eos molestiae quis. Molestias non libero officia
            quasi repellat amet harum debitis quisquam nemo dignissimos maxime
            cumque vero eaque, inventore saepe? Sequi neque similique
            perferendis, tempore eaque necessitatibus. Recusandae in eaque vel
            possimus? Delectus, itaque voluptatibus perspiciatis unde
            exercitationem consectetur, placeat error hic officiis sunt iste
            facere numquam alias tempore odit natus voluptate asperiores eius
            inventore distinctio quis eveniet cumque est quaerat! Cupiditate?
            Animi voluptate corporis ipsum aut, nesciunt voluptatem, nostrum qui
            dolor incidunt sequi velit sunt nobis est ab provident sit
            voluptates eum. Dolor hic non repudiandae explicabo eum quisquam
            modi incidunt. Iusto eius provident impedit, error, iste facilis
            libero distinctio quis amet aliquid ab illo dignissimos quasi
            necessitatibus voluptatem. Explicabo sint laudantium atque minima
            reiciendis voluptatibus incidunt deleniti temporibus necessitatibus
            dicta. Veritatis assumenda eos, voluptatibus placeat velit nesciunt
            pariatur! Ex nostrum neque qui quo, dolor provident optio, officia
            sequi, ratione quod inventore iure labore tempora animi ipsa dolorum
            culpa vitae. Exercitationem? Ea eos repellat ex repellendus corrupti
            officia itaque quam, quos, voluptatum, molestias pariatur libero
            magni. Dolor, quis rerum minima officia, qui voluptas in at aut
            explicabo doloremque maiores ipsa id. Aliquid nemo harum alias
            aperiam porro delectus veritatis corrupti sunt fugit vel perferendis
            nam, molestias dolorum recusandae dolore eos deleniti assumenda
            quaerat vitae nesciunt distinctio facere provident non cumque.
            Dolore. Voluptatibus quisquam aperiam possimus animi eaque,
            repellendus nulla ducimus qui quos dicta quidem saepe cupiditate
            exercitationem iste magnam quaerat non expedita aut tenetur ipsa
            rerum ad cum distinctio? Eveniet, aliquam. Sequi voluptatibus illo
            iure sed aperiam neque, nobis temporibus unde repellat totam esse
            asperiores mollitia blanditiis, debitis similique tenetur atque aut
            in molestiae. Culpa praesentium consectetur magni nulla. Vitae,
            repellendus! Provident est temporibus perspiciatis eum possimus
            sint, dicta sed quisquam nostrum ipsum nisi, dolorem eveniet modi
            mollitia maxime corporis officiis cumque natus! Quisquam nobis
            obcaecati dicta veritatis. Vero, fugit facilis. Ab doloribus natus
            fugiat nisi. Quasi ea modi ad. Quo, neque. Harum, nisi ducimus sunt
            ea, ratione laborum in excepturi veniam, consequuntur sapiente
            deserunt. Voluptatem veritatis dolore iure ad commodi. Amet nobis
            eum cum, totam eaque quis odit earum ullam ipsa laboriosam natus
            soluta velit doloribus eligendi omnis expedita, ea labore
            perferendis aspernatur facilis eius nemo recusandae molestias!
            Porro, voluptatum. Autem esse harum rerum debitis nulla in nesciunt
            rem dignissimos, sequi aliquam fuga molestias necessitatibus
            laudantium sed ipsa quaerat asperiores similique suscipit ex. Error
            blanditiis pariatur debitis commodi accusantium. Cum? Accusantium
            numquam et praesentium, fugiat quis ipsum excepturi earum sapiente
            esse itaque, quaerat quae alias. Veritatis voluptas reiciendis
            accusamus obcaecati eligendi deserunt enim aliquid. Eum quaerat
            commodi inventore molestiae ipsam? Ipsa consequuntur tempora
            necessitatibus fuga dolor nobis deleniti voluptatem incidunt, sint
            voluptate reiciendis consectetur praesentium fugiat asperiores ipsam
            animi ea quasi consequatur vitae vero. Placeat velit temporibus
            earum beatae iure. Accusantium ducimus vel ipsum necessitatibus
            voluptatem consectetur cumque, labore provident, minima voluptates
            qui obcaecati ut repudiandae, aspernatur hic fugit? Quisquam
            consequatur optio impedit esse assumenda, incidunt temporibus rem
            hic blanditiis. Hic, et tempore repudiandae velit quas autem,
            repellendus accusantium dolor officiis labore nisi architecto, nemo
            eius temporibus neque quae totam magnam. Ipsa, unde sunt! Magni
            earum provident excepturi quaerat reiciendis? Expedita, libero
            tenetur praesentium, dolores adipisci consectetur ab sunt dolor
            dignissimos eligendi accusamus ratione ipsam facilis deserunt
            consequuntur inventore impedit. Officia sequi magnam temporibus nemo
            iure a impedit, doloremque at. Exercitationem molestiae nisi dolor
            vero ipsam voluptate repellendus inventore nihil iusto aliquam
            nostrum libero dolore minima quasi distinctio natus ullam, dolorem
            omnis error id, modi numquam deleniti. Eum, earum nulla? Ipsum
            repellendus, nostrum sequi officiis quia laboriosam expedita veniam?
            Non ex temporibus quod fuga veniam ab saepe consequatur consequuntur
            provident iusto? In dolor libero ut quam quidem rerum incidunt cum!
            Et at non veniam consequuntur commodi laudantium ratione quo
            veritatis. Iste, similique at! Doloremque illo ullam, eos totam ut,
            autem voluptatibus voluptatem eum fuga fugit deleniti et veniam
            minus! Officia? Ipsa reiciendis quasi harum ipsam eligendi optio et
            dolores, rerum quae quisquam illum quidem suscipit, non, ducimus
            consectetur? Quisquam beatae, quae veritatis perspiciatis sunt rem
            consectetur eaque in possimus impedit. Velit veritatis officiis,
            rerum illo sed dignissimos, dolore nulla magni iusto sequi id.
            Commodi aperiam iste perferendis. Quisquam ut eos dolorum, facere
            illum laborum sed, earum animi ratione magni illo? Veritatis error
            odio, quisquam ratione repellendus asperiores, obcaecati corporis
            perspiciatis totam quaerat nam cupiditate! Iusto voluptatem fugiat
            quam ratione nisi! Culpa perferendis, reiciendis ad enim nisi
            laudantium quisquam iure ducimus! Dolorem excepturi numquam qui hic,
            quia modi nisi quidem, vitae eligendi molestiae exercitationem
            libero labore omnis dicta at repudiandae autem distinctio
            praesentium? Quo porro maxime officiis consectetur repudiandae
            expedita aspernatur. Dicta accusantium expedita amet aspernatur non
            architecto maxime veniam odit sequi illum et labore libero,
            doloremque temporibus itaque. Similique magni veniam officia ea
            totam in impedit ipsa corrupti voluptates id? Unde beatae placeat
            rerum quia recusandae voluptatum dolores doloribus, pariatur laborum
            voluptatem. Esse, earum eaque alias adipisci consequuntur illum
            neque harum facilis velit placeat quam accusantium deleniti
            repellendus veritatis? Doloribus. Fuga quisquam aspernatur dicta
            distinctio porro quo molestiae possimus repudiandae rem sequi at
            laudantium magni nulla omnis aut, repellat nesciunt commodi amet
            placeat aliquam, cum nam quibusdam esse accusamus! Perspiciatis!
            Quam aperiam voluptatum ducimus, inventore quod corrupti ullam
            similique at error? Veniam, dolorum maxime beatae temporibus rerum
            ut? Corrupti quaerat illum unde earum itaque odit natus dicta
            dolorum nemo perspiciatis? Illo aliquam necessitatibus quisquam et
            sapiente nulla, delectus cum. Porro magnam sed iure velit nobis
            error inventore, omnis nostrum. Maiores, vero dolore mollitia facere
            voluptate nostrum vitae expedita illum officia! Cupiditate modi,
            neque placeat voluptatem pariatur rerum, corrupti vitae voluptate
            dolorum accusantium perferendis in sunt laborum illo ipsum voluptas
            ex nostrum. Aperiam ipsum, minima ea provident dolores reiciendis
            error repudiandae! Aperiam qui eos aspernatur, numquam rerum
            molestiae fuga natus vitae optio. Mollitia iste pariatur unde, at
            eum, obcaecati ducimus et labore accusantium ullam sit suscipit
            sequi est fugiat neque quaerat. Impedit perspiciatis repellat, sit
            culpa ea voluptas quibusdam quaerat praesentium necessitatibus dicta
            tempore quo minus temporibus aperiam neque illum quasi! Obcaecati
            culpa pariatur magni numquam praesentium, vero in repellendus iure?
            Quidem enim repellat eum optio delectus, molestias nulla saepe
            soluta ad modi sed at fuga praesentium? Quidem nobis assumenda rerum
            dignissimos! Eligendi quas fugit, mollitia soluta earum recusandae
            illum obcaecati. Laborum amet saepe explicabo pariatur iste autem,
            possimus maxime consequatur similique esse numquam unde voluptatem
            nobis, sint ab molestiae quos perspiciatis neque totam veniam
            dignissimos labore sed ad tenetur. Perspiciatis.
          </p>
        </section>
      </div>
    </main>
    <script src="script.js"></script>
  </body>
</html>
    