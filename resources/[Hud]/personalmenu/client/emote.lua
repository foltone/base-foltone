Walk =  {
    { value = "move_f@multiplayer",label = "Femme par defaut" },
    { value = "move_m@multiplayer",label = "Homme par defaut" },
    { value = "move_m@alien",label = "Alien" },
    { value = "anim_group_move_ballistic",label = "Blindé" },
    { value = "move_f@arrogant@a",label = "Arrogant" },
    { value = "move_m@brave",label = "Courageux" },
    { value = "move_m@casual@a",label = "Decontracte" },
    { value = "move_m@casual@b",label = "Decontracte 2" },
    { value = "move_m@casual@c",label = "Decontracte 3 " },
    { value = "move_m@casual@d",label = "Decontracte 4" },
    { value = "move_m@casual@f",label = "Decontracte 6" },
    { value = "move_f@chichi",label = "Chichi" },
    { value = "move_m@confident",label = "Confiant" },
    { value = "move_m@business@a",label = "Flic" },
    { value = "move_m@business@b",label = "Flic 2"},
    { value = "move_m@business@c",label = "Flic 3"},
    { value = "move_m@drunk@a",label = "Bourre" },
    { value = "move_m@drunk@slightlydrunk",label = "Legerement Bourre" },
    { value = "move_m@buzzed",label = "Bourre 2" },
    { value = "move_m@drunk@verydrunk",label = "Bourre 3" },
    { value = "move_f@femme@",label = "Femme" },
    { value = "move_characters@franklin@fire",label = "Feu" },
    { value = "move_characters@michael@fire",label = "Feu 2" },
    { value = "move_m@fire",label = "Feu 3" },
    { value = "move_f@flee@a",label = "Fuire" },
    { value = "move_p_m_one",label = "Franklin" },
    { value = "move_m@gangster@generic",label = "Gangster" },
    { value = "move_m@gangster@ng",label = "Gangster 2" },
    { value = "move_m@gangster@var_e",label = "Gangster 3" },
    { value = "move_m@gangster@var_f",label = "Gangster 4" },
    { value = "move_m@gangster@var_i",label = "Gangster 5" },
    { value = "anim@move_m@grooving@",label = "Hocher la tete" },
    { value = "move_m@prison_gaurd",label = "Gardien de prison" },
    { value = "move_m@prisoner_cuffed",label = "Attaché" },
    { value = "move_f@heels@c",label = "Talons" },
    { value = "move_f@heels@d",label = "Talons 2" },
    { value = "move_m@hiking",label = "Randonnée" },
    { value = "move_m@hipster@a",label = "Hipster" },
    { value = "move_m@hobo@a",label = "Clochard" },
    { value = "move_f@hurry@a",label = "Se dépècher" },
    { value = "move_p_m_zero_janitor",label = "Gardien" },
    { value = "move_p_m_zero_slow",label = "Gardien 2" },
    { value = "move_m@jog@",label = "Jogging" },
    { value = "anim_group_move_lemar_alley",label = "Lemar" },
    { value = "move_heist_lester",label = "Lester" },
    { value = "move_lester_caneup",label = "Lester 2" },
    { value = "move_f@maneater",label = "Mangeur" },
    { value = "move_ped_bucket",label = "Michael" },
    { value = "move_m@money",label = "Argent" },
    { value = "move_m@muscle@a",label = "Muscle" },
    { value = "move_m@posh@",label = "Chic" },
    { value = "move_f@posh@",label = "Chic 2" },
    { value = "move_m@quick",label = "Rapide" },
    { value = "female_fast_runner",label = "Coureuse" },
    { value = "move_m@sad@a",label = "Triste" },
    { value = "move_m@sassy",label = "Insolent" },
    { value = "move_f@sassy",label = "Insolent 2" },
    { value = "move_f@scared",label = "Appeure" },
    { value = "move_f@sexy@a",label = "Sexy" },
    { value = "move_m@shadyped@a",label = "Douteux" },
    { value = "move_characters@jimmy@slow@",label = "Lent" },
    { value = "move_m@swagger",label = "Assure" },
    { value = "move_m@tough_guy@",label = "Difficile" },
    { value = "move_f@tough_guy@",label = "Difficile 2" },
    { value = "clipset@move@trash_fast_turn",label = "Poubelle" },
    { value = "missfbi4prepp1_garbageman",label = "Poubelle 2" },
    { value = "move_p_m_two",label = "Trevor" },
    { value = "move_m@bag",label = "Large" },
}

Salue = {
    {
        type = "~b~↓↓~s~ Salue  ~b~↓↓",

        salue = {
            {name = "Faire une révérence" ,  value = "anim@mp_player_intcelebrationpaired@f_f_sarcastic" , anim = "sarcastic_left" , loop = 48, command = "curtsy"},
            {name = "Poignée de main" ,  value = "mp_ped_interaction" , anim = "handshake_guy_a" , loop = 48, command = "handshake"},
            {name = "Poignée de main 2" ,  value = "mp_ped_interaction" , anim = "handshake_guy_b" , loop = 48, command = "handshake2"},
            {name = "Salut" ,  value = "anim@mp_player_intincarsalutestd@ds@" , anim = "idle_a" , loop = 51,command = "salut"},
            {name = "Salut 2" ,  value = "anim@mp_player_intincarsalutestd@ps@" , anim = "idle_a" , loop = 51,command = "salut2"},
            {name = "Salut 3" ,  value = "anim@mp_player_intuppersalute" , anim = "idle_a" , loop = 51, command = "salut3"},
            {name = "Signe de la main" ,  value = "friends@frj@ig_1" , anim = "wave_a" , loop = 51, command = "wave"},
            {name = "Signe de la main 2" ,  value = "anim@mp_player_intcelebrationfemale@wave" , anim = "wave" , loop = 51, command = "wave2"},
            {name = "Signe de la main 3" ,  value = "friends@fra@ig_1" , anim = "over_here_idle_a" , loop = 51, command = "wave3"},
            {name = "Signe de la main 4" ,  value = "random@mugging5" , anim = "001445_01_gangintimidation_1_female_idle_b" , loop = 51, command = "wave4"},
            {name = "Signe de la main 5" ,  value = "friends@frj@ig_1" , anim = "wave_b" , loop = 51, command = "wave5"},
            {name = "Signe de la main 6" ,  value = "friends@fra@ig_1" , anim = "wave_c" , loop = 51, command = "wave6"},
            {name = "Signe de la main 7" ,  value = "friends@frj@ig_1" , anim = "wave_d" , loop = 51, command = "wave7"},
            {name = "Signe de la main 8" ,  value = "friends@frj@ig_1" , anim = "wave_e" , loop = 51, command = "wave8"},
            {name = "Signe de la main 9" ,  value = "gestures@m@standing@casual" , anim = "gesture_hello" , loop = 48, command = "wave9"},
            {name = "Siffler" ,  value = "rcmnigel1c" , anim = "hailing_whistle_waive_a" , loop = 48, command = "whistle2"},
            {name = "Siffler Taxi" ,  value = "taxi_hail" , anim = "hail_taxi" , loop = 48, command = "whistle"},
            {name = "S'incliner" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "regal_c_1st" , loop = 48, command = "bow"},
            {name = "S'incliner 2" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "regal_a_1st" , loop = 48, command = "bow2"},
            {name = "Peace" ,  value = "mp_player_int_upperpeace_sign" , anim = "mp_player_int_peace_sign" , loop = 48, command = "peace"},
            {name = "Peace 2" ,  value = "anim@mp_player_intupperpeace" , anim = "idle_a" , loop = 48, command = "peace2"},
            {name = "Bonjour" ,  value = "timetable@amanda@ig_4" , anim = "ig_4_base" , loop = 48, command = "namaste"},

            {name = "Signe de la main 9" ,  value = "gestures@m@standing@casual" , anim = "gesture_hello" , loop = 51, command = "wave9"},
            {name = "Siffler" ,  value = "rcmnigel1c" , anim = "hailing_whistle_waive_a" , loop = 48, command = "whistle2"},
            {name = "Siffler Taxi" ,  value = "taxi_hail" , anim = "hail_taxi" , loop = 51, command = "whistle"},
            {name = "S'incliner'" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "regal_c_1st" , loop = 51, command = "bow"},
            {name = "S'incliner 2" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "regal_a_1st" , loop = 51, command = "bow2"},
            {name = "Peace" ,  value = "mp_player_int_upperpeace_sign" , anim = "mp_player_int_peace_sign" , loop = 51, command = "peace"},
            {name = "Peace 2" ,  value = "anim@mp_player_intupperpeace" , anim = "idle_a" , loop = 51, command = "peace2"},
            {name = "Bonjour" ,  value = "timetable@amanda@ig_4" , anim = "ig_4_base" , loop = 51, command = "namaste"},

        }
    }
}

Actions = {
    {
        type = "~b~↓↓~s~ Actions  ~b~↓↓",

        actions = {
            {name = "BBQ" , scenario = "PROP_HUMAN_BBQ", loop = 1, command = "bbq"},
            {name = "Boire" ,  value = "mp_player_inteat@pnq" , anim = "loop" , loop = 48, command = "drink"},
            {name = "Café" ,  value = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_c" , loop = 51, command = "coffe", 
                Prop = 'p_amb_coffeecup_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Soda" ,  value = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_c" , loop = 51, command = "soda", 
                Prop = 'prop_ecola_can',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            },
            {name = "Whiskey" ,  value = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_c" , loop = 51, command = "whiskey", 
                Prop = 'prop_drink_whisky',
                PropBone = 28422,
                PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            },    
            {name = "Bière" ,  value = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_c" , loop = 51, command = "beer", 
                Prop = 'prop_amb_beer_bottle',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Coupe" ,  value = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_c" , loop = 51, command = "coupe", 
                Prop = 'prop_plastic_cup_02',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
        
            {name = "Vin" ,  value = "anim@heists@humane_labs@finale@keycards" , anim = "ped_a_enter_loop" , loop = 51, command = "vin", 
                Prop = 'prop_drink_redwine',
                PropBone = 18905,
                PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            },
            {name = "Champagne" ,  value = "anim@heists@humane_labs@finale@keycards" , anim = "ped_a_enter_loop" , loop = 51, command = "champagne", 
                Prop = 'prop_drink_champ',
                PropBone = 18905,
                PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            },
            {name = "Flûte" ,  value = "anim@heists@humane_labs@finale@keycards" , anim = "ped_a_enter_loop" , loop = 51, command = "flute", 
                Prop = 'prop_champ_flute',
                PropBone = 18905,
                PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            },
            {name = "Manger" ,  value = "mp_player_inteat@burger" , anim = "mp_player_int_eat_burger" , loop = 48, command = "eat"},
            {name = "Donut" ,  value = "mp_player_inteat@burger" , anim = "mp_player_int_eat_burger" , loop = 48, command = "donut", 
                Prop = 'prop_amb_donut',
                PropBone = 18905,
                PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            },
            {name = "Sandwich" ,  value = "mp_player_inteat@burger" , anim = "mp_player_int_eat_burger" , loop = 48, command = "sandwich", 
                Prop = 'prop_sandwich_01',
                PropBone = 18905,
                PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            },
            {name = "Burger" ,  value = "mp_player_inteat@burger" , anim = "mp_player_int_eat_burger" , loop = 48, command = "burger", 
                Prop = 'prop_cs_burger_01',
                PropBone = 18905,
                PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            },
            {name = "Barre à Ego" ,  value = "mp_player_inteat@burger" , anim = "mp_player_int_eat_burger" , loop = 48, command = "egobar", 
                Prop = 'prop_choc_ego',
                PropBone = 60309,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Dormir" ,  value = "timetable@tracy@sleep@" , anim = "idle_c" , loop = 1, command = "sleep"},
            {name = "Pousser une voiture" ,  value = "missfinale_c2ig_11" , anim = "pushcar_offcliff_m" , loop = 1, command = "push"},
            {name = "Se frotter" ,  value = "move_m@_idles@shake_off" , anim = "shakeoff_1" , loop = 48, command = "shakeoff"},
            {name = "Applaudir en colère" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "angry_clap_a_player_a" , loop = 48, command = "clapangry"},
            {name = "Applaudir lentement" ,  value = "anim@mp_player_intcelebrationfemale@slow_clap" , anim = "slow_clap" , loop = 48, command = "slowclap"},
            {name = "Applaudir lentement 2" ,  value = "anim@mp_player_intcelebrationmale@slow_clap" , anim = "slow_clap" , loop = 48, command = "slowclap2"},
            {name = "Applaudir lentement 3" ,  value = "anim@mp_player_intupperslow_clap" , anim = "idle_a" , loop = 48, command = "slowclap3"},
            {name = "Applaudir" ,  value = "amb@world_human_cheering@male_a" , anim = "base" , loop = 48, command = "clap"},
            {name = "Câlin" ,  value = "mp_ped_interaction" , anim = "kisses_guy_a" , loop = 48, command = "hug"},
            {name = "Câlin 2" ,  value = "mp_ped_interaction" , anim = "kisses_guy_b" , loop = 48, command = "hug2"},
            {name = "Câlin 3" ,  value = "mp_ped_interaction" , anim = "hugs_guy_a" , loop = 48, command = "hug3"},
            {name = "S'agenouiller 2" ,  value = "rcmextreme3" , anim = "idle" , loop = 1, command = "kneel2"},
            {name = "S'agenouiller 3" ,  value = "amb@world_human_bum_wash@male@low@idle_a" , anim = "idle_a" , loop = 1, command = "kneel3"},
            {name = "S'agenouiller main sur la tete" ,  value = "random@arrests@busted" , anim = "idle_a" , loop = 1, command = "surrender"},
            {name = "Frapper à la porte" ,  value = "timetable@jimmy@doorknock@" , anim = "knockdoor_idle" , loop = 48, command = "knock"},
            {name = "Frapper à la porte 2" ,  value = "missheistfbi3b_ig7" , anim = "lift_fibagent_loop" , loop = 48, command = "knock2"},
            {name = "Pousser voiture" ,  value = "missfinale_c2ig_11" , anim = "pushcar_offcliff_f" , loop = 1, command = "push"},
            {name = "Pousser voiture 2" ,  value = "missfinale_c2ig_11" , anim = "pushcar_offcliff_m" , loop = 1, command = "push2"},
            {name = "Taper au clavier penché" ,  value = "anim@heists@prison_heiststation@cop_reactions" , anim = "cop_b_idle" , loop = 48, command = "type"},
            {name = "Taper au clavier penché 2" ,  value = "mp_fbi_heist" , anim = "loop" , loop = 48, command = "type4"},
            {name = "Taper au clavier debout" ,  value = "anim@heists@prison_heistig1_p1_guard_checks_bus" , anim = "loop" , loop = 48, command = "type2"},
            {name = "Taper au clavier debout 2" ,  value = "mp_prison_break" , anim = "hack_loop" , loop = 48, command = "type3"},
            {name = "S'évanouir" ,  value = "missarmenian2" , anim = "drunk_loop" , loop = 1, command = "passout"},
            {name = "S'évanouir 2" ,  value = "missarmenian2" , anim = "corpse_search_exit_ped" , loop = 1, command = "passout2"},
            {name = "S'évanouir 3" ,  value = "anim@gangops@morgue@table@" , anim = "body_search" , loop = 1, command = "passout3"},
            {name = "S'évanouir 4" ,  value = "mini@cpr@char_b@cpr_def" , anim = "cpr_pumpchest_idle" , loop = 1, command = "passout4"},
            {name = "S'évanouir 5" ,  value = "random@mugging4" , anim = "flee_backward_loop_shopkeeper" , loop = 1, command = "passout5"},
            {name = "Caresser" ,  value = "creatures@rottweiler@tricks@" , anim = "petting_franklin" , loop = 0, command = "petting"},
            {name = "Ramper" ,  value = "move_injured_ground" , anim = "front_loop" , loop = 1, command = "crawl"},
            {name = "Salto" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "flip_a_player_a" , loop = 0, command = "flip"},
            {name = "Kapoera" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "cap_a_player_a" , loop = 0, command = "flip2"},
            {name = "Détacher" ,  value = "mp_arresting" , anim = "a_uncuff" , loop = 0, command = "uncuff"},
            {name = "Tirer" ,  value = "random@mugging4" , anim = "struggle_loop_b_thief" , loop = 0, command = "pull"},
            {name = "Pisser" ,  value = "misscarsteal2peeing" , anim = "peeing_loop" , loop = 0, command = "pee"},
            {name = "Main en l'air" ,  value = "missminuteman_1ig_2" , anim = "handsup_base" , loop = 51, command = "handsup"},
            {name = "Glisser" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "slide_a_player_a" , loop = 0, command = "slide"},
            {name = "Glisser 2" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "slide_b_player_a" , loop = 0, command = "slide2"},
            {name = "Glisser 3" ,  value = "anim@arena@celeb@flat@solo@no_props@" , anim = "slide_c_player_a" , loop = 0, command = "slide3"},
            {name = "Faire du stop" ,  value = "random@hitch_lift" , anim = "idle_f" , loop = 1, command = "lift"},
            {name = "Sentir" ,  value = "move_p_m_two_idles@generic" , anim = "fidget_sniff_fingers" , loop = 0, command = "smell"},
            {name = "Ramasser" ,  value = "random@domestic" , anim = "pickup_low" , loop = 0, command = "pickup"},
            {name = "Essayer vêtements" ,  value = "mp_clothing@female@trousers" , anim = "try_trousers_neutral_a" , loop = 0, command = "tryclothes"},
            {name = "Essayer vêtements 2" ,  value = "mp_clothing@female@shirt" , anim = "try_shirt_positive_a" , loop = 0, command = "tryclothes2"},
            {name = "Essayer vêtements 3" ,  value = "mp_clothing@female@shoes" , anim = "try_shoes_positive_a" , loop = 0, command = "tryclothes3"},


        }
    }
}

Frapper = {
    {
        type = "~b~↓↓~s~ Frapper  ~b~↓↓",

        frapper = {

            {name = "Saut de l'ange" ,  value = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , loop = 1,command = "jumpingjacks"},
            {name = "Frapper" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_rear_lefthook" , loop = 0,command = "punch"},
            {name = "Frapper 2" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_cross_r" , loop = 0,command = "punched"},
            {name = "Coup de tête" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_headbutt" , loop = 0,command = "headbutt"},
            {name = "Coup de poing" ,  value = "rcmextreme2" , anim = "loop_punching" , loop = 0,command = "punching"},
            {name = "Gifle" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_slap" , loop = 0,command = "slap"},
            {name = "Gifle 2" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_backslap" , loop = 0,command = "slap2"},
            {name = "Gifle 3" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_slap" , loop = 0,command = "slapped"},
            {name = "Gifle 4" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_backslap" , loop = 0,command = "slapped2"},
            {name = "Se faire frapper" ,  value = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , loop = 51,command = "jumpingjacks"},
            {name = "Frapper" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_rear_lefthook" , loop = 51,command = "punch"},
            {name = "Frapper 2" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_cross_r" , loop = 51,command = "punched"},
            {name = "Coup de tête" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_headbutt" , loop = 51,command = "headbutt"},
            {name = "Coup de poing" ,  value = "rcmextreme2" , anim = "loop_punching" , loop = 51,command = "punching"},
            {name = "Gifle" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_slap" , loop = 48,command = "slap"},
            {name = "Gifle 2" ,  value = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_backslap" , loop = 51,command = "slap2"},
            {name = "Gifle 3" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_slap" , loop = 51,command = "slapped"},
            {name = "Gifle 4" ,  value = "melee@unarmed@streamed_variations" , anim = "victim_takedown_front_backslap" , loop = 51,command = "slapped2"},


        }
    }
}



Sexe = {
    {name = "Twerk", value = "switch@trevor@mocks_lapdance",  anim ="001443_01_trvs_28_idle_stripper", loop = 0, command = "twerk"},
    {name = "Faire du charme", value = "mini@strip_club@idles@stripper", anim = "stripper_idle_02",loop = 0, command = "charme"},
    {name = "Montrer ses Seins", value = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b",loop = 0, command = "boobs"},
    {name = "Dans ton Cul", value = "anim@mp_player_intcelebrationmale@dock", anim = "dock",loop = 0, command = "ass"},
    {name = "Se gratter les couilles", value = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch",loop = 0, command = "scratchingballs"},
    {name = "Se gratter le cul", value = "mp_player_int_upperarse_pick", anim ="mp_player_int_arse_pick",loop = 0, command = "scratchingass"},
    {name = "Strip Tease 1", value = "mini@strip_club@lap_dance@ld_girl_esx_song_esx_p1",  anim ="ld_girl_esx_song_esx_p1_f",loop = 0, command = "strip"},
    {name = "Strip Tease 2", value = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2",loop = 0, command = "strip2"},
    {name = "Strip Tease au sol", value = "mini@strip_club@private_dance@part3",  anim ="priv_dance_p3",loop = 0, command = "strip3"},
    {name = "Femme faire une gaterie en voiture", value = "oddjobs@towing",  anim ="f_blow_job_loop",loop = 0, command = "pipcar"},
    {name = "Femme bais** en voiture", value = "mini@prostitutes@sexlow_veh", anim ="low_car_sex_loop_female",loop =0, command = "fuckcar"},
    {name = "Homme se faire su*** en voiture", value = "oddjobs@towing",  anim ="m_blow_job_loop",loop = 0, command = "pipcar2"},
    {name = "Homme bais** en voiture", value = "mini@prostitutes@sexlow_veh",  anim ="low_car_sex_loop_player", loop = 0, command = "fuckcar2"},
    {name = "Se mettre penché", value = "random@street_race",  anim ="_car_a_flirt_girl", loop = 0, command = "wendy"},

}

Musique = {
        {
            
            Inst = "~b~↓↓~s~ Instruments ~b~↓↓ ", 
            

            instruments = {
                {name = "Guitare imaginaire" , value = "anim@mp_player_intcelebrationfemale@air_guitar" , anim = "air_guitar" , loop = 1, command = "guitare"},
                {name = "Piano imaginaire" , value = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , loop = 1, command = "piano"},
                {name = "Guitare" ,  value = "amb@world_human_musician@guitar@male@idle_a" , anim = "idle_b" , loop = 51, command = "guitar", 
                    Prop = 'prop_acc_guitar_01',
                    PropBone = 24818,
                    PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
                },
                {name = "Guitare 2" ,  value = "switch@trevor@guitar_beatdown" , anim = "001370_02_trvs_8_guitar_beatdown_idle_busker" , loop = 51, command = "guitar2", 
                    Prop = 'prop_acc_guitar_01',
                    PropBone = 24818,
                    PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
                },
                {name = "Guitare électrique" ,  value = "amb@world_human_musician@guitar@male@idle_a" , anim = "idle_b" , loop = 51, command = "guitarelectric", 
                    Prop = 'prop_el_guitar_01',
                    PropBone = 24818,
                    PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
                },
                {name = "Guitare électrique 2" ,  value = "amb@world_human_musician@guitar@male@idle_a" , anim = "idle_b" , loop = 51, command = "guitarelectric2", 
                    Prop = 'prop_el_guitar_03',
                    PropBone = 24818,
                    PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
                },
            },
            type = "~b~↓↓~s~ Danse ~b~↓↓ ", 

            danses = {
                {name = "Danse" , value = "anim@amb@nightclub@dancers@podium_dancers@" , anim = "hi_dance_facedj_17_v2_male^5" , loop = 1, command = "danse"},
                {name = "Danse 2" , value = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_down" , loop = 1, command = "danse2"},
                {name = "Danse 3" , value = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center" , loop = 1, command = "danse3"},
                {name = "Danse 4" , value = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_up" , loop = 1, command = "danse4"},
                {name = "Danse 5" , value = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , loop = 1, command = "danse5"},
                {name = "Danse 6" , value = "misschinese2_crystalmazemcs1_cs" , anim = "dance_loop_tao" , loop = 1, command = "danse6"},
                {name = "Danse 7" , value = "misschinese2_crystalmazemcs1_ig" , anim = "dance_loop_tao" , loop = 1, command = "danse7"},
                {name = "Danse 8" , value = "missfbi3_sniping" , anim = "dance_m_default" , loop = 1, command = "danse8"},
                {name = "Danse 9" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , loop = 1, command = "danse9"},
                {name = "Danse du poisson" , value = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , loop = 1, command = 'fishdanse'},
            },


            type2 = " ~b~↓↓~s~ Danse femme ~b~↓↓", 

            dansesf = {
                {name = "Danse femme" , value = "anim@amb@nightclub@dancers@solomun_entourage@" , anim = "mi_dance_facedj_17_v1_female^1" , loop = 1,command = "dansef"},
                {name = "Danse femme 2", value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , loop = 1 ,command = "dansef2"},
                {name = "Danse femme 3", value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , loop = 1 ,command = "dansef3"},
                {name = "Danse femme 4", value = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^1" , loop = 1 ,command = "dansef4"},
                {name = "Danse femme 5", value = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^3" , loop = 1 ,command = "dansef5"},
                {name = "Danse femme 6", value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , loop = 1,command = "dansef6" },
            } ,

            type11  = " ~b~↓↓~s~ Danse bâtons lumineux ~b~↓↓",
            glowstickdanse = {
                {name = "Danse bâtons lumineux" , value = "anim@amb@nightclub@lazlow@hi_railing@" , anim = "ambclub_13_mi_hi_sexualgriding_laz" , loop = 51, command = 'danceglowstick',
                    Prop = 'ba_prop_battle_glowstick_01',
                    PropBone = 28422,
                    PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
                    SecondProp = 'ba_prop_battle_glowstick_01',
                    SecondPropBone = 60309,
                    SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
                },
                {name = "Danse bâtons lumineux 2" , value = "anim@amb@nightclub@lazlow@hi_railing@" , anim =  "ambclub_12_mi_hi_bootyshake_laz" , loop = 51, command = 'danceglowstick2',
                    Prop = 'ba_prop_battle_glowstick_01',
                    PropBone = 28422,
                    PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
                    SecondProp = 'ba_prop_battle_glowstick_01',
                    SecondPropBone = 60309,
                    SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
                },
                {name = "Danse bâtons lumineux 3" , value = "anim@amb@nightclub@lazlow@hi_railing@" , anim = "ambclub_09_mi_hi_bellydancer_laz" , loop = 51, command = 'danceglowstick3',
                    Prop = 'ba_prop_battle_glowstick_01',
                    PropBone = 28422,
                    PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
                    SecondProp = 'ba_prop_battle_glowstick_01',
                    SecondPropBone = 60309,
                    SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
                },

            },
            type10  = " ~b~↓↓~s~ Danse du cheval ~b~↓↓",
            horseDanse = {
                {name = "Danse du cheval" , value = "anim@amb@nightclub@lazlow@hi_dancefloor@" , anim = "dancecrowd_li_15_handup_laz" , loop = 51, command = 'horsedance',
                    Prop = "ba_prop_battle_hobby_horse",
                    PropBone = 28422,
                    PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                },
                {name = "Danse du cheval 2" , value = "anim@amb@nightclub@lazlow@hi_dancefloor@" , anim =  "crowddance_hi_11_handup_laz" , loop = 51, command = 'horsedance2',
                    Prop = "ba_prop_battle_hobby_horse",
                    PropBone = 28422,
                    PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                },
                {name = "Danse du cheval 3" , value = "anim@amb@nightclub@lazlow@hi_dancefloor@" , anim = "dancecrowd_li_11_hu_shimmy_laz" , loop = 51, command = 'horsedance3',
                    Prop = "ba_prop_battle_hobby_horse",
                    PropBone = 28422,
                    PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                },

            },
            type3  = " ~b~↓↓~s~ Danse lente ~b~↓↓",

            danseslente = {
                {name = "Danse lente" , value = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center" , loop = 1, command = 'slowdanse'},
                {name = "Danse lente 2" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim =  "low_center" , loop = 1, command = 'slowdanse2'},
                {name = "Danse lente 3" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , loop = 1, command = 'slowdanse3'},
                {name = "Danse lente 4" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , loop = 1, command = 'slowdanse4'},

            },

            type4 = " ~b~↓↓~s~ Danse idiote ~b~↓↓ ", 
            dansesidiot = {
                {name = "Danse idiote" , value = "special_ped@mountain_dancer@monologue_3@monologue_3a" , anim = "mnt_dnc_buttwag" , loop = 1,command = 'dancesilly'},
                {name = "Danse idiote 2" , value = "move_clown@p_m_zero_idles@" , anim =  "fidget_short_dance" , loop = 1,command = 'dancesilly2'},
                {name = "Danse idiote 3" , value = "move_clown@p_m_two_idles@" , anim = "fidget_short_dance" , loop = 1,command = 'dancesilly3'},
                {name = "Danse idiote 4" , value = "anim@amb@nightclub@lazlow@hi_podium@" , anim = "danceidle_hi_11_buttwiggle_b_laz" , loop = 1,command = 'dancesilly4'},
                {name = "Danse idiote 5" , value = "timetable@tracy@ig_5@idle_a" , anim = "idle_a" , loop = 1,command = 'dancesilly5'},
                {name = "Danse idiote 6" , value = "timetable@tracy@ig_8@idle_b" , anim = "idle_d" , loop = 1,command = 'dancesilly6'},
                {name = "Danse idiote 7" , value = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , loop = 1,command = 'dancesilly7'},
                {name = "Danse idiote 8" , value = "anim@mp_player_intcelebrationfemale@the_woogie" , anim ="the_woogie" , loop = 1,command = 'dancesilly8'},
                {name = "Danse idiote 9" , value = "rcmnigel1bnmt_1b" , anim = "dance_loop_tyler" , loop = 1,command = 'dancesilly9'},

            },

            type5 = " ~b~↓↓~s~ Danse timide ~b~↓↓ ", 
            dansestimide = {
                {name = "Danse timide" , value = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center" , loop = 1, command = "danceshy"},
                {name = "Danse timide 2" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim =  "low_center_down" , loop = 1, command = "danceshy2"},
            },

            type6 =  " ~b~↓↓~s~ Danse du haut ~b~↓↓ ", 
            danseshaut = {
                {name = "Danse du haut" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , loop = 1, command ="danceupper"},
                {name = "Danse du haut  2" , value = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim =  "high_center_up", loop = 1, command = "danceupper2"},
            }

    },
}


Poses = {

    {

        type = " ~b~↓↓~s~ Bras croisé ~b~↓↓ ", 
        brascroise = {
            {name = "Bras croisé" , value = "amb@world_human_hang_out_street@female_arms_crossed@idle_a" , anim = "idle_a" , loop = 51, command = "crossarms"},
            {name = "Bras croisé 2" , value = "amb@world_human_hang_out_street@male_c@idle_a" , anim = "idle_b" , loop = 51, command = "crossarms2"},
            {name = "Bras croisé 3" , value = "anim@heists@heist_corona@single_team" , anim = "single_team_loop_boss", loop = 51, command = "crossarms3"},
            {name = "Bras croisé 4" , value = "random@street_race" , anim = "_car_b_lookout" , loop = 51, command = "crossarms4"},
            {name = "Bras croisé 5" , value ="anim@amb@nightclub@peds@" , anim = "rcmme_amanda1_stand_loop_cop" , loop = 51, command = "crossarms5"},
            {name = "Bras croisé 6" , value ="random@shop_gunstore" , anim = "_idle" , loop = 51, command = "crossarms6"},


        },

        type2 = " ~b~↓↓~s~ Inactif ~b~↓↓ ", 
        inactif = {
            {name = "Inactif " , value = "anim@heists@heist_corona@team_idles@male_a" , anim = "idle" , loop = 1, command = "inactif"},
            {name = "Inactif 2" , value = "anim@heists@heist_corona@team_idles@female_a" , anim = "idle" , loop = 1, command = "inactif2"},
            {name = "Inactif 3" , value = "anim@heists@humane_labs@finale@strip_club" , anim = "ped_b_celebrate_loop", loop = 1, command = "inactif3"},
            {name = "Inactif 4" , value = "anim@mp_celebration@idles@female" , anim = "celebration_idle_f_a" , loop = 1, command = "inactif4"},
            {name = "Inactif 5" , value ="anim@mp_corona_idles@female_b@idle_a" , anim = "idle_a" , loop = 1, command = "inactif5"},
            {name = "Inactif 6" , value ="anim@mp_corona_idles@male_c@idle_a" , anim = "idle_a" , loop = 1, command = "inactif6"},
            {name = "Inactif 7" , value ="anim@mp_corona_idles@male_d@idle_a" , anim = "idle_a" , loop = 1, command = "inactif7"},
            {name = "Inactif 8" , value ="amb@world_human_hang_out_street@male_b@idle_a" , anim = "idle_b" , loop = 1, command = "inactif8"},
            {name = "Inactif 9" , value ="friends@fra@ig_1" , anim = "base_idle" , loop = 1, command = "inactif9"},
            {name = "Inactif 10" , value ="mp_move@prostitute@m@french" , anim = "idle", loop = 1, command = "inactif10"},
            {name = "Inactif 11" , value ="random@countrysiderobbery", anim = "idle_a" , loop = 1, command = "inactif11"},
            {name = "Inactif bourré" , value ="random@drunk_driver_1", anim = "drunk_driver_stand_loop_dd1" , loop = 1, command = "inactifsoul"},
            {name = "Inactif bourré 2" , value ="random@drunk_driver_1", anim = "drunk_driver_stand_loop_dd2" , loop = 1, command = "inactifsoul2"},
            {name = "Inactif bourré 3" , value ="missarmenian2", anim = "standing_idle_loop_drunk" , loop = 1, command = "inactifsoul3"},
            {name = "Se détendre" , value ="trev_scares_tramp_idle_tramp", anim = "switch@trevor@scares_tramp" , loop = 1, command ="chill"},
            {name = "Regarder les nuages" , value ="trev_annoys_sunbathers_loop_girl", anim = "switch@trevor@annoys_sunbathers" , loop = 1, command = "cloudgaze"},
            {name = "Regarder les nuages 2" , value ="trev_annoys_sunbathers_loop_guy", anim = "switch@trevor@annoys_sunbathers" , loop = 1, command = "cloudgaze2"},
            {name = "Allongé sur le ventre" , value ="missfbi3_sniping", anim = "prone_dave" , loop = 1, command = "prone"},


        },

        type3 = " ~b~↓↓~s~ Attendre ~b~↓↓ ", 
        wait = {
            {name = "Attendre " , value = "random@shop_tattoo" , anim = "_idle_a" , loop = 51, command = "wait"},
            {name = "Attendre 2" , value = "missbigscore2aig_3" , anim = "wait_for_van_c" , loop = 51, command = "wait2"},
            {name = "Attendre 3" , value = "amb@world_human_hang_out_street@female_hold_arm@idle_a",anim = "idle_a", loop = 1, command = "wait3"},
            {name = "Attendre 4" , value = "amb@world_human_hang_out_street@Female_arm_side@idle_a" , anim = "idle_a" , loop = 1, command = "wait4"},
            {name = "Attendre 5" , value ="missclothing" , anim = "idle_storeclerk" , loop = 51, command = "wait5"},
            {name = "Attendre 6" , value ="timetable@amanda@ig_2", anim = "ig_2_base_amanda" , loop = 51, command = "wait6"},
            {name = "Attendre 7" , value ="rcmnigel1cnmt_1c" , anim = "base" , loop = 51, command = "wait7"},
            {name = "Attendre 8" , value ="rcmjosh1" , anim = "idle" , loop = 51, command = "wait8"},
            {name = "Attendre 9" , value ="rcmjosh2" , anim = "josh_2_intp1_base" , loop = 51, command = "wait9"},
            {name = "Attendre 10" , value ="timetable@amanda@ig_3" , anim = "ig_3_base_tracy", loop = 51, command = "wait10"},
            {name = "Attendre 11" , value ="misshair_shop@hair_dressers", anim = "keeper_base" , loop = 51, command = "wait11"},
            {name = "Attendre 12" , value ="rcmjosh1", anim = "idle" , loop = 51, command = "wait12"},
            {name = "Attendre 13" , value ="rcmnigel1a", anim = "base" , loop = 51, command = "wait13"},


        },
        
        type4 = " ~b~↓↓~s~ Penser ~b~↓↓ ", 
        penser = {
            {name = "Penser " , value = "misscarsteal4@aliens" , anim = "rehearsal_base_idle_director" , loop = 51, command = "penser"},
            {name = "Penser 2" , value = "missheist_jewelleadinout" , anim = "jh_int_outro_loop_a" , loop = 51, command = "penser2"},
            {name = "Penser 3" , value = "timetable@tracy@ig_8@base",anim = "base", loop = 51, command = "penser3"},
            {name = "Penser 4" , value = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , anim = "idle_a" , loop = 51, command = "penser4"},
            {name = "Penser 5" , value = "mp_cp_welcome_tutthink" , anim = "b_think" , loop = 51, command = "penser5"},
        },

        type40 = "~b~↓↓~s~ Poses  ~b~↓↓",

        ppp = {
            {name = "Super-héros" ,  value = "rcmbarry" , anim = "base" , loop = 51, command = "superhero"},
            {name = "Super-héros 2" ,  value = "rcmbarry" , anim = "base" , loop = 51, command = "superhero2"},
            {name = "Bras pliés" ,  value = "anim@amb@business@bgen@bgen_no_work@" , anim = "stand_phone_phoneputdown_idle_nowork" , loop = 51, command = "foldarms"},
            {name = "Bras pliés 2" ,  value = "anim@amb@nightclub@peds@" , anim = "rcmme_amanda1_stand_loop_cop" , loop = 51, command = "foldarms2"},
            {name = "Bras croisés côté" ,  value = "rcmnigel1a_band_groupies" , anim = "base_m2" , loop = 51, command = "crossarmsside"},
            {name = "Se pencher 2" ,  value = "amb@world_human_leaning@female@wall@back@hand_up@idle_a" , anim = "idle_a" , loop = 1, command = "lean2"},
            {name = "Se pencher 3" ,  value = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a" , anim = "idle_a" , loop = 1, command = "lean3"},
            {name = "Se pencher 4" ,  value = "amb@world_human_leaning@male@wall@back@foot_up@idle_a" , anim = "idle_a" , loop = 1, command = "lean4"},
            {name = "Se pencher 5" ,  value = "amb@world_human_leaning@male@wall@back@hands_together@idle_b" , anim = "idle_b" , loop = 1, command = "lean5"},
            {name = "Se pencher sur un bar 2" ,  value = "amb@prop_human_bum_shopping_cart@male@idle_a" , anim = "idle_c" , loop = 1, command = "leanbar2"},
            {name = "Se pencher sur un bar 3" ,  value = "anim@amb@nightclub@lazlow@ig1_vip@" , anim = "clubvip_base_laz" , loop = 1, command = "leanbar3"},
            {name = "Se pencher sur un bar 4" ,  value = "anim@heists@prison_heist" , anim = "ped_b_loop_a" , loop = 1, command = "leanbar4"},
            {name = "Se pencher sur le haut" ,  value = "anim@mp_ferris_wheel" , anim = "idle_a_player_one" , loop = 1, command = "leanhigh"},
            {name = "Se pencher sur le haut 2" ,  value = "anim@mp_ferris_wheel" , anim = "idle_a_player_two" , loop = 1, command = "leanhigh2"},
            {name = "Se pencher sur le côté" ,  value = "timetable@mime@01_gc" , anim = "idle_a" , loop = 1, command = 'leanside'},
            {name = "Se pencher sur le côté 2" ,  value = "misscarstealfinale" , anim = "packer_idle_1_trevor" , loop = 1, command = 'leanside2'},
            {name = "Se pencher sur le côté 3" ,  value = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , loop = 1, command = 'leanside3'},
            {name = "Se pencher sur le côté 4" ,  value = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , loop = 1, command = 'leanside4'},
            {name = "Se pencher sur le côté 5" ,  value = "rcmjosh2" , anim = "josh_2_intp1_base" , loop = 1, command = 'leanside5'},
            {name = "Bain de soleil" ,  value = "amb@world_human_sunbathe@male@back@base" , anim = "base" , loop = 1, command = "sunbathe"},
            {name = "Bain de soleil 2" ,  value = "amb@world_human_sunbathe@female@back@base" , anim = "base" , loop = 1, command = "sunbathe2"},

        }

    }

}


Sits = {
    {

        type = " ~b~↓↓~s~ S'asseoir ~b~↓↓ ", 

        sits = {
            {name = "S'asseoir " , value = "anim@amb@business@bgen@bgen_no_work@" , anim = "sit_phone_phoneputdown_idle_nowork" , loop = 1, command = "sit"},
            {name = "S'asseoir 2" , value = "rcm_barry3" , anim = "barry_3_sit_loop" , loop = 1, command = "sit2"},
            {name = "S'asseoir 3" , value = "amb@world_human_picnic@male@idle_a",anim = "idle_a", loop = 1, command = "sit3"},
            {name = "S'asseoir 4" , value = "amb@world_human_picnic@female@idle_a" , anim = "idle_a" , loop = 1, command = "sit4"},
            {name = "S'asseoir 5" , value ="anim@heists@fleeca_bank@ig_7_jetski_owner" , anim = "owner_idle" , loop = 1, command = "sit5"},
            {name = "S'asseoir 6" , value ="timetable@jimmy@mics3_ig_15@", anim = "mics3_15_base_jimmy" , loop = 1, command = "sit6"},
            {name = "S'asseoir 7" , value ="anim@amb@nightclub@lazlow@lo_alone@" , anim = "lowalone_base_laz" , loop = 1, command = "sit7"},
            {name = "S'asseoir 8" , value ="timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_jimmy" , loop = 1, command = "sit8"},
            {name = "S'asseoir 9" , value ="amb@world_human_stupor@male@idle_a" , anim = "idle_a" , loop = 1, command = "sit9"},
            {name = "S'asseoir et s'appuyer" , value ="timetable@tracy@ig_14@" , anim = "ig_14_base_tracy", loop = 1, command = "sitlean"},
            {name = "S'asseoir triste" , value ="anim@amb@business@bgen@bgen_no_work@", anim = "sit_phone_phoneputdown_sleeping-noworkfemale" , loop = 1, command = "sitsad"},
            {name = "S'asseoir appeuré" , value ="anim@heists@ornate_bank@hostages@hit", anim = "hit_loop_ped_b" , loop = 1, command = "sitscared"},
            {name = "S'asseoir appeuré 2" , value ="anim@heists@ornate_bank@hostages@ped_c@", anim = "flinch_loop" , loop = 1, command = "sitscared2"},
            {name = "S'asseoir appeuré 3" , value ="anim@heists@ornate_bank@hostages@ped_e@", anim = "flinch_loop" , loop = 1, command = "sitscared3"},
            {name = "S'asseoir bourré" , value = "timetable@amanda@drunk@base" , anim = "base" , loop = 1, command = "sitdrunk"},
            {name = "S'asseoir sur une chaise " , scenario = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", command = "sitchair"},
            {name = "S'asseoir sur une chaise 2 " , value = "timetable@ron@ig_5_p3", anim = "ig_5_p3_base" , loop = 1, command = "sitchair2"},
            {name = "S'asseoir sur une chaise 3" , value = "timetable@reunited@ig_10", anim = "base_amanda" , loop = 1, command = "sitchair3"},
            {name = "S'asseoir sur une chaise 4" , value = "timetable@ron@ig_3_couch", anim = "base" , loop = 1, command = "sitchair4"},
            {name = "S'asseoir sur une chaise 5" , value = "timetable@jimmy@mics3_ig_15@", anim = "mics3_15_base_tracy" , loop = 1, command = "sitchair5"},
            {name = "S'asseoir sur une chaise 6" , value = "timetable@maid@couch@", anim = "base" , loop = 1, command = "sitchair6"},
            {name = "S'asseoir sur une chaise et se pencher" , value = "timetable@ron@ron_ig_2_alt1", anim = "ig_2_alt1_base" , loop = 1, command = "sitchairside"},

        },

        type2 = " ~b~↓↓~s~ Tomber ~b~↓↓ ", 
        tomber = {
            {name = "S'endormir" , value ="mp_sleep" , anim = "sleep_loop" , loop = 0, command = "fallasleep"},
            {name = "Tomber " , value = "random@drunk_driver_1" , anim = "drunk_fall_over" , loop = 0, command = "fall"},
            {name = "Tomber 2" , value = "mp_suicide" , anim = "pistol" , loop = 0, command = "fall2"},
            {name = "Tomber 3" , value = "mp_suicide",anim = "pill", loop = 0, command = "fall3"},
            {name = "Tomber 4" , value = "friends@frf@ig_2" , anim = "knockout_plyr" , loop = 0, command = "fall4"},
            {name = "Tomber 5" , value ="anim@gangops@hostage@" , anim = "victim_fail" , loop = 0, command = "fall5"},

        },

    }
}


Works = {
    {
        type = " ~b~↓↓~s~ Police ~b~↓↓ ", 
        cops = {
            {name = "Garde" , scenario = "WORLD_HUMAN_GUARD_STAND", loop = 1, command = "guard"},
            {name = "Mains sur la ceinture" , scenario = "WORLD_HUMAN_COP_IDLES"  , loop = 1, command = "cops"},
            {name = "Bras croisés" , value = "anim@amb@nightclub@peds@" , anim = "rcmme_amanda1_stand_loop_cop" , loop = 1, command = 'cops2'},
            {name = "Parler radio" , value = "amb@code_human_police_investigate@idle_a" , anim = "idle_b" , loop = 1, command = "radio"},
            {name = "Circulation" , scenario = "WORLD_HUMAN_CAR_PARK_ATTENDANT" , loop = 1, command = "copbeacon"},
            {name = "Jumelle" , scenario = "WORLD_HUMAN_BINOCULARS" , loop = 1 , command = 'jumelle'},
            {name = "Presse-papiers" , scenario = "WORLD_HUMAN_CLIPBOARD" , loop = 1, command = 'clipboard'},
            {name = "Presse-papiers 2" ,  value = "missfam4" , anim = "base" , loop = 51, command = "clipboard2", 
                Prop = 'p_amb_clipboard_01',
                PropBone = 36029,
                PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            },
            {name = "Bloc-notes" ,  value = "missheistdockssetup1clipboard@base" , anim = "base" , loop = 51, command = "notepad", 
                Prop = 'prop_notepad_01',
                PropBone = 18905,
                PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
                SecondProp = 'prop_pencil_01',
                SecondPropBone = 58866,
                SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            },


        },
        type2 = " ~b~↓↓~s~ Mécanicien  ~b~↓↓",
        mechanic = {
            {name = "Petite réparation" ,  value = "mini@repair" , anim = "fixing_a_ped" , loop = 1, command = "smallrepair"},
            {name = "Grosse réparation" ,  value = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" , anim = "machinic_loop_mechandplayer" , loop = 1, command = "bigrepair"},
            {name = "Réparation au sol" ,  value = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" , anim = "machinic_loop_mechandplayer" , loop = 1, command = "repair"},
            {name = "Réparation" ,  value = "amb@world_human_vehicle_mechanic@male@base" , anim = "idle_a" , loop = 1, command = "repair2"},
            {name = "Nettoyer" ,  value = "timetable@floyd@clean_kitchen@base" , anim = "base" , loop = 51, command = "clean", 
                Prop = "prop_sponge_01",
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            },  
            {name = "Nettoyer 2" ,  value = "amb@world_human_maid_clean@" , anim = "base" , loop = 51, command = "clean2", 
                Prop = "prop_sponge_01",
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            },

        },

        type3 = " ~b~↓↓~s~ Ambulancier  ~b~↓↓",
        ems = {
            {name = "Consulter" ,  value = "amb@medic@standing@tendtodead@base" , anim = "base" , loop = 1, command = "medic2"},
            {name = "Massage cardiaque" ,  value = "mini@cpr@char_a@cpr_str" , anim = "cpr_pumpchest" , loop = 1, command = "cpr"},
            {name = "Massage cardiaque brancard" ,  value = "mini@cpr@char_a@cpr_str" , anim = "cpr_pumpchest" , loop = 51, command = "cpr2"},
        },
        type4 = " ~b~↓↓~s~ DJ  ~b~↓↓",
        dj = {
            
            {name = "Mixage" ,  value = "anim@amb@nightclub@djs@dixon@" , anim = "dixn_dance_cntr_open_dix" , loop = 51, command = "dj"},
        
        },
        

    }
}

Gang = {
    {
        type = "~b~↓↓~s~ Gang  ~b~↓↓",

        gang = {
            {name = "Doigt" ,  value = "anim@mp_player_intselfiethe_bird" , anim = "idle_a" , loop = 51, command = "finger"},
            {name = "Double doigt" ,  value = "anim@mp_player_intupperfinger" , anim = "idle_a_fp" , loop = 51, command = "finger2"},
            {name = "Doigt en mouvement" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_a_1st" , loop = 51, command = "finger3"},
            {name = "Double doigt en mouvement" ,  value = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_c_1st" , loop = 51, command = "finger4"},
            {name = "Signe de gang" ,  value = "mp_player_int_uppergang_sign_a" , anim = "mp_player_int_gang_sign_a" , loop = 51, command = "gangsign"},
            {name = "Signe de gang 2" ,  value = "mp_player_int_uppergang_sign_b" , anim = "mp_player_int_gang_sign_b" , loop = 51, command = "gangsign2"},
            {name = "Se battre" ,  value = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_c" , loop = 0, command = "fight"},
            {name = "Se battre 2" ,  value = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , loop = 0, command = "fight2"},
            {name = "Menacer" ,  value = "random@atmrobberygen" , anim = "b_atm_mugging" , loop = 51, command = "menace"},

        }
    }
}


Sport = {
    {

        type = "~b~↓↓~s~ Boxe  ~b~↓↓",
        box = {
            {name = "Boxer" ,  value = "anim@mp_player_intcelebrationmale@shadow_boxing" , anim = "shadow_boxing" , loop = 0, command = "boxe"},
            {name = "Boxer 2" ,  value = "anim@mp_player_intcelebrationfemale@shadow_boxing" , anim = "shadow_boxing" , loop = 0, command = "boxe2"},
        },

        type4 = "~b~↓↓~s~ Karaté  ~b~↓↓",
        karate = {
            {name = "Karaté" ,  value = "anim@mp_player_intcelebrationfemale@karate_chops" , anim = "karate_chops" , loop = 0, command = "karate"},
            {name = "Karaté 2" ,  value = "anim@mp_player_intcelebrationmale@karate_chops" , anim = "karate_chops" , loop = 0, command = "karate2"},

        },

        type2 = "~b~↓↓~s~ Golf  ~b~↓↓",
        golf = {
            {name = "Swing" ,  value = "rcmnigel1d" , anim = "swing_a_mark" , loop = 0, command = "golf"},
        },

        type3 = "~b~↓↓~s~ Jogging  ~b~↓↓",
        jog = {
            {name = "Jogging" ,  scenario = "WORLD_HUMAN_JOG_STANDING" , loop = 0, command = "jog"},
            {name = "Jogging 2" ,  value = "amb@world_human_jog_standing@male@idle_a" , anim = "idle_a" , loop = 0, command = "jog2"},
            {name = "Jogging 3" ,  value = "amb@world_human_jog_standing@female@idle_a" , anim = "idle_a" , loop = 0, command = "jog3"},
            {name = "Jogging 4" ,  value = "amb@world_human_power_walker@female@idle_a" , anim = "idle_a" , loop = 0, command = "jog4"},
            {name = "Jogging 5" ,  value = "move_m@joy@a" , anim = "walk" , loop = 0, command = "jog5"},
        },

        type10 = "~b~↓↓~s~ Étirement/Sports  ~b~↓↓",
        etirement = {
            {name = "Pompe" ,  value = "amb@world_human_push_ups@male@base" , anim = "base" , loop = 1, command = "pump"},
            {name = "Barre de musculation" ,  value = "amb@world_human_muscle_free_weights@male@barbell@base" , anim = "base" , loop = 1, command = "weightbar"},
            {name = "Faire des abdos" ,  value = "amb@world_human_sit_ups@male@base" , anim = "base" , loop = 1, command = "abdos"},
            {name = "Faire du yoga" ,  value = "amb@world_human_yoga@male@base" , anim = "base" , loop = 1, command = "yoga"},
            {name = "Étirement" ,  value = "mini@triathlon" , anim = "idle_e" , loop = 1, command = "stretch"},
            {name = "Étirement 2" ,  value = "mini@triathlon" , anim = "idle_f" , loop = 1, command = "stretch2"},
            {name = "Étirement 3" ,  value = "mini@triathlon" , anim = "idle_d" , loop = 1, command = "stretch3"},
            {name = "Étirement 4" ,  value = "rcmfanatic1maryann_stretchidle_b" , anim = "idle_e" , loop = 1, command = "stretch4"},
        }
    }
}


PropsEmote = {
    {
        simple = {
            {name = "Sac à dos" ,  value = "move_p_m_zero_rucksack" , anim = "idle" , loop = 51, command = "backpack", 
                Prop = 'p_michael_backpack_s',
                PropBone = 24818,
                PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            },
            {name = "Fumer une cigarette" ,  value = "amb@world_human_aa_smoke@male@idle_a" , anim = "idle_c" , loop = 51, command = "smoke", 
                Prop = 'prop_cs_ciggy_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Fumer une cigarette 2" ,  value = "amb@world_human_aa_smoke@male@idle_a" , anim = "idle_b" , loop = 51, command = "smoke2", 
                Prop = 'prop_cs_ciggy_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Fumer une cigarette 3" ,  value = "amb@world_human_smoking@female@idle_a" , anim = "idle_b" , loop = 51, command = "smoke3", 
                Prop = 'prop_cs_ciggy_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            {name = "Fumer un cigar" ,  value = "amb@world_human_smoking@male@male_a@enter" , anim = "enter" , loop = 51, command = "cigar", 
                Prop = 'prop_cs_ciggy_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
             },
             {name = "Fumer un cigar 2" ,  value = "amb@world_human_smoking@male@male_a@enter" , anim = "enter" , loop = 51, command = "cigar2", 
                Prop = 'prop_cigar_01',
                PropBone = 47419,
                PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            },
            {name = "Boîte" ,  value = "anim@heists@box_carry@" , anim = "idle" , loop = 51, command = "box", 
                Prop = "hei_prop_heist_box",
                PropBone = 60309,
                PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            },
            {name = "Rose" ,  value = "anim@heists@humane_labs@finale@keycards" , anim = "ped_a_enter_loop" , loop = 51, command = "rose", 
                Prop = "prop_single_rose",
                PropBone = 18905,
                PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},  
            },
            {name = "Bong" ,  value = "anim@safehouse@bong" , anim = "bong_stage3" , loop = 51, command = "bong", 
                Prop = 'hei_heist_sh_bong_01',
                PropBone = 18905,
                PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
            },
            {name = "Valise" ,  value = "missheistdocksprep1hold_cellphone" , anim = "static" , loop = 51, command = "suitcase", 
                Prop = "prop_ld_suitcase_01",
                PropBone = 57005,
                PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
            },
            {name = "Valise 2" ,  value = "missheistdocksprep1hold_cellphone" , anim = "static" , loop = 51, command = "suitcase2", 
                Prop = "prop_security_case_01",
                PropBone = 57005,
                PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            },
            {name = "Photo d'identité" ,  value = "mp_character_creation@customise@male_a" , anim = "loop" , loop = 51, command = "mugshot", 
                Prop = 'prop_police_id_board',
                PropBone = 58868,
                PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            },
           
            
            {name = "Livre" ,  value = "cellphone@" , anim = "cellphone_text_read_base" , loop = 51, command = "book", 
                Prop = 'prop_novel_01',
                PropBone = 6286,
                PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}
            },
            {name = "Bouquet" ,  value = "impexp_int-0" , anim = "mp_m_waremech_01_dual-0" , loop = 51, command = "bouquet", 
                Prop = 'prop_snow_flower_02',
                PropBone = 24817,
                PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            },
            {name = "Peluche" ,  value = "impexp_int-0" , anim = "mp_m_waremech_01_dual-0" , loop = 51, command = "peluche", 
                Prop = 'v_ilev_mr_rasberryclean',
                PropBone = 24817,
                PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            },
            {name = "Carte" ,  value = "amb@world_human_tourist_map@male@base" , anim = "base" , loop = 51, command = "map", 
                Prop = 'prop_tourist_map_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },
            
            {name = "Mendier" ,  value = "amb@world_human_bum_freeway@male@base" , anim = "base" , loop = 51, command = "beg", 
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            },
            {name = "Joint" ,  value = "amb@world_human_smoking@male@male_a@enter" , anim = "enter" , loop = 51, command = "joint", 
            Prop = 'p_cs_joint_02',
              PropBone = 47419,
              PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            },
            {name = "Cigarette" ,  value = "amb@world_human_smoking@male@male_a@enter" , anim = "enter" , loop = 51, command = "cig", 
                Prop = 'prop_amb_ciggy_01',
                PropBone = 47419,
                PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            },
            {name = "Dossier 3" ,  value = "missheistdocksprep1hold_cellphone" , anim = "static" , loop = 51, command = "brief3", 
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            }, 
            {name = "Tablette" ,  value = "amb@world_human_tourist_map@male@base" , anim = "base" , loop = 51, command = "tablet", 
                Prop = "prop_cs_tablet",
                PropBone = 28422,
                PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            },
            {name = "Tablette 2" ,  value = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a" , anim = "idle_a" , loop = 51, command = "tablet2", 
                Prop = "prop_cs_tablet",
                PropBone = 28422,
                PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            }, 
            {name = "Appel téléphonique" ,  value = "cellphone@" , anim = "cellphone_call_listen_base" , loop = 51, command = "phonecall", 
                Prop = "prop_npc_phone_02",
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            }, 
            {name = "Téléphone" ,  value = "cellphone@" , anim = "cellphone_text_read_base" , loop = 51, command = "phone", 
                Prop = "prop_npc_phone_02",
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },

            {name = "Parapluie" ,  value = "amb@world_human_drinking@coffee@male@base" , anim = "base" , loop = 51, command = "umbrella", 
                Prop = "p_amb_brolly_01",
                PropBone = 57005,
                PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            },

            {name = "Faite pleuvoir" ,  value = "anim@mp_player_intupperraining_cash" , anim = "idle_a" , loop = 51, command = "makeitrain", 
                Prop = 'prop_anim_cash_pile_01',
                PropBone = 60309,
                PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
                PtfxAsset = "scr_xs_celebration",
                PtfxName = "scr_xs_money_rain",
                PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
            },

            
            {name = "Caméra" ,  value = "amb@world_human_paparazzi@male@base" , anim = "base" , loop = 51, command = "camera", 
                Prop = 'prop_pap_camera_01',
                PropBone = 28422,
                PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                PtfxAsset = "scr_bike_business",
                PtfxName = "scr_bike_cfid_camera_flash",
                PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
            },

            {name = "Spray au champagne" ,  value = "anim@mp_player_intupperspray_champagne" , anim = "idle_a" , loop = 51, command = "champagnespray", 
                Prop = 'ba_prop_battle_champ_open',
                PropBone = 28422,
                PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
    
                PtfxAsset = "scr_ba_club",
                PtfxName = "scr_ba_club_champagne_spray",
                PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            },

            

        }
    }
}



------Commande

TriggerEvent('chat:addSuggestion', '/e', 'Jouer une emote', {{ name="Nom de l'emote", help="dance, camera, s'assoir et plein d'autre."}})
RegisterCommand("e", function(source, args)
	Ptfx = true
	
	for kCat, vCat in pairs(Salue) do
		for kSalue, vSalue in pairs(vCat.salue) do
			if args[1] == vSalue.command then 
				ClearPedTasks(personal.pedId())
				startAnim(vSalue.value,vSalue.anim,vSalue.loop) 
				return
			end
		end
	end
	for kCat, vCat in pairs(Actions) do
		for kAct, vAct in pairs(vCat.actions) do
			if args[1] == vAct.command then 
				ClearPedTasks(personal.pedId())
                if vAct.name == "BBQ" then 
                    startScenario2(vAct.scenario)
                end
				if vAct.Prop ~= nil then
					local PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vAct.PropPlacement)
				
					AddPropToPlayer(vAct.Prop, vAct.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
				end
				startAnim(vAct.value,vAct.anim,vAct.loop) 
				return
			end
		end
	end

	for kCat, vCat in pairs(Frapper) do
		for kFrapper, vFrapper in pairs(vCat.frapper) do
			if args[1] == vFrapper.command then 
				ClearPedTasks(personal.pedId())
				startAnim(vFrapper.value,vFrapper.anim,vFrapper.loop) 
				return
			end
		end
	end
	for kCat, vCat in pairs(Gang) do
		for kGang, vGang in pairs(vCat.gang) do
			if args[1] == vGang.command then 
				ClearPedTasks(personal.pedId())
				startAnim(vGang.value,vGang.anim,vGang.loop) 
				return
			end
		end
	end
	for kSex, vSex in pairs(Sexe) do
		if args[1] == vSex.command then 
			ClearPedTasks(personal.pedId())
			startAnim(vSex.value,vSex.anim,vSex.loop) 
			return
		end
	end
	for kCat, vCat in pairs(Musique) do
		for kIns, vIns in pairs(vCat.instruments) do
			if args[1] == vIns.command then 
				if vIns.name == "Guitare" or vIns.name == "Guitare 2" or vIns.name == "Guitare électrique" or vIns.name == "Guitare électrique 2" then 
					DestroyAllProps()
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vIns.PropPlacement)
					AddPropToPlayer(vIns.Prop, vIns.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					startAnim(vIns.value,vIns.anim,vIns.loop)
				else
					DestroyAllProps()
					ClearPedTasks(personal.pedId())
					startAnim(vIns.value,vIns.anim,vIns.loop) 
				end
				return
			end
		end
		for kDanse, vDanse in pairs(vCat.danses) do
			if args[1] == vDanse.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vDanse.value,vDanse.anim,vDanse.loop) 
				return
			end
		end
		for kDansef, vDansef in pairs(vCat.dansesf) do
			if args[1] == vDansef.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vDansef.value,vDansef.anim,vDansef.loop) 
				return
			end
		end
		for kDanseH, vDanseGL in pairs(vCat.glowstickdanse) do
			if args[1] == vDanseGL.command then 
				DestroyAllProps()
				PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vDanseGL.PropPlacement)
				SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(vDanseGL.SecondPropPlacement)
				AddPropToPlayer(vDanseGL.Prop, vDanseGL.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
				AddPropToPlayer(vDanseGL.SecondProp, vDanseGL.SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
				startAnim(vDanseGL.value,vDanseGL.anim,vDanseGL.loop) 
				return
			end
		end
		for kDanseH, vDanseH in pairs(vCat.horseDanse) do
			if args[1] == vDanseH.command then 
				DestroyAllProps()
				PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vDanseH.PropPlacement)
				AddPropToPlayer(vDanseH.Prop, vDanseH.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
				startAnim(vDanseH.value,vDanseH.anim,vDanseH.loop)
				return
			end
		end
		for kDansel, vDansel in pairs(vCat.danseslente) do
			if args[1] == vDansel.command then
				DestroyAllProps() 
				ClearPedTasks(personal.pedId())
				startAnim(vDansel.value,vDansel.anim,vDansel.loop) 
				return
			end
		end
		for kDanseI, vDanseI in pairs(vCat.dansesidiot) do
			if args[1] == vDanseI.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vDanseI.value,vDanseI.anim,vDanseI.loop) 
				return
			end
		end
		for kDanseH, vDanseH in pairs(vCat.danseshaut) do
			if args[1] == vDanseH.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vDanseH.value,vDanseH.anim,vDanseH.loop) 
				return
			end
		end
		for kDanseT, vDanseT in pairs(vCat.dansesidiot) do
			if args[1] == vDanseT.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vDanseT.value,vDanseT.anim,vDanseT.loop) 
				return
			end
		end
	end
	for kCat, vCat in pairs(Poses) do
		for kBC, vBC in pairs(vCat.brascroise) do
			if args[1] == vBC.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vBC.value,vBC.anim,vBC.loop) 
				return
			end
		end
		for kIna, vIna in pairs(vCat.inactif) do
			if args[1] == vIna.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vIna.value,vIna.anim,vIna.loop) 
				return
			end
		end
		for kWait, vWait in pairs(vCat.wait) do
			if args[1] == vWait.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vWait.value,vWait.anim,vWait.loop) 
				return
			end
		end
		for kPenser, vPenser in pairs(vCat.penser) do
			if args[1] == vPenser.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vPenser.value,vPenser.anim,vPenser.loop) 
				return
			end
		end
		for kPose, vPose in pairs(vCat.ppp) do
			if args[1] == vPose.command then 
				ClearPedTasks(personal.pedId())
				startAnim(vPose.value,vPose.anim,vPose.loop) 
				return
			end
		end
	end
	
	for kCat, vCat in pairs(Sits) do
		for kBC, vSit in pairs(vCat.sits) do
			if args[1] == vSit.command then 
				if vSit.command == "sitchair" then 
					DestroyAllProps()
					ClearPedTasks(personal.pedId())
					startScenario(vSit.scenario)
				else
					DestroyAllProps()
					ClearPedTasks(personal.pedId())
					startAnim(vSit.value,vSit.anim,vSit.loop) 
				end
				return
			end
		end
		for kFall, vFall in pairs(vCat.tomber) do
			if args[1] == vFall.command then
				DestroyAllProps()
				ClearPedTasks(personal.pedId()) 
				startAnim(vFall.value,vFall.anim,vFall.loop)
				return
			end
		end
	end
	for kCat, vCat in pairs(Sport) do
		for kBox, vBox in pairs(vCat.box) do
			if args[1] == vBox.command then 
					DestroyAllProps()
					ClearPedTasks(personal.pedId())
					startAnim(vBox.value,vBox.anim,vBox.loop) 
				return
			end
		end
		for kKat, vKat in pairs(vCat.karate) do
			if args[1] == vKat.command then 
				ClearPedTasks(personal.pedId())
				DestroyAllProps()
				startAnim(vKat.value,vKat.anim,vKat.loop)
				return
			end
		end
		for kG, vG in pairs(vCat.golf) do
			if args[1] == vG.command then 
				DestroyAllProps()
				ClearPedTasks(personal.pedId())
				startAnim(vG.value,vG.anim,vG.loop)
				return
			end
		end
		for kG, vJ in pairs(vCat.jog) do
			if args[1] == vJ.command then 
				if vJ.name == "Jogging" then
					DestroyAllProps() 
					ClearPedTasks(personal.pedId())
					startScenario(vJ.scenario)
				else
					DestroyAllProps()
					ClearPedTasks(personal.pedId())
					startAnim(vJ.value,vJ.anim,vJ.loop)
				end
				return
			end
		end
		for kG, vE in pairs(vCat.etirement) do
			if args[1] == vE.command then 
				startAnim(vE.value,vE.anim,vE.loop)
				return
			end
		end
	end
	for kCat, vCat in pairs(Works) do
		for kCops, vCops in pairs(vCat.cops) do
			if args[1] == vCops.command then 
				if vCops.name == "Mains sur la ceinture"  then
					ClearPedTasks(personal.pedId())
					startScenario(vCops.scenario)
                elseif vCops.name == "Circulation"  then
                    ClearPedTasks(personal.pedId())
                    startScenario2(vCops.scenario)
				elseif vCops.name == "Balise de flic" then
					ClearPedTasks(personal.pedId())
					startScenario(vCops.scenario)
				elseif vCops.name == "Presse-papiers"  then 
					ClearPedTasks(personal.pedId())
					startScenario(vCops.scenario)
				elseif vCops.name == "Garde" then 
					ClearPedTasks(personal.pedId())
					startScenario2(vCops.scenario) 
				elseif vCops.name == "Jumelle" then
					ClearPedTasks(personal.pedId())
					startScenario2(vCops.scenario) 
				elseif vCops.name == "Presse-papiers 2" then 
					DestroyAllProps()
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vCops.PropPlacement)
					AddPropToPlayer(vCops.Prop, vCops.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					startAnim(vCops.value,vCops.anim,vCops.loop)
				elseif vCops.name == "Bloc-notes" then 
					DestroyAllProps()
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vCops.PropPlacement)
					SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(vCops.SecondPropPlacement)
					AddPropToPlayer(vCops.Prop, vCops.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					AddPropToPlayer(vCops.SecondProp, vCops.SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
					startAnim(vCops.value,vCops.anim,vCops.loop) 
				else
					ClearPedTasks(personal.pedId())
					startAnim(vCops.value,vCops.anim,vCops.loop) 
				end
				return
			end
		end
		for kM, vM in pairs(vCat.mechanic) do
			if args[1] == vM.command then 
				if vM.name == "Nettoyer" or vM.name == "Nettoyer 2" then 
                    DestroyAllProps()
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(vM.PropPlacement)
					AddPropToPlayer(vM.Prop, vM.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					startAnim(vM.value,vM.anim,vM.loop)
                else
                    DestroyAllProps()
                    ClearPedTasks(personal.pedId())
                    startAnim(vM.value,vM.anim,vM.loop)
				end

				return
			end
		end
		for kEms, vEms in pairs(vCat.ems) do
			if args[1] == vEms.command then
				ClearPedTasks(personal.pedId())
				startAnim(vEms.value,vEms.anim,vEms.loop)
				return
			end
		end
		for kDJ, vDj in pairs(vCat.dj) do
			if args[1] == vDj.command then 
				ClearPedTasks(personal.pedId())
				startAnim(vDj.value,vDj.anim,vDj.loop)
				return
			end
		end
	end
	for kCat, vCat in pairs(PropsEmote) do
		for k, v in pairs(vCat.simple) do
			if args[1] == v.command then
				if v.name == "Faite pleuvoir" or v.name == "Spray au champagne" or v.name == "Caméra" then 
					Ptfx = true	
					DestroyAllProps()
					ESX.ShowNotification('Appuyer  ~y~ G ~s~sur utiliser l\'attaque spécial.')
					Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(v.PtfxPlacement)
					PtfxAsset = v.PtfxAsset
					PtfxName = v.PtfxName
					PtfxPrompt = true
					PtfxThis(PtfxAsset)
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(v.PropPlacement)
					AddPropToPlayer(v.Prop, v.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					startAnim(v.value,v.anim,v.loop)
					
				else
					DestroyAllProps()
					PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(v.PropPlacement)
					AddPropToPlayer(v.Prop, v.PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
					startAnim(v.value,v.anim,v.loop)
				end

				return
			end
		end
	end
end)