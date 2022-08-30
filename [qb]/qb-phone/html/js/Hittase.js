Phone.Apps['Hittase'] = {
    Template: `
        <div class="hittase-container">
            <div class="hittase-header">
    
                <div class="hittase-icon">
                    <img src="https://www.hitta.se/staticv4/header/hitta.svg"/>
                </div>

                <div class="hittase-input">
                    <input type="text" placeholder="Namn telefon" oninput="$(this).val().length > 0 ? $('.hittase-searchIcon').addClass('active') : $('.hittase-searchIcon').removeClass('active')">
                    <div class="hittase-searchIcon" onClick="Phone.Apps['Hittase'].Functions.Search()">
                        <i class="material-icons">search</i>
                    </div>
                </div>
            </div>

            <div class="hittase-content"></div>
        </div>
    `,
    Functions: {
        Search: function () {
            let Input = $(`.hittase-input input`).val();

            if (Input.length > 0) {
                $(`.hittase-content`).empty();

                var i;
                for (i = 0; i < Phone.Apps['Hittase'].Characters.length; i++) {
                    if (Phone.Apps['Hittase'].Characters[i].Name.toUpperCase().includes(Input.toUpperCase()) || Phone.Apps['Hittase'].Characters[i].Number.includes(Input)) {
                        $(`.hittase-content`).append(`
                            <div class="hittase-person">
                                <div class="hittase-person-name">${Phone.Apps['Hittase'].Characters[i].Name}</div>
                                <div class="hittase-person-number">${Phone.Apps['Hittase'].Characters[i].Number}<i class="material-icons">call</i></div>
                            </div>
                        `)
                    }
                }
            }
        }
    },
    StartFunction: function () {
        Phone.PostMessage('NuiFocus', true);
    },
    Button: function (Key) {
        if (Key == 'ARROW UP') {

        } else if (Key == 'ARROW DOWN') {

        } else if (Key == 'ARROW RIGHT') {

        } else if (Key == 'ARROW LEFT') {

        } else if (Key == 'ENTER') {
            if ($(`.hittase-input input`).is(':focus')) {
                Phone.Apps['Hittase'].Functions.Search()
            }
        } else if (Key == 'BACKSPACE') {
            if ($(`.hittase-input input`).is(':focus')) { return };

            Phone.PostMessage('NuiFocus', false);

            Phone.OpenApp('Home');
        }
    }
}
