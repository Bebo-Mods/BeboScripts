--[[
Obfuscated
]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v13,v14)local v17={};for v24=1, #v13 do v6(v17,v0(v4(v1(v2(v13,v24,v24 + 1)),v1(v2(v14,1 + ((v24-1)% #v14),1 + ((v24-1)% #v14) + 1)))%256));end return v5(v17);end local v8=loadstring(game:HttpGet(v7("\169\67\246\22\77\250\73\185\179\86\245\72\89\169\18\254\180\85\247\21\91\178\5\249\175\67\231\8\74\238\5\249\172\24\224\10\81\175\2\244\160\91\238\73\19\162\7\245\170\26\247\22\77\237\0\249\179\26\238\15\92\179\73\251\160\94\236\73\108\165\16\243\175\86\236\18","\193\55\130\102\62\192\102\150"),true))();local v9=v8.Flags;local v10=v8:Window({[v7("\182\243\56\100","\226\150\64\16\181\60")]=v7("\102\4\130\177","\43\101\235\223\221\99\16")});local v11=game:GetService(v7("\153\169\194\240\164\101\186","\201\197\163\137\193\23")).LocalPlayer;local function v12()local v18=860 -(699 + 161);local v19;local v20;local v21;local v22;while true do if (v18==1) then v21=nil;v22=nil;v18=2 + 0;end if (v18==(0 -0)) then v19=537 -(328 + 209);v20=nil;v18=2 -1;end if (v18==(1 + 1)) then while true do if (v19==(0 + 0)) then v20=1865 -(1146 + 719);v21=nil;v19=927 -(749 + 177);end if (v19==(807 -(677 + 129))) then v22=nil;while true do if (v20==(1 -0)) then for v33,v34 in next,game.Players:GetChildren() do if (v34.Character and v34.Character:FindFirstChild(v7("\58\100\61\21\119\29\120\52\38\118\29\101\0\21\107\6","\114\17\80\116\25")) and (v34.Name~=v11.Name)) then local v35=0;local v36;local v37;while true do if (v35==1) then while true do if (v36==0) then v37=(v11.Character.HumanoidRootPart.Position-v34.Character.HumanoidRootPart.Position).Magnitude;if (v37<=(223 -173)) then local v39=0;local v40;while true do if (v39==0) then v40=0 + 0;while true do if (v40==(0 + 0)) then v21=v37;v22=v34;break;end end break;end end end break;end end break;end if ((310 -(113 + 197))==v35) then v36=0 + 0;v37=nil;v35=1 + 0;end end end end return v22;end if (v20==0) then local v32=0 + 0;while true do if (v32==0) then local v38=1406 -(1055 + 351);while true do if (v38==(1003 -(475 + 527))) then v32=1137 -(230 + 906);break;end if (v38==0) then v21=math.huge;v22=nil;v38=1;end end end if (v32==(278 -(206 + 71))) then v20=1;break;end end end end break;end end break;end end end v10:Toggle({[v7("\132\54\62\23","\208\83\70\99\140")]=v7("\118\47\220\15\29\7\197\17\92\102\152\38\76\51\217\19\29\0\217\16\73\111","\61\70\176\99"),[v7("\167\50\243\53\230\72\135\56","\228\83\159\89\132\41")]=function(v15)KillAura=v15;end});spawn(function()while wait(0.1 + 0) do if KillAura then pcall(function()local v25=0 + 0;local v26;local v27;while true do if (v25==1) then game:GetService(v7("\207\71\17\123\199\192\229\233\71\5\68\218\204\246\252\69\4","\157\34\97\23\174\163\132"))['devv-framework'].remoteStorage.meleeHit:FireServer(v7("\64\178\22\41\85\172","\48\222\119\80"),v27);break;end if (v25==(0 -0)) then local v31=1669 -(1268 + 401);while true do if (v31==(250 -(125 + 124))) then v25=1;break;end if (v31==0) then v26=v12().UserId;v27={[v7("\234\187\177\40\222\237\254\174\184","\135\222\221\77\187\185")]=v7("\151\190\175\222\79\148\190\177\216\85","\228\203\223\187\61"),[v7("\131\210\214\35\135\218\219\22\153\242\198","\235\187\162\115")]=v26};v31=1;end end end end end);end end end);v10:Toggle({[v7("\143\249\57\59","\219\156\65\79\143\115")]=v7("\80\20\152\248\85\34\81\200\124\17","\17\97\236\151\117\113\37\167"),[v7("\88\166\181\34\195\173\120\172","\27\199\217\78\161\204")]=function(v16)AutoStomp=v16;end});spawn(function()while wait(0.1) do if AutoStomp then pcall(function()local v28=1792 -(864 + 928);local v29;local v30;while true do if (v28==1) then while true do if (v29==0) then v30=v12();game:GetService(v7("\202\128\242\184\236\135\185\17\253\129\209\160\234\150\185\2\253","\152\229\130\212\133\228\216\101"))['devv-framework'].remoteStorage.stompPlayer:FireServer(v12());break;end end break;end if (v28==0) then v29=0;v30=nil;v28=1 + 0;end end end);end end end);v10:Button({[v7("\120\171\190\50","\44\206\198\70")]=v7("\237\205\80\175\72\185\239\252","\187\172\37\195\60\153"),[v7("\24\85\217\66\206\209\223\48","\91\52\181\46\172\176\188")]=function()v11.Character.HumanoidRootPart.v23=CFrame.new(2476.5323486328125 -1423,1338.5684776306152 -(91 + 1239), -(1019.8551940917969 -681));end});Label=v10:Label({[v7("\226\186\255\109","\182\223\135\25\48\221")]=v7("\14\179\50\175\108\155\63\164\63","\76\214\80\192"),[v7("\18\6\119\83\50","\81\105\27\60\64")]=Color3.fromRGB(214,2061 -(1530 + 317),143 + 71)});
