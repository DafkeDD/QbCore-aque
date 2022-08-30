SetupLawyers = function(data) {
    $(".lawyers-list").html("");
    var lawyers = [];
    var realestate = [];
    var mechanic = [];
    var taxi = [];
    var ambulance = [];

    if (data.length > 0) {

        $.each(data, function(i, lawyer) {
            if (lawyer.typejob == "police") {
                lawyers.push(lawyer);
            }
            if (lawyer.typejob == "ambulance") {
                realestate.push(lawyer);
            }
            if (lawyer.typejob == "mechanic") {
                mechanic.push(lawyer);
            }
            if (lawyer.typejob == "tuner") {
                taxi.push(lawyer);
            }
            if (lawyer.typejob == "pizzathis") {
                ambulance.push(lawyer);
            }
        });

        $(".lawyers-list").append('<h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; border-top-left-radius: .5vh; border-top-right-radius: .5vh; width:100%; display:block; background-color: rgb(42, 137, 214);">Polismyndigheten (' + lawyers.length + ')</h1>');

        if (lawyers.length > 0) {
            $.each(lawyers, function(i, lawyer) {
                var element = '<div class="lawyer-list" id="lawyerid-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid-" + i).data('LawyerData', lawyer);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga poliser i tjänst än.</div></div>'
            $(".lawyers-list").append(element);
        }

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(155, 15, 120);">Landstinger (' + realestate.length + ')</h1>');

        if (realestate.length > 0) {
            $.each(realestate, function(i, lawyer1) {
                var element = '<div class="lawyer-list" id="lawyerid1-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer1.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer1.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid1-" + i).data('LawyerData', lawyer1);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga sjukvårdare i tjänst än.</div></div>'
            $(".lawyers-list").append(element);
        }

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(0, 204, 102);">Auto Exotic (' + mechanic.length + ')</h1>');

        if (mechanic.length > 0) {
            $.each(mechanic, function(i, lawyer2) {
                var element = '<div class="lawyer-list" id="lawyerid2-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer2.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer2.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid2-" + i).data('LawyerData', lawyer2);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga mekaniker i tjänst än.</div></div>'
            $(".lawyers-list").append(element);
        }

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 190, 27);">Redline (' + taxi.length + ')</h1>');

        if (taxi.length > 0) {
            $.each(taxi, function(i, lawyer3) {
                var element = '<div class="lawyer-list" id="lawyerid3-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer3.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer3.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid3-" + i).data('LawyerData', lawyer3);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga redline personal i tjänst än.</div></div>'
            $(".lawyers-list").append(element);
        }
        
        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 0, 0);">Pizzeria (' + ambulance.length + ')</h1>');

        if (ambulance.length > 0) {
            $.each(ambulance, function(i, lawyer5) {
                var element = '<div class="lawyer-list" id="lawyerid5-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer5.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer5.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
                $(".lawyers-list").append(element);
                $("#lawyerid5-" + i).data('LawyerData', lawyer5);
            });
        } else {
            var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga pizza bagare i tjänst än.</div></div>'
            $(".lawyers-list").append(element);
        }
    } else {
        $(".lawyers-list").append('<h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; border-top-left-radius: .5vh; border-top-right-radius: .5vh; width:100%; display:block; background-color: rgb(42, 137, 214);">Poliser (' + lawyers.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga poliser i tjänst än.</div></div>'
        $(".lawyers-list").append(element);

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(155, 15, 120);">Mäklare (' + realestate.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga sjukvårdare i tjänst än.</div></div>'
        $(".lawyers-list").append(element);

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(0, 204, 102);">Mekaniker (' + mechanic.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga mekaniker i tjänst än.</div></div>'
        $(".lawyers-list").append(element);

        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 190, 27);">Taxi (' + taxi.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga redline personal i tjänst än.</div></div>'
        $(".lawyers-list").append(element);
        
        $(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(255, 0, 0);">Sjukvårdare (' + ambulance.length + ')</h1>');

        var element = '<div class="lawyer-list"><div class="no-lawyers">Det finns inga pizza bagare i tjänst än.</div></div>'
        $(".lawyers-list").append(element);
    }
}

$(document).on('click', '.lawyer-list-call', function(e){
    e.preventDefault();

    var LawyerData = $(this).parent().data('LawyerData');
    
    var cData = {
        number: LawyerData.phone,
        name: LawyerData.name
    }

    $.post('https://qb-phone/CallContact', JSON.stringify({
        ContactData: cData,
        Anonymous: QB.Phone.Data.AnonymousCall,
    }), function(status){
        if (cData.number !== QB.Phone.Data.PlayerData.charinfo.phone) {
            if (status.IsOnline) {
                if (status.CanCall) {
                    if (!status.InCall) {
                        if (QB.Phone.Data.AnonymousCall) {
                            QB.Phone.Notifications.Add("fas fa-phone", "Telefon", "Du startade ett anonymt samtal!");
                        }
                        $(".phone-call-outgoing").css({"display":"block"});
                        $(".phone-call-incoming").css({"display":"none"});
                        $(".phone-call-ongoing").css({"display":"none"});
                        $(".phone-call-outgoing-caller").html(cData.name);
                        QB.Phone.Functions.HeaderTextColor("white", 400);
                        QB.Phone.Animations.TopSlideUp('.phone-application-container', 400, -160);
                        setTimeout(function(){
                            $(".lawyers-app").css({"display":"none"});
                            QB.Phone.Animations.TopSlideDown('.phone-application-container', 400, 0);
                            QB.Phone.Functions.ToggleApp("phone-call", "block");
                        }, 450);
    
                        CallData.name = cData.name;
                        CallData.number = cData.number;
                    
                        QB.Phone.Data.currentApplication = "phone-call";
                    } else {
                        QB.Phone.Notifications.Add("fas fa-phone", "Telefon", "Du är redan ansluten till ett samtal!");
                    }
                } else {
                    QB.Phone.Notifications.Add("fas fa-phone", "Telefon", "Den här personen är redan i ett samtal");
                }
            } else {
                QB.Phone.Notifications.Add("fas fa-phone", "Telefon", "Den här personen är inte tillgänglig!");
            }
        } else {
            QB.Phone.Notifications.Add("fas fa-phone", "Telefon", "Du kan inte ringa ditt eget nummer!");
        }
    });
});
