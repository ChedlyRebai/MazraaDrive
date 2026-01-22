á`
R/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Data/AppDbContext.cs
	namespace 	
Infrastructure
 
. 
Data 
{		 
public

 

class

 
AppDbContext

 
:

 
IdentityDbContext

  1
<

1 2
AppUser

2 9
,

9 :
Role

; ?
,

? @
string

A G
,

G H
IdentityUserClaim 
< 
string 
> 
, 
IdentityUserRole /
</ 0
string0 6
>6 7
,7 8
IdentityUserLogin9 J
<J K
stringK Q
>Q R
,R S
IdentityRoleClaim 
< 
string  
>  !
,! "
IdentityUserToken# 4
<4 5
string5 ;
>; <
>< =
{ 
public 
AppDbContext 
( 
DbContextOptions ,
<, -
AppDbContext- 9
>9 :
options; B
)B C
:D E
baseF J
(J K
optionsK R
)R S
{T U
}V W
public 
DbSet 
< 
DocumentChunk "
>" #
DocumentChunks$ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
virtual 
DbSet 
< 
AccessRequest *
>* +
AccessRequests, :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
virtual 
DbSet 
< 

Department '
>' (
Departments) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
virtual 
DbSet 
< 
AccessRight (
>( )
AccessRights* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
virtual 
DbSet 
< 
Notification )
>) *
Notifications+ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
virtual 
DbSet 
< 
Folder #
># $
Folders% ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
virtual 
DbSet 
< 
Document %
>% &
	Documents' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
virtual 
DbSet 
< 
DocumentAccessLink /
>/ 0
DocumentAccessLinks1 D
{E F
getG J
;J K
setL O
;O P
}Q R
public 
virtual 
DbSet 
< 
DocumentRequest ,
>, -
DocumentRequests. >
{? @
getA D
;D E
setF I
;I J
}K L
public 
virtual 
DbSet 
< 

AIQueryLog '
>' (
AIQueryLogs) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
virtual 
DbSet 
< 
Role !
>! "
Role# '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DbSet 
< 
Folder 
> 
Folder #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
virtual 
DbSet 
< 
AppUser $
>$ %
User& *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{   	
base!! 
.!! 
OnModelCreating!!  
(!!  !
modelBuilder!!! -
)!!- .
;!!. /
modelBuilder"" 
."" +
ApplyConfigurationsFromAssembly"" 8
(""8 9
Assembly""9 A
.""A B 
GetExecutingAssembly""B V
(""V W
)""W X
)""X Y
;""Y Z
modelBuilder$$ 
.$$ 
Entity$$ 
<$$  
Role$$  $
>$$$ %
($$% &
entity$$& ,
=>$$- /
{%% 
entity&& 
.&& 
Property&& 
(&& 
r&&  
=>&&! #
r&&$ %
.&&% &
Id&&& (
)&&( )
.'' 
ValueGeneratedOnAdd'' #
(''# $
)''$ %
;''% &
}(( 
)(( 
;(( 
modelBuilder** 
.** 
Entity** 
<**  
DocumentRequest**  /
>**/ 0
(**0 1
entity**1 7
=>**8 :
{++ 
entity-- 
.-- 
HasOne-- 
(-- 
dr--  
=>--! #
dr--$ &
.--& '
	Requester--' 0
)--0 1
... 
WithMany.. 
(.. 
u.. 
=>..  "
u..# $
...$ %
RequestedDocuments..% 7
)..7 8
.// 
HasForeignKey// "
(//" #
dr//# %
=>//& (
dr//) +
.//+ ,
RequesterId//, 7
)//7 8
.00 
OnDelete00 
(00 
DeleteBehavior00 ,
.00, -
Restrict00- 5
)005 6
;006 7
entity33 
.33 
HasOne33 
(33 
dr33  
=>33! #
dr33$ &
.33& '
ProcessedBy33' 2
)332 3
.44 
WithMany44 
(44 
u44 
=>44  "
u44# $
.44$ %
ProcessedDocuments44% 7
)447 8
.55 
HasForeignKey55 "
(55" #
dr55# %
=>55& (
dr55) +
.55+ ,
ProcessedById55, 9
)559 :
.66 
OnDelete66 
(66 
DeleteBehavior66 ,
.66, -
SetNull66- 4
)664 5
;665 6
entity99 
.99 
HasOne99 
(99 
dr99  
=>99! #
dr99$ &
.99& '

Department99' 1
)991 2
.:: 
WithMany:: 
(:: 
):: 
.;; 
HasForeignKey;; "
(;;" #
dr;;# %
=>;;& (
dr;;) +
.;;+ ,
DepartmentId;;, 8
);;8 9
.<< 
OnDelete<< 
(<< 
DeleteBehavior<< ,
.<<, -
Restrict<<- 5
)<<5 6
;<<6 7
entity?? 
.?? 
HasOne?? 
(?? 
dr??  
=>??! #
dr??$ &
.??& '
ResponseDocument??' 7
)??7 8
.@@ 
WithMany@@ 
(@@ 
)@@ 
.AA 
HasForeignKeyAA "
(AA" #
drAA# %
=>AA& (
drAA) +
.AA+ ,
ResponseDocumentIdAA, >
)AA> ?
.BB 
OnDeleteBB 
(BB 
DeleteBehaviorBB ,
.BB, -
SetNullBB- 4
)BB4 5
;BB5 6
}CC 
)CC 
;CC 
modelBuilderEE 
.EE 
EntityEE 
<EE  
AccessRightEE  +
>EE+ ,
(EE, -
)EE- .
.FF 
HasIndexFF 
(FF 
arFF 
=>FF 
newFF  #
{FF$ %
arFF& (
.FF( )
UserIdFF) /
,FF/ 0
arFF1 3
.FF3 4
FolderIdFF4 <
}FF= >
)FF> ?
.GG 
IsUniqueGG 
(GG 
)GG 
;GG 
modelBuilderII 
.II 
EntityII 
<II  
NotificationII  ,
>II, -
(II- .
)II. /
.JJ 
HasOneJJ 
(JJ 
nJJ 
=>JJ 
nJJ 
.JJ 
UserJJ #
)JJ# $
.KK 
WithManyKK 
(KK 
uKK 
=>KK 
uKK  
.KK  !
NotificationsKK! .
)KK. /
.LL 
HasForeignKeyLL 
(LL 
nLL  
=>LL! #
nLL$ %
.LL% &
UserIdLL& ,
)LL, -
.MM 
OnDeleteMM 
(MM 
DeleteBehaviorMM (
.MM( )
CascadeMM) 0
)MM0 1
;MM1 2
modelBuilderQQ 
.QQ 
EntityQQ 
<QQ  
NotificationQQ  ,
>QQ, -
(QQ- .
entityQQ. 4
=>QQ5 7
{RR 
entitySS 
.SS 
HasOneSS 
(SS 
nSS 
=>SS  "
nSS# $
.SS$ %
UserSS% )
)SS) *
.TT 
WithManyTT 
(TT 
uTT 
=>TT  "
uTT# $
.TT$ %
NotificationsTT% 2
)TT2 3
.UU 
HasForeignKeyUU "
(UU" #
nUU# $
=>UU% '
nUU( )
.UU) *
UserIdUU* 0
)UU0 1
.VV 
OnDeleteVV 
(VV 
DeleteBehaviorVV ,
.VV, -
CascadeVV- 4
)VV4 5
;VV5 6
entityXX 
.XX 
HasOneXX 
(XX 
nXX 
=>XX  "
nXX# $
.XX$ %
SenderXX% +
)XX+ ,
.YY 
WithManyYY 
(YY 
)YY 
.ZZ 
HasForeignKeyZZ "
(ZZ" #
nZZ# $
=>ZZ% '
nZZ( )
.ZZ) *
SenderIdZZ* 2
)ZZ2 3
.[[ 
OnDelete[[ 
([[ 
DeleteBehavior[[ ,
.[[, -
Restrict[[- 5
)[[5 6
;[[6 7
entity]] 
.]] 
Property]] 
(]]  
n]]  !
=>]]" $
n]]% &
.]]& '
title]]' ,
)]], -
.]]- .

IsRequired]]. 8
(]]8 9
)]]9 :
.]]: ;
HasMaxLength]]; G
(]]G H
$num]]H K
)]]K L
;]]L M
entity^^ 
.^^ 
Property^^ 
(^^  
n^^  !
=>^^" $
n^^% &
.^^& '
Message^^' .
)^^. /
.^^/ 0

IsRequired^^0 :
(^^: ;
)^^; <
;^^< =
entity`` 
.`` 
HasIndex`` 
(``  
n``  !
=>``" $
n``% &
.``& '
UserId``' -
)``- .
;``. /
entityaa 
.aa 
HasIndexaa 
(aa  
naa  !
=>aa" $
naa% &
.aa& '
IsReadaa' -
)aa- .
;aa. /
}cc 
)cc 
;cc 
modelBuilderhh 
.hh 
Entityhh 
<hh  
AppUserhh  '
>hh' (
(hh( )
entityhh) /
=>hh0 2
{ii 
entityjj 
.jj 
HasManyjj 
(jj 
ujj  
=>jj! #
ujj$ %
.jj% &
Notificationsjj& 3
)jj3 4
.kk 
WithOnekk 
(kk 
nkk 
=>kk !
nkk" #
.kk# $
Userkk$ (
)kk( )
.ll 
HasForeignKeyll "
(ll" #
nll# $
=>ll% '
nll( )
.ll) *
UserIdll* 0
)ll0 1
.mm 
OnDeletemm 
(mm 
DeleteBehaviormm ,
.mm, -
Cascademm- 4
)mm4 5
;mm5 6
}nn 
)nn 
;nn 
}pp 	
}qq 
}rr ÉX
[/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/InfrastructureRegistration.cs
	namespace 	
Infrastructure
 
; 
public 
static 
class &
InfrastructureRegistration .
{ 
public 

static 
IServiceCollection $&
infrastructureRegistration% ?
(? @
this@ D
IServiceCollectionE W
servicesX `
,` a
IConfigurationb p
configurationq ~
)~ 
{ 
services 
. 
AddDbContext 
< 
AppDbContext *
>* +
(+ ,
options, 3
=>4 6
{ 	
options   
.   
	UseNpgsql   
(   
configuration   +
.  + ,
GetConnectionString  , ?
(  ? @
$str  @ S
)  S T
)  T U
;  U V
}!! 	
)!!	 

;!!
 
services>> 
.>> 
	AddScoped>> 
<>> 
IRoleRepository>> *
,>>* +
RoleRepository>>, :
>>>: ;
(>>; <
)>>< =
;>>= >
services?? 
.?? 
	AddScoped?? 
<?? !
IDepartmentRepository?? 0
,??0 1 
DepartmentRepository??2 F
>??F G
(??G H
)??H I
;??I J
services@@ 
.@@ 
	AddScoped@@ 
<@@ !
IDocRequestRepository@@ 0
,@@0 1 
DocRequestRepository@@2 F
>@@F G
(@@G H
)@@H I
;@@I J
servicesAA 
.AA 
	AddScopedAA 
<AA 
	IDocumentAA $
,AA$ %
DocumentRepositoryAA& 8
>AA8 9
(AA9 :
)AA: ;
;AA; <
servicesBB 
.BB 
	AddScopedBB 
<BB 
IFolderRepositoryBB ,
,BB, -
FolderRepositoryBB. >
>BB> ?
(BB? @
)BB@ A
;BBA B
servicesDD 
.DD 
	AddScopedDD 
<DD 
IUserRepositoryDD *
,DD* +
UserRepositoryDD, :
>DD: ;
(DD; <
)DD< =
;DD= >
servicesGG 
.GG 
	AddScopedGG 
<GG $
IAccessRequestRepositoryGG 3
,GG3 4#
AccessRequestRepositoryGG5 L
>GGL M
(GGM N
)GGN O
;GGO P
servicesII 
.II 
	AddScopedII 
<II "
IDocumentAccessServiceII 1
,II1 2!
DocumentAccessServiceII3 H
>IIH I
(III J
)IIJ K
;IIK L
servicesJJ 
.JJ "
AddHttpContextAccessorJJ '
(JJ' (
)JJ( )
;JJ) *
servicesKK 
.KK 
	AddScopedKK 
<KK 
ICurrentUserServiceKK .
,KK. /
CurrentUserServiceKK0 B
>KKB C
(KKC D
)KKD E
;KKE F
servicesLL 
.LL 
	AddScopedLL 
<LL $
IAccessRequestRepositoryLL 3
,LL3 4#
AccessRequestRepositoryLL5 L
>LLL M
(LLM N
)LLN O
;LLO P
servicesMM 
.MM 
	AddScopedMM 
<MM "
IPermissionsRepositoryMM 1
,MM1 2!
PermissionsRepositoryMM3 H
>MMH I
(MMI J
)MMJ K
;MMK L
servicesNN 
.NN 
	AddScopedNN 
<NN #
INotificationRepositoryNN 2
,NN2 3"
NotificationRepositoryNN4 J
>NNJ K
(NNK L
)NNL M
;NNM N
servicesOO 
.OO 
	AddScopedOO 
<OO 
IGenerateTokenOO )
,OO) *
GenerateTokenOO+ 8
>OO8 9
(OO9 :
)OO: ;
;OO; <
servicesPP 
.PP 
	AddScopedPP 
<PP 
IAuthPP  
,PP  !
AuthRepositoryPP" 0
>PP0 1
(PP1 2
)PP2 3
;PP3 4
servicesQQ 
.QQ 
	AddScopedQQ 
<QQ 
IHomeRepositoryQQ *
,QQ* +
HomeRepositoryQQ, :
>QQ: ;
(QQ; <
)QQ< =
;QQ= >
servicesSS 
.SS 
	AddScopedSS 
<SS 
IAccessRightServiceSS .
,SS. /
AccessRightServiceSS0 B
>SSB C
(SSC D
)SSD E
;SSE F
servicesTT 
.TT 
	AddScopedTT 
(TT 
typeofTT !
(TT! "
CoreTT" &
.TT& '

InterfacesTT' 1
.TT1 2
IGenericRepositoryTT2 D
<TTD E
>TTE F
)TTF G
,TTG H
typeofTTI O
(TTO P
InfrastructureTTP ^
.TT^ _
RepositoriesTT_ k
.TTk l
GenericRepositoryTTl }
<TT} ~
>TT~ 
)	TT Ä
)
TTÄ Å
;
TTÅ Ç
servicesUU 
.UU 
AddSingletonUU 
<UU 
IFileProviderUU +
>UU+ ,
(UU, -
providerUU- 5
=>UU6 8
newVV  
PhysicalFileProviderVV  
(VV  !
PathVV! %
.VV% &
CombineVV& -
(VV- .
	DirectoryVV. 7
.VV7 8
GetCurrentDirectoryVV8 K
(VVK L
)VVL M
,VVM N
$strVVO X
)VVX Y
)VVY Z
)VVZ [
;VV[ \
servicesWW 
.WW 
AddApiVersioningWW !
(WW! "
optionsWW" )
=>WW* ,
{XX 	
optionsYY 
.YY /
#AssumeDefaultVersionWhenUnspecifiedYY 7
=YY8 9
trueYY: >
;YY> ?
optionsZZ 
.ZZ 
DefaultApiVersionZZ %
=ZZ& '
newZZ( +
	MicrosoftZZ, 5
.ZZ5 6

AspNetCoreZZ6 @
.ZZ@ A
MvcZZA D
.ZZD E

ApiVersionZZE O
(ZZO P
$numZZP Q
,ZZQ R
$numZZS T
)ZZT U
;ZZU V
options[[ 
.[[ 
ReportApiVersions[[ %
=[[& '
true[[( ,
;[[, -
}\\ 	
)\\	 

;\\
 
services^^ 
.^^ 
	AddScoped^^ 
<^^ 
IUnitOfWork^^ &
,^^& '

UnitOfWork^^( 2
>^^2 3
(^^3 4
)^^4 5
;^^5 6
servicescc 
.cc &
ConfigureApplicationCookiecc +
(cc+ ,
optionscc, 3
=>cc4 6
{dd 	
optionsee 
.ee 
Cookieee 
.ee 
Nameee 
=ee  !
$stree" )
;ee) *
optionsff 
.ff 
Eventsff 
.ff 
OnRedirectToLoginff ,
=ff- .
contextff/ 6
=>ff7 9
{gg 
contexthh 
.hh 
Responsehh  
.hh  !

StatusCodehh! +
=hh, -
$numhh. 1
;hh1 2
returnii 
Taskii 
.ii 
CompletedTaskii )
;ii) *
}jj 
;jj 
}kk 	
)kk	 

;kk
 
servicesqq 
.qq 
AddAuthenticationqq "
(qq" #
)qq# $
.rr 
AddJwtBearerrr 
(rr 
optionsrr !
=>rr" $
{ss 
optionstt 
.tt  
RequireHttpsMetadatatt ,
=tt- .
falsett/ 4
;tt4 5
optionsuu 
.uu 
	SaveTokenuu !
=uu" #
trueuu$ (
;uu( )
optionsvv 
.vv %
TokenValidationParametersvv 1
=vv2 3
newvv4 7
	Microsoftvv8 A
.vvA B
IdentityModelvvB O
.vvO P
TokensvvP V
.vvV W%
TokenValidationParametersvvW p
{ww $
ValidateIssuerSigningKeyxx ,
=xx- .
truexx/ 3
,xx3 4
IssuerSigningKeyyy $
=yy% &
newyy' *
	Microsoftyy+ 4
.yy4 5
IdentityModelyy5 B
.yyB C
TokensyyC I
.yyI J 
SymmetricSecurityKeyyyJ ^
(yy^ _
Systemyy_ e
.yye f
Textyyf j
.yyj k
Encodingyyk s
.yys t
UTF8yyt x
.yyx y
GetBytes	yyy Å
(
yyÅ Ç
configuration
yyÇ è
[
yyè ê
$str
yyê û
]
yyû ü
)
yyü †
)
yy† °
,
yy° ¢
ValidateIssuerzz "
=zz# $
truezz% )
,zz) *
ValidIssuer{{ 
={{  !
configuration{{" /
[{{/ 0
$str{{0 >
]{{> ?
,{{? @
ValidateAudience|| $
=||% &
true||' +
,||+ ,
ValidAudience}} !
=}}" #
configuration}}$ 1
[}}1 2
$str}}2 B
]}}B C
,}}C D
	ClockSkew~~ 
=~~ 
TimeSpan~~  (
.~~( )
Zero~~) -
,~~- .
RoleClaimType !
=" #

ClaimTypes$ .
.. /
Role/ 3
,3 4
NameClaimType
ÄÄ !
=
ÄÄ" #

ClaimTypes
ÄÄ$ .
.
ÄÄ. /
Name
ÄÄ/ 3
}
ÅÅ 
;
ÅÅ 
options
ÇÇ 
.
ÇÇ 
Events
ÇÇ 
=
ÇÇ  
new
ÇÇ! $
	Microsoft
ÇÇ% .
.
ÇÇ. /

AspNetCore
ÇÇ/ 9
.
ÇÇ9 :
Authentication
ÇÇ: H
.
ÇÇH I
	JwtBearer
ÇÇI R
.
ÇÇR S
JwtBearerEvents
ÇÇS b
{
ÉÉ 
OnMessageReceived
ÑÑ %
=
ÑÑ& '
context
ÑÑ( /
=>
ÑÑ0 2
{
ÖÖ 
if
áá 
(
áá 
string
áá 
.
áá 
IsNullOrEmpty
áá '
(
áá' (
context
áá( /
.
áá/ 0
Token
áá0 5
)
áá5 6
)
áá6 7
{
àà 
context
ââ 
.
ââ 
Token
ââ  
=
ââ! "
context
ââ# *
.
ââ* +
Request
ââ+ 2
.
ââ2 3
Cookies
ââ3 :
[
ââ: ;
$str
ââ; B
]
ââB C
;
ââC D
}
ää 
return
ãã 
Task
ãã 
.
ãã 
CompletedTask
ãã (
;
ãã( )
}
åå 
,
åå $
OnAuthenticationFailed
çç *
=
çç+ ,
context
çç- 4
=>
çç5 7
{
éé 
Console
èè 
.
èè  
	WriteLine
èè  )
(
èè) *
$str
èè* C
+
èèD E
context
èèF M
.
èèM N
	Exception
èèN W
.
èèW X
Message
èèX _
)
èè_ `
;
èè` a
return
êê 
Task
êê #
.
êê# $
CompletedTask
êê$ 1
;
êê1 2
}
ëë 
}
íí 
;
íí 
}
ìì 
)
ìì 
;
ìì 
services
ïï 
.
ïï 
AddAuthorization
ïï !
(
ïï! "
)
ïï" #
;
ïï# $
return
óó 
services
óó 
;
óó 
}
òò 
}ôô ”õ
_/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250901140648_init.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public

 

partial

 
class

 
init

 
:

 
	Migration

  )
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 :
,: ;
nullable< D
:D E
falseF K
)K L
,L M
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= C
,C D
nullableE M
:M N
trueO S
)S T
,T U
IsActive 
= 
table $
.$ %
Column% +
<+ ,
bool, 0
>0 1
(1 2
type2 6
:6 7
$str8 A
,A B
nullableC K
:K L
falseM R
)R S
,S T
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 N
,N O
	maxLengthP Y
:Y Z
$num[ ^
,^ _
nullable` h
:h i
truej n
)n o
,o p
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ X
,X Y
	maxLengthZ c
:c d
$nume h
,h i
nullablej r
:r s
truet x
)x y
,y z
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
type< @
:@ A
$strB H
,H I
nullableJ R
:R S
trueT X
)X Y
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name   
:   
$str   #
,  # $
columns!! 
:!! 
table!! 
=>!! !
new!!" %
{"" 
Id## 
=## 
table## 
.## 
Column## %
<##% &
int##& )
>##) *
(##* +
type##+ /
:##/ 0
$str##1 :
,##: ;
nullable##< D
:##D E
false##F K
)##K L
.$$ 

Annotation$$ #
($$# $
$str$$$ D
,$$D E)
NpgsqlValueGenerationStrategy$$F c
.$$c d#
IdentityByDefaultColumn$$d {
)$${ |
,$$| }
Name%% 
=%% 
table%%  
.%%  !
Column%%! '
<%%' (
string%%( .
>%%. /
(%%/ 0
type%%0 4
:%%4 5
$str%%6 N
,%%N O
	maxLength%%P Y
:%%Y Z
$num%%[ ^
,%%^ _
nullable%%` h
:%%h i
false%%j o
)%%o p
,%%p q
Description&& 
=&&  !
table&&" '
.&&' (
Column&&( .
<&&. /
string&&/ 5
>&&5 6
(&&6 7
type&&7 ;
:&&; <
$str&&= V
,&&V W
	maxLength&&X a
:&&a b
$num&&c g
,&&g h
nullable&&i q
:&&q r
false&&s x
)&&x y
,&&y z
	CreatedAt'' 
='' 
table''  %
.''% &
Column''& ,
<'', -
DateTime''- 5
>''5 6
(''6 7
type''7 ;
:''; <
$str''= W
,''W X
nullable''Y a
:''a b
false''c h
)''h i
,''i j
	UpdatedAt(( 
=(( 
table((  %
.((% &
Column((& ,
<((, -
DateTime((- 5
>((5 6
(((6 7
type((7 ;
:((; <
$str((= W
,((W X
nullable((Y a
:((a b
false((c h
)((h i
})) 
,)) 
constraints** 
:** 
table** "
=>**# %
{++ 
table,, 
.,, 

PrimaryKey,, $
(,,$ %
$str,,% 5
,,,5 6
x,,7 8
=>,,9 ;
x,,< =
.,,= >
Id,,> @
),,@ A
;,,A B
}-- 
)-- 
;-- 
migrationBuilder// 
.// 
CreateTable// (
(//( )
name00 
:00 
$str00 (
,00( )
columns11 
:11 
table11 
=>11 !
new11" %
{22 
Id33 
=33 
table33 
.33 
Column33 %
<33% &
int33& )
>33) *
(33* +
type33+ /
:33/ 0
$str331 :
,33: ;
nullable33< D
:33D E
false33F K
)33K L
.44 

Annotation44 #
(44# $
$str44$ D
,44D E)
NpgsqlValueGenerationStrategy44F c
.44c d#
IdentityByDefaultColumn44d {
)44{ |
,44| }
RoleId55 
=55 
table55 "
.55" #
Column55# )
<55) *
string55* 0
>550 1
(551 2
type552 6
:556 7
$str558 >
,55> ?
nullable55@ H
:55H I
false55J O
)55O P
,55P Q
	ClaimType66 
=66 
table66  %
.66% &
Column66& ,
<66, -
string66- 3
>663 4
(664 5
type665 9
:669 :
$str66; A
,66A B
nullable66C K
:66K L
true66M Q
)66Q R
,66R S

ClaimValue77 
=77  
table77! &
.77& '
Column77' -
<77- .
string77. 4
>774 5
(775 6
type776 :
:77: ;
$str77< B
,77B C
nullable77D L
:77L M
true77N R
)77R S
}88 
,88 
constraints99 
:99 
table99 "
=>99# %
{:: 
table;; 
.;; 

PrimaryKey;; $
(;;$ %
$str;;% :
,;;: ;
x;;< =
=>;;> @
x;;A B
.;;B C
Id;;C E
);;E F
;;;F G
table<< 
.<< 

ForeignKey<< $
(<<$ %
name== 
:== 
$str== F
,==F G
column>> 
:>> 
x>>  !
=>>>" $
x>>% &
.>>& '
RoleId>>' -
,>>- .
principalTable?? &
:??& '
$str??( 5
,??5 6
principalColumn@@ '
:@@' (
$str@@) -
,@@- .
onDeleteAA  
:AA  !
ReferentialActionAA" 3
.AA3 4
CascadeAA4 ;
)AA; <
;AA< =
}BB 
)BB 
;BB 
migrationBuilderDD 
.DD 
CreateTableDD (
(DD( )
nameEE 
:EE 
$strEE #
,EE# $
columnsFF 
:FF 
tableFF 
=>FF !
newFF" %
{GG 
IdHH 
=HH 
tableHH 
.HH 
ColumnHH %
<HH% &
stringHH& ,
>HH, -
(HH- .
typeHH. 2
:HH2 3
$strHH4 :
,HH: ;
nullableHH< D
:HHD E
falseHHF K
)HHK L
,HHL M
IsActiveII 
=II 
tableII $
.II$ %
ColumnII% +
<II+ ,
boolII, 0
>II0 1
(II1 2
typeII2 6
:II6 7
$strII8 A
,IIA B
	maxLengthIIC L
:IIL M
$numIIN Q
,IIQ R
nullableIIS [
:II[ \
falseII] b
)IIb c
,IIc d
CinJJ 
=JJ 
tableJJ 
.JJ  
ColumnJJ  &
<JJ& '
longJJ' +
>JJ+ ,
(JJ, -
typeJJ- 1
:JJ1 2
$strJJ3 ;
,JJ; <
nullableJJ= E
:JJE F
trueJJG K
)JJK L
,JJL M
	CreatedAtKK 
=KK 
tableKK  %
.KK% &
ColumnKK& ,
<KK, -
DateTimeKK- 5
>KK5 6
(KK6 7
typeKK7 ;
:KK; <
$strKK= W
,KKW X
nullableKKY a
:KKa b
falseKKc h
)KKh i
,KKi j
	UpdatedAtLL 
=LL 
tableLL  %
.LL% &
ColumnLL& ,
<LL, -
DateTimeLL- 5
>LL5 6
(LL6 7
typeLL7 ;
:LL; <
$strLL= W
,LLW X
nullableLLY a
:LLa b
falseLLc h
)LLh i
,LLi j
RoleIdMM 
=MM 
tableMM "
.MM" #
ColumnMM# )
<MM) *
stringMM* 0
>MM0 1
(MM1 2
typeMM2 6
:MM6 7
$strMM8 >
,MM> ?
nullableMM@ H
:MMH I
trueMMJ N
)MMN O
,MMO P
DepartmentIdNN  
=NN! "
tableNN# (
.NN( )
ColumnNN) /
<NN/ 0
intNN0 3
>NN3 4
(NN4 5
typeNN5 9
:NN9 :
$strNN; D
,NND E
nullableNNF N
:NNN O
falseNNP U
)NNU V
,NNV W
UserNameOO 
=OO 
tableOO $
.OO$ %
ColumnOO% +
<OO+ ,
stringOO, 2
>OO2 3
(OO3 4
typeOO4 8
:OO8 9
$strOO: R
,OOR S
	maxLengthOOT ]
:OO] ^
$numOO_ b
,OOb c
nullableOOd l
:OOl m
trueOOn r
)OOr s
,OOs t
NormalizedUserNamePP &
=PP' (
tablePP) .
.PP. /
ColumnPP/ 5
<PP5 6
stringPP6 <
>PP< =
(PP= >
typePP> B
:PPB C
$strPPD \
,PP\ ]
	maxLengthPP^ g
:PPg h
$numPPi l
,PPl m
nullablePPn v
:PPv w
truePPx |
)PP| }
,PP} ~
EmailQQ 
=QQ 
tableQQ !
.QQ! "
ColumnQQ" (
<QQ( )
stringQQ) /
>QQ/ 0
(QQ0 1
typeQQ1 5
:QQ5 6
$strQQ7 O
,QQO P
	maxLengthQQQ Z
:QQZ [
$numQQ\ _
,QQ_ `
nullableQQa i
:QQi j
trueQQk o
)QQo p
,QQp q
NormalizedEmailRR #
=RR$ %
tableRR& +
.RR+ ,
ColumnRR, 2
<RR2 3
stringRR3 9
>RR9 :
(RR: ;
typeRR; ?
:RR? @
$strRRA Y
,RRY Z
	maxLengthRR[ d
:RRd e
$numRRf i
,RRi j
nullableRRk s
:RRs t
trueRRu y
)RRy z
,RRz {
EmailConfirmedSS "
=SS# $
tableSS% *
.SS* +
ColumnSS+ 1
<SS1 2
boolSS2 6
>SS6 7
(SS7 8
typeSS8 <
:SS< =
$strSS> G
,SSG H
nullableSSI Q
:SSQ R
falseSSS X
)SSX Y
,SSY Z
PasswordHashTT  
=TT! "
tableTT# (
.TT( )
ColumnTT) /
<TT/ 0
stringTT0 6
>TT6 7
(TT7 8
typeTT8 <
:TT< =
$strTT> D
,TTD E
nullableTTF N
:TTN O
trueTTP T
)TTT U
,TTU V
SecurityStampUU !
=UU" #
tableUU$ )
.UU) *
ColumnUU* 0
<UU0 1
stringUU1 7
>UU7 8
(UU8 9
typeUU9 =
:UU= >
$strUU? E
,UUE F
nullableUUG O
:UUO P
trueUUQ U
)UUU V
,UUV W
ConcurrencyStampVV $
=VV% &
tableVV' ,
.VV, -
ColumnVV- 3
<VV3 4
stringVV4 :
>VV: ;
(VV; <
typeVV< @
:VV@ A
$strVVB H
,VVH I
nullableVVJ R
:VVR S
trueVVT X
)VVX Y
,VVY Z
PhoneNumberWW 
=WW  !
tableWW" '
.WW' (
ColumnWW( .
<WW. /
stringWW/ 5
>WW5 6
(WW6 7
typeWW7 ;
:WW; <
$strWW= C
,WWC D
nullableWWE M
:WWM N
trueWWO S
)WWS T
,WWT U 
PhoneNumberConfirmedXX (
=XX) *
tableXX+ 0
.XX0 1
ColumnXX1 7
<XX7 8
boolXX8 <
>XX< =
(XX= >
typeXX> B
:XXB C
$strXXD M
,XXM N
nullableXXO W
:XXW X
falseXXY ^
)XX^ _
,XX_ `
TwoFactorEnabledYY $
=YY% &
tableYY' ,
.YY, -
ColumnYY- 3
<YY3 4
boolYY4 8
>YY8 9
(YY9 :
typeYY: >
:YY> ?
$strYY@ I
,YYI J
nullableYYK S
:YYS T
falseYYU Z
)YYZ [
,YY[ \

LockoutEndZZ 
=ZZ  
tableZZ! &
.ZZ& '
ColumnZZ' -
<ZZ- .
DateTimeOffsetZZ. <
>ZZ< =
(ZZ= >
typeZZ> B
:ZZB C
$strZZD ^
,ZZ^ _
nullableZZ` h
:ZZh i
trueZZj n
)ZZn o
,ZZo p
LockoutEnabled[[ "
=[[# $
table[[% *
.[[* +
Column[[+ 1
<[[1 2
bool[[2 6
>[[6 7
([[7 8
type[[8 <
:[[< =
$str[[> G
,[[G H
nullable[[I Q
:[[Q R
false[[S X
)[[X Y
,[[Y Z
AccessFailedCount\\ %
=\\& '
table\\( -
.\\- .
Column\\. 4
<\\4 5
int\\5 8
>\\8 9
(\\9 :
type\\: >
:\\> ?
$str\\@ I
,\\I J
nullable\\K S
:\\S T
false\\U Z
)\\Z [
}]] 
,]] 
constraints^^ 
:^^ 
table^^ "
=>^^# %
{__ 
table`` 
.`` 

PrimaryKey`` $
(``$ %
$str``% 5
,``5 6
x``7 8
=>``9 ;
x``< =
.``= >
Id``> @
)``@ A
;``A B
tableaa 
.aa 

ForeignKeyaa $
(aa$ %
namebb 
:bb 
$strbb A
,bbA B
columncc 
:cc 
xcc  !
=>cc" $
xcc% &
.cc& '
RoleIdcc' -
,cc- .
principalTabledd &
:dd& '
$strdd( 5
,dd5 6
principalColumnee '
:ee' (
$stree) -
)ee- .
;ee. /
tableff 
.ff 

ForeignKeyff $
(ff$ %
namegg 
:gg 
$strgg G
,ggG H
columnhh 
:hh 
xhh  !
=>hh" $
xhh% &
.hh& '
DepartmentIdhh' 3
,hh3 4
principalTableii &
:ii& '
$strii( 5
,ii5 6
principalColumnjj '
:jj' (
$strjj) -
,jj- .
onDeletekk  
:kk  !
ReferentialActionkk" 3
.kk3 4
Cascadekk4 ;
)kk; <
;kk< =
}ll 
)ll 
;ll 
migrationBuildernn 
.nn 
CreateTablenn (
(nn( )
nameoo 
:oo 
$stroo #
,oo# $
columnspp 
:pp 
tablepp 
=>pp !
newpp" %
{qq 
Idrr 
=rr 
tablerr 
.rr 
Columnrr %
<rr% &
intrr& )
>rr) *
(rr* +
typerr+ /
:rr/ 0
$strrr1 :
,rr: ;
nullablerr< D
:rrD E
falserrF K
)rrK L
.ss 

Annotationss #
(ss# $
$strss$ D
,ssD E)
NpgsqlValueGenerationStrategyssF c
.ssc d#
IdentityByDefaultColumnssd {
)ss{ |
,ss| }
UserIdtt 
=tt 
tablett "
.tt" #
Columntt# )
<tt) *
stringtt* 0
>tt0 1
(tt1 2
typett2 6
:tt6 7
$strtt8 >
,tt> ?
nullablett@ H
:ttH I
falsettJ O
)ttO P
,ttP Q
Questionuu 
=uu 
tableuu $
.uu$ %
Columnuu% +
<uu+ ,
stringuu, 2
>uu2 3
(uu3 4
typeuu4 8
:uu8 9
$struu: @
,uu@ A
nullableuuB J
:uuJ K
falseuuL Q
)uuQ R
,uuR S
ResultSummaryvv !
=vv" #
tablevv$ )
.vv) *
Columnvv* 0
<vv0 1
stringvv1 7
>vv7 8
(vv8 9
typevv9 =
:vv= >
$strvv? E
,vvE F
nullablevvG O
:vvO P
falsevvQ V
)vvV W
,vvW X
	CreatedAtww 
=ww 
tableww  %
.ww% &
Columnww& ,
<ww, -
DateTimeww- 5
>ww5 6
(ww6 7
typeww7 ;
:ww; <
$strww= W
,wwW X
nullablewwY a
:wwa b
falsewwc h
)wwh i
,wwi j
	UpdatedAtxx 
=xx 
tablexx  %
.xx% &
Columnxx& ,
<xx, -
DateTimexx- 5
>xx5 6
(xx6 7
typexx7 ;
:xx; <
$strxx= W
,xxW X
nullablexxY a
:xxa b
truexxc g
)xxg h
}yy 
,yy 
constraintszz 
:zz 
tablezz "
=>zz# %
{{{ 
table|| 
.|| 

PrimaryKey|| $
(||$ %
$str||% 5
,||5 6
x||7 8
=>||9 ;
x||< =
.||= >
Id||> @
)||@ A
;||A B
table}} 
.}} 

ForeignKey}} $
(}}$ %
name~~ 
:~~ 
$str~~ A
,~~A B
column 
: 
x  !
=>" $
x% &
.& '
UserId' -
,- .
principalTable
ÄÄ &
:
ÄÄ& '
$str
ÄÄ( 5
,
ÄÄ5 6
principalColumn
ÅÅ '
:
ÅÅ' (
$str
ÅÅ) -
,
ÅÅ- .
onDelete
ÇÇ  
:
ÇÇ  !
ReferentialAction
ÇÇ" 3
.
ÇÇ3 4
Cascade
ÇÇ4 ;
)
ÇÇ; <
;
ÇÇ< =
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
migrationBuilder
ÖÖ 
.
ÖÖ 
CreateTable
ÖÖ (
(
ÖÖ( )
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ (
,
ÜÜ( )
columns
áá 
:
áá 
table
áá 
=>
áá !
new
áá" %
{
àà 
Id
ââ 
=
ââ 
table
ââ 
.
ââ 
Column
ââ %
<
ââ% &
int
ââ& )
>
ââ) *
(
ââ* +
type
ââ+ /
:
ââ/ 0
$str
ââ1 :
,
ââ: ;
nullable
ââ< D
:
ââD E
false
ââF K
)
ââK L
.
ää 

Annotation
ää #
(
ää# $
$str
ää$ D
,
ääD E+
NpgsqlValueGenerationStrategy
ääF c
.
ääc d%
IdentityByDefaultColumn
ääd {
)
ää{ |
,
ää| }
UserId
ãã 
=
ãã 
table
ãã "
.
ãã" #
Column
ãã# )
<
ãã) *
string
ãã* 0
>
ãã0 1
(
ãã1 2
type
ãã2 6
:
ãã6 7
$str
ãã8 >
,
ãã> ?
nullable
ãã@ H
:
ããH I
false
ããJ O
)
ããO P
,
ããP Q
	ClaimType
åå 
=
åå 
table
åå  %
.
åå% &
Column
åå& ,
<
åå, -
string
åå- 3
>
åå3 4
(
åå4 5
type
åå5 9
:
åå9 :
$str
åå; A
,
ååA B
nullable
ååC K
:
ååK L
true
ååM Q
)
ååQ R
,
ååR S

ClaimValue
çç 
=
çç  
table
çç! &
.
çç& '
Column
çç' -
<
çç- .
string
çç. 4
>
çç4 5
(
çç5 6
type
çç6 :
:
çç: ;
$str
çç< B
,
ççB C
nullable
ççD L
:
ççL M
true
ççN R
)
ççR S
}
éé 
,
éé 
constraints
èè 
:
èè 
table
èè "
=>
èè# %
{
êê 
table
ëë 
.
ëë 

PrimaryKey
ëë $
(
ëë$ %
$str
ëë% :
,
ëë: ;
x
ëë< =
=>
ëë> @
x
ëëA B
.
ëëB C
Id
ëëC E
)
ëëE F
;
ëëF G
table
íí 
.
íí 

ForeignKey
íí $
(
íí$ %
name
ìì 
:
ìì 
$str
ìì F
,
ììF G
column
îî 
:
îî 
x
îî  !
=>
îî" $
x
îî% &
.
îî& '
UserId
îî' -
,
îî- .
principalTable
ïï &
:
ïï& '
$str
ïï( 5
,
ïï5 6
principalColumn
ññ '
:
ññ' (
$str
ññ) -
,
ññ- .
onDelete
óó  
:
óó  !
ReferentialAction
óó" 3
.
óó3 4
Cascade
óó4 ;
)
óó; <
;
óó< =
}
òò 
)
òò 
;
òò 
migrationBuilder
öö 
.
öö 
CreateTable
öö (
(
öö( )
name
õõ 
:
õõ 
$str
õõ (
,
õõ( )
columns
úú 
:
úú 
table
úú 
=>
úú !
new
úú" %
{
ùù 
LoginProvider
ûû !
=
ûû" #
table
ûû$ )
.
ûû) *
Column
ûû* 0
<
ûû0 1
string
ûû1 7
>
ûû7 8
(
ûû8 9
type
ûû9 =
:
ûû= >
$str
ûû? E
,
ûûE F
nullable
ûûG O
:
ûûO P
false
ûûQ V
)
ûûV W
,
ûûW X
ProviderKey
üü 
=
üü  !
table
üü" '
.
üü' (
Column
üü( .
<
üü. /
string
üü/ 5
>
üü5 6
(
üü6 7
type
üü7 ;
:
üü; <
$str
üü= C
,
üüC D
nullable
üüE M
:
üüM N
false
üüO T
)
üüT U
,
üüU V!
ProviderDisplayName
†† '
=
††( )
table
††* /
.
††/ 0
Column
††0 6
<
††6 7
string
††7 =
>
††= >
(
††> ?
type
††? C
:
††C D
$str
††E K
,
††K L
nullable
††M U
:
††U V
true
††W [
)
††[ \
,
††\ ]
UserId
°° 
=
°° 
table
°° "
.
°°" #
Column
°°# )
<
°°) *
string
°°* 0
>
°°0 1
(
°°1 2
type
°°2 6
:
°°6 7
$str
°°8 >
,
°°> ?
nullable
°°@ H
:
°°H I
false
°°J O
)
°°O P
}
¢¢ 
,
¢¢ 
constraints
££ 
:
££ 
table
££ "
=>
££# %
{
§§ 
table
•• 
.
•• 

PrimaryKey
•• $
(
••$ %
$str
••% :
,
••: ;
x
••< =
=>
••> @
new
••A D
{
••E F
x
••G H
.
••H I
LoginProvider
••I V
,
••V W
x
••X Y
.
••Y Z
ProviderKey
••Z e
}
••f g
)
••g h
;
••h i
table
¶¶ 
.
¶¶ 

ForeignKey
¶¶ $
(
¶¶$ %
name
ßß 
:
ßß 
$str
ßß F
,
ßßF G
column
®® 
:
®® 
x
®®  !
=>
®®" $
x
®®% &
.
®®& '
UserId
®®' -
,
®®- .
principalTable
©© &
:
©©& '
$str
©©( 5
,
©©5 6
principalColumn
™™ '
:
™™' (
$str
™™) -
,
™™- .
onDelete
´´  
:
´´  !
ReferentialAction
´´" 3
.
´´3 4
Cascade
´´4 ;
)
´´; <
;
´´< =
}
¨¨ 
)
¨¨ 
;
¨¨ 
migrationBuilder
ÆÆ 
.
ÆÆ 
CreateTable
ÆÆ (
(
ÆÆ( )
name
ØØ 
:
ØØ 
$str
ØØ '
,
ØØ' (
columns
∞∞ 
:
∞∞ 
table
∞∞ 
=>
∞∞ !
new
∞∞" %
{
±± 
UserId
≤≤ 
=
≤≤ 
table
≤≤ "
.
≤≤" #
Column
≤≤# )
<
≤≤) *
string
≤≤* 0
>
≤≤0 1
(
≤≤1 2
type
≤≤2 6
:
≤≤6 7
$str
≤≤8 >
,
≤≤> ?
nullable
≤≤@ H
:
≤≤H I
false
≤≤J O
)
≤≤O P
,
≤≤P Q
RoleId
≥≥ 
=
≥≥ 
table
≥≥ "
.
≥≥" #
Column
≥≥# )
<
≥≥) *
string
≥≥* 0
>
≥≥0 1
(
≥≥1 2
type
≥≥2 6
:
≥≥6 7
$str
≥≥8 >
,
≥≥> ?
nullable
≥≥@ H
:
≥≥H I
false
≥≥J O
)
≥≥O P
}
¥¥ 
,
¥¥ 
constraints
µµ 
:
µµ 
table
µµ "
=>
µµ# %
{
∂∂ 
table
∑∑ 
.
∑∑ 

PrimaryKey
∑∑ $
(
∑∑$ %
$str
∑∑% 9
,
∑∑9 :
x
∑∑; <
=>
∑∑= ?
new
∑∑@ C
{
∑∑D E
x
∑∑F G
.
∑∑G H
UserId
∑∑H N
,
∑∑N O
x
∑∑P Q
.
∑∑Q R
RoleId
∑∑R X
}
∑∑Y Z
)
∑∑Z [
;
∑∑[ \
table
∏∏ 
.
∏∏ 

ForeignKey
∏∏ $
(
∏∏$ %
name
ππ 
:
ππ 
$str
ππ E
,
ππE F
column
∫∫ 
:
∫∫ 
x
∫∫  !
=>
∫∫" $
x
∫∫% &
.
∫∫& '
RoleId
∫∫' -
,
∫∫- .
principalTable
ªª &
:
ªª& '
$str
ªª( 5
,
ªª5 6
principalColumn
ºº '
:
ºº' (
$str
ºº) -
,
ºº- .
onDelete
ΩΩ  
:
ΩΩ  !
ReferentialAction
ΩΩ" 3
.
ΩΩ3 4
Cascade
ΩΩ4 ;
)
ΩΩ; <
;
ΩΩ< =
table
ææ 
.
ææ 

ForeignKey
ææ $
(
ææ$ %
name
øø 
:
øø 
$str
øø E
,
øøE F
column
¿¿ 
:
¿¿ 
x
¿¿  !
=>
¿¿" $
x
¿¿% &
.
¿¿& '
UserId
¿¿' -
,
¿¿- .
principalTable
¡¡ &
:
¡¡& '
$str
¡¡( 5
,
¡¡5 6
principalColumn
¬¬ '
:
¬¬' (
$str
¬¬) -
,
¬¬- .
onDelete
√√  
:
√√  !
ReferentialAction
√√" 3
.
√√3 4
Cascade
√√4 ;
)
√√; <
;
√√< =
}
ƒƒ 
)
ƒƒ 
;
ƒƒ 
migrationBuilder
∆∆ 
.
∆∆ 
CreateTable
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« (
,
««( )
columns
»» 
:
»» 
table
»» 
=>
»» !
new
»»" %
{
…… 
UserId
   
=
   
table
   "
.
  " #
Column
  # )
<
  ) *
string
  * 0
>
  0 1
(
  1 2
type
  2 6
:
  6 7
$str
  8 >
,
  > ?
nullable
  @ H
:
  H I
false
  J O
)
  O P
,
  P Q
LoginProvider
ÀÀ !
=
ÀÀ" #
table
ÀÀ$ )
.
ÀÀ) *
Column
ÀÀ* 0
<
ÀÀ0 1
string
ÀÀ1 7
>
ÀÀ7 8
(
ÀÀ8 9
type
ÀÀ9 =
:
ÀÀ= >
$str
ÀÀ? E
,
ÀÀE F
nullable
ÀÀG O
:
ÀÀO P
false
ÀÀQ V
)
ÀÀV W
,
ÀÀW X
Name
ÃÃ 
=
ÃÃ 
table
ÃÃ  
.
ÃÃ  !
Column
ÃÃ! '
<
ÃÃ' (
string
ÃÃ( .
>
ÃÃ. /
(
ÃÃ/ 0
type
ÃÃ0 4
:
ÃÃ4 5
$str
ÃÃ6 <
,
ÃÃ< =
nullable
ÃÃ> F
:
ÃÃF G
false
ÃÃH M
)
ÃÃM N
,
ÃÃN O
Value
ÕÕ 
=
ÕÕ 
table
ÕÕ !
.
ÕÕ! "
Column
ÕÕ" (
<
ÕÕ( )
string
ÕÕ) /
>
ÕÕ/ 0
(
ÕÕ0 1
type
ÕÕ1 5
:
ÕÕ5 6
$str
ÕÕ7 =
,
ÕÕ= >
nullable
ÕÕ? G
:
ÕÕG H
true
ÕÕI M
)
ÕÕM N
}
ŒŒ 
,
ŒŒ 
constraints
œœ 
:
œœ 
table
œœ "
=>
œœ# %
{
–– 
table
—— 
.
—— 

PrimaryKey
—— $
(
——$ %
$str
——% :
,
——: ;
x
——< =
=>
——> @
new
——A D
{
——E F
x
——G H
.
——H I
UserId
——I O
,
——O P
x
——Q R
.
——R S
LoginProvider
——S `
,
——` a
x
——b c
.
——c d
Name
——d h
}
——i j
)
——j k
;
——k l
table
““ 
.
““ 

ForeignKey
““ $
(
““$ %
name
”” 
:
”” 
$str
”” F
,
””F G
column
‘‘ 
:
‘‘ 
x
‘‘  !
=>
‘‘" $
x
‘‘% &
.
‘‘& '
UserId
‘‘' -
,
‘‘- .
principalTable
’’ &
:
’’& '
$str
’’( 5
,
’’5 6
principalColumn
÷÷ '
:
÷÷' (
$str
÷÷) -
,
÷÷- .
onDelete
◊◊  
:
◊◊  !
ReferentialAction
◊◊" 3
.
◊◊3 4
Cascade
◊◊4 ;
)
◊◊; <
;
◊◊< =
}
ÿÿ 
)
ÿÿ 
;
ÿÿ 
migrationBuilder
⁄⁄ 
.
⁄⁄ 
CreateTable
⁄⁄ (
(
⁄⁄( )
name
€€ 
:
€€ 
$str
€€ !
,
€€! "
columns
‹‹ 
:
‹‹ 
table
‹‹ 
=>
‹‹ !
new
‹‹" %
{
›› 
Id
ﬁﬁ 
=
ﬁﬁ 
table
ﬁﬁ 
.
ﬁﬁ 
Column
ﬁﬁ %
<
ﬁﬁ% &
int
ﬁﬁ& )
>
ﬁﬁ) *
(
ﬁﬁ* +
type
ﬁﬁ+ /
:
ﬁﬁ/ 0
$str
ﬁﬁ1 :
,
ﬁﬁ: ;
nullable
ﬁﬁ< D
:
ﬁﬁD E
false
ﬁﬁF K
)
ﬁﬁK L
.
ﬂﬂ 

Annotation
ﬂﬂ #
(
ﬂﬂ# $
$str
ﬂﬂ$ D
,
ﬂﬂD E+
NpgsqlValueGenerationStrategy
ﬂﬂF c
.
ﬂﬂc d%
IdentityByDefaultColumn
ﬂﬂd {
)
ﬂﬂ{ |
,
ﬂﬂ| }
UserId
‡‡ 
=
‡‡ 
table
‡‡ "
.
‡‡" #
Column
‡‡# )
<
‡‡) *
string
‡‡* 0
>
‡‡0 1
(
‡‡1 2
type
‡‡2 6
:
‡‡6 7
$str
‡‡8 >
,
‡‡> ?
nullable
‡‡@ H
:
‡‡H I
false
‡‡J O
)
‡‡O P
,
‡‡P Q

ActionType
·· 
=
··  
table
··! &
.
··& '
Column
··' -
<
··- .
string
··. 4
>
··4 5
(
··5 6
type
··6 :
:
··: ;
$str
··< B
,
··B C
nullable
··D L
:
··L M
false
··N S
)
··S T
,
··T U
	UserAgent
‚‚ 
=
‚‚ 
table
‚‚  %
.
‚‚% &
Column
‚‚& ,
<
‚‚, -
string
‚‚- 3
>
‚‚3 4
(
‚‚4 5
type
‚‚5 9
:
‚‚9 :
$str
‚‚; A
,
‚‚A B
nullable
‚‚C K
:
‚‚K L
true
‚‚M Q
)
‚‚Q R
,
‚‚R S
	IPAddress
„„ 
=
„„ 
table
„„  %
.
„„% &
Column
„„& ,
<
„„, -
string
„„- 3
>
„„3 4
(
„„4 5
type
„„5 9
:
„„9 :
$str
„„; A
,
„„A B
nullable
„„C K
:
„„K L
true
„„M Q
)
„„Q R
,
„„R S
Action
‰‰ 
=
‰‰ 
table
‰‰ "
.
‰‰" #
Column
‰‰# )
<
‰‰) *
string
‰‰* 0
>
‰‰0 1
(
‰‰1 2
type
‰‰2 6
:
‰‰6 7
$str
‰‰8 P
,
‰‰P Q
	maxLength
‰‰R [
:
‰‰[ \
$num
‰‰] `
,
‰‰` a
nullable
‰‰b j
:
‰‰j k
false
‰‰l q
)
‰‰q r
,
‰‰r s
TargetEntity
ÂÂ  
=
ÂÂ! "
table
ÂÂ# (
.
ÂÂ( )
Column
ÂÂ) /
<
ÂÂ/ 0
string
ÂÂ0 6
>
ÂÂ6 7
(
ÂÂ7 8
type
ÂÂ8 <
:
ÂÂ< =
$str
ÂÂ> V
,
ÂÂV W
	maxLength
ÂÂX a
:
ÂÂa b
$num
ÂÂc f
,
ÂÂf g
nullable
ÂÂh p
:
ÂÂp q
false
ÂÂr w
)
ÂÂw x
,
ÂÂx y
Description
ÊÊ 
=
ÊÊ  !
table
ÊÊ" '
.
ÊÊ' (
Column
ÊÊ( .
<
ÊÊ. /
string
ÊÊ/ 5
>
ÊÊ5 6
(
ÊÊ6 7
type
ÊÊ7 ;
:
ÊÊ; <
$str
ÊÊ= C
,
ÊÊC D
nullable
ÊÊE M
:
ÊÊM N
false
ÊÊO T
)
ÊÊT U
,
ÊÊU V
	CreatedAt
ÁÁ 
=
ÁÁ 
table
ÁÁ  %
.
ÁÁ% &
Column
ÁÁ& ,
<
ÁÁ, -
DateTime
ÁÁ- 5
>
ÁÁ5 6
(
ÁÁ6 7
type
ÁÁ7 ;
:
ÁÁ; <
$str
ÁÁ= W
,
ÁÁW X
nullable
ÁÁY a
:
ÁÁa b
false
ÁÁc h
)
ÁÁh i
,
ÁÁi j
	UpdatedAt
ËË 
=
ËË 
table
ËË  %
.
ËË% &
Column
ËË& ,
<
ËË, -
DateTime
ËË- 5
>
ËË5 6
(
ËË6 7
type
ËË7 ;
:
ËË; <
$str
ËË= W
,
ËËW X
nullable
ËËY a
:
ËËa b
true
ËËc g
)
ËËg h
}
ÈÈ 
,
ÈÈ 
constraints
ÍÍ 
:
ÍÍ 
table
ÍÍ "
=>
ÍÍ# %
{
ÎÎ 
table
ÏÏ 
.
ÏÏ 

PrimaryKey
ÏÏ $
(
ÏÏ$ %
$str
ÏÏ% 3
,
ÏÏ3 4
x
ÏÏ5 6
=>
ÏÏ7 9
x
ÏÏ: ;
.
ÏÏ; <
Id
ÏÏ< >
)
ÏÏ> ?
;
ÏÏ? @
table
ÌÌ 
.
ÌÌ 

ForeignKey
ÌÌ $
(
ÌÌ$ %
name
ÓÓ 
:
ÓÓ 
$str
ÓÓ ?
,
ÓÓ? @
column
ÔÔ 
:
ÔÔ 
x
ÔÔ  !
=>
ÔÔ" $
x
ÔÔ% &
.
ÔÔ& '
UserId
ÔÔ' -
,
ÔÔ- .
principalTable
 &
:
& '
$str
( 5
,
5 6
principalColumn
ÒÒ '
:
ÒÒ' (
$str
ÒÒ) -
,
ÒÒ- .
onDelete
ÚÚ  
:
ÚÚ  !
ReferentialAction
ÚÚ" 3
.
ÚÚ3 4
Cascade
ÚÚ4 ;
)
ÚÚ; <
;
ÚÚ< =
}
ÛÛ 
)
ÛÛ 
;
ÛÛ 
migrationBuilder
ıı 
.
ıı 
CreateTable
ıı (
(
ıı( )
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ 
,
ˆˆ 
columns
˜˜ 
:
˜˜ 
table
˜˜ 
=>
˜˜ !
new
˜˜" %
{
¯¯ 
Id
˘˘ 
=
˘˘ 
table
˘˘ 
.
˘˘ 
Column
˘˘ %
<
˘˘% &
int
˘˘& )
>
˘˘) *
(
˘˘* +
type
˘˘+ /
:
˘˘/ 0
$str
˘˘1 :
,
˘˘: ;
nullable
˘˘< D
:
˘˘D E
false
˘˘F K
)
˘˘K L
.
˙˙ 

Annotation
˙˙ #
(
˙˙# $
$str
˙˙$ D
,
˙˙D E+
NpgsqlValueGenerationStrategy
˙˙F c
.
˙˙c d%
IdentityByDefaultColumn
˙˙d {
)
˙˙{ |
,
˙˙| }
Name
˚˚ 
=
˚˚ 
table
˚˚  
.
˚˚  !
Column
˚˚! '
<
˚˚' (
string
˚˚( .
>
˚˚. /
(
˚˚/ 0
type
˚˚0 4
:
˚˚4 5
$str
˚˚6 <
,
˚˚< =
nullable
˚˚> F
:
˚˚F G
false
˚˚H M
)
˚˚M N
,
˚˚N O
ParentFolderId
¸¸ "
=
¸¸# $
table
¸¸% *
.
¸¸* +
Column
¸¸+ 1
<
¸¸1 2
int
¸¸2 5
>
¸¸5 6
(
¸¸6 7
type
¸¸7 ;
:
¸¸; <
$str
¸¸= F
,
¸¸F G
nullable
¸¸H P
:
¸¸P Q
true
¸¸R V
)
¸¸V W
,
¸¸W X
DepartmentId
˝˝  
=
˝˝! "
table
˝˝# (
.
˝˝( )
Column
˝˝) /
<
˝˝/ 0
int
˝˝0 3
>
˝˝3 4
(
˝˝4 5
type
˝˝5 9
:
˝˝9 :
$str
˝˝; D
,
˝˝D E
nullable
˝˝F N
:
˝˝N O
false
˝˝P U
)
˝˝U V
,
˝˝V W
Description
˛˛ 
=
˛˛  !
table
˛˛" '
.
˛˛' (
Column
˛˛( .
<
˛˛. /
string
˛˛/ 5
>
˛˛5 6
(
˛˛6 7
type
˛˛7 ;
:
˛˛; <
$str
˛˛= C
,
˛˛C D
nullable
˛˛E M
:
˛˛M N
true
˛˛O S
)
˛˛S T
,
˛˛T U
CreatedById
ˇˇ 
=
ˇˇ  !
table
ˇˇ" '
.
ˇˇ' (
Column
ˇˇ( .
<
ˇˇ. /
string
ˇˇ/ 5
>
ˇˇ5 6
(
ˇˇ6 7
type
ˇˇ7 ;
:
ˇˇ; <
$str
ˇˇ= C
,
ˇˇC D
nullable
ˇˇE M
:
ˇˇM N
false
ˇˇO T
)
ˇˇT U
,
ˇˇU V
	CreatedAt
ÄÄ 
=
ÄÄ 
table
ÄÄ  %
.
ÄÄ% &
Column
ÄÄ& ,
<
ÄÄ, -
DateTime
ÄÄ- 5
>
ÄÄ5 6
(
ÄÄ6 7
type
ÄÄ7 ;
:
ÄÄ; <
$str
ÄÄ= W
,
ÄÄW X
nullable
ÄÄY a
:
ÄÄa b
false
ÄÄc h
)
ÄÄh i
,
ÄÄi j
	UpdatedAt
ÅÅ 
=
ÅÅ 
table
ÅÅ  %
.
ÅÅ% &
Column
ÅÅ& ,
<
ÅÅ, -
DateTime
ÅÅ- 5
>
ÅÅ5 6
(
ÅÅ6 7
type
ÅÅ7 ;
:
ÅÅ; <
$str
ÅÅ= W
,
ÅÅW X
nullable
ÅÅY a
:
ÅÅa b
true
ÅÅc g
)
ÅÅg h
}
ÇÇ 
,
ÇÇ 
constraints
ÉÉ 
:
ÉÉ 
table
ÉÉ "
=>
ÉÉ# %
{
ÑÑ 
table
ÖÖ 
.
ÖÖ 

PrimaryKey
ÖÖ $
(
ÖÖ$ %
$str
ÖÖ% 0
,
ÖÖ0 1
x
ÖÖ2 3
=>
ÖÖ4 6
x
ÖÖ7 8
.
ÖÖ8 9
Id
ÖÖ9 ;
)
ÖÖ; <
;
ÖÖ< =
table
ÜÜ 
.
ÜÜ 

ForeignKey
ÜÜ $
(
ÜÜ$ %
name
áá 
:
áá 
$str
áá A
,
ááA B
column
àà 
:
àà 
x
àà  !
=>
àà" $
x
àà% &
.
àà& '
CreatedById
àà' 2
,
àà2 3
principalTable
ââ &
:
ââ& '
$str
ââ( 5
,
ââ5 6
principalColumn
ää '
:
ää' (
$str
ää) -
,
ää- .
onDelete
ãã  
:
ãã  !
ReferentialAction
ãã" 3
.
ãã3 4
Cascade
ãã4 ;
)
ãã; <
;
ãã< =
table
åå 
.
åå 

ForeignKey
åå $
(
åå$ %
name
çç 
:
çç 
$str
çç B
,
ççB C
column
éé 
:
éé 
x
éé  !
=>
éé" $
x
éé% &
.
éé& '
DepartmentId
éé' 3
,
éé3 4
principalTable
èè &
:
èè& '
$str
èè( 5
,
èè5 6
principalColumn
êê '
:
êê' (
$str
êê) -
,
êê- .
onDelete
ëë  
:
ëë  !
ReferentialAction
ëë" 3
.
ëë3 4
Cascade
ëë4 ;
)
ëë; <
;
ëë< =
table
íí 
.
íí 

ForeignKey
íí $
(
íí$ %
name
ìì 
:
ìì 
$str
ìì ?
,
ìì? @
column
îî 
:
îî 
x
îî  !
=>
îî" $
x
îî% &
.
îî& '
ParentFolderId
îî' 5
,
îî5 6
principalTable
ïï &
:
ïï& '
$str
ïï( 0
,
ïï0 1
principalColumn
ññ '
:
ññ' (
$str
ññ) -
)
ññ- .
;
ññ. /
}
óó 
)
óó 
;
óó 
migrationBuilder
ôô 
.
ôô 
CreateTable
ôô (
(
ôô( )
name
öö 
:
öö 
$str
öö "
,
öö" #
columns
õõ 
:
õõ 
table
õõ 
=>
õõ !
new
õõ" %
{
úú 
Id
ùù 
=
ùù 
table
ùù 
.
ùù 
Column
ùù %
<
ùù% &
int
ùù& )
>
ùù) *
(
ùù* +
type
ùù+ /
:
ùù/ 0
$str
ùù1 :
,
ùù: ;
nullable
ùù< D
:
ùùD E
false
ùùF K
)
ùùK L
.
ûû 

Annotation
ûû #
(
ûû# $
$str
ûû$ D
,
ûûD E+
NpgsqlValueGenerationStrategy
ûûF c
.
ûûc d%
IdentityByDefaultColumn
ûûd {
)
ûû{ |
,
ûû| }
Name
üü 
=
üü 
table
üü  
.
üü  !
Column
üü! '
<
üü' (
string
üü( .
>
üü. /
(
üü/ 0
type
üü0 4
:
üü4 5
$str
üü6 <
,
üü< =
nullable
üü> F
:
üüF G
false
üüH M
)
üüM N
,
üüN O
UserId
†† 
=
†† 
table
†† "
.
††" #
Column
††# )
<
††) *
string
††* 0
>
††0 1
(
††1 2
type
††2 6
:
††6 7
$str
††8 >
,
††> ?
nullable
††@ H
:
††H I
false
††J O
)
††O P
,
††P Q
ParentFolderId
°° "
=
°°# $
table
°°% *
.
°°* +
Column
°°+ 1
<
°°1 2
int
°°2 5
>
°°5 6
(
°°6 7
type
°°7 ;
:
°°; <
$str
°°= F
,
°°F G
nullable
°°H P
:
°°P Q
true
°°R V
)
°°V W
,
°°W X
	CreatedAt
¢¢ 
=
¢¢ 
table
¢¢  %
.
¢¢% &
Column
¢¢& ,
<
¢¢, -
DateTime
¢¢- 5
>
¢¢5 6
(
¢¢6 7
type
¢¢7 ;
:
¢¢; <
$str
¢¢= W
,
¢¢W X
nullable
¢¢Y a
:
¢¢a b
false
¢¢c h
)
¢¢h i
,
¢¢i j
	UpdatedAt
££ 
=
££ 
table
££  %
.
££% &
Column
££& ,
<
££, -
DateTime
££- 5
>
££5 6
(
££6 7
type
££7 ;
:
££; <
$str
££= W
,
££W X
nullable
££Y a
:
££a b
true
££c g
)
££g h
}
§§ 
,
§§ 
constraints
•• 
:
•• 
table
•• "
=>
••# %
{
¶¶ 
table
ßß 
.
ßß 

PrimaryKey
ßß $
(
ßß$ %
$str
ßß% 4
,
ßß4 5
x
ßß6 7
=>
ßß8 :
x
ßß; <
.
ßß< =
Id
ßß= ?
)
ßß? @
;
ßß@ A
table
®® 
.
®® 

ForeignKey
®® $
(
®®$ %
name
©© 
:
©© 
$str
©© @
,
©©@ A
column
™™ 
:
™™ 
x
™™  !
=>
™™" $
x
™™% &
.
™™& '
UserId
™™' -
,
™™- .
principalTable
´´ &
:
´´& '
$str
´´( 5
,
´´5 6
principalColumn
¨¨ '
:
¨¨' (
$str
¨¨) -
,
¨¨- .
onDelete
≠≠  
:
≠≠  !
ReferentialAction
≠≠" 3
.
≠≠3 4
Cascade
≠≠4 ;
)
≠≠; <
;
≠≠< =
table
ÆÆ 
.
ÆÆ 

ForeignKey
ÆÆ $
(
ÆÆ$ %
name
ØØ 
:
ØØ 
$str
ØØ G
,
ØØG H
column
∞∞ 
:
∞∞ 
x
∞∞  !
=>
∞∞" $
x
∞∞% &
.
∞∞& '
ParentFolderId
∞∞' 5
,
∞∞5 6
principalTable
±± &
:
±±& '
$str
±±( 4
,
±±4 5
principalColumn
≤≤ '
:
≤≤' (
$str
≤≤) -
)
≤≤- .
;
≤≤. /
}
≥≥ 
)
≥≥ 
;
≥≥ 
migrationBuilder
µµ 
.
µµ 
CreateTable
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
$str
∂∂ 
,
∂∂  
columns
∑∑ 
:
∑∑ 
table
∑∑ 
=>
∑∑ !
new
∑∑" %
{
∏∏ 
Id
ππ 
=
ππ 
table
ππ 
.
ππ 
Column
ππ %
<
ππ% &
int
ππ& )
>
ππ) *
(
ππ* +
type
ππ+ /
:
ππ/ 0
$str
ππ1 :
,
ππ: ;
nullable
ππ< D
:
ππD E
false
ππF K
)
ππK L
.
∫∫ 

Annotation
∫∫ #
(
∫∫# $
$str
∫∫$ D
,
∫∫D E+
NpgsqlValueGenerationStrategy
∫∫F c
.
∫∫c d%
IdentityByDefaultColumn
∫∫d {
)
∫∫{ |
,
∫∫| }
SenderId
ªª 
=
ªª 
table
ªª $
.
ªª$ %
Column
ªª% +
<
ªª+ ,
int
ªª, /
>
ªª/ 0
(
ªª0 1
type
ªª1 5
:
ªª5 6
$str
ªª7 @
,
ªª@ A
nullable
ªªB J
:
ªªJ K
false
ªªL Q
)
ªªQ R
,
ªªR S

ReceiverId
ºº 
=
ºº  
table
ºº! &
.
ºº& '
Column
ºº' -
<
ºº- .
int
ºº. 1
>
ºº1 2
(
ºº2 3
type
ºº3 7
:
ºº7 8
$str
ºº9 B
,
ººB C
nullable
ººD L
:
ººL M
false
ººN S
)
ººS T
,
ººT U
Subject
ΩΩ 
=
ΩΩ 
table
ΩΩ #
.
ΩΩ# $
Column
ΩΩ$ *
<
ΩΩ* +
string
ΩΩ+ 1
>
ΩΩ1 2
(
ΩΩ2 3
type
ΩΩ3 7
:
ΩΩ7 8
$str
ΩΩ9 Q
,
ΩΩQ R
	maxLength
ΩΩS \
:
ΩΩ\ ]
$num
ΩΩ^ a
,
ΩΩa b
nullable
ΩΩc k
:
ΩΩk l
false
ΩΩm r
)
ΩΩr s
,
ΩΩs t
Body
ææ 
=
ææ 
table
ææ  
.
ææ  !
Column
ææ! '
<
ææ' (
string
ææ( .
>
ææ. /
(
ææ/ 0
type
ææ0 4
:
ææ4 5
$str
ææ6 <
,
ææ< =
nullable
ææ> F
:
ææF G
false
ææH M
)
ææM N
,
ææN O
IsRead
øø 
=
øø 
table
øø "
.
øø" #
Column
øø# )
<
øø) *
bool
øø* .
>
øø. /
(
øø/ 0
type
øø0 4
:
øø4 5
$str
øø6 ?
,
øø? @
nullable
øøA I
:
øøI J
false
øøK P
)
øøP Q
,
øøQ R
SentAt
¿¿ 
=
¿¿ 
table
¿¿ "
.
¿¿" #
Column
¿¿# )
<
¿¿) *
DateTime
¿¿* 2
>
¿¿2 3
(
¿¿3 4
type
¿¿4 8
:
¿¿8 9
$str
¿¿: T
,
¿¿T U
nullable
¿¿V ^
:
¿¿^ _
false
¿¿` e
)
¿¿e f
,
¿¿f g
	SenderId1
¡¡ 
=
¡¡ 
table
¡¡  %
.
¡¡% &
Column
¡¡& ,
<
¡¡, -
string
¡¡- 3
>
¡¡3 4
(
¡¡4 5
type
¡¡5 9
:
¡¡9 :
$str
¡¡; A
,
¡¡A B
nullable
¡¡C K
:
¡¡K L
false
¡¡M R
)
¡¡R S
,
¡¡S T
ReceiverId1
¬¬ 
=
¬¬  !
table
¬¬" '
.
¬¬' (
Column
¬¬( .
<
¬¬. /
string
¬¬/ 5
>
¬¬5 6
(
¬¬6 7
type
¬¬7 ;
:
¬¬; <
$str
¬¬= C
,
¬¬C D
nullable
¬¬E M
:
¬¬M N
false
¬¬O T
)
¬¬T U
,
¬¬U V
	CreatedAt
√√ 
=
√√ 
table
√√  %
.
√√% &
Column
√√& ,
<
√√, -
DateTime
√√- 5
>
√√5 6
(
√√6 7
type
√√7 ;
:
√√; <
$str
√√= W
,
√√W X
nullable
√√Y a
:
√√a b
false
√√c h
)
√√h i
,
√√i j
	UpdatedAt
ƒƒ 
=
ƒƒ 
table
ƒƒ  %
.
ƒƒ% &
Column
ƒƒ& ,
<
ƒƒ, -
DateTime
ƒƒ- 5
>
ƒƒ5 6
(
ƒƒ6 7
type
ƒƒ7 ;
:
ƒƒ; <
$str
ƒƒ= W
,
ƒƒW X
nullable
ƒƒY a
:
ƒƒa b
true
ƒƒc g
)
ƒƒg h
}
≈≈ 
,
≈≈ 
constraints
∆∆ 
:
∆∆ 
table
∆∆ "
=>
∆∆# %
{
«« 
table
»» 
.
»» 

PrimaryKey
»» $
(
»»$ %
$str
»»% 1
,
»»1 2
x
»»3 4
=>
»»5 7
x
»»8 9
.
»»9 :
Id
»»: <
)
»»< =
;
»»= >
table
…… 
.
…… 

ForeignKey
…… $
(
……$ %
name
   
:
   
$str
   B
,
  B C
column
ÀÀ 
:
ÀÀ 
x
ÀÀ  !
=>
ÀÀ" $
x
ÀÀ% &
.
ÀÀ& '
ReceiverId1
ÀÀ' 2
,
ÀÀ2 3
principalTable
ÃÃ &
:
ÃÃ& '
$str
ÃÃ( 5
,
ÃÃ5 6
principalColumn
ÕÕ '
:
ÕÕ' (
$str
ÕÕ) -
,
ÕÕ- .
onDelete
ŒŒ  
:
ŒŒ  !
ReferentialAction
ŒŒ" 3
.
ŒŒ3 4
Cascade
ŒŒ4 ;
)
ŒŒ; <
;
ŒŒ< =
table
œœ 
.
œœ 

ForeignKey
œœ $
(
œœ$ %
name
–– 
:
–– 
$str
–– @
,
––@ A
column
—— 
:
—— 
x
——  !
=>
——" $
x
——% &
.
——& '
	SenderId1
——' 0
,
——0 1
principalTable
““ &
:
““& '
$str
““( 5
,
““5 6
principalColumn
”” '
:
””' (
$str
””) -
,
””- .
onDelete
‘‘  
:
‘‘  !
ReferentialAction
‘‘" 3
.
‘‘3 4
Cascade
‘‘4 ;
)
‘‘; <
;
‘‘< =
}
’’ 
)
’’ 
;
’’ 
migrationBuilder
◊◊ 
.
◊◊ 
CreateTable
◊◊ (
(
◊◊( )
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ !
,
ÿÿ! "
columns
ŸŸ 
:
ŸŸ 
table
ŸŸ 
=>
ŸŸ !
new
ŸŸ" %
{
⁄⁄ 
Id
€€ 
=
€€ 
table
€€ 
.
€€ 
Column
€€ %
<
€€% &
int
€€& )
>
€€) *
(
€€* +
type
€€+ /
:
€€/ 0
$str
€€1 :
,
€€: ;
nullable
€€< D
:
€€D E
false
€€F K
)
€€K L
.
‹‹ 

Annotation
‹‹ #
(
‹‹# $
$str
‹‹$ D
,
‹‹D E+
NpgsqlValueGenerationStrategy
‹‹F c
.
‹‹c d%
IdentityByDefaultColumn
‹‹d {
)
‹‹{ |
,
‹‹| }
Name
›› 
=
›› 
table
››  
.
››  !
Column
››! '
<
››' (
string
››( .
>
››. /
(
››/ 0
type
››0 4
:
››4 5
$str
››6 N
,
››N O
	maxLength
››P Y
:
››Y Z
$num
››[ ^
,
››^ _
nullable
››` h
:
››h i
false
››j o
)
››o p
,
››p q
FileType
ﬁﬁ 
=
ﬁﬁ 
table
ﬁﬁ $
.
ﬁﬁ$ %
Column
ﬁﬁ% +
<
ﬁﬁ+ ,
string
ﬁﬁ, 2
>
ﬁﬁ2 3
(
ﬁﬁ3 4
type
ﬁﬁ4 8
:
ﬁﬁ8 9
$str
ﬁﬁ: Q
,
ﬁﬁQ R
	maxLength
ﬁﬁS \
:
ﬁﬁ\ ]
$num
ﬁﬁ^ `
,
ﬁﬁ` a
nullable
ﬁﬁb j
:
ﬁﬁj k
false
ﬁﬁl q
)
ﬁﬁq r
,
ﬁﬁr s
FileSize
ﬂﬂ 
=
ﬂﬂ 
table
ﬂﬂ $
.
ﬂﬂ$ %
Column
ﬂﬂ% +
<
ﬂﬂ+ ,
long
ﬂﬂ, 0
>
ﬂﬂ0 1
(
ﬂﬂ1 2
type
ﬂﬂ2 6
:
ﬂﬂ6 7
$str
ﬂﬂ8 @
,
ﬂﬂ@ A
nullable
ﬂﬂB J
:
ﬂﬂJ K
false
ﬂﬂL Q
)
ﬂﬂQ R
,
ﬂﬂR S
Description
‡‡ 
=
‡‡  !
table
‡‡" '
.
‡‡' (
Column
‡‡( .
<
‡‡. /
string
‡‡/ 5
>
‡‡5 6
(
‡‡6 7
type
‡‡7 ;
:
‡‡; <
$str
‡‡= C
,
‡‡C D
nullable
‡‡E M
:
‡‡M N
true
‡‡O S
)
‡‡S T
,
‡‡T U
StoragePath
·· 
=
··  !
table
··" '
.
··' (
Column
··( .
<
··. /
string
··/ 5
>
··5 6
(
··6 7
type
··7 ;
:
··; <
$str
··= U
,
··U V
	maxLength
··W `
:
··` a
$num
··b e
,
··e f
nullable
··g o
:
··o p
false
··q v
)
··v w
,
··w x
FolderId
‚‚ 
=
‚‚ 
table
‚‚ $
.
‚‚$ %
Column
‚‚% +
<
‚‚+ ,
int
‚‚, /
>
‚‚/ 0
(
‚‚0 1
type
‚‚1 5
:
‚‚5 6
$str
‚‚7 @
,
‚‚@ A
nullable
‚‚B J
:
‚‚J K
true
‚‚L P
)
‚‚P Q
,
‚‚Q R
UploadedById
„„  
=
„„! "
table
„„# (
.
„„( )
Column
„„) /
<
„„/ 0
string
„„0 6
>
„„6 7
(
„„7 8
type
„„8 <
:
„„< =
$str
„„> D
,
„„D E
nullable
„„F N
:
„„N O
false
„„P U
)
„„U V
,
„„V W
DepartmentId
‰‰  
=
‰‰! "
table
‰‰# (
.
‰‰( )
Column
‰‰) /
<
‰‰/ 0
int
‰‰0 3
>
‰‰3 4
(
‰‰4 5
type
‰‰5 9
:
‰‰9 :
$str
‰‰; D
,
‰‰D E
nullable
‰‰F N
:
‰‰N O
false
‰‰P U
)
‰‰U V
,
‰‰V W
Version
ÂÂ 
=
ÂÂ 
table
ÂÂ #
.
ÂÂ# $
Column
ÂÂ$ *
<
ÂÂ* +
int
ÂÂ+ .
>
ÂÂ. /
(
ÂÂ/ 0
type
ÂÂ0 4
:
ÂÂ4 5
$str
ÂÂ6 ?
,
ÂÂ? @
nullable
ÂÂA I
:
ÂÂI J
true
ÂÂK O
)
ÂÂO P
,
ÂÂP Q
IsValidated
ÊÊ 
=
ÊÊ  !
table
ÊÊ" '
.
ÊÊ' (
Column
ÊÊ( .
<
ÊÊ. /
bool
ÊÊ/ 3
>
ÊÊ3 4
(
ÊÊ4 5
type
ÊÊ5 9
:
ÊÊ9 :
$str
ÊÊ; D
,
ÊÊD E
nullable
ÊÊF N
:
ÊÊN O
true
ÊÊP T
)
ÊÊT U
,
ÊÊU V
	CreatedAt
ÁÁ 
=
ÁÁ 
table
ÁÁ  %
.
ÁÁ% &
Column
ÁÁ& ,
<
ÁÁ, -
DateTime
ÁÁ- 5
>
ÁÁ5 6
(
ÁÁ6 7
type
ÁÁ7 ;
:
ÁÁ; <
$str
ÁÁ= W
,
ÁÁW X
nullable
ÁÁY a
:
ÁÁa b
false
ÁÁc h
)
ÁÁh i
,
ÁÁi j
	UpdatedAt
ËË 
=
ËË 
table
ËË  %
.
ËË% &
Column
ËË& ,
<
ËË, -
DateTime
ËË- 5
>
ËË5 6
(
ËË6 7
type
ËË7 ;
:
ËË; <
$str
ËË= W
,
ËËW X
nullable
ËËY a
:
ËËa b
false
ËËc h
)
ËËh i
}
ÈÈ 
,
ÈÈ 
constraints
ÍÍ 
:
ÍÍ 
table
ÍÍ "
=>
ÍÍ# %
{
ÎÎ 
table
ÏÏ 
.
ÏÏ 

PrimaryKey
ÏÏ $
(
ÏÏ$ %
$str
ÏÏ% 3
,
ÏÏ3 4
x
ÏÏ5 6
=>
ÏÏ7 9
x
ÏÏ: ;
.
ÏÏ; <
Id
ÏÏ< >
)
ÏÏ> ?
;
ÏÏ? @
table
ÌÌ 
.
ÌÌ 

ForeignKey
ÌÌ $
(
ÌÌ$ %
name
ÓÓ 
:
ÓÓ 
$str
ÓÓ E
,
ÓÓE F
column
ÔÔ 
:
ÔÔ 
x
ÔÔ  !
=>
ÔÔ" $
x
ÔÔ% &
.
ÔÔ& '
UploadedById
ÔÔ' 3
,
ÔÔ3 4
principalTable
 &
:
& '
$str
( 5
,
5 6
principalColumn
ÒÒ '
:
ÒÒ' (
$str
ÒÒ) -
,
ÒÒ- .
onDelete
ÚÚ  
:
ÚÚ  !
ReferentialAction
ÚÚ" 3
.
ÚÚ3 4
Cascade
ÚÚ4 ;
)
ÚÚ; <
;
ÚÚ< =
table
ÛÛ 
.
ÛÛ 

ForeignKey
ÛÛ $
(
ÛÛ$ %
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ E
,
ÙÙE F
column
ıı 
:
ıı 
x
ıı  !
=>
ıı" $
x
ıı% &
.
ıı& '
DepartmentId
ıı' 3
,
ıı3 4
principalTable
ˆˆ &
:
ˆˆ& '
$str
ˆˆ( 5
,
ˆˆ5 6
principalColumn
˜˜ '
:
˜˜' (
$str
˜˜) -
,
˜˜- .
onDelete
¯¯  
:
¯¯  !
ReferentialAction
¯¯" 3
.
¯¯3 4
Cascade
¯¯4 ;
)
¯¯; <
;
¯¯< =
table
˘˘ 
.
˘˘ 

ForeignKey
˘˘ $
(
˘˘$ %
name
˙˙ 
:
˙˙ 
$str
˙˙ <
,
˙˙< =
column
˚˚ 
:
˚˚ 
x
˚˚  !
=>
˚˚" $
x
˚˚% &
.
˚˚& '
FolderId
˚˚' /
,
˚˚/ 0
principalTable
¸¸ &
:
¸¸& '
$str
¸¸( 0
,
¸¸0 1
principalColumn
˝˝ '
:
˝˝' (
$str
˝˝) -
)
˝˝- .
;
˝˝. /
}
˛˛ 
)
˛˛ 
;
˛˛ 
migrationBuilder
ÄÄ 
.
ÄÄ 
CreateTable
ÄÄ (
(
ÄÄ( )
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ )
,
ÅÅ) *
columns
ÇÇ 
:
ÇÇ 
table
ÇÇ 
=>
ÇÇ !
new
ÇÇ" %
{
ÉÉ 
Id
ÑÑ 
=
ÑÑ 
table
ÑÑ 
.
ÑÑ 
Column
ÑÑ %
<
ÑÑ% &
int
ÑÑ& )
>
ÑÑ) *
(
ÑÑ* +
type
ÑÑ+ /
:
ÑÑ/ 0
$str
ÑÑ1 :
,
ÑÑ: ;
nullable
ÑÑ< D
:
ÑÑD E
false
ÑÑF K
)
ÑÑK L
.
ÖÖ 

Annotation
ÖÖ #
(
ÖÖ# $
$str
ÖÖ$ D
,
ÖÖD E+
NpgsqlValueGenerationStrategy
ÖÖF c
.
ÖÖc d%
IdentityByDefaultColumn
ÖÖd {
)
ÖÖ{ |
,
ÖÖ| }
	MessageId
ÜÜ 
=
ÜÜ 
table
ÜÜ  %
.
ÜÜ% &
Column
ÜÜ& ,
<
ÜÜ, -
int
ÜÜ- 0
>
ÜÜ0 1
(
ÜÜ1 2
type
ÜÜ2 6
:
ÜÜ6 7
$str
ÜÜ8 A
,
ÜÜA B
nullable
ÜÜC K
:
ÜÜK L
false
ÜÜM R
)
ÜÜR S
,
ÜÜS T
MailFolderId
áá  
=
áá! "
table
áá# (
.
áá( )
Column
áá) /
<
áá/ 0
int
áá0 3
>
áá3 4
(
áá4 5
type
áá5 9
:
áá9 :
$str
áá; D
,
ááD E
nullable
ááF N
:
ááN O
false
ááP U
)
ááU V
,
ááV W
	CreatedAt
àà 
=
àà 
table
àà  %
.
àà% &
Column
àà& ,
<
àà, -
DateTime
àà- 5
>
àà5 6
(
àà6 7
type
àà7 ;
:
àà; <
$str
àà= W
,
ààW X
nullable
ààY a
:
ààa b
false
ààc h
)
ààh i
,
àài j
	UpdatedAt
ââ 
=
ââ 
table
ââ  %
.
ââ% &
Column
ââ& ,
<
ââ, -
DateTime
ââ- 5
>
ââ5 6
(
ââ6 7
type
ââ7 ;
:
ââ; <
$str
ââ= W
,
ââW X
nullable
ââY a
:
ââa b
true
ââc g
)
ââg h
}
ää 
,
ää 
constraints
ãã 
:
ãã 
table
ãã "
=>
ãã# %
{
åå 
table
çç 
.
çç 

PrimaryKey
çç $
(
çç$ %
$str
çç% ;
,
çç; <
x
çç= >
=>
çç? A
x
ççB C
.
ççC D
Id
ççD F
)
ççF G
;
ççG H
table
éé 
.
éé 

ForeignKey
éé $
(
éé$ %
name
èè 
:
èè 
$str
èè L
,
èèL M
column
êê 
:
êê 
x
êê  !
=>
êê" $
x
êê% &
.
êê& '
MailFolderId
êê' 3
,
êê3 4
principalTable
ëë &
:
ëë& '
$str
ëë( 4
,
ëë4 5
principalColumn
íí '
:
íí' (
$str
íí) -
,
íí- .
onDelete
ìì  
:
ìì  !
ReferentialAction
ìì" 3
.
ìì3 4
Cascade
ìì4 ;
)
ìì; <
;
ìì< =
table
îî 
.
îî 

ForeignKey
îî $
(
îî$ %
name
ïï 
:
ïï 
$str
ïï F
,
ïïF G
column
ññ 
:
ññ 
x
ññ  !
=>
ññ" $
x
ññ% &
.
ññ& '
	MessageId
ññ' 0
,
ññ0 1
principalTable
óó &
:
óó& '
$str
óó( 1
,
óó1 2
principalColumn
òò '
:
òò' (
$str
òò) -
,
òò- .
onDelete
ôô  
:
ôô  !
ReferentialAction
ôô" 3
.
ôô3 4
Cascade
ôô4 ;
)
ôô; <
;
ôô< =
}
öö 
)
öö 
;
öö 
migrationBuilder
úú 
.
úú 
CreateTable
úú (
(
úú( )
name
ùù 
:
ùù 
$str
ùù &
,
ùù& '
columns
ûû 
:
ûû 
table
ûû 
=>
ûû !
new
ûû" %
{
üü 
Id
†† 
=
†† 
table
†† 
.
†† 
Column
†† %
<
††% &
int
††& )
>
††) *
(
††* +
type
††+ /
:
††/ 0
$str
††1 :
,
††: ;
nullable
††< D
:
††D E
false
††F K
)
††K L
.
°° 

Annotation
°° #
(
°°# $
$str
°°$ D
,
°°D E+
NpgsqlValueGenerationStrategy
°°F c
.
°°c d%
IdentityByDefaultColumn
°°d {
)
°°{ |
,
°°| }

DocumentId
¢¢ 
=
¢¢  
table
¢¢! &
.
¢¢& '
Column
¢¢' -
<
¢¢- .
int
¢¢. 1
>
¢¢1 2
(
¢¢2 3
type
¢¢3 7
:
¢¢7 8
$str
¢¢9 B
,
¢¢B C
nullable
¢¢D L
:
¢¢L M
false
¢¢N S
)
¢¢S T
,
¢¢T U
RequesterId
££ 
=
££  !
table
££" '
.
££' (
Column
££( .
<
££. /
string
££/ 5
>
££5 6
(
££6 7
type
££7 ;
:
££; <
$str
££= C
,
££C D
nullable
££E M
:
££M N
false
££O T
)
££T U
,
££U V
RequestRead
§§ 
=
§§  !
table
§§" '
.
§§' (
Column
§§( .
<
§§. /
bool
§§/ 3
>
§§3 4
(
§§4 5
type
§§5 9
:
§§9 :
$str
§§; D
,
§§D E
nullable
§§F N
:
§§N O
false
§§P U
)
§§U V
,
§§V W
RequestWrite
••  
=
••! "
table
••# (
.
••( )
Column
••) /
<
••/ 0
bool
••0 4
>
••4 5
(
••5 6
type
••6 :
:
••: ;
$str
••< E
,
••E F
nullable
••G O
:
••O P
false
••Q V
)
••V W
,
••W X
RequestUpdate
¶¶ !
=
¶¶" #
table
¶¶$ )
.
¶¶) *
Column
¶¶* 0
<
¶¶0 1
bool
¶¶1 5
>
¶¶5 6
(
¶¶6 7
type
¶¶7 ;
:
¶¶; <
$str
¶¶= F
,
¶¶F G
nullable
¶¶H P
:
¶¶P Q
true
¶¶R V
)
¶¶V W
,
¶¶W X
RequestDelete
ßß !
=
ßß" #
table
ßß$ )
.
ßß) *
Column
ßß* 0
<
ßß0 1
bool
ßß1 5
>
ßß5 6
(
ßß6 7
type
ßß7 ;
:
ßß; <
$str
ßß= F
,
ßßF G
nullable
ßßH P
:
ßßP Q
false
ßßR W
)
ßßW X
,
ßßX Y
Message
®® 
=
®® 
table
®® #
.
®®# $
Column
®®$ *
<
®®* +
string
®®+ 1
>
®®1 2
(
®®2 3
type
®®3 7
:
®®7 8
$str
®®9 ?
,
®®? @
nullable
®®A I
:
®®I J
true
®®K O
)
®®O P
,
®®P Q
Status
©© 
=
©© 
table
©© "
.
©©" #
Column
©©# )
<
©©) *
string
©©* 0
>
©©0 1
(
©©1 2
type
©©2 6
:
©©6 7
$str
©©8 >
,
©©> ?
nullable
©©@ H
:
©©H I
false
©©J O
)
©©O P
,
©©P Q

DecisionAt
™™ 
=
™™  
table
™™! &
.
™™& '
Column
™™' -
<
™™- .
DateTime
™™. 6
>
™™6 7
(
™™7 8
type
™™8 <
:
™™< =
$str
™™> X
,
™™X Y
nullable
™™Z b
:
™™b c
true
™™d h
)
™™h i
,
™™i j
DecidedById
´´ 
=
´´  !
table
´´" '
.
´´' (
Column
´´( .
<
´´. /
string
´´/ 5
>
´´5 6
(
´´6 7
type
´´7 ;
:
´´; <
$str
´´= C
,
´´C D
nullable
´´E M
:
´´M N
true
´´O S
)
´´S T
,
´´T U
	CreatedAt
¨¨ 
=
¨¨ 
table
¨¨  %
.
¨¨% &
Column
¨¨& ,
<
¨¨, -
DateTime
¨¨- 5
>
¨¨5 6
(
¨¨6 7
type
¨¨7 ;
:
¨¨; <
$str
¨¨= W
,
¨¨W X
nullable
¨¨Y a
:
¨¨a b
false
¨¨c h
)
¨¨h i
,
¨¨i j
	UpdatedAt
≠≠ 
=
≠≠ 
table
≠≠  %
.
≠≠% &
Column
≠≠& ,
<
≠≠, -
DateTime
≠≠- 5
>
≠≠5 6
(
≠≠6 7
type
≠≠7 ;
:
≠≠; <
$str
≠≠= W
,
≠≠W X
nullable
≠≠Y a
:
≠≠a b
true
≠≠c g
)
≠≠g h
}
ÆÆ 
,
ÆÆ 
constraints
ØØ 
:
ØØ 
table
ØØ "
=>
ØØ# %
{
∞∞ 
table
±± 
.
±± 

PrimaryKey
±± $
(
±±$ %
$str
±±% 8
,
±±8 9
x
±±: ;
=>
±±< >
x
±±? @
.
±±@ A
Id
±±A C
)
±±C D
;
±±D E
table
≤≤ 
.
≤≤ 

ForeignKey
≤≤ $
(
≤≤$ %
name
≥≥ 
:
≥≥ 
$str
≥≥ I
,
≥≥I J
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& '
DecidedById
¥¥' 2
,
¥¥2 3
principalTable
µµ &
:
µµ& '
$str
µµ( 5
,
µµ5 6
principalColumn
∂∂ '
:
∂∂' (
$str
∂∂) -
)
∂∂- .
;
∂∂. /
table
∑∑ 
.
∑∑ 

ForeignKey
∑∑ $
(
∑∑$ %
name
∏∏ 
:
∏∏ 
$str
∏∏ I
,
∏∏I J
column
ππ 
:
ππ 
x
ππ  !
=>
ππ" $
x
ππ% &
.
ππ& '
RequesterId
ππ' 2
,
ππ2 3
principalTable
∫∫ &
:
∫∫& '
$str
∫∫( 5
,
∫∫5 6
principalColumn
ªª '
:
ªª' (
$str
ªª) -
,
ªª- .
onDelete
ºº  
:
ºº  !
ReferentialAction
ºº" 3
.
ºº3 4
Cascade
ºº4 ;
)
ºº; <
;
ºº< =
table
ΩΩ 
.
ΩΩ 

ForeignKey
ΩΩ $
(
ΩΩ$ %
name
ææ 
:
ææ 
$str
ææ F
,
ææF G
column
øø 
:
øø 
x
øø  !
=>
øø" $
x
øø% &
.
øø& '

DocumentId
øø' 1
,
øø1 2
principalTable
¿¿ &
:
¿¿& '
$str
¿¿( 3
,
¿¿3 4
principalColumn
¡¡ '
:
¡¡' (
$str
¡¡) -
,
¡¡- .
onDelete
¬¬  
:
¬¬  !
ReferentialAction
¬¬" 3
.
¬¬3 4
Cascade
¬¬4 ;
)
¬¬; <
;
¬¬< =
}
√√ 
)
√√ 
;
√√ 
migrationBuilder
≈≈ 
.
≈≈ 
CreateTable
≈≈ (
(
≈≈( )
name
∆∆ 
:
∆∆ 
$str
∆∆ $
,
∆∆$ %
columns
«« 
:
«« 
table
«« 
=>
«« !
new
««" %
{
»» 
Id
…… 
=
…… 
table
…… 
.
…… 
Column
…… %
<
……% &
int
……& )
>
……) *
(
……* +
type
……+ /
:
……/ 0
$str
……1 :
,
……: ;
nullable
……< D
:
……D E
false
……F K
)
……K L
.
   

Annotation
   #
(
  # $
$str
  $ D
,
  D E+
NpgsqlValueGenerationStrategy
  F c
.
  c d%
IdentityByDefaultColumn
  d {
)
  { |
,
  | }
UserId
ÀÀ 
=
ÀÀ 
table
ÀÀ "
.
ÀÀ" #
Column
ÀÀ# )
<
ÀÀ) *
string
ÀÀ* 0
>
ÀÀ0 1
(
ÀÀ1 2
type
ÀÀ2 6
:
ÀÀ6 7
$str
ÀÀ8 >
,
ÀÀ> ?
nullable
ÀÀ@ H
:
ÀÀH I
false
ÀÀJ O
)
ÀÀO P
,
ÀÀP Q

DocumentId
ÃÃ 
=
ÃÃ  
table
ÃÃ! &
.
ÃÃ& '
Column
ÃÃ' -
<
ÃÃ- .
int
ÃÃ. 1
>
ÃÃ1 2
(
ÃÃ2 3
type
ÃÃ3 7
:
ÃÃ7 8
$str
ÃÃ9 B
,
ÃÃB C
nullable
ÃÃD L
:
ÃÃL M
true
ÃÃN R
)
ÃÃR S
,
ÃÃS T
FolderId
ÕÕ 
=
ÕÕ 
table
ÕÕ $
.
ÕÕ$ %
Column
ÕÕ% +
<
ÕÕ+ ,
int
ÕÕ, /
>
ÕÕ/ 0
(
ÕÕ0 1
type
ÕÕ1 5
:
ÕÕ5 6
$str
ÕÕ7 @
,
ÕÕ@ A
nullable
ÕÕB J
:
ÕÕJ K
true
ÕÕL P
)
ÕÕP Q
,
ÕÕQ R
	CanCreate
ŒŒ 
=
ŒŒ 
table
ŒŒ  %
.
ŒŒ% &
Column
ŒŒ& ,
<
ŒŒ, -
bool
ŒŒ- 1
>
ŒŒ1 2
(
ŒŒ2 3
type
ŒŒ3 7
:
ŒŒ7 8
$str
ŒŒ9 B
,
ŒŒB C
nullable
ŒŒD L
:
ŒŒL M
false
ŒŒN S
)
ŒŒS T
,
ŒŒT U
CanRead
œœ 
=
œœ 
table
œœ #
.
œœ# $
Column
œœ$ *
<
œœ* +
bool
œœ+ /
>
œœ/ 0
(
œœ0 1
type
œœ1 5
:
œœ5 6
$str
œœ7 @
,
œœ@ A
nullable
œœB J
:
œœJ K
false
œœL Q
)
œœQ R
,
œœR S
	CanUpdate
–– 
=
–– 
table
––  %
.
––% &
Column
––& ,
<
––, -
bool
––- 1
>
––1 2
(
––2 3
type
––3 7
:
––7 8
$str
––9 B
,
––B C
nullable
––D L
:
––L M
false
––N S
)
––S T
,
––T U
	CanDelete
—— 
=
—— 
table
——  %
.
——% &
Column
——& ,
<
——, -
bool
——- 1
>
——1 2
(
——2 3
type
——3 7
:
——7 8
$str
——9 B
,
——B C
nullable
——D L
:
——L M
false
——N S
)
——S T
,
——T U
	CreatedAt
““ 
=
““ 
table
““  %
.
““% &
Column
““& ,
<
““, -
DateTime
““- 5
>
““5 6
(
““6 7
type
““7 ;
:
““; <
$str
““= W
,
““W X
nullable
““Y a
:
““a b
false
““c h
)
““h i
,
““i j
	UpdatedAt
”” 
=
”” 
table
””  %
.
””% &
Column
””& ,
<
””, -
DateTime
””- 5
>
””5 6
(
””6 7
type
””7 ;
:
””; <
$str
””= W
,
””W X
nullable
””Y a
:
””a b
true
””c g
)
””g h
}
‘‘ 
,
‘‘ 
constraints
’’ 
:
’’ 
table
’’ "
=>
’’# %
{
÷÷ 
table
◊◊ 
.
◊◊ 

PrimaryKey
◊◊ $
(
◊◊$ %
$str
◊◊% 6
,
◊◊6 7
x
◊◊8 9
=>
◊◊: <
x
◊◊= >
.
◊◊> ?
Id
◊◊? A
)
◊◊A B
;
◊◊B C
table
ÿÿ 
.
ÿÿ 

ForeignKey
ÿÿ $
(
ÿÿ$ %
name
ŸŸ 
:
ŸŸ 
$str
ŸŸ B
,
ŸŸB C
column
⁄⁄ 
:
⁄⁄ 
x
⁄⁄  !
=>
⁄⁄" $
x
⁄⁄% &
.
⁄⁄& '
UserId
⁄⁄' -
,
⁄⁄- .
principalTable
€€ &
:
€€& '
$str
€€( 5
,
€€5 6
principalColumn
‹‹ '
:
‹‹' (
$str
‹‹) -
,
‹‹- .
onDelete
››  
:
››  !
ReferentialAction
››" 3
.
››3 4
Cascade
››4 ;
)
››; <
;
››< =
table
ﬁﬁ 
.
ﬁﬁ 

ForeignKey
ﬁﬁ $
(
ﬁﬁ$ %
name
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ D
,
ﬂﬂD E
column
‡‡ 
:
‡‡ 
x
‡‡  !
=>
‡‡" $
x
‡‡% &
.
‡‡& '

DocumentId
‡‡' 1
,
‡‡1 2
principalTable
·· &
:
··& '
$str
··( 3
,
··3 4
principalColumn
‚‚ '
:
‚‚' (
$str
‚‚) -
)
‚‚- .
;
‚‚. /
table
„„ 
.
„„ 

ForeignKey
„„ $
(
„„$ %
name
‰‰ 
:
‰‰ 
$str
‰‰ ?
,
‰‰? @
column
ÂÂ 
:
ÂÂ 
x
ÂÂ  !
=>
ÂÂ" $
x
ÂÂ% &
.
ÂÂ& '
FolderId
ÂÂ' /
,
ÂÂ/ 0
principalTable
ÊÊ &
:
ÊÊ& '
$str
ÊÊ( 0
,
ÊÊ0 1
principalColumn
ÁÁ '
:
ÁÁ' (
$str
ÁÁ) -
)
ÁÁ- .
;
ÁÁ. /
}
ËË 
)
ËË 
;
ËË 
migrationBuilder
ÍÍ 
.
ÍÍ 
CreateTable
ÍÍ (
(
ÍÍ( )
name
ÎÎ 
:
ÎÎ 
$str
ÎÎ (
,
ÎÎ( )
columns
ÏÏ 
:
ÏÏ 
table
ÏÏ 
=>
ÏÏ !
new
ÏÏ" %
{
ÌÌ 
Id
ÓÓ 
=
ÓÓ 
table
ÓÓ 
.
ÓÓ 
Column
ÓÓ %
<
ÓÓ% &
int
ÓÓ& )
>
ÓÓ) *
(
ÓÓ* +
type
ÓÓ+ /
:
ÓÓ/ 0
$str
ÓÓ1 :
,
ÓÓ: ;
nullable
ÓÓ< D
:
ÓÓD E
false
ÓÓF K
)
ÓÓK L
.
ÔÔ 

Annotation
ÔÔ #
(
ÔÔ# $
$str
ÔÔ$ D
,
ÔÔD E+
NpgsqlValueGenerationStrategy
ÔÔF c
.
ÔÔc d%
IdentityByDefaultColumn
ÔÔd {
)
ÔÔ{ |
,
ÔÔ| }
RequesterId
 
=
  !
table
" '
.
' (
Column
( .
<
. /
string
/ 5
>
5 6
(
6 7
type
7 ;
:
; <
$str
= C
,
C D
nullable
E M
:
M N
false
O T
)
T U
,
U V
DepartmentId
ÒÒ  
=
ÒÒ! "
table
ÒÒ# (
.
ÒÒ( )
Column
ÒÒ) /
<
ÒÒ/ 0
int
ÒÒ0 3
>
ÒÒ3 4
(
ÒÒ4 5
type
ÒÒ5 9
:
ÒÒ9 :
$str
ÒÒ; D
,
ÒÒD E
nullable
ÒÒF N
:
ÒÒN O
false
ÒÒP U
)
ÒÒU V
,
ÒÒV W
DocumentType
ÚÚ  
=
ÚÚ! "
table
ÚÚ# (
.
ÚÚ( )
Column
ÚÚ) /
<
ÚÚ/ 0
string
ÚÚ0 6
>
ÚÚ6 7
(
ÚÚ7 8
type
ÚÚ8 <
:
ÚÚ< =
$str
ÚÚ> V
,
ÚÚV W
	maxLength
ÚÚX a
:
ÚÚa b
$num
ÚÚc f
,
ÚÚf g
nullable
ÚÚh p
:
ÚÚp q
false
ÚÚr w
)
ÚÚw x
,
ÚÚx y
Description
ÛÛ 
=
ÛÛ  !
table
ÛÛ" '
.
ÛÛ' (
Column
ÛÛ( .
<
ÛÛ. /
string
ÛÛ/ 5
>
ÛÛ5 6
(
ÛÛ6 7
type
ÛÛ7 ;
:
ÛÛ; <
$str
ÛÛ= U
,
ÛÛU V
	maxLength
ÛÛW `
:
ÛÛ` a
$num
ÛÛb e
,
ÛÛe f
nullable
ÛÛg o
:
ÛÛo p
false
ÛÛq v
)
ÛÛv w
,
ÛÛw x
Priority
ÙÙ 
=
ÙÙ 
table
ÙÙ $
.
ÙÙ$ %
Column
ÙÙ% +
<
ÙÙ+ ,
string
ÙÙ, 2
>
ÙÙ2 3
(
ÙÙ3 4
type
ÙÙ4 8
:
ÙÙ8 9
$str
ÙÙ: Q
,
ÙÙQ R
	maxLength
ÙÙS \
:
ÙÙ\ ]
$num
ÙÙ^ `
,
ÙÙ` a
nullable
ÙÙb j
:
ÙÙj k
false
ÙÙl q
)
ÙÙq r
,
ÙÙr s
Status
ıı 
=
ıı 
table
ıı "
.
ıı" #
Column
ıı# )
<
ıı) *
string
ıı* 0
>
ıı0 1
(
ıı1 2
type
ıı2 6
:
ıı6 7
$str
ıı8 O
,
ııO P
	maxLength
ııQ Z
:
ııZ [
$num
ıı\ ^
,
ıı^ _
nullable
ıı` h
:
ııh i
false
ııj o
)
ııo p
,
ııp q 
ResponseDocumentId
ˆˆ &
=
ˆˆ' (
table
ˆˆ) .
.
ˆˆ. /
Column
ˆˆ/ 5
<
ˆˆ5 6
int
ˆˆ6 9
>
ˆˆ9 :
(
ˆˆ: ;
type
ˆˆ; ?
:
ˆˆ? @
$str
ˆˆA J
,
ˆˆJ K
nullable
ˆˆL T
:
ˆˆT U
true
ˆˆV Z
)
ˆˆZ [
,
ˆˆ[ \
RequestedAt
˜˜ 
=
˜˜  !
table
˜˜" '
.
˜˜' (
Column
˜˜( .
<
˜˜. /
DateTime
˜˜/ 7
>
˜˜7 8
(
˜˜8 9
type
˜˜9 =
:
˜˜= >
$str
˜˜? Y
,
˜˜Y Z
nullable
˜˜[ c
:
˜˜c d
false
˜˜e j
)
˜˜j k
,
˜˜k l
RespondedAt
¯¯ 
=
¯¯  !
table
¯¯" '
.
¯¯' (
Column
¯¯( .
<
¯¯. /
DateTime
¯¯/ 7
>
¯¯7 8
(
¯¯8 9
type
¯¯9 =
:
¯¯= >
$str
¯¯? Y
,
¯¯Y Z
nullable
¯¯[ c
:
¯¯c d
true
¯¯e i
)
¯¯i j
,
¯¯j k
ResponseMessage
˘˘ #
=
˘˘$ %
table
˘˘& +
.
˘˘+ ,
Column
˘˘, 2
<
˘˘2 3
string
˘˘3 9
>
˘˘9 :
(
˘˘: ;
type
˘˘; ?
:
˘˘? @
$str
˘˘A G
,
˘˘G H
nullable
˘˘I Q
:
˘˘Q R
true
˘˘S W
)
˘˘W X
,
˘˘X Y
ProcessedById
˙˙ !
=
˙˙" #
table
˙˙$ )
.
˙˙) *
Column
˙˙* 0
<
˙˙0 1
string
˙˙1 7
>
˙˙7 8
(
˙˙8 9
type
˙˙9 =
:
˙˙= >
$str
˙˙? E
,
˙˙E F
nullable
˙˙G O
:
˙˙O P
true
˙˙Q U
)
˙˙U V
,
˙˙V W
DepartmentId1
˚˚ !
=
˚˚" #
table
˚˚$ )
.
˚˚) *
Column
˚˚* 0
<
˚˚0 1
int
˚˚1 4
>
˚˚4 5
(
˚˚5 6
type
˚˚6 :
:
˚˚: ;
$str
˚˚< E
,
˚˚E F
nullable
˚˚G O
:
˚˚O P
true
˚˚Q U
)
˚˚U V
,
˚˚V W

DocumentId
¸¸ 
=
¸¸  
table
¸¸! &
.
¸¸& '
Column
¸¸' -
<
¸¸- .
int
¸¸. 1
>
¸¸1 2
(
¸¸2 3
type
¸¸3 7
:
¸¸7 8
$str
¸¸9 B
,
¸¸B C
nullable
¸¸D L
:
¸¸L M
true
¸¸N R
)
¸¸R S
,
¸¸S T
	CreatedAt
˝˝ 
=
˝˝ 
table
˝˝  %
.
˝˝% &
Column
˝˝& ,
<
˝˝, -
DateTime
˝˝- 5
>
˝˝5 6
(
˝˝6 7
type
˝˝7 ;
:
˝˝; <
$str
˝˝= W
,
˝˝W X
nullable
˝˝Y a
:
˝˝a b
false
˝˝c h
)
˝˝h i
,
˝˝i j
	UpdatedAt
˛˛ 
=
˛˛ 
table
˛˛  %
.
˛˛% &
Column
˛˛& ,
<
˛˛, -
DateTime
˛˛- 5
>
˛˛5 6
(
˛˛6 7
type
˛˛7 ;
:
˛˛; <
$str
˛˛= W
,
˛˛W X
nullable
˛˛Y a
:
˛˛a b
true
˛˛c g
)
˛˛g h
}
ˇˇ 
,
ˇˇ 
constraints
ÄÄ 
:
ÄÄ 
table
ÄÄ "
=>
ÄÄ# %
{
ÅÅ 
table
ÇÇ 
.
ÇÇ 

PrimaryKey
ÇÇ $
(
ÇÇ$ %
$str
ÇÇ% :
,
ÇÇ: ;
x
ÇÇ< =
=>
ÇÇ> @
x
ÇÇA B
.
ÇÇB C
Id
ÇÇC E
)
ÇÇE F
;
ÇÇF G
table
ÉÉ 
.
ÉÉ 

ForeignKey
ÉÉ $
(
ÉÉ$ %
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ M
,
ÑÑM N
column
ÖÖ 
:
ÖÖ 
x
ÖÖ  !
=>
ÖÖ" $
x
ÖÖ% &
.
ÖÖ& '
ProcessedById
ÖÖ' 4
,
ÖÖ4 5
principalTable
ÜÜ &
:
ÜÜ& '
$str
ÜÜ( 5
,
ÜÜ5 6
principalColumn
áá '
:
áá' (
$str
áá) -
,
áá- .
onDelete
àà  
:
àà  !
ReferentialAction
àà" 3
.
àà3 4
SetNull
àà4 ;
)
àà; <
;
àà< =
table
ââ 
.
ââ 

ForeignKey
ââ $
(
ââ$ %
name
ää 
:
ää 
$str
ää K
,
ääK L
column
ãã 
:
ãã 
x
ãã  !
=>
ãã" $
x
ãã% &
.
ãã& '
RequesterId
ãã' 2
,
ãã2 3
principalTable
åå &
:
åå& '
$str
åå( 5
,
åå5 6
principalColumn
çç '
:
çç' (
$str
çç) -
,
çç- .
onDelete
éé  
:
éé  !
ReferentialAction
éé" 3
.
éé3 4
Restrict
éé4 <
)
éé< =
;
éé= >
table
èè 
.
èè 

ForeignKey
èè $
(
èè$ %
name
êê 
:
êê 
$str
êê L
,
êêL M
column
ëë 
:
ëë 
x
ëë  !
=>
ëë" $
x
ëë% &
.
ëë& '
DepartmentId
ëë' 3
,
ëë3 4
principalTable
íí &
:
íí& '
$str
íí( 5
,
íí5 6
principalColumn
ìì '
:
ìì' (
$str
ìì) -
,
ìì- .
onDelete
îî  
:
îî  !
ReferentialAction
îî" 3
.
îî3 4
Restrict
îî4 <
)
îî< =
;
îî= >
table
ïï 
.
ïï 

ForeignKey
ïï $
(
ïï$ %
name
ññ 
:
ññ 
$str
ññ M
,
ññM N
column
óó 
:
óó 
x
óó  !
=>
óó" $
x
óó% &
.
óó& '
DepartmentId1
óó' 4
,
óó4 5
principalTable
òò &
:
òò& '
$str
òò( 5
,
òò5 6
principalColumn
ôô '
:
ôô' (
$str
ôô) -
)
ôô- .
;
ôô. /
table
öö 
.
öö 

ForeignKey
öö $
(
öö$ %
name
õõ 
:
õõ 
$str
õõ H
,
õõH I
column
úú 
:
úú 
x
úú  !
=>
úú" $
x
úú% &
.
úú& '

DocumentId
úú' 1
,
úú1 2
principalTable
ùù &
:
ùù& '
$str
ùù( 3
,
ùù3 4
principalColumn
ûû '
:
ûû' (
$str
ûû) -
)
ûû- .
;
ûû. /
table
üü 
.
üü 

ForeignKey
üü $
(
üü$ %
name
†† 
:
†† 
$str
†† P
,
††P Q
column
°° 
:
°° 
x
°°  !
=>
°°" $
x
°°% &
.
°°& ' 
ResponseDocumentId
°°' 9
,
°°9 :
principalTable
¢¢ &
:
¢¢& '
$str
¢¢( 3
,
¢¢3 4
principalColumn
££ '
:
££' (
$str
££) -
,
££- .
onDelete
§§  
:
§§  !
ReferentialAction
§§" 3
.
§§3 4
SetNull
§§4 ;
)
§§; <
;
§§< =
}
•• 
)
•• 
;
•• 
migrationBuilder
ßß 
.
ßß 
CreateIndex
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® 5
,
®®5 6
table
©© 
:
©© 
$str
©© '
,
©©' (
column
™™ 
:
™™ 
$str
™™ %
)
™™% &
;
™™& '
migrationBuilder
¨¨ 
.
¨¨ 
CreateIndex
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ 4
,
≠≠4 5
table
ÆÆ 
:
ÆÆ 
$str
ÆÆ '
,
ÆÆ' (
column
ØØ 
:
ØØ 
$str
ØØ $
)
ØØ$ %
;
ØØ% &
migrationBuilder
±± 
.
±± 
CreateIndex
±± (
(
±±( )
name
≤≤ 
:
≤≤ 
$str
≤≤ 5
,
≤≤5 6
table
≥≥ 
:
≥≥ 
$str
≥≥ '
,
≥≥' (
column
¥¥ 
:
¥¥ 
$str
¥¥ %
)
¥¥% &
;
¥¥& '
migrationBuilder
∂∂ 
.
∂∂ 
CreateIndex
∂∂ (
(
∂∂( )
name
∑∑ 
:
∑∑ 
$str
∑∑ 2
,
∑∑2 3
table
∏∏ 
:
∏∏ 
$str
∏∏ %
,
∏∏% &
column
ππ 
:
ππ 
$str
ππ $
)
ππ$ %
;
ππ% &
migrationBuilder
ªª 
.
ªª 
CreateIndex
ªª (
(
ªª( )
name
ºº 
:
ºº 
$str
ºº 0
,
ºº0 1
table
ΩΩ 
:
ΩΩ 
$str
ΩΩ %
,
ΩΩ% &
column
ææ 
:
ææ 
$str
ææ "
)
ææ" #
;
ææ# $
migrationBuilder
¿¿ 
.
¿¿ 
CreateIndex
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ .
,
¡¡. /
table
¬¬ 
:
¬¬ 
$str
¬¬ %
,
¬¬% &
column
√√ 
:
√√ 
$str
√√  
)
√√  !
;
√√! "
migrationBuilder
≈≈ 
.
≈≈ 
CreateIndex
≈≈ (
(
≈≈( )
name
∆∆ 
:
∆∆ 
$str
∆∆ -
,
∆∆- .
table
«« 
:
«« 
$str
«« $
,
««$ %
column
»» 
:
»» 
$str
»»  
)
»»  !
;
»»! "
migrationBuilder
   
.
   
CreateIndex
   (
(
  ( )
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ 2
,
ÀÀ2 3
table
ÃÃ 
:
ÃÃ 
$str
ÃÃ )
,
ÃÃ) *
column
ÕÕ 
:
ÕÕ 
$str
ÕÕ  
)
ÕÕ  !
;
ÕÕ! "
migrationBuilder
œœ 
.
œœ 
CreateIndex
œœ (
(
œœ( )
name
–– 
:
–– 
$str
–– %
,
––% &
table
—— 
:
—— 
$str
—— $
,
——$ %
column
““ 
:
““ 
$str
““ (
,
““( )
unique
”” 
:
”” 
true
”” 
)
”” 
;
”” 
migrationBuilder
’’ 
.
’’ 
CreateIndex
’’ (
(
’’( )
name
÷÷ 
:
÷÷ 
$str
÷÷ 2
,
÷÷2 3
table
◊◊ 
:
◊◊ 
$str
◊◊ )
,
◊◊) *
column
ÿÿ 
:
ÿÿ 
$str
ÿÿ  
)
ÿÿ  !
;
ÿÿ! "
migrationBuilder
⁄⁄ 
.
⁄⁄ 
CreateIndex
⁄⁄ (
(
⁄⁄( )
name
€€ 
:
€€ 
$str
€€ 2
,
€€2 3
table
‹‹ 
:
‹‹ 
$str
‹‹ )
,
‹‹) *
column
›› 
:
›› 
$str
››  
)
››  !
;
››! "
migrationBuilder
ﬂﬂ 
.
ﬂﬂ 
CreateIndex
ﬂﬂ (
(
ﬂﬂ( )
name
‡‡ 
:
‡‡ 
$str
‡‡ 1
,
‡‡1 2
table
·· 
:
·· 
$str
·· (
,
··( )
column
‚‚ 
:
‚‚ 
$str
‚‚  
)
‚‚  !
;
‚‚! "
migrationBuilder
‰‰ 
.
‰‰ 
CreateIndex
‰‰ (
(
‰‰( )
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ "
,
ÂÂ" #
table
ÊÊ 
:
ÊÊ 
$str
ÊÊ $
,
ÊÊ$ %
column
ÁÁ 
:
ÁÁ 
$str
ÁÁ )
)
ÁÁ) *
;
ÁÁ* +
migrationBuilder
ÈÈ 
.
ÈÈ 
CreateIndex
ÈÈ (
(
ÈÈ( )
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ 3
,
ÍÍ3 4
table
ÎÎ 
:
ÎÎ 
$str
ÎÎ $
,
ÎÎ$ %
column
ÏÏ 
:
ÏÏ 
$str
ÏÏ &
)
ÏÏ& '
;
ÏÏ' (
migrationBuilder
ÓÓ 
.
ÓÓ 
CreateIndex
ÓÓ (
(
ÓÓ( )
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ -
,
ÔÔ- .
table
 
:
 
$str
 $
,
$ %
column
ÒÒ 
:
ÒÒ 
$str
ÒÒ  
)
ÒÒ  !
;
ÒÒ! "
migrationBuilder
ÛÛ 
.
ÛÛ 
CreateIndex
ÛÛ (
(
ÛÛ( )
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ %
,
ÙÙ% &
table
ıı 
:
ıı 
$str
ıı $
,
ıı$ %
column
ˆˆ 
:
ˆˆ 
$str
ˆˆ ,
,
ˆˆ, -
unique
˜˜ 
:
˜˜ 
true
˜˜ 
)
˜˜ 
;
˜˜ 
migrationBuilder
˘˘ 
.
˘˘ 
CreateIndex
˘˘ (
(
˘˘( )
name
˙˙ 
:
˙˙ 
$str
˙˙ +
,
˙˙+ ,
table
˚˚ 
:
˚˚ 
$str
˚˚ "
,
˚˚" #
column
¸¸ 
:
¸¸ 
$str
¸¸  
)
¸¸  !
;
¸¸! "
migrationBuilder
˛˛ 
.
˛˛ 
CreateIndex
˛˛ (
(
˛˛( )
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ 8
,
ˇˇ8 9
table
ÄÄ 
:
ÄÄ 
$str
ÄÄ )
,
ÄÄ) *
column
ÅÅ 
:
ÅÅ 
$str
ÅÅ &
)
ÅÅ& '
;
ÅÅ' (
migrationBuilder
ÉÉ 
.
ÉÉ 
CreateIndex
ÉÉ (
(
ÉÉ( )
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ 9
,
ÑÑ9 :
table
ÖÖ 
:
ÖÖ 
$str
ÖÖ )
,
ÖÖ) *
column
ÜÜ 
:
ÜÜ 
$str
ÜÜ '
)
ÜÜ' (
;
ÜÜ( )
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ 6
,
ââ6 7
table
ää 
:
ää 
$str
ää )
,
ää) *
column
ãã 
:
ãã 
$str
ãã $
)
ãã$ %
;
ãã% &
migrationBuilder
çç 
.
çç 
CreateIndex
çç (
(
çç( )
name
éé 
:
éé 
$str
éé 9
,
éé9 :
table
èè 
:
èè 
$str
èè )
,
èè) *
column
êê 
:
êê 
$str
êê '
)
êê' (
;
êê( )
migrationBuilder
íí 
.
íí 
CreateIndex
íí (
(
íí( )
name
ìì 
:
ìì 
$str
ìì 7
,
ìì7 8
table
îî 
:
îî 
$str
îî )
,
îî) *
column
ïï 
:
ïï 
$str
ïï %
)
ïï% &
;
ïï& '
migrationBuilder
óó 
.
óó 
CreateIndex
óó (
(
óó( )
name
òò 
:
òò 
$str
òò >
,
òò> ?
table
ôô 
:
ôô 
$str
ôô )
,
ôô) *
column
öö 
:
öö 
$str
öö ,
)
öö, -
;
öö- .
migrationBuilder
úú 
.
úú 
CreateIndex
úú (
(
úú( )
name
ùù 
:
ùù 
$str
ùù 1
,
ùù1 2
table
ûû 
:
ûû 
$str
ûû "
,
ûû" #
column
üü 
:
üü 
$str
üü &
)
üü& '
;
üü' (
migrationBuilder
°° 
.
°° 
CreateIndex
°° (
(
°°( )
name
¢¢ 
:
¢¢ 
$str
¢¢ -
,
¢¢- .
table
££ 
:
££ 
$str
££ "
,
££" #
column
§§ 
:
§§ 
$str
§§ "
)
§§" #
;
§§# $
migrationBuilder
¶¶ 
.
¶¶ 
CreateIndex
¶¶ (
(
¶¶( )
name
ßß 
:
ßß 
$str
ßß 1
,
ßß1 2
table
®® 
:
®® 
$str
®® "
,
®®" #
column
©© 
:
©© 
$str
©© &
)
©©& '
;
©©' (
migrationBuilder
´´ 
.
´´ 
CreateIndex
´´ (
(
´´( )
name
¨¨ 
:
¨¨ 
$str
¨¨ -
,
¨¨- .
table
≠≠ 
:
≠≠ 
$str
≠≠ 
,
≠≠  
column
ÆÆ 
:
ÆÆ 
$str
ÆÆ %
)
ÆÆ% &
;
ÆÆ& '
migrationBuilder
∞∞ 
.
∞∞ 
CreateIndex
∞∞ (
(
∞∞( )
name
±± 
:
±± 
$str
±± .
,
±±. /
table
≤≤ 
:
≤≤ 
$str
≤≤ 
,
≤≤  
column
≥≥ 
:
≥≥ 
$str
≥≥ &
)
≥≥& '
;
≥≥' (
migrationBuilder
µµ 
.
µµ 
CreateIndex
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
$str
∂∂ 0
,
∂∂0 1
table
∑∑ 
:
∑∑ 
$str
∑∑ 
,
∑∑  
column
∏∏ 
:
∏∏ 
$str
∏∏ (
)
∏∏( )
;
∏∏) *
migrationBuilder
∫∫ 
.
∫∫ 
CreateIndex
∫∫ (
(
∫∫( )
name
ªª 
:
ªª 
$str
ªª 4
,
ªª4 5
table
ºº 
:
ºº 
$str
ºº #
,
ºº# $
column
ΩΩ 
:
ΩΩ 
$str
ΩΩ (
)
ΩΩ( )
;
ΩΩ) *
migrationBuilder
øø 
.
øø 
CreateIndex
øø (
(
øø( )
name
¿¿ 
:
¿¿ 
$str
¿¿ ,
,
¿¿, -
table
¡¡ 
:
¡¡ 
$str
¡¡ #
,
¡¡# $
column
¬¬ 
:
¬¬ 
$str
¬¬  
)
¬¬  !
;
¬¬! "
migrationBuilder
ƒƒ 
.
ƒƒ 
CreateIndex
ƒƒ (
(
ƒƒ( )
name
≈≈ 
:
≈≈ 
$str
≈≈ 9
,
≈≈9 :
table
∆∆ 
:
∆∆ 
$str
∆∆ *
,
∆∆* +
column
«« 
:
«« 
$str
«« &
)
««& '
;
««' (
migrationBuilder
…… 
.
…… 
CreateIndex
…… (
(
……( )
name
   
:
   
$str
   6
,
  6 7
table
ÀÀ 
:
ÀÀ 
$str
ÀÀ *
,
ÀÀ* +
column
ÃÃ 
:
ÃÃ 
$str
ÃÃ #
)
ÃÃ# $
;
ÃÃ$ %
migrationBuilder
ŒŒ 
.
ŒŒ 
CreateIndex
ŒŒ (
(
ŒŒ( )
name
œœ 
:
œœ 
$str
œœ .
,
œœ. /
table
–– 
:
–– 
$str
––  
,
––  !
column
—— 
:
—— 
$str
—— %
)
——% &
;
——& '
migrationBuilder
”” 
.
”” 
CreateIndex
”” (
(
””( )
name
‘‘ 
:
‘‘ 
$str
‘‘ ,
,
‘‘, -
table
’’ 
:
’’ 
$str
’’  
,
’’  !
column
÷÷ 
:
÷÷ 
$str
÷÷ #
)
÷÷# $
;
÷÷$ %
}
◊◊ 	
	protected
⁄⁄ 
override
⁄⁄ 
void
⁄⁄ 
Down
⁄⁄  $
(
⁄⁄$ %
MigrationBuilder
⁄⁄% 5
migrationBuilder
⁄⁄6 F
)
⁄⁄F G
{
€€ 	
migrationBuilder
‹‹ 
.
‹‹ 
	DropTable
‹‹ &
(
‹‹& '
name
›› 
:
›› 
$str
›› &
)
››& '
;
››' (
migrationBuilder
ﬂﬂ 
.
ﬂﬂ 
	DropTable
ﬂﬂ &
(
ﬂﬂ& '
name
‡‡ 
:
‡‡ 
$str
‡‡ $
)
‡‡$ %
;
‡‡% &
migrationBuilder
‚‚ 
.
‚‚ 
	DropTable
‚‚ &
(
‚‚& '
name
„„ 
:
„„ 
$str
„„ #
)
„„# $
;
„„$ %
migrationBuilder
ÂÂ 
.
ÂÂ 
	DropTable
ÂÂ &
(
ÂÂ& '
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ (
)
ÊÊ( )
;
ÊÊ) *
migrationBuilder
ËË 
.
ËË 
	DropTable
ËË &
(
ËË& '
name
ÈÈ 
:
ÈÈ 
$str
ÈÈ (
)
ÈÈ( )
;
ÈÈ) *
migrationBuilder
ÎÎ 
.
ÎÎ 
	DropTable
ÎÎ &
(
ÎÎ& '
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ (
)
ÏÏ( )
;
ÏÏ) *
migrationBuilder
ÓÓ 
.
ÓÓ 
	DropTable
ÓÓ &
(
ÓÓ& '
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ '
)
ÔÔ' (
;
ÔÔ( )
migrationBuilder
ÒÒ 
.
ÒÒ 
	DropTable
ÒÒ &
(
ÒÒ& '
name
ÚÚ 
:
ÚÚ 
$str
ÚÚ (
)
ÚÚ( )
;
ÚÚ) *
migrationBuilder
ÙÙ 
.
ÙÙ 
	DropTable
ÙÙ &
(
ÙÙ& '
name
ıı 
:
ıı 
$str
ıı !
)
ıı! "
;
ıı" #
migrationBuilder
˜˜ 
.
˜˜ 
	DropTable
˜˜ &
(
˜˜& '
name
¯¯ 
:
¯¯ 
$str
¯¯ (
)
¯¯( )
;
¯¯) *
migrationBuilder
˙˙ 
.
˙˙ 
	DropTable
˙˙ &
(
˙˙& '
name
˚˚ 
:
˚˚ 
$str
˚˚ )
)
˚˚) *
;
˚˚* +
migrationBuilder
˝˝ 
.
˝˝ 
	DropTable
˝˝ &
(
˝˝& '
name
˛˛ 
:
˛˛ 
$str
˛˛ !
)
˛˛! "
;
˛˛" #
migrationBuilder
ÄÄ 
.
ÄÄ 
	DropTable
ÄÄ &
(
ÄÄ& '
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ "
)
ÅÅ" #
;
ÅÅ# $
migrationBuilder
ÉÉ 
.
ÉÉ 
	DropTable
ÉÉ &
(
ÉÉ& '
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ 
)
ÑÑ  
;
ÑÑ  !
migrationBuilder
ÜÜ 
.
ÜÜ 
	DropTable
ÜÜ &
(
ÜÜ& '
name
áá 
:
áá 
$str
áá 
)
áá 
;
áá  
migrationBuilder
ââ 
.
ââ 
	DropTable
ââ &
(
ââ& '
name
ää 
:
ää 
$str
ää #
)
ää# $
;
ää$ %
migrationBuilder
åå 
.
åå 
	DropTable
åå &
(
åå& '
name
çç 
:
çç 
$str
çç #
)
çç# $
;
çç$ %
migrationBuilder
èè 
.
èè 
	DropTable
èè &
(
èè& '
name
êê 
:
êê 
$str
êê #
)
êê# $
;
êê$ %
}
ëë 	
}
íí 
}ìì ˜$
`/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250902093042_inits.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
inits 
:  
	Migration! *
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str 9
,9 :
table 
: 
$str $
)$ %
;% &
migrationBuilder 
. 
	DropIndex &
(& '
name 
: 
$str -
,- .
table 
: 
$str $
)$ %
;% &
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str $
)$ %
;% &
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str  
,  !
table 
: 
$str $
)$ %
;% &
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str #
,# $
table 
: 
$str $
,$ %
type   
:   
$str   
,   
nullable!! 
:!! 
false!! 
,!!  
defaultValue"" 
:"" 
$str""  
,""  !

oldClrType## 
:## 
typeof## "
(##" #
string### )
)##) *
,##* +
oldType$$ 
:$$ 
$str$$ 
,$$  
oldNullable%% 
:%% 
true%% !
)%%! "
;%%" #
}&& 	
	protected)) 
override)) 
void)) 
Down))  $
())$ %
MigrationBuilder))% 5
migrationBuilder))6 F
)))F G
{** 	
migrationBuilder++ 
.++ 
	AddColumn++ &
<++& '
string++' -
>++- .
(++. /
name,, 
:,, 
$str,, 
,,, 
table-- 
:-- 
$str-- $
,--$ %
type.. 
:.. 
$str.. 
,.. 
nullable// 
:// 
true// 
)// 
;//  
migrationBuilder11 
.11 
AlterColumn11 (
<11( )
string11) /
>11/ 0
(110 1
name22 
:22 
$str22 #
,22# $
table33 
:33 
$str33 $
,33$ %
type44 
:44 
$str44 
,44 
nullable55 
:55 
true55 
,55 

oldClrType66 
:66 
typeof66 "
(66" #
string66# )
)66) *
,66* +
oldType77 
:77 
$str77 
)77  
;77  !
migrationBuilder99 
.99 
	AddColumn99 &
<99& '
bool99' +
>99+ ,
(99, -
name:: 
::: 
$str::  
,::  !
table;; 
:;; 
$str;; $
,;;$ %
type<< 
:<< 
$str<< 
,<<  
nullable== 
:== 
false== 
,==  
defaultValue>> 
:>> 
false>> #
)>># $
;>>$ %
migrationBuilder@@ 
.@@ 
CreateIndex@@ (
(@@( )
nameAA 
:AA 
$strAA -
,AA- .
tableBB 
:BB 
$strBB $
,BB$ %
columnCC 
:CC 
$strCC  
)CC  !
;CC! "
migrationBuilderEE 
.EE 
AddForeignKeyEE *
(EE* +
nameFF 
:FF 
$strFF 9
,FF9 :
tableGG 
:GG 
$strGG $
,GG$ %
columnHH 
:HH 
$strHH  
,HH  !
principalTableII 
:II 
$strII  -
,II- .
principalColumnJJ 
:JJ  
$strJJ! %
)JJ% &
;JJ& '
}KK 	
}LL 
}MM ˜
`/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250904001039_initt.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
initt 
:  
	Migration! *
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ˇ
d/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250905171516_addEntity.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
	addEntity "
:# $
	Migration% .
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} »-
g/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250905174737_updateEntity.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public

 

partial

 
class

 
updateEntity

 %
:

& '
	Migration

( 1
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str !
)! "
;" #
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ D
,D E)
NpgsqlValueGenerationStrategyF c
.c d#
IdentityByDefaultColumnd {
){ |
,| }
UserId 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 >
,> ?
nullable@ H
:H I
falseJ O
)O P
,P Q
Action 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 P
,P Q
	maxLengthR [
:[ \
$num] `
,` a
nullableb j
:j k
falsel q
)q r
,r s

ActionType 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< B
,B C
nullableD L
:L M
falseN S
)S T
,T U
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= W
,W X
nullableY a
:a b
falsec h
)h i
,i j
Description   
=    !
table  " '
.  ' (
Column  ( .
<  . /
string  / 5
>  5 6
(  6 7
type  7 ;
:  ; <
$str  = C
,  C D
nullable  E M
:  M N
false  O T
)  T U
,  U V
	IPAddress!! 
=!! 
table!!  %
.!!% &
Column!!& ,
<!!, -
string!!- 3
>!!3 4
(!!4 5
type!!5 9
:!!9 :
$str!!; A
,!!A B
nullable!!C K
:!!K L
true!!M Q
)!!Q R
,!!R S
TargetEntity""  
=""! "
table""# (
.""( )
Column"") /
<""/ 0
string""0 6
>""6 7
(""7 8
type""8 <
:""< =
$str""> V
,""V W
	maxLength""X a
:""a b
$num""c f
,""f g
nullable""h p
:""p q
false""r w
)""w x
,""x y
	UpdatedAt## 
=## 
table##  %
.##% &
Column##& ,
<##, -
DateTime##- 5
>##5 6
(##6 7
type##7 ;
:##; <
$str##= W
,##W X
nullable##Y a
:##a b
true##c g
)##g h
,##h i
	UserAgent$$ 
=$$ 
table$$  %
.$$% &
Column$$& ,
<$$, -
string$$- 3
>$$3 4
($$4 5
type$$5 9
:$$9 :
$str$$; A
,$$A B
nullable$$C K
:$$K L
true$$M Q
)$$Q R
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% 3
,((3 4
x((5 6
=>((7 9
x((: ;
.((; <
Id((< >
)((> ?
;((? @
table)) 
.)) 

ForeignKey)) $
())$ %
name** 
:** 
$str** ?
,**? @
column++ 
:++ 
x++  !
=>++" $
x++% &
.++& '
UserId++' -
,++- .
principalTable,, &
:,,& '
$str,,( 5
,,,5 6
principalColumn-- '
:--' (
$str--) -
,--- .
onDelete..  
:..  !
ReferentialAction.." 3
...3 4
Cascade..4 ;
)..; <
;..< =
}// 
)// 
;// 
migrationBuilder11 
.11 
CreateIndex11 (
(11( )
name22 
:22 
$str22 +
,22+ ,
table33 
:33 
$str33 "
,33" #
column44 
:44 
$str44  
)44  !
;44! "
}55 	
}66 
}77 ç
k/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250905184811_FixRelationships.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
FixRelationships )
:* +
	Migration, 5
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} Å2
^/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250906135503_ini.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public

 

partial

 
class

 
ini

 
:

 
	Migration

 (
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str +
,+ ,
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ D
,D E)
NpgsqlValueGenerationStrategyF c
.c d#
IdentityByDefaultColumnd {
){ |
,| }
Token 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 =
,= >
nullable? G
:G H
falseI N
)N O
,O P

DocumentId 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
trueN R
)R S
,S T
UserId 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 >
,> ?
nullable@ H
:H I
falseJ O
)O P
,P Q
	ExpiresAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= W
,W X
nullableY a
:a b
falsec h
)h i
,i j
CanRead 
= 
table #
.# $
Column$ *
<* +
bool+ /
>/ 0
(0 1
type1 5
:5 6
$str7 @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
	CanUpdate 
= 
table  %
.% &
Column& ,
<, -
bool- 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
	CanDelete 
= 
table  %
.% &
Column& ,
<, -
bool- 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= W
,W X
nullableY a
:a b
falsec h
)h i
,i j
	UpdatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= W
,W X
nullableY a
:a b
truec g
)g h
} 
, 
constraints 
: 
table "
=># %
{   
table!! 
.!! 

PrimaryKey!! $
(!!$ %
$str!!% =
,!!= >
x!!? @
=>!!A C
x!!D E
.!!E F
Id!!F H
)!!H I
;!!I J
table"" 
."" 

ForeignKey"" $
(""$ %
name## 
:## 
$str## I
,##I J
column$$ 
:$$ 
x$$  !
=>$$" $
x$$% &
.$$& '
UserId$$' -
,$$- .
principalTable%% &
:%%& '
$str%%( 5
,%%5 6
principalColumn&& '
:&&' (
$str&&) -
,&&- .
onDelete''  
:''  !
ReferentialAction''" 3
.''3 4
Cascade''4 ;
)''; <
;''< =
table(( 
.(( 

ForeignKey(( $
((($ %
name)) 
:)) 
$str)) K
,))K L
column** 
:** 
x**  !
=>**" $
x**% &
.**& '

DocumentId**' 1
,**1 2
principalTable++ &
:++& '
$str++( 3
,++3 4
principalColumn,, '
:,,' (
$str,,) -
),,- .
;,,. /
}-- 
)-- 
;-- 
migrationBuilder// 
.// 
CreateIndex// (
(//( )
name00 
:00 
$str00 9
,009 :
table11 
:11 
$str11 ,
,11, -
column22 
:22 
$str22 $
)22$ %
;22% &
migrationBuilder44 
.44 
CreateIndex44 (
(44( )
name55 
:55 
$str55 5
,555 6
table66 
:66 
$str66 ,
,66, -
column77 
:77 
$str77  
)77  !
;77! "
}88 	
	protected;; 
override;; 
void;; 
Down;;  $
(;;$ %
MigrationBuilder;;% 5
migrationBuilder;;6 F
);;F G
{<< 	
migrationBuilder== 
.== 
	DropTable== &
(==& '
name>> 
:>> 
$str>> +
)>>+ ,
;>>, -
}?? 	
}@@ 
}AA ùf
h/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250911230543_updateENtityh.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public

 

partial

 
class

 
updateENtityh

 &
:

' (
	Migration

) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	DropIndex &
(& '
name 
: 
$str .
,. /
table 
: 
$str %
)% &
;& '
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str &
,& '
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ D
,D E)
NpgsqlValueGenerationStrategyF c
.c d#
IdentityByDefaultColumnd {
){ |
,| }

DocumentId 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
Content 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 ?
,? @
nullableA I
:I J
falseK P
)P Q
,Q R
	Embedding 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; A
,A B
nullableC K
:K L
falseM R
)R S
,S T

ChunkIndex 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 B
,B C
nullableD L
:L M
falseN S
)S T
,T U
EmbeddingVector #
=$ %
table& +
.+ ,
Column, 2
<2 3
float3 8
[8 9
]9 :
>: ;
(; <
type< @
:@ A
$strB J
,J K
nullableL T
:T U
trueV Z
)Z [
,[ \
SimilarityScore #
=$ %
table& +
.+ ,
Column, 2
<2 3
float3 8
>8 9
(9 :
type: >
:> ?
$str@ F
,F G
nullableH P
:P Q
falseR W
)W X
} 
, 
constraints   
:   
table   "
=>  # %
{!! 
table"" 
."" 

PrimaryKey"" $
(""$ %
$str""% 8
,""8 9
x"": ;
=>""< >
x""? @
.""@ A
Id""A C
)""C D
;""D E
table## 
.## 

ForeignKey## $
(##$ %
name$$ 
:$$ 
$str$$ F
,$$F G
column%% 
:%% 
x%%  !
=>%%" $
x%%% &
.%%& '

DocumentId%%' 1
,%%1 2
principalTable&& &
:&&& '
$str&&( 3
,&&3 4
principalColumn'' '
:''' (
$str'') -
,''- .
onDelete((  
:((  !
ReferentialAction((" 3
.((3 4
Cascade((4 ;
)((; <
;((< =
})) 
))) 
;)) 
migrationBuilder++ 
.++ 
CreateTable++ (
(++( )
name,, 
:,, 
$str,, %
,,,% &
columns-- 
:-- 
table-- 
=>-- !
new--" %
{.. 
Id// 
=// 
table// 
.// 
Column// %
<//% &
int//& )
>//) *
(//* +
type//+ /
:/// 0
$str//1 :
,//: ;
nullable//< D
://D E
false//F K
)//K L
.00 

Annotation00 #
(00# $
$str00$ D
,00D E)
NpgsqlValueGenerationStrategy00F c
.00c d#
IdentityByDefaultColumn00d {
)00{ |
,00| }
title11 
=11 
table11 !
.11! "
Column11" (
<11( )
string11) /
>11/ 0
(110 1
type111 5
:115 6
$str117 O
,11O P
	maxLength11Q Z
:11Z [
$num11\ _
,11_ `
nullable11a i
:11i j
false11k p
)11p q
,11q r
UserId22 
=22 
table22 "
.22" #
Column22# )
<22) *
string22* 0
>220 1
(221 2
type222 6
:226 7
$str228 >
,22> ?
nullable22@ H
:22H I
false22J O
)22O P
,22P Q
Message33 
=33 
table33 #
.33# $
Column33$ *
<33* +
string33+ 1
>331 2
(332 3
type333 7
:337 8
$str339 ?
,33? @
nullable33A I
:33I J
false33K P
)33P Q
,33Q R
Date44 
=44 
table44  
.44  !
Column44! '
<44' (
DateTime44( 0
>440 1
(441 2
type442 6
:446 7
$str448 R
,44R S
nullable44T \
:44\ ]
false44^ c
)44c d
,44d e
IsRead55 
=55 
table55 "
.55" #
Column55# )
<55) *
bool55* .
>55. /
(55/ 0
type550 4
:554 5
$str556 ?
,55? @
nullable55A I
:55I J
false55K P
)55P Q
,55Q R
Link66 
=66 
table66  
.66  !
Column66! '
<66' (
string66( .
>66. /
(66/ 0
type660 4
:664 5
$str666 <
,66< =
nullable66> F
:66F G
true66H L
)66L M
,66M N
Type77 
=77 
table77  
.77  !
Column77! '
<77' (
int77( +
>77+ ,
(77, -
type77- 1
:771 2
$str773 <
,77< =
nullable77> F
:77F G
false77H M
)77M N
,77N O
	ActionUrl88 
=88 
table88  %
.88% &
Column88& ,
<88, -
string88- 3
>883 4
(884 5
type885 9
:889 :
$str88; A
,88A B
nullable88C K
:88K L
true88M Q
)88Q R
,88R S
SenderId99 
=99 
table99 $
.99$ %
Column99% +
<99+ ,
string99, 2
>992 3
(993 4
type994 8
:998 9
$str99: @
,99@ A
nullable99B J
:99J K
true99L P
)99P Q
,99Q R
	CreatedAt:: 
=:: 
table::  %
.::% &
Column::& ,
<::, -
DateTime::- 5
>::5 6
(::6 7
type::7 ;
:::; <
$str::= W
,::W X
nullable::Y a
:::a b
false::c h
)::h i
,::i j
	UpdatedAt;; 
=;; 
table;;  %
.;;% &
Column;;& ,
<;;, -
DateTime;;- 5
>;;5 6
(;;6 7
type;;7 ;
:;;; <
$str;;= W
,;;W X
nullable;;Y a
:;;a b
true;;c g
);;g h
}<< 
,<< 
constraints== 
:== 
table== "
=>==# %
{>> 
table?? 
.?? 

PrimaryKey?? $
(??$ %
$str??% 7
,??7 8
x??9 :
=>??; =
x??> ?
.??? @
Id??@ B
)??B C
;??C D
table@@ 
.@@ 

ForeignKey@@ $
(@@$ %
nameAA 
:AA 
$strAA E
,AAE F
columnBB 
:BB 
xBB  !
=>BB" $
xBB% &
.BB& '
SenderIdBB' /
,BB/ 0
principalTableCC &
:CC& '
$strCC( 5
,CC5 6
principalColumnDD '
:DD' (
$strDD) -
,DD- .
onDeleteEE  
:EE  !
ReferentialActionEE" 3
.EE3 4
RestrictEE4 <
)EE< =
;EE= >
tableFF 
.FF 

ForeignKeyFF $
(FF$ %
nameGG 
:GG 
$strGG C
,GGC D
columnHH 
:HH 
xHH  !
=>HH" $
xHH% &
.HH& '
UserIdHH' -
,HH- .
principalTableII &
:II& '
$strII( 5
,II5 6
principalColumnJJ '
:JJ' (
$strJJ) -
,JJ- .
onDeleteKK  
:KK  !
ReferentialActionKK" 3
.KK3 4
CascadeKK4 ;
)KK; <
;KK< =
}LL 
)LL 
;LL 
migrationBuilderNN 
.NN 
CreateIndexNN (
(NN( )
nameOO 
:OO 
$strOO 7
,OO7 8
tablePP 
:PP 
$strPP %
,PP% &
columnsQQ 
:QQ 
newQQ 
[QQ 
]QQ 
{QQ  
$strQQ! )
,QQ) *
$strQQ+ 5
}QQ6 7
,QQ7 8
uniqueRR 
:RR 
trueRR 
)RR 
;RR 
migrationBuilderTT 
.TT 
CreateIndexTT (
(TT( )
nameUU 
:UU 
$strUU 4
,UU4 5
tableVV 
:VV 
$strVV '
,VV' (
columnWW 
:WW 
$strWW $
)WW$ %
;WW% &
migrationBuilderYY 
.YY 
CreateIndexYY (
(YY( )
nameZZ 
:ZZ 
$strZZ -
,ZZ- .
table[[ 
:[[ 
$str[[ &
,[[& '
column\\ 
:\\ 
$str\\ 
)\\ 
;\\  
migrationBuilder^^ 
.^^ 
CreateIndex^^ (
(^^( )
name__ 
:__ 
$str__ /
,__/ 0
table`` 
:`` 
$str`` &
,``& '
columnaa 
:aa 
$straa  
)aa  !
;aa! "
migrationBuildercc 
.cc 
CreateIndexcc (
(cc( )
namedd 
:dd 
$strdd 1
,dd1 2
tableee 
:ee 
$stree &
,ee& '
columnff 
:ff 
$strff "
)ff" #
;ff# $
migrationBuilderhh 
.hh 
CreateIndexhh (
(hh( )
nameii 
:ii 
$strii /
,ii/ 0
tablejj 
:jj 
$strjj &
,jj& '
columnkk 
:kk 
$strkk  
)kk  !
;kk! "
}ll 	
	protectedoo 
overrideoo 
voidoo 
Downoo  $
(oo$ %
MigrationBuilderoo% 5
migrationBuilderoo6 F
)ooF G
{pp 	
migrationBuilderqq 
.qq 
	DropTableqq &
(qq& '
namerr 
:rr 
$strrr &
)rr& '
;rr' (
migrationBuildertt 
.tt 
	DropTablett &
(tt& '
nameuu 
:uu 
$struu %
)uu% &
;uu& '
migrationBuilderww 
.ww 
	DropIndexww &
(ww& '
namexx 
:xx 
$strxx 7
,xx7 8
tableyy 
:yy 
$stryy %
)yy% &
;yy& '
migrationBuilder{{ 
.{{ 
CreateIndex{{ (
({{( )
name|| 
:|| 
$str|| .
,||. /
table}} 
:}} 
$str}} %
,}}% &
column~~ 
:~~ 
$str~~  
)~~  !
;~~! "
} 	
}
ÄÄ 
}ÅÅ ¶!
l/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20250911235040_updateENtityappdb.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public		 

partial		 
class		 
updateENtityappdb		 *
:		+ ,
	Migration		- 6
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	DropIndex &
(& '
name 
: 
$str -
,- .
table 
: 
$str &
)& '
;' (
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str &
)& '
;' (
migrationBuilder 
. 
	AddColumn &
<& '
string' -
>- .
(. /
name 
: 
$str !
,! "
table 
: 
$str &
,& '
type 
: 
$str 
, 
nullable 
: 
true 
) 
;  
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str 2
,2 3
table 
: 
$str &
,& '
column 
: 
$str #
)# $
;$ %
migrationBuilder!! 
.!! 
AddForeignKey!! *
(!!* +
name"" 
:"" 
$str"" >
,""> ?
table## 
:## 
$str## &
,##& '
column$$ 
:$$ 
$str$$ #
,$$# $
principalTable%% 
:%% 
$str%%  -
,%%- .
principalColumn&& 
:&&  
$str&&! %
)&&% &
;&&& '
}'' 	
	protected** 
override** 
void** 
Down**  $
(**$ %
MigrationBuilder**% 5
migrationBuilder**6 F
)**F G
{++ 	
migrationBuilder,, 
.,, 
DropForeignKey,, +
(,,+ ,
name-- 
:-- 
$str-- >
,--> ?
table.. 
:.. 
$str.. &
)..& '
;..' (
migrationBuilder00 
.00 
	DropIndex00 &
(00& '
name11 
:11 
$str11 2
,112 3
table22 
:22 
$str22 &
)22& '
;22' (
migrationBuilder44 
.44 

DropColumn44 '
(44' (
name55 
:55 
$str55 !
,55! "
table66 
:66 
$str66 &
)66& '
;66' (
migrationBuilder88 
.88 
	AddColumn88 &
<88& '
DateTime88' /
>88/ 0
(880 1
name99 
:99 
$str99 
,99 
table:: 
::: 
$str:: &
,::& '
type;; 
:;; 
$str;; 0
,;;0 1
nullable<< 
:<< 
false<< 
,<<  
defaultValue== 
:== 
new== !
DateTime==" *
(==* +
$num==+ ,
,==, -
$num==. /
,==/ 0
$num==1 2
,==2 3
$num==4 5
,==5 6
$num==7 8
,==8 9
$num==: ;
,==; <
$num=== >
,==> ?
DateTimeKind==@ L
.==L M
Unspecified==M X
)==X Y
)==Y Z
;==Z [
migrationBuilder?? 
.?? 
CreateIndex?? (
(??( )
name@@ 
:@@ 
$str@@ -
,@@- .
tableAA 
:AA 
$strAA &
,AA& '
columnBB 
:BB 
$strBB 
)BB 
;BB  
}CC 	
}DD 
}EE ë
m/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20251007122220_updateENtityappdbc.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
updateENtityappdbc +
:, -
	Migration. 7
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ì
n/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20251007122431_updateENtityappdbcv.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 
updateENtityappdbcv ,
:- .
	Migration/ 8
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ¸z
o/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20251007122742_updateENtityappdbcvw.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public

 

partial

 
class

  
updateENtityappdbcvw

 -
:

. /
	Migration

0 9
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str )
)) *
;* +
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str "
)" #
;# $
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str 
)  
;  !
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
columns 
: 
table 
=> !
new" %
{ 
Id   
=   
table   
.   
Column   %
<  % &
int  & )
>  ) *
(  * +
type  + /
:  / 0
$str  1 :
,  : ;
nullable  < D
:  D E
false  F K
)  K L
.!! 

Annotation!! #
(!!# $
$str!!$ D
,!!D E)
NpgsqlValueGenerationStrategy!!F c
.!!c d#
IdentityByDefaultColumn!!d {
)!!{ |
,!!| }
ParentFolderId"" "
=""# $
table""% *
.""* +
Column""+ 1
<""1 2
int""2 5
>""5 6
(""6 7
type""7 ;
:""; <
$str""= F
,""F G
nullable""H P
:""P Q
true""R V
)""V W
,""W X
UserId## 
=## 
table## "
.##" #
Column### )
<##) *
string##* 0
>##0 1
(##1 2
type##2 6
:##6 7
$str##8 >
,##> ?
nullable##@ H
:##H I
false##J O
)##O P
,##P Q
	CreatedAt$$ 
=$$ 
table$$  %
.$$% &
Column$$& ,
<$$, -
DateTime$$- 5
>$$5 6
($$6 7
type$$7 ;
:$$; <
$str$$= W
,$$W X
nullable$$Y a
:$$a b
false$$c h
)$$h i
,$$i j
Name%% 
=%% 
table%%  
.%%  !
Column%%! '
<%%' (
string%%( .
>%%. /
(%%/ 0
type%%0 4
:%%4 5
$str%%6 <
,%%< =
nullable%%> F
:%%F G
false%%H M
)%%M N
,%%N O
	UpdatedAt&& 
=&& 
table&&  %
.&&% &
Column&&& ,
<&&, -
DateTime&&- 5
>&&5 6
(&&6 7
type&&7 ;
:&&; <
$str&&= W
,&&W X
nullable&&Y a
:&&a b
true&&c g
)&&g h
}'' 
,'' 
constraints(( 
:(( 
table(( "
=>((# %
{)) 
table** 
.** 

PrimaryKey** $
(**$ %
$str**% 4
,**4 5
x**6 7
=>**8 :
x**; <
.**< =
Id**= ?
)**? @
;**@ A
table++ 
.++ 

ForeignKey++ $
(++$ %
name,, 
:,, 
$str,, @
,,,@ A
column-- 
:-- 
x--  !
=>--" $
x--% &
.--& '
UserId--' -
,--- .
principalTable.. &
:..& '
$str..( 5
,..5 6
principalColumn// '
://' (
$str//) -
,//- .
onDelete00  
:00  !
ReferentialAction00" 3
.003 4
Cascade004 ;
)00; <
;00< =
table11 
.11 

ForeignKey11 $
(11$ %
name22 
:22 
$str22 G
,22G H
column33 
:33 
x33  !
=>33" $
x33% &
.33& '
ParentFolderId33' 5
,335 6
principalTable44 &
:44& '
$str44( 4
,444 5
principalColumn55 '
:55' (
$str55) -
)55- .
;55. /
}66 
)66 
;66 
migrationBuilder88 
.88 
CreateTable88 (
(88( )
name99 
:99 
$str99 
,99  
columns:: 
::: 
table:: 
=>:: !
new::" %
{;; 
Id<< 
=<< 
table<< 
.<< 
Column<< %
<<<% &
int<<& )
><<) *
(<<* +
type<<+ /
:<</ 0
$str<<1 :
,<<: ;
nullable<<< D
:<<D E
false<<F K
)<<K L
.== 

Annotation== #
(==# $
$str==$ D
,==D E)
NpgsqlValueGenerationStrategy==F c
.==c d#
IdentityByDefaultColumn==d {
)=={ |
,==| }
ReceiverId1>> 
=>>  !
table>>" '
.>>' (
Column>>( .
<>>. /
string>>/ 5
>>>5 6
(>>6 7
type>>7 ;
:>>; <
$str>>= C
,>>C D
nullable>>E M
:>>M N
false>>O T
)>>T U
,>>U V
	SenderId1?? 
=?? 
table??  %
.??% &
Column??& ,
<??, -
string??- 3
>??3 4
(??4 5
type??5 9
:??9 :
$str??; A
,??A B
nullable??C K
:??K L
false??M R
)??R S
,??S T
Body@@ 
=@@ 
table@@  
.@@  !
Column@@! '
<@@' (
string@@( .
>@@. /
(@@/ 0
type@@0 4
:@@4 5
$str@@6 <
,@@< =
nullable@@> F
:@@F G
false@@H M
)@@M N
,@@N O
	CreatedAtAA 
=AA 
tableAA  %
.AA% &
ColumnAA& ,
<AA, -
DateTimeAA- 5
>AA5 6
(AA6 7
typeAA7 ;
:AA; <
$strAA= W
,AAW X
nullableAAY a
:AAa b
falseAAc h
)AAh i
,AAi j
IsReadBB 
=BB 
tableBB "
.BB" #
ColumnBB# )
<BB) *
boolBB* .
>BB. /
(BB/ 0
typeBB0 4
:BB4 5
$strBB6 ?
,BB? @
nullableBBA I
:BBI J
falseBBK P
)BBP Q
,BBQ R

ReceiverIdCC 
=CC  
tableCC! &
.CC& '
ColumnCC' -
<CC- .
intCC. 1
>CC1 2
(CC2 3
typeCC3 7
:CC7 8
$strCC9 B
,CCB C
nullableCCD L
:CCL M
falseCCN S
)CCS T
,CCT U
SenderIdDD 
=DD 
tableDD $
.DD$ %
ColumnDD% +
<DD+ ,
intDD, /
>DD/ 0
(DD0 1
typeDD1 5
:DD5 6
$strDD7 @
,DD@ A
nullableDDB J
:DDJ K
falseDDL Q
)DDQ R
,DDR S
SentAtEE 
=EE 
tableEE "
.EE" #
ColumnEE# )
<EE) *
DateTimeEE* 2
>EE2 3
(EE3 4
typeEE4 8
:EE8 9
$strEE: T
,EET U
nullableEEV ^
:EE^ _
falseEE` e
)EEe f
,EEf g
SubjectFF 
=FF 
tableFF #
.FF# $
ColumnFF$ *
<FF* +
stringFF+ 1
>FF1 2
(FF2 3
typeFF3 7
:FF7 8
$strFF9 Q
,FFQ R
	maxLengthFFS \
:FF\ ]
$numFF^ a
,FFa b
nullableFFc k
:FFk l
falseFFm r
)FFr s
,FFs t
	UpdatedAtGG 
=GG 
tableGG  %
.GG% &
ColumnGG& ,
<GG, -
DateTimeGG- 5
>GG5 6
(GG6 7
typeGG7 ;
:GG; <
$strGG= W
,GGW X
nullableGGY a
:GGa b
trueGGc g
)GGg h
}HH 
,HH 
constraintsII 
:II 
tableII "
=>II# %
{JJ 
tableKK 
.KK 

PrimaryKeyKK $
(KK$ %
$strKK% 1
,KK1 2
xKK3 4
=>KK5 7
xKK8 9
.KK9 :
IdKK: <
)KK< =
;KK= >
tableLL 
.LL 

ForeignKeyLL $
(LL$ %
nameMM 
:MM 
$strMM B
,MMB C
columnNN 
:NN 
xNN  !
=>NN" $
xNN% &
.NN& '
ReceiverId1NN' 2
,NN2 3
principalTableOO &
:OO& '
$strOO( 5
,OO5 6
principalColumnPP '
:PP' (
$strPP) -
,PP- .
onDeleteQQ  
:QQ  !
ReferentialActionQQ" 3
.QQ3 4
CascadeQQ4 ;
)QQ; <
;QQ< =
tableRR 
.RR 

ForeignKeyRR $
(RR$ %
nameSS 
:SS 
$strSS @
,SS@ A
columnTT 
:TT 
xTT  !
=>TT" $
xTT% &
.TT& '
	SenderId1TT' 0
,TT0 1
principalTableUU &
:UU& '
$strUU( 5
,UU5 6
principalColumnVV '
:VV' (
$strVV) -
,VV- .
onDeleteWW  
:WW  !
ReferentialActionWW" 3
.WW3 4
CascadeWW4 ;
)WW; <
;WW< =
}XX 
)XX 
;XX 
migrationBuilderZZ 
.ZZ 
CreateTableZZ (
(ZZ( )
name[[ 
:[[ 
$str[[ )
,[[) *
columns\\ 
:\\ 
table\\ 
=>\\ !
new\\" %
{]] 
Id^^ 
=^^ 
table^^ 
.^^ 
Column^^ %
<^^% &
int^^& )
>^^) *
(^^* +
type^^+ /
:^^/ 0
$str^^1 :
,^^: ;
nullable^^< D
:^^D E
false^^F K
)^^K L
.__ 

Annotation__ #
(__# $
$str__$ D
,__D E)
NpgsqlValueGenerationStrategy__F c
.__c d#
IdentityByDefaultColumn__d {
)__{ |
,__| }
MailFolderId``  
=``! "
table``# (
.``( )
Column``) /
<``/ 0
int``0 3
>``3 4
(``4 5
type``5 9
:``9 :
$str``; D
,``D E
nullable``F N
:``N O
false``P U
)``U V
,``V W
	MessageIdaa 
=aa 
tableaa  %
.aa% &
Columnaa& ,
<aa, -
intaa- 0
>aa0 1
(aa1 2
typeaa2 6
:aa6 7
$straa8 A
,aaA B
nullableaaC K
:aaK L
falseaaM R
)aaR S
,aaS T
	CreatedAtbb 
=bb 
tablebb  %
.bb% &
Columnbb& ,
<bb, -
DateTimebb- 5
>bb5 6
(bb6 7
typebb7 ;
:bb; <
$strbb= W
,bbW X
nullablebbY a
:bba b
falsebbc h
)bbh i
,bbi j
	UpdatedAtcc 
=cc 
tablecc  %
.cc% &
Columncc& ,
<cc, -
DateTimecc- 5
>cc5 6
(cc6 7
typecc7 ;
:cc; <
$strcc= W
,ccW X
nullableccY a
:cca b
trueccc g
)ccg h
}dd 
,dd 
constraintsee 
:ee 
tableee "
=>ee# %
{ff 
tablegg 
.gg 

PrimaryKeygg $
(gg$ %
$strgg% ;
,gg; <
xgg= >
=>gg? A
xggB C
.ggC D
IdggD F
)ggF G
;ggG H
tablehh 
.hh 

ForeignKeyhh $
(hh$ %
nameii 
:ii 
$strii L
,iiL M
columnjj 
:jj 
xjj  !
=>jj" $
xjj% &
.jj& '
MailFolderIdjj' 3
,jj3 4
principalTablekk &
:kk& '
$strkk( 4
,kk4 5
principalColumnll '
:ll' (
$strll) -
,ll- .
onDeletemm  
:mm  !
ReferentialActionmm" 3
.mm3 4
Cascademm4 ;
)mm; <
;mm< =
tablenn 
.nn 

ForeignKeynn $
(nn$ %
nameoo 
:oo 
$stroo F
,ooF G
columnpp 
:pp 
xpp  !
=>pp" $
xpp% &
.pp& '
	MessageIdpp' 0
,pp0 1
principalTableqq &
:qq& '
$strqq( 1
,qq1 2
principalColumnrr '
:rr' (
$strrr) -
,rr- .
onDeletess  
:ss  !
ReferentialActionss" 3
.ss3 4
Cascadess4 ;
)ss; <
;ss< =
}tt 
)tt 
;tt 
migrationBuildervv 
.vv 
CreateIndexvv (
(vv( )
nameww 
:ww 
$strww 4
,ww4 5
tablexx 
:xx 
$strxx #
,xx# $
columnyy 
:yy 
$stryy (
)yy( )
;yy) *
migrationBuilder{{ 
.{{ 
CreateIndex{{ (
({{( )
name|| 
:|| 
$str|| ,
,||, -
table}} 
:}} 
$str}} #
,}}# $
column~~ 
:~~ 
$str~~  
)~~  !
;~~! "
migrationBuilder
ÄÄ 
.
ÄÄ 
CreateIndex
ÄÄ (
(
ÄÄ( )
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ 9
,
ÅÅ9 :
table
ÇÇ 
:
ÇÇ 
$str
ÇÇ *
,
ÇÇ* +
column
ÉÉ 
:
ÉÉ 
$str
ÉÉ &
)
ÉÉ& '
;
ÉÉ' (
migrationBuilder
ÖÖ 
.
ÖÖ 
CreateIndex
ÖÖ (
(
ÖÖ( )
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ 6
,
ÜÜ6 7
table
áá 
:
áá 
$str
áá *
,
áá* +
column
àà 
:
àà 
$str
àà #
)
àà# $
;
àà$ %
migrationBuilder
ää 
.
ää 
CreateIndex
ää (
(
ää( )
name
ãã 
:
ãã 
$str
ãã .
,
ãã. /
table
åå 
:
åå 
$str
åå  
,
åå  !
column
çç 
:
çç 
$str
çç %
)
çç% &
;
çç& '
migrationBuilder
èè 
.
èè 
CreateIndex
èè (
(
èè( )
name
êê 
:
êê 
$str
êê ,
,
êê, -
table
ëë 
:
ëë 
$str
ëë  
,
ëë  !
column
íí 
:
íí 
$str
íí #
)
íí# $
;
íí$ %
}
ìì 	
}
îî 
}ïï ∫
Å/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20260120211541_FixDocumentRequestDepartmentForeignKey.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class 2
&FixDocumentRequestDepartmentForeignKey ?
:@ A
	MigrationB K
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} £
v/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Migrations/20260120230053_RemoveDuplicateDepartmentId.cs
	namespace 	
Infrastructure
 
. 

Migrations #
{ 
public 

partial 
class '
RemoveDuplicateDepartmentId 4
:5 6
	Migration7 @
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} ﬁÀ
e/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/AccessRequestRepository.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
;

% &
public 
class #
AccessRequestRepository $
:% &$
IAccessRequestRepository' ?
{ 
private 
readonly 
AppDbContext !
_ctx" &
;& '
public 
#
AccessRequestRepository "
(" #
AppDbContext# /
ctx0 3
)3 4
=>5 7
_ctx8 <
== >
ctx? B
;B C
public 

async 
Task 
< 
AccessRequestDto &
>& '
AddAsync( 0
(0 1
AccessRequest1 >
entity? E
)E F
{ 
await 
_ctx 
. 
AccessRequests !
.! "
AddAsync" *
(* +
entity+ 1
)1 2
;2 3
return 
new 
AccessRequestDto #
{ 	
Id 
= 
entity 
. 
Id 
, 

DocumentId 
= 
entity 
.  

DocumentId  *
,* +
RequesterId 
= 
entity  
.  !
RequesterId! ,
,, -
RequestRead 
= 
entity  
.  !
RequestRead! ,
,, -
RequestWrite 
= 
entity !
.! "
RequestWrite" .
,. /
RequestDelete 
= 
entity "
." #
RequestDelete# 0
,0 1
Status 
= 
entity 
. 
Status "
," #
	CreatedAt 
= 
entity 
. 
	CreatedAt (
,( )

DecisionAt 
= 
entity 
.  

DecisionAt  *
,* +
DecidedById 
= 
entity  
.  !
DecidedById! ,
}   	
;  	 

}!! 
public## 

async## 
Task## 
<## 
AccessRequestDto## &
?##& '
>##' (
GetByIdAsync##) 5
(##5 6
int##6 9
id##: <
)##< =
=>##> @
await$$ 
_ctx$$ 
.$$ 
AccessRequests$$ !
.%% 
Include%% 
(%% 
a%% 
=>%% 
a%% 
.%% 
Document%% $
)%%$ %
.&& 
Include&& 
(&& 
a&& 
=>&& 
a&& 
.&& 
	Requester&& %
)&&% &
.'' 
Include'' 
('' 
a'' 
=>'' 
a'' 
.'' 
	DecidedBy'' %
)''% &
.(( 
Where(( 
((( 
a(( 
=>(( 
a(( 
.(( 
Id(( 
==(( 
id((  "
)((" #
.)) 
Select)) 
()) 
a)) 
=>)) 
new)) 
AccessRequestDto)) -
{** 
Id++ 
=++ 
a++ 
.++ 
Id++ 
,++ 

DocumentId,, 
=,, 
a,, 
.,, 

DocumentId,, )
,,,) *
RequesterId-- 
=-- 
a-- 
.--  
RequesterId--  +
,--+ ,
RequestRead.. 
=.. 
a.. 
...  
RequestRead..  +
,..+ ,
RequestWrite// 
=// 
a//  
.//  !
RequestWrite//! -
,//- .
RequestDelete00 
=00 
a00  !
.00! "
RequestDelete00" /
,00/ 0
Message11 
=11 
a11 
.11 
Message11 #
,11# $
DocumentName22 
=22 
a22  
.22  !
Document22! )
.22) *
Name22* .
,22. /
Status33 
=33 
a33 
.33 
Status33 !
,33! "
	CreatedAt44 
=44 
a44 
.44 
	CreatedAt44 '
,44' (

DecisionAt55 
=55 
a55 
.55 

DecisionAt55 )
,55) *
DecidedById66 
=66 
a66 
.66  
DecidedById66  +
,66+ ,
DecidedByName77 
=77 
a77  !
.77! "
	DecidedBy77" +
!=77, .
null77/ 3
?774 5
a776 7
.777 8
	DecidedBy778 A
.77A B
UserName77B J
:77K L
null77M Q
}88 
)88 
.99 
FirstOrDefaultAsync99  
(99  !
)99! "
;99" #
public;; 

async;; 
Task;; 
<;; 
bool;; 
>;; 
ExistsPendingAsync;; .
(;;. /
int;;/ 2

documentId;;3 =
,;;= >
string;;? E
requesterId;;F Q
);;Q R
=>;;S U
await<< 
_ctx<< 
.<< 
AccessRequests<< !
.<<! "
AnyAsync<<" *
(<<* +
r<<+ ,
=><<- /
r== 
.== 

DocumentId== 
==== 

documentId== &
&&==' )
r>> 
.>> 
RequesterId>> 
==>> 
requesterId>> (
&&>>) +
r?? 
.?? 
Status?? 
==?? 
$str?? $
)??$ %
;??% &
publicAA 

asyncAA 
TaskAA 
<AA 
PagedResultAA !
<AA! "
AccessRequestDtoAA" 2
>AA2 3
>AA3 4
GetMyRequestsAsyncAA5 G
(AAG H
PaginationParamsAAH X
paginationParamsAAY i
)AAi j
{BB 
varCC 
currentUserIdCC 
=CC 
$strCC  
;CC  !
varDD 
qDD 
=DD 
_ctxDD 
.DD 
AccessRequestsDD #
.EE 
WhereEE 
(EE 
aEE 
=>EE 
aEE 
.EE 
RequesterIdEE %
==EE& (
currentUserIdEE) 6
)EE6 7
.FF 
AsQueryableFF 
(FF 
)FF 
;FF 
varHH 
totalHH 
=HH 
awaitHH 
qHH 
.HH 

CountAsyncHH &
(HH& '
)HH' (
;HH( )
varII 
itemsII 
=II 
awaitII 
qII 
.JJ 
SkipJJ 
(JJ 
(JJ 
paginationParamsJJ #
.JJ# $

PageNumberJJ$ .
-JJ/ 0
$numJJ1 2
)JJ2 3
*JJ4 5
paginationParamsJJ6 F
.JJF G
PageSizeJJG O
)JJO P
.KK 
TakeKK 
(KK 
paginationParamsKK "
.KK" #
PageSizeKK# +
)KK+ ,
.LL 
SelectLL 
(LL 
xLL 
=>LL 
newLL 
AccessRequestDtoLL -
{MM 
IdNN 
=NN 
xNN 
.NN 
IdNN 
,NN 

DocumentIdOO 
=OO 
xOO 
.OO 

DocumentIdOO )
,OO) *
DocumentNamePP 
=PP 
xPP  
.PP  !
DocumentPP! )
.PP) *
NamePP* .
,PP. /
RequesterIdQQ 
=QQ 
xQQ 
.QQ  
RequesterIdQQ  +
,QQ+ ,
RequesterNameRR 
=RR 
xRR  !
.RR! "
	RequesterRR" +
.RR+ ,
UserNameRR, 4
,RR4 5
RequestReadSS 
=SS 
xSS 
.SS  
RequestReadSS  +
,SS+ ,
RequestWriteTT 
=TT 
xTT  
.TT  !
RequestWriteTT! -
,TT- .
RequestDeleteUU 
=UU 
xUU  !
.UU! "
RequestDeleteUU" /
,UU/ 0
StatusVV 
=VV 
xVV 
.VV 
StatusVV !
,VV! "
MessageWW 
=WW 
xWW 
.WW 
MessageWW #
,WW# $
	CreatedAtXX 
=XX 
xXX 
.XX 
	CreatedAtXX '
,XX' (

DecisionAtYY 
=YY 
xYY 
.YY 

DecisionAtYY )
,YY) *
DecidedByIdZZ 
=ZZ 
xZZ 
.ZZ  
DecidedByIdZZ  +
,ZZ+ ,
DecidedByName[[ 
=[[ 
x[[  !
.[[! "
	DecidedBy[[" +
!=[[, .
null[[/ 3
?[[4 5
x[[6 7
.[[7 8
	DecidedBy[[8 A
.[[A B
UserName[[B J
:[[K L
null[[M Q
}\\ 
)\\ 
.]] 
ToListAsync]] 
(]] 
)]] 
;]] 
return`` 
new`` 
PagedResult`` 
<`` 
AccessRequestDto`` /
>``/ 0
{aa 	
Databb 
=bb 
itemsbb 
,bb 

PageNumbercc 
=cc 
paginationParamscc )
.cc) *

PageNumbercc* 4
,cc4 5
PageSizedd 
=dd 
paginationParamsdd '
.dd' (
PageSizedd( 0
,dd0 1
TotalRecordsee 
=ee 
totalee  
}ff 	
;ff	 

}gg 
publicii 

asyncii 
Taskii 
<ii #
AccessRequestPageResultii -
>ii- .
GetPagedAsyncii/ <
(ii< =
PaginationParamsii= M
piiN O
)iiO P
{jj 
varkk 
qkk 
=kk 
_ctxkk 
.kk 
AccessRequestskk #
.ll 
AsNoTrackingll 
(ll 
)ll 
.nn 
Includenn 
(nn 
ann 
=>nn 
ann 
.nn 
Documentnn $
)nn$ %
.oo 
Includeoo 
(oo 
aoo 
=>oo 
aoo 
.oo 
	Requesteroo %
)oo% &
.pp 
Includepp 
(pp 
app 
=>pp 
app 
.pp 
	DecidedBypp %
)pp% &
.qq 
AsQueryableqq 
(qq 
)qq 
;qq 
if{{ 

({{ 
!{{ 
string{{ 
.{{ 
IsNullOrEmpty{{ !
({{! "
p{{" #
.{{# $
Search{{$ *
){{* +
){{+ ,
{|| 	
q}} 
=}} 
q}} 
.}} 
Where}} 
(}} 
x}} 
=>}} 
x}} 
.}} 
	Requester}} (
.}}, -
UserName}}- 5
.}}5 6
ToLower}}6 =
(}}= >
)}}> ?
.}}? @
Contains}}@ H
(}}H I
p}}I J
.}}J K
Search}}K Q
.}}Q R
ToLower}}R Y
(}}Y Z
)}}Z [
)}}[ \
)}}\ ]
;}}] ^
}~~ 	
q 	
=
 
p 
. 
SortBy 
switch 
{
ÄÄ 	
$str
ÅÅ 
=>
ÅÅ 
q
ÅÅ 
.
ÅÅ 
OrderBy
ÅÅ %
(
ÅÅ% &
x
ÅÅ& '
=>
ÅÅ( *
x
ÅÅ+ ,
.
ÅÅ, -
	CreatedAt
ÅÅ- 6
)
ÅÅ6 7
,
ÅÅ7 8
$str
ÇÇ 
=>
ÇÇ 
q
ÇÇ 
.
ÇÇ  
OrderByDescending
ÇÇ  1
(
ÇÇ1 2
x
ÇÇ2 3
=>
ÇÇ4 6
x
ÇÇ7 8
.
ÇÇ8 9

DecisionAt
ÇÇ9 C
)
ÇÇC D
,
ÇÇD E
$str
ÉÉ 
=>
ÉÉ 
q
ÉÉ 
.
ÉÉ 
OrderBy
ÉÉ &
(
ÉÉ& '
x
ÉÉ' (
=>
ÉÉ) +
x
ÉÉ, -
.
ÉÉ- .

DecisionAt
ÉÉ. 8
)
ÉÉ8 9
,
ÉÉ9 :
_
ÑÑ 
=>
ÑÑ 
q
ÑÑ 
.
ÑÑ 
OrderByDescending
ÑÑ $
(
ÑÑ$ %
x
ÑÑ% &
=>
ÑÑ' )
x
ÑÑ* +
.
ÑÑ+ ,
	CreatedAt
ÑÑ, 5
)
ÑÑ5 6
}
ÖÖ 	
;
ÖÖ	 

var
áá 
total
áá 
=
áá 
await
áá 
q
áá 
.
áá 

CountAsync
áá &
(
áá& '
)
áá' (
;
áá( )
var
àà 
items
àà 
=
àà 
await
àà 
q
àà 
.
ââ 
Skip
ââ 
(
ââ 
(
ââ 
p
ââ 
.
ââ 

PageNumber
ââ 
-
ââ  !
$num
ââ" #
)
ââ# $
*
ââ% &
p
ââ' (
.
ââ( )
PageSize
ââ) 1
)
ââ1 2
.
ää 
Take
ää 
(
ää 
p
ää 
.
ää 
PageSize
ää 
)
ää 
.
ãã 
Select
ãã 
(
ãã 
x
ãã 
=>
ãã 
new
ãã 
AccessRequestDto
ãã -
{
åå 
Id
çç 
=
çç 
x
çç 
.
çç 
Id
çç 
,
çç 

DocumentId
éé 
=
éé 
x
éé 
.
éé 

DocumentId
éé )
,
éé) *
DocumentName
èè 
=
èè 
x
èè  
.
èè  !
Document
èè! )
.
èè) *
Name
èè* .
,
èè. /
RequesterId
êê 
=
êê 
x
êê 
.
êê  
RequesterId
êê  +
,
êê+ ,
RequesterName
ëë 
=
ëë 
x
ëë  !
.
ëë! "
	Requester
ëë" +
.
ëë+ ,
UserName
ëë, 4
,
ëë4 5
RequestRead
íí 
=
íí 
x
íí 
.
íí  
RequestRead
íí  +
,
íí+ ,
RequestWrite
ìì 
=
ìì 
x
ìì  
.
ìì  !
RequestWrite
ìì! -
,
ìì- .
Message
îî 
=
îî 
x
îî 
.
îî 
Message
îî #
,
îî# $
RequestDelete
ïï 
=
ïï 
x
ïï  !
.
ïï! "
RequestDelete
ïï" /
,
ïï/ 0
Status
ññ 
=
ññ 
x
ññ 
.
ññ 
Status
ññ !
,
ññ! "
	CreatedAt
óó 
=
óó 
x
óó 
.
óó 
	CreatedAt
óó '
,
óó' (

DecisionAt
òò 
=
òò 
x
òò 
.
òò 

DecisionAt
òò )
,
òò) *
DecidedById
ôô 
=
ôô 
x
ôô 
.
ôô  
DecidedById
ôô  +
,
ôô+ ,
DecidedByName
öö 
=
öö 
x
öö  !
.
öö! "
	DecidedBy
öö" +
!=
öö, .
null
öö/ 3
?
öö4 5
x
öö6 7
.
öö7 8
	DecidedBy
öö8 A
.
ööA B
UserName
ööB J
:
ööK L
null
ööM Q
}
õõ 
)
õõ 
.
úú 
ToListAsync
úú 
(
úú 
)
úú 
;
úú 
return
ûû 
new
ûû %
AccessRequestPageResult
ûû *
{
üü 	
HasNextPage
†† 
=
†† 
total
†† 
>
††  
p
††! "
.
††" #
PageSize
††# +
*
††, -
p
††. /
.
††/ 0

PageNumber
††0 :
,
††: ;
HasPreviousPage
°° 
=
°° 
p
°° 
.
°° 

PageNumber
°° )
>
°°* +
$num
°°, -
,
°°- .
TotalPending
¢¢ 
=
¢¢ 
await
¢¢  
_ctx
¢¢! %
.
¢¢% &
AccessRequests
¢¢& 4
.
¢¢4 5

CountAsync
¢¢5 ?
(
¢¢? @
r
¢¢@ A
=>
¢¢B D
r
¢¢E F
.
¢¢F G
Status
¢¢G M
==
¢¢N P
$str
¢¢Q ]
)
¢¢] ^
,
¢¢^ _
TotalRejected
££ 
=
££ 
await
££ !
_ctx
££" &
.
££& '
AccessRequests
££' 5
.
££5 6

CountAsync
££6 @
(
££@ A
r
££A B
=>
££C E
r
££F G
.
££G H
Status
££H N
==
££O Q
$str
££R \
)
££\ ]
,
££] ^
TotalApproved
§§ 
=
§§ 
await
§§ !
_ctx
§§" &
.
§§& '
AccessRequests
§§' 5
.
§§5 6

CountAsync
§§6 @
(
§§@ A
r
§§A B
=>
§§C E
r
§§F G
.
§§G H
Status
§§H N
==
§§O Q
$str
§§R \
)
§§\ ]
,
§§] ^
Data
•• 
=
•• 
items
•• 
,
•• 

PageNumber
¶¶ 
=
¶¶ 
p
¶¶ 
.
¶¶ 

PageNumber
¶¶ %
,
¶¶% &
PageSize
ßß 
=
ßß 
p
ßß 
.
ßß 
PageSize
ßß !
,
ßß! "
TotalRecords
®® 
=
®® 
total
®®  
}
©© 	
;
©©	 

}
™™ 
public
¨¨ 

Task
¨¨ 
SaveChangesAsync
¨¨  
(
¨¨  !
)
¨¨! "
=>
¨¨# %
_ctx
¨¨& *
.
¨¨* +
SaveChangesAsync
¨¨+ ;
(
¨¨; <
)
¨¨< =
;
¨¨= >
public
ÆÆ 

async
ÆÆ 
Task
ÆÆ 
DeleteAsync
ÆÆ !
(
ÆÆ! "
int
ÆÆ" %
id
ÆÆ& (
)
ÆÆ( )
{
ØØ 
var
∞∞ 
accessRequest
∞∞ 
=
∞∞ 
await
∞∞ !
_ctx
∞∞" &
.
∞∞& '
AccessRequests
∞∞' 5
.
∞∞5 6
	FindAsync
∞∞6 ?
(
∞∞? @
id
∞∞@ B
)
∞∞B C
;
∞∞C D
_ctx
≤≤ 
.
≤≤ 
AccessRequests
≤≤ 
.
≤≤ 
Remove
≤≤ "
(
≤≤" #
accessRequest
≤≤# 0
)
≤≤0 1
;
≤≤1 2
}
¥¥ 
public
∂∂ 

Task
∂∂ 
<
∂∂ 
AccessRequestDto
∂∂  
>
∂∂  !
UpdateAsync
∂∂" -
(
∂∂- .
AccessRequest
∂∂. ;
entity
∂∂< B
)
∂∂B C
{
∑∑ 
_ctx
∏∏ 
.
∏∏ 
AccessRequests
∏∏ 
.
∏∏ 
Update
∏∏ "
(
∏∏" #
entity
∏∏# )
)
∏∏) *
;
∏∏* +
var
ππ 
dto
ππ 
=
ππ 
new
ππ 
AccessRequestDto
ππ &
{
∫∫ 	
Id
ªª 
=
ªª 
entity
ªª 
.
ªª 
Id
ªª 
,
ªª 

DocumentId
ºº 
=
ºº 
entity
ºº 
.
ºº  

DocumentId
ºº  *
,
ºº* +
RequesterId
ΩΩ 
=
ΩΩ 
entity
ΩΩ  
.
ΩΩ  !
RequesterId
ΩΩ! ,
,
ΩΩ, -
RequestRead
ææ 
=
ææ 
entity
ææ  
.
ææ  !
RequestRead
ææ! ,
,
ææ, -
RequestWrite
øø 
=
øø 
entity
øø !
.
øø! "
RequestWrite
øø" .
,
øø. /
RequestDelete
¿¿ 
=
¿¿ 
entity
¿¿ "
.
¿¿" #
RequestDelete
¿¿# 0
,
¿¿0 1
Message
¡¡ 
=
¡¡ 
entity
¡¡ 
.
¡¡ 
Message
¡¡ $
,
¡¡$ %
Status
¬¬ 
=
¬¬ 
entity
¬¬ 
.
¬¬ 
Status
¬¬ "
,
¬¬" #
	CreatedAt
√√ 
=
√√ 
entity
√√ 
.
√√ 
	CreatedAt
√√ (
,
√√( )

DecisionAt
ƒƒ 
=
ƒƒ 
entity
ƒƒ 
.
ƒƒ  

DecisionAt
ƒƒ  *
,
ƒƒ* +
DecidedById
≈≈ 
=
≈≈ 
entity
≈≈  
.
≈≈  !
DecidedById
≈≈! ,
}
∆∆ 	
;
∆∆	 

return
»» 
Task
»» 
.
»» 

FromResult
»» 
(
»» 
dto
»» "
)
»»" #
;
»»# $
}
…… 
public
ÀÀ 

Task
ÀÀ 
UpdateAsync
ÀÀ 
(
ÀÀ 
AccessRequestDto
ÀÀ ,
entity
ÀÀ- 3
)
ÀÀ3 4
{
ÃÃ 
throw
ÕÕ 
new
ÕÕ %
NotImplementedException
ÕÕ )
(
ÕÕ) *
)
ÕÕ* +
;
ÕÕ+ ,
}
ŒŒ 
public
—— 

async
—— 
Task
—— 
<
—— 
PagedResult
—— !
<
——! "
AccessRequestDto
——" 2
>
——2 3
>
——3 4&
GetRequestsByUserIdAsync
——5 M
(
——M N
string
——N T
userId
——U [
,
——[ \
PaginationParams
——] m
paginationParams
——n ~
)
——~ 
{
““ 
var
‘‘ 
q
‘‘ 
=
‘‘ 
_ctx
‘‘ 
.
‘‘ 
AccessRequests
‘‘ #
.
’’ 
Where
’’ 
(
’’ 
a
’’ 
=>
’’ 
a
’’ 
.
’’ 
RequesterId
’’ %
==
’’& (
userId
’’) /
)
’’/ 0
.
÷÷ 
AsQueryable
÷÷ 
(
÷÷ 
)
÷÷ 
;
÷÷ 
if
◊◊ 

(
◊◊ 
!
◊◊ 
string
◊◊ 
.
◊◊ 
IsNullOrEmpty
◊◊ !
(
◊◊! "
paginationParams
◊◊" 2
.
◊◊2 3
Search
◊◊3 9
)
◊◊9 :
)
◊◊: ;
{
ÿÿ 	
q
⁄⁄ 
=
⁄⁄ 
q
⁄⁄ 
.
⁄⁄ 
Where
⁄⁄ 
(
⁄⁄ 
a
⁄⁄ 
=>
⁄⁄ 
a
⁄⁄ 
.
⁄⁄ 
Document
⁄⁄ '
.
⁄⁄' (
Name
⁄⁄( ,
.
⁄⁄, -
ToLower
⁄⁄- 4
(
⁄⁄4 5
)
⁄⁄5 6
.
⁄⁄6 7
Contains
⁄⁄7 ?
(
⁄⁄? @
paginationParams
⁄⁄@ P
.
⁄⁄P Q
Search
⁄⁄Q W
.
⁄⁄W X
ToLower
⁄⁄X _
(
⁄⁄_ `
)
⁄⁄` a
)
⁄⁄a b
)
⁄⁄b c
;
⁄⁄c d
}
€€ 	
var
‹‹ 
total
‹‹ 
=
‹‹ 
await
‹‹ 
q
‹‹ 
.
‹‹ 

CountAsync
‹‹ &
(
‹‹& '
)
‹‹' (
;
‹‹( )
var
›› 
items
›› 
=
›› 
await
›› 
q
›› 
.
ﬁﬁ 
Skip
ﬁﬁ 
(
ﬁﬁ 
(
ﬁﬁ 
paginationParams
ﬁﬁ #
.
ﬁﬁ# $

PageNumber
ﬁﬁ$ .
-
ﬁﬁ/ 0
$num
ﬁﬁ1 2
)
ﬁﬁ2 3
*
ﬁﬁ4 5
paginationParams
ﬁﬁ6 F
.
ﬁﬁF G
PageSize
ﬁﬁG O
)
ﬁﬁO P
.
ﬂﬂ 
Take
ﬂﬂ 
(
ﬂﬂ 
paginationParams
ﬂﬂ "
.
ﬂﬂ" #
PageSize
ﬂﬂ# +
)
ﬂﬂ+ ,
.
‡‡ 
Select
‡‡ 
(
‡‡ 
x
‡‡ 
=>
‡‡ 
new
‡‡ 
AccessRequestDto
‡‡ -
{
·· 
Id
‚‚ 
=
‚‚ 
x
‚‚ 
.
‚‚ 
Id
‚‚ 
,
‚‚ 

DocumentId
„„ 
=
„„ 
x
„„ 
.
„„ 

DocumentId
„„ )
,
„„) *
DocumentName
‰‰ 
=
‰‰ 
x
‰‰  
.
‰‰  !
Document
‰‰! )
.
‰‰) *
Name
‰‰* .
,
‰‰. /
RequesterId
ÂÂ 
=
ÂÂ 
x
ÂÂ 
.
ÂÂ  
RequesterId
ÂÂ  +
,
ÂÂ+ ,
RequesterName
ÊÊ 
=
ÊÊ 
x
ÊÊ  !
.
ÊÊ! "
	Requester
ÊÊ" +
.
ÊÊ+ ,
UserName
ÊÊ, 4
,
ÊÊ4 5
RequestRead
ÁÁ 
=
ÁÁ 
x
ÁÁ 
.
ÁÁ  
RequestRead
ÁÁ  +
,
ÁÁ+ ,
Message
ËË 
=
ËË 
x
ËË 
.
ËË 
Message
ËË #
,
ËË# $
RequestWrite
ÈÈ 
=
ÈÈ 
x
ÈÈ  
.
ÈÈ  !
RequestWrite
ÈÈ! -
,
ÈÈ- .
RequestDelete
ÍÍ 
=
ÍÍ 
x
ÍÍ  !
.
ÍÍ! "
RequestDelete
ÍÍ" /
,
ÍÍ/ 0
Status
ÎÎ 
=
ÎÎ 
x
ÎÎ 
.
ÎÎ 
Status
ÎÎ !
,
ÎÎ! "
	CreatedAt
ÏÏ 
=
ÏÏ 
x
ÏÏ 
.
ÏÏ 
	CreatedAt
ÏÏ '
,
ÏÏ' (

DecisionAt
ÌÌ 
=
ÌÌ 
x
ÌÌ 
.
ÌÌ 

DecisionAt
ÌÌ )
,
ÌÌ) *
DecidedById
ÓÓ 
=
ÓÓ 
x
ÓÓ 
.
ÓÓ  
DecidedById
ÓÓ  +
,
ÓÓ+ ,
DecidedByName
ÔÔ 
=
ÔÔ 
x
ÔÔ  !
.
ÔÔ! "
	DecidedBy
ÔÔ" +
!=
ÔÔ, .
null
ÔÔ/ 3
?
ÔÔ4 5
x
ÔÔ6 7
.
ÔÔ7 8
	DecidedBy
ÔÔ8 A
.
ÔÔA B
UserName
ÔÔB J
:
ÔÔK L
null
ÔÔM Q
}
 
)
 
.
ÒÒ 
ToListAsync
ÒÒ 
(
ÒÒ 
)
ÒÒ 
;
ÒÒ 
return
ÙÙ 
new
ÙÙ 
PagedResult
ÙÙ 
<
ÙÙ 
AccessRequestDto
ÙÙ /
>
ÙÙ/ 0
{
ıı 	
Data
ˆˆ 
=
ˆˆ 
items
ˆˆ 
,
ˆˆ 

PageNumber
˜˜ 
=
˜˜ 
paginationParams
˜˜ )
.
˜˜) *

PageNumber
˜˜* 4
,
˜˜4 5
PageSize
¯¯ 
=
¯¯ 
paginationParams
¯¯ '
.
¯¯' (
PageSize
¯¯( 0
,
¯¯0 1
TotalRecords
˘˘ 
=
˘˘ 
total
˘˘  
}
˙˙ 	
;
˙˙	 

}
˚˚ 
}¸¸ Ÿn
\/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/AuthRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
;% &
public 
class 
AuthRepository 
: 
IAuth #
{ 
private 
readonly 
UserManager  
<  !
AppUser! (
>( )
_userManager* 6
;6 7
private 
readonly 
SignInManager "
<" #
AppUser# *
>* +
_signInManager, :
;: ;
private 
readonly 
AppDbContext !
_context" *
;* +
private 
readonly 
IGenerateToken #
generateToken$ 1
;1 2
public 

AuthRepository 
( 
AppDbContext &
context' .
,. /
UserManager0 ;
<; <
AppUser< C
>C D
userManagerE P
,P Q
SignInManagerR _
<_ `
AppUser` g
>g h
signInManageri v
,v w
IGenerateToken	x Ü
token
á å
)
å ç
{ 
_context 
= 
context 
; 
_userManager 
= 
userManager "
;" #
_signInManager 
= 
signInManager &
;& '
generateToken 
= 
token 
; 
} 
public 

async 
Task 
< 
string 
> 
RegisterAsync +
(+ ,
RegisterDTO, 7
registerDTO8 C
)C D
{   
if!! 

(!! 
registerDTO!! 
==!! 
null!! 
)!!  
{"" 	
return## 
null## 
;## 
}$$ 	
if%% 

(%% 
await%% 
_userManager%% 
.%% 
FindByNameAsync%% .
(%%. /
registerDTO%%/ :
.%%: ;
Username%%; C
)%%C D
is%%E G
not%%H K
null%%L P
)%%P Q
{&& 	
return'' 
$str'' 3
;''3 4
}(( 	
AppUser// 
user// 
=// 
new// 
AppUser// "
(//" #
)//# $
{00 	
DepartmentId11 
=11 
registerDTO11 &
.11& '
DepartmentId11' 3
,113 4
IsActive22 
=22 
true22 
,22 
	CreatedAt33 
=33 
DateTime33  
.33  !
UtcNow33! '
,33' (
	UpdatedAt44 
=44 
DateTime44  
.44  !
UtcNow44! '
,44' (
EmailConfirmed66 
=66 
true66 !
,66! "
UserName77 
=77 
registerDTO77 "
.77" #
Username77# +
,77+ ,
}:: 	
;::	 

var<< 
result<< 
=<< 
await<< 
_userManager<< '
.<<' (
CreateAsync<<( 3
(<<3 4
user<<4 8
,<<8 9
registerDTO<<: E
.<<E F
Password<<F N
)<<N O
;<<O P
if?? 

(?? 
result?? 
.?? 
Errors?? 
.?? 
Any?? 
(?? 
)?? 
)??  
{@@ 	
returnAA 
stringAA 
.AA 
JoinAA 
(AA 
$strAA #
,AA# $
resultAA% +
.AA+ ,
ErrorsAA, 2
.AA2 3
SelectAA3 9
(AA9 :
eAA: ;
=>AA< >
eAA? @
.AA@ A
DescriptionAAA L
)AAL M
)AAM N
;AAN O
}BB 	
stringCC 
codeCC 
=CC 
_userManagerCC "
.CC" #/
#GenerateEmailConfirmationTokenAsyncCC# F
(CCF G
userCCG K
)CCK L
.CCL M
ResultCCM S
;CCS T
returnFF 
$strFF 
;FF 
}GG 
publicWW 

asyncWW 
TaskWW 
<WW 
stringWW 
>WW 

LoginAsyncWW (
(WW( )
LoginDTOWW) 1
loginDTOWW2 :
)WW: ;
{XX 
ifYY 

(YY 
loginDTOYY 
==YY 
nullYY 
)YY 
{ZZ 	
Console[[ 
.[[ 
	WriteLine[[ 
([[ 
$str[[ 0
)[[0 1
;[[1 2
return\\ 
null\\ 
;\\ 
}]] 	
Console^^ 
.^^ 
	WriteLine^^ 
(^^ 
$"^^ 
$str^^ 1
{^^1 2
loginDTO^^2 :
.^^: ;
Cin^^; >
}^^> ?
$str^^? K
{^^K L
loginDTO^^L T
.^^T U
Password^^U ]
}^^] ^
"^^^ _
)^^_ `
;^^` a
var`` 
cin`` 
=`` 
loginDTO`` 
.`` 
Cin`` 
;`` 
varaa 
useraa 
=aa 
awaitaa 
_contextaa !
.aa! "
Usersaa" '
.aa' (
Whereaa( -
(aa- .
uaa. /
=>aa0 2
uaa3 4
.aa4 5
Cinaa5 8
==aa9 ;
cinaa< ?
)aa? @
.aa@ A
FirstOrDefaultAsyncaaA T
(aaT U
)aaU V
;aaV W
varbb 
rolesbb 
=bb 
awaitbb 
_userManagerbb &
.bb& '
GetRolesAsyncbb' 4
(bb4 5
userbb5 9
)bb9 :
;bb: ;
foreachdd 
(dd 
vardd 
itemdd 
indd 
rolesdd "
)dd" #
{ee 	
Consoleff 
.ff 
	WriteLineff 
(ff 
$"ff  
$strff  /
{ff/ 0
cinff0 3
}ff3 4
$strff4 ?
{ff? @
itemff@ D
}ffD E
$str	ffE å
"
ffå ç
)
ffç é
;
ffé è
}gg 	
ifii 

(ii 
userii 
==ii 
nullii 
)ii 
{jj 	
Consolekk 
.kk 
	WriteLinekk 
(kk 
$"kk  
$strkk  8
{kk8 9
cinkk9 <
}kk< =
"kk= >
)kk> ?
;kk? @
returnmm 
$strmm ,
;mm, -
}nn 	
varpp 
resultpp 
=pp 
awaitpp 
_signInManagerpp )
.pp) *$
CheckPasswordSignInAsyncpp* B
(ppB C
userppC G
,ppG H
loginDTOppI Q
.ppQ R
PasswordppR Z
,ppZ [
falsepp\ a
)ppa b
;ppb c
ifrr 

(rr 
!rr 
resultrr 
.rr 
	Succeededrr 
)rr 
{ss 	
returntt 
$strtt ,
;tt, -
}uu 	
elsevv 
{ww 	
returnxx 
awaitxx 
generateTokenxx &
.xx& '
GetAndCreateTokenxx' 8
(xx8 9
userxx9 =
,xx= >
rolesxx? D
[xxD E
$numxxE F
]xxF G
)xxG H
;xxH I
}yy 	
}zz 
public|| 

async|| 
Task|| 
<|| 
bool|| 
>|| "
SendEailForgetPassword|| 2
(||2 3
string||3 9
email||: ?
)||? @
{}} 
var~~ 
user~~ 
=~~ 
await~~ 
_userManager~~ %
.~~% &
FindByEmailAsync~~& 6
(~~6 7
email~~7 <
)~~< =
;~~= >
if 

( 
user 
is 
null 
) 
{
ÄÄ 	
return
ÅÅ 
false
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
var
ÉÉ 
token
ÉÉ 
=
ÉÉ 
await
ÉÉ 
_userManager
ÉÉ &
.
ÉÉ& '-
GeneratePasswordResetTokenAsync
ÉÉ' F
(
ÉÉF G
user
ÉÉG K
)
ÉÉK L
;
ÉÉL M
return
ÖÖ 
true
ÖÖ 
;
ÖÖ 
}
ÜÜ 
public
àà 

async
àà 
Task
àà 
<
àà 
string
àà 
>
àà 
ConfirmEmailAsync
àà /
(
àà/ 0
string
àà0 6
email
àà7 <
,
àà< =
string
àà> D
code
ààE I
)
ààI J
{
ââ 
var
ää 
user
ää 
=
ää 
await
ää 
_userManager
ää %
.
ää% &
FindByEmailAsync
ää& 6
(
ää6 7
email
ää7 <
)
ää< =
;
ää= >
if
ãã 

(
ãã 
user
ãã 
==
ãã 
null
ãã 
)
ãã 
{
åå 	
return
çç 
$str
çç #
;
çç# $
}
éé 	
var
êê 
result
êê 
=
êê 
await
êê 
_userManager
êê '
.
êê' (
ConfirmEmailAsync
êê( 9
(
êê9 :
user
êê: >
,
êê> ?
code
êê@ D
)
êêD E
;
êêE F
if
ëë 

(
ëë 
result
ëë 
.
ëë 
	Succeeded
ëë 
)
ëë 
{
íí 	
return
ìì 
$str
ìì 1
;
ìì1 2
}
îî 	
else
ïï 
{
ññ 	
return
óó 
$str
óó -
+
óó. /
string
óó0 6
.
óó6 7
Join
óó7 ;
(
óó; <
$str
óó< @
,
óó@ A
result
óóB H
.
óóH I
Errors
óóI O
.
óóO P
Select
óóP V
(
óóV W
e
óóW X
=>
óóY [
e
óó\ ]
.
óó] ^
Description
óó^ i
)
óói j
)
óój k
;
óók l
}
òò 	
}
ôô 
public
õõ 

async
õõ 
Task
õõ 
<
õõ 
string
õõ 
>
õõ 
ResetPassword
õõ +
(
õõ+ ,
ResetPasswordDTO
õõ, <
resetPasswordDTO
õõ= M
)
õõM N
{
úú 
var
ùù 
findUser
ùù 
=
ùù 
await
ùù 
_context
ùù %
.
ùù% &
Users
ùù& +
.
ùù+ ,
Where
ùù, 1
(
ùù1 2
u
ùù2 3
=>
ùù4 6
u
ùù7 8
.
ùù8 9
Cin
ùù9 <
==
ùù= ?
resetPasswordDTO
ùù@ P
.
ùùP Q
Cin
ùùQ T
)
ùùT U
.
ùùU V

FirstAsync
ùùV `
(
ùù` a
)
ùùa b
;
ùùb c
if
ûû 

(
ûû 
findUser
ûû 
==
ûû 
null
ûû 
)
ûû 
{
üü 	
return
†† 
$str
†† #
;
††# $
}
°° 	
var
££ 
result
££ 
=
££ 
await
££ 
_userManager
££ '
.
££' ( 
ResetPasswordAsync
££( :
(
££: ;
findUser
££; C
,
££C D
resetPasswordDTO
££E U
.
££U V
token
££V [
,
££[ \
resetPasswordDTO
££] m
.
££m n
Password
££n v
)
££v w
;
££w x
if
•• 

(
•• 
result
•• 
.
•• 
	Succeeded
•• 
)
•• 
{
¶¶ 	
return
ßß 
$str
ßß 0
;
ßß0 1
}
®® 	
else
©© 
{
™™ 	
return
´´ 
$str
´´ /
+
´´0 1
string
´´2 8
.
´´8 9
Join
´´9 =
(
´´= >
$str
´´> B
,
´´B C
result
´´D J
.
´´J K
Errors
´´K Q
.
´´Q R
Select
´´R X
(
´´X Y
e
´´Y Z
=>
´´[ ]
e
´´^ _
.
´´_ `
Description
´´` k
)
´´k l
)
´´l m
;
´´m n
}
¨¨ 	
}
≠≠ 
public
ØØ 

async
ØØ 
Task
ØØ 
<
ØØ 
bool
ØØ 
>
ØØ 
ActiveAccount
ØØ )
(
ØØ) *
ActiveAccountDTO
ØØ* :
activeAccountDTO
ØØ; K
)
ØØK L
{
∞∞ 
var
≤≤ 
findUser
≤≤ 
=
≤≤ 
await
≤≤ 
_context
≤≤ %
.
≤≤% &
Users
≤≤& +
.
≤≤+ ,
Where
≤≤, 1
(
≤≤1 2
u
≤≤2 3
=>
≤≤4 6
u
≤≤7 8
.
≤≤8 9
Cin
≤≤9 <
==
≤≤= ?
activeAccountDTO
≤≤@ P
.
≤≤P Q
Cin
≤≤Q T
)
≤≤T U
.
≤≤U V

FirstAsync
≤≤V `
(
≤≤` a
)
≤≤a b
;
≤≤b c
Console
¥¥ 
.
¥¥ 
	WriteLine
¥¥ 
(
¥¥ 
$str
¥¥ "
+
¥¥# $
activeAccountDTO
¥¥% 5
)
¥¥5 6
;
¥¥6 7
if
µµ 

(
µµ 
findUser
µµ 
is
µµ 
null
µµ 
)
µµ 
{
∂∂ 	
return
∑∑ 
false
∑∑ 
;
∑∑ 
}
∏∏ 	
var
øø 
token
øø 
=
øø 
await
øø 
_userManager
øø &
.
øø& '1
#GenerateEmailConfirmationTokenAsync
øø' J
(
øøJ K
findUser
øøK S
)
øøS T
;
øøT U
Console
¿¿ 
.
¿¿ 
	WriteLine
¿¿ 
(
¿¿ 
$str
¿¿ *
+
¿¿+ ,
findUser
¿¿- 5
.
¿¿5 6
EmailConfirmed
¿¿6 D
)
¿¿D E
;
¿¿E F
Console
¡¡ 
.
¡¡ 
	WriteLine
¡¡ 
(
¡¡ 
$str
¡¡ #
+
¡¡$ %
token
¡¡& +
)
¡¡+ ,
;
¡¡, -
return
«« 
false
«« 
;
«« 
}
»» 
}…… ¿ü
b/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/DepartmentRepository.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
;

% &
public 
class  
DepartmentRepository !
:" #
GenericRepository$ 5
<5 6

Department6 @
>@ A
,A B!
IDepartmentRepositoryC X
{ 
private 
readonly 
AppDbContext !
_context" *
;* +
public 
 
DepartmentRepository 
(  
AppDbContext  ,
context- 4
)4 5
:6 7
base8 <
(< =
context= D
)D E
{ 
_context 
= 
context 
?? 
throw #
new$ '!
ArgumentNullException( =
(= >
nameof> D
(D E
contextE L
)L M
)M N
;N O
} 
public 

async 
Task 
< 
PagedResult !
<! "

Department" ,
>, -
>- .
GetPageAsync/ ;
(; <
DepartmentFilterDto< O
filterP V
)V W
{ 
var 
query 
= 
_context 
. 
Departments (
. 	
AsQueryable	 
( 
) 
; 
query 
= 
ApplyFilters 
( 
query "
," #
filter$ *
)* +
;+ ,
var!! 
totalRecords!! 
=!! 
await!!  
query!!! &
.!!& '

CountAsync!!' 1
(!!1 2
)!!2 3
;!!3 4
query$$ 
=$$ 
ApplySorting$$ 
($$ 
query$$ "
,$$" #
filter$$$ *
.$$* +
SortBy$$+ 1
,$$1 2
filter$$3 9
.$$9 :
SortDirection$$: G
)$$G H
;$$H I
var'' 
departments'' 
='' 
await'' 
query''  %
.(( 
Include(( 
((( 
d(( 
=>(( 
d(( 
.(( 
Users(( !
)((! "
.)) 
Include)) 
()) 
d)) 
=>)) 
d)) 
.)) 
Folders)) #
)))# $
.** 
Include** 
(** 
d** 
=>** 
d** 
.** 
DocumentRequests** ,
)**, -
.++ 
Skip++ 
(++ 
(++ 
filter++ 
.++ 

PageNumber++ $
-++% &
$num++' (
)++( )
*++* +
filter++, 2
.++2 3
PageSize++3 ;
)++; <
.,, 
Take,, 
(,, 
filter,, 
.,, 
PageSize,, !
),,! "
.-- 
ToListAsync-- 
(-- 
)-- 
;-- 
return// 
departments// 
.// 
ToPagedResult// (
(//( )
filter00 
.00 

PageNumber00 
,00 
filter11 
.11 
PageSize11 
,11 
totalRecords22 
,22 
filter33 
.33 
Search33 
,33 
filter44 
.44 
SortBy44 
,44 
filter55 
.55 
SortDirection55  
)66 	
;66	 

}77 
public88 

async88 
Task88 
<88 

Department88  
>88  !
AddAsync88" *
(88* +

Department88+ 5

department886 @
)88@ A
{99 
if:: 

(:: 

department:: 
==:: 
null:: 
):: 
throw;; 
new;; !
ArgumentNullException;; +
(;;+ ,
nameof;;, 2
(;;2 3

department;;3 =
);;= >
,;;> ?
$str;;@ [
);;[ \
;;;\ ]

department== 
.== 
	CreatedAt== 
=== 
DateTime== '
.==' (
UtcNow==( .
;==. /

department>> 
.>> 
	UpdatedAt>> 
=>> 
DateTime>> '
.>>' (
UtcNow>>( .
;>>. /
var@@ 
result@@ 
=@@ 
await@@ 
_context@@ #
.@@# $
Departments@@$ /
.@@/ 0
AddAsync@@0 8
(@@8 9

department@@9 C
)@@C D
;@@D E
returnAA 
resultAA 
.AA 
EntityAA 
;AA 
}BB 
publicDD 

asyncDD 
TaskDD 
DeleteAsyncDD !
(DD! "
intDD" %
idDD& (
)DD( )
{EE 
varFF 

departmentFF 
=FF 
awaitFF 
_contextFF '
.FF' (
DepartmentsFF( 3
.FF3 4
	FindAsyncFF4 =
(FF= >
idFF> @
)FF@ A
;FFA B
ifGG 

(GG 

departmentGG 
==GG 
nullGG 
)GG 
throwHH 
newHH 
ArgumentExceptionHH '
(HH' (
$"HH( *
$strHH* =
{HH= >
idHH> @
}HH@ A
$strHHA K
"HHK L
)HHL M
;HHM N
_contextJJ 
.JJ 
DepartmentsJJ 
.JJ 
RemoveJJ #
(JJ# $

departmentJJ$ .
)JJ. /
;JJ/ 0
}KK 
publicMM 

asyncMM 
TaskMM 
<MM 
IReadOnlyListMM #
<MM# $

DepartmentMM$ .
>MM. /
>MM/ 0
GetAllAsyncMM1 <
(MM< =
)MM= >
{NN 
returnOO 
awaitOO 
_contextOO 
.OO 
DepartmentsOO )
.PP 
IncludePP 
(PP 
dPP 
=>PP 
dPP 
.PP 
UsersPP !
)PP! "
.QQ 
IncludeQQ 
(QQ 
dQQ 
=>QQ 
dQQ 
.QQ 
FoldersQQ #
)QQ# $
.RR 
IncludeRR 
(RR 
dRR 
=>RR 
dRR 
.RR 
DocumentRequestsRR ,
)RR, -
.SS 
OrderBySS 
(SS 
dSS 
=>SS 
dSS 
.SS 
NameSS  
)SS  !
.TT 
ToListAsyncTT 
(TT 
)TT 
;TT 
}UU 
publicWW 

asyncWW 
TaskWW 
<WW 

DepartmentWW  
?WW  !
>WW! "
GetByIdAsyncWW# /
(WW/ 0
intWW0 3
idWW4 6
)WW6 7
{XX 
returnYY 
awaitYY 
_contextYY 
.YY 
DepartmentsYY )
.ZZ 
IncludeZZ 
(ZZ 
dZZ 
=>ZZ 
dZZ 
.ZZ 
UsersZZ !
)ZZ! "
.[[ 
Include[[ 
([[ 
d[[ 
=>[[ 
d[[ 
.[[ 
Folders[[ #
)[[# $
.\\ 
Include\\ 
(\\ 
d\\ 
=>\\ 
d\\ 
.\\ 
DocumentRequests\\ ,
)\\, -
.]] 
FirstOrDefaultAsync]]  
(]]  !
d]]! "
=>]]# %
d]]& '
.]]' (
Id]]( *
==]]+ -
id]]. 0
)]]0 1
;]]1 2
}^^ 
public`` 

async`` 
Task`` 
<`` 

Department``  
?``  !
>``! "
GetByNameAsync``# 1
(``1 2
string``2 8
name``9 =
)``= >
{aa 
ifbb 

(bb 
stringbb 
.bb 
IsNullOrEmptybb  
(bb  !
namebb! %
)bb% &
)bb& '
returncc 
nullcc 
;cc 
returnee 
awaitee 
_contextee 
.ee 
Departmentsee )
.ff 
FirstOrDefaultAsyncff  
(ff  !
dff! "
=>ff# %
dff& '
.ff' (
Nameff( ,
.ff, -
ToLowerff- 4
(ff4 5
)ff5 6
==ff7 9
nameff: >
.ff> ?
ToLowerff? F
(ffF G
)ffG H
)ffH I
;ffI J
}gg 
publicii 

asyncii 
Taskii 
UpdateAsyncii !
(ii! "

Departmentii" ,

departmentii- 7
)ii7 8
{jj 
ifkk 

(kk 

departmentkk 
==kk 
nullkk 
)kk 
throwll 
newll !
ArgumentNullExceptionll +
(ll+ ,
nameofll, 2
(ll2 3

departmentll3 =
)ll= >
,ll> ?
$strll@ [
)ll[ \
;ll\ ]

departmentnn 
.nn 
	UpdatedAtnn 
=nn 
DateTimenn '
.nn' (
UtcNownn( .
;nn. /
_contextoo 
.oo 
Departmentsoo 
.oo 
Updateoo #
(oo# $

departmentoo$ .
)oo. /
;oo/ 0
}pp 
publicrr 

asyncrr 
Taskrr 
<rr 
boolrr 
>rr 
ExistsAsyncrr '
(rr' (
intrr( +
idrr, .
)rr. /
{ss 
returntt 
awaittt 
_contexttt 
.tt 
Departmentstt )
.tt) *
AnyAsynctt* 2
(tt2 3
dtt3 4
=>tt5 7
dtt8 9
.tt9 :
Idtt: <
==tt= ?
idtt@ B
)ttB C
;ttC D
}uu 
publicww 

asyncww 
Taskww 
<ww 
boolww 
>ww 
ExistsByNameAsyncww -
(ww- .
stringww. 4
nameww5 9
)ww9 :
{xx 
ifyy 

(yy 
stringyy 
.yy 
IsNullOrEmptyyy  
(yy  !
nameyy! %
)yy% &
)yy& '
returnzz 
falsezz 
;zz 
return|| 
await|| 
_context|| 
.|| 
Departments|| )
.}} 
AnyAsync}} 
(}} 
d}} 
=>}} 
d}} 
.}} 
Name}} !
.}}! "
ToLower}}" )
(}}) *
)}}* +
==}}, .
name}}/ 3
.}}3 4
ToLower}}4 ;
(}}; <
)}}< =
)}}= >
;}}> ?
}~~ 
public
ÄÄ 

async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
IReadOnlyList
ÄÄ #
<
ÄÄ# $

Department
ÄÄ$ .
>
ÄÄ. /
>
ÄÄ/ 0#
GetWithUserCountAsync
ÄÄ1 F
(
ÄÄF G
)
ÄÄG H
{
ÅÅ 
return
ÇÇ 
await
ÇÇ 
_context
ÇÇ 
.
ÇÇ 
Departments
ÇÇ )
.
ÉÉ 
Include
ÉÉ 
(
ÉÉ 
d
ÉÉ 
=>
ÉÉ 
d
ÉÉ 
.
ÉÉ 
Users
ÉÉ !
)
ÉÉ! "
.
ÑÑ 
OrderBy
ÑÑ 
(
ÑÑ 
d
ÑÑ 
=>
ÑÑ 
d
ÑÑ 
.
ÑÑ 
Name
ÑÑ  
)
ÑÑ  !
.
ÖÖ 
ToListAsync
ÖÖ 
(
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 
private
àà 

IQueryable
àà 
<
àà 

Department
àà !
>
àà! "
ApplyFilters
àà# /
(
àà/ 0

IQueryable
àà0 :
<
àà: ;

Department
àà; E
>
ààE F
query
ààG L
,
ààL M!
DepartmentFilterDto
ààN a
filter
ààb h
)
ààh i
{
ââ 
if
ää 

(
ää 
!
ää 
string
ää 
.
ää 
IsNullOrEmpty
ää !
(
ää! "
filter
ää" (
.
ää( )
Name
ää) -
)
ää- .
)
ää. /
query
ãã 
=
ãã 
query
ãã 
.
ãã 
Where
ãã 
(
ãã  
d
ãã  !
=>
ãã" $
d
ãã% &
.
ãã& '
Name
ãã' +
.
ãã+ ,
Contains
ãã, 4
(
ãã4 5
filter
ãã5 ;
.
ãã; <
Name
ãã< @
)
ãã@ A
)
ããA B
;
ããB C
if
çç 

(
çç 
filter
çç 
.
çç 
CreatedFrom
çç 
.
çç 
HasValue
çç '
)
çç' (
query
éé 
=
éé 
query
éé 
.
éé 
Where
éé 
(
éé  
d
éé  !
=>
éé" $
d
éé% &
.
éé& '
	CreatedAt
éé' 0
>=
éé1 3
filter
éé4 :
.
éé: ;
CreatedFrom
éé; F
)
ééF G
;
ééG H
if
êê 

(
êê 
filter
êê 
.
êê 
	CreatedTo
êê 
.
êê 
HasValue
êê %
)
êê% &
query
ëë 
=
ëë 
query
ëë 
.
ëë 
Where
ëë 
(
ëë  
d
ëë  !
=>
ëë" $
d
ëë% &
.
ëë& '
	CreatedAt
ëë' 0
<=
ëë1 3
filter
ëë4 :
.
ëë: ;
	CreatedTo
ëë; D
)
ëëD E
;
ëëE F
if
ìì 

(
ìì 
!
ìì 
string
ìì 
.
ìì 
IsNullOrEmpty
ìì !
(
ìì! "
filter
ìì" (
.
ìì( )
Search
ìì) /
)
ìì/ 0
)
ìì0 1
{
îî 	
query
ïï 
=
ïï 
query
ïï 
.
ïï 
Where
ïï 
(
ïï  
d
ïï  !
=>
ïï" $
d
ññ 
.
ññ 
Name
ññ 
.
ññ 
Contains
ññ 
(
ññ  
filter
ññ  &
.
ññ& '
Search
ññ' -
)
ññ- .
||
ññ/ 1
d
óó 
.
óó 
Description
óó 
.
óó 
Contains
óó &
(
óó& '
filter
óó' -
.
óó- .
Search
óó. 4
)
óó4 5
)
òò 
;
òò 
}
ôô 	
return
ûû 
query
ûû 
;
ûû 
}
üü 
private
°° 

IQueryable
°° 
<
°° 

Department
°° !
>
°°! "
ApplySorting
°°# /
(
°°/ 0

IQueryable
°°0 :
<
°°: ;

Department
°°; E
>
°°E F
query
°°G L
,
°°L M
string
°°N T
?
°°T U
sortBy
°°V \
,
°°\ ]
string
°°^ d
?
°°d e
sortDirection
°°f s
)
°°s t
{
¢¢ 
if
££ 

(
££ 
string
££ 
.
££ 
IsNullOrEmpty
££  
(
££  !
sortBy
££! '
)
££' (
)
££( )
return
§§ 
query
§§ 
.
§§ 
OrderBy
§§  
(
§§  !
d
§§! "
=>
§§# %
d
§§& '
.
§§' (
Name
§§( ,
)
§§, -
;
§§- .
var
¶¶ 
isDescending
¶¶ 
=
¶¶ 
sortDirection
¶¶ (
?
¶¶( )
.
¶¶) *
ToLower
¶¶* 1
(
¶¶1 2
)
¶¶2 3
==
¶¶4 6
$str
¶¶7 =
;
¶¶= >
return
®® 
sortBy
®® 
.
®® 
ToLower
®® 
(
®® 
)
®® 
switch
®®  &
{
©© 	
$str
™™ 
=>
™™ 
isDescending
™™ "
?
™™# $
query
™™% *
.
™™* +
OrderByDescending
™™+ <
(
™™< =
d
™™= >
=>
™™? A
d
™™B C
.
™™C D
Name
™™D H
)
™™H I
:
´´# $
query
´´% *
.
´´* +
OrderBy
´´+ 2
(
´´2 3
d
´´3 4
=>
´´5 7
d
´´8 9
.
´´9 :
Name
´´: >
)
´´> ?
,
´´? @
$str
¨¨ 
=>
¨¨ 
isDescending
¨¨ )
?
¨¨* +
query
¨¨, 1
.
¨¨1 2
OrderByDescending
¨¨2 C
(
¨¨C D
d
¨¨D E
=>
¨¨F H
d
¨¨I J
.
¨¨J K
Description
¨¨K V
)
¨¨V W
:
≠≠* +
query
≠≠, 1
.
≠≠1 2
OrderBy
≠≠2 9
(
≠≠9 :
d
≠≠: ;
=>
≠≠< >
d
≠≠? @
.
≠≠@ A
Description
≠≠A L
)
≠≠L M
,
≠≠M N
$str
ÆÆ 
=>
ÆÆ 
isDescending
ÆÆ '
?
ÆÆ( )
query
ÆÆ* /
.
ÆÆ/ 0
OrderByDescending
ÆÆ0 A
(
ÆÆA B
d
ÆÆB C
=>
ÆÆD F
d
ÆÆG H
.
ÆÆH I
	CreatedAt
ÆÆI R
)
ÆÆR S
:
ØØ( )
query
ØØ* /
.
ØØ/ 0
OrderBy
ØØ0 7
(
ØØ7 8
d
ØØ8 9
=>
ØØ: <
d
ØØ= >
.
ØØ> ?
	CreatedAt
ØØ? H
)
ØØH I
,
ØØI J
$str
∞∞ 
=>
∞∞ 
isDescending
∞∞ '
?
∞∞( )
query
∞∞* /
.
∞∞/ 0
OrderByDescending
∞∞0 A
(
∞∞A B
d
∞∞B C
=>
∞∞D F
d
∞∞G H
.
∞∞H I
	UpdatedAt
∞∞I R
)
∞∞R S
:
±±( )
query
±±* /
.
±±/ 0
OrderBy
±±0 7
(
±±7 8
d
±±8 9
=>
±±: <
d
±±= >
.
±±> ?
	UpdatedAt
±±? H
)
±±H I
,
±±I J
_
≤≤ 
=>
≤≤ 
query
≤≤ 
.
≤≤ 
OrderBy
≤≤ 
(
≤≤ 
d
≤≤  
=>
≤≤! #
d
≤≤$ %
.
≤≤% &
Name
≤≤& *
)
≤≤* +
}
≥≥ 	
;
≥≥	 

}
¥¥ 
public
∂∂ 

async
∂∂ 
Task
∂∂ 
<
∂∂ 
IEnumerable
∂∂ !
<
∂∂! "!
DepartmentSearchDTO
∂∂" 5
>
∂∂5 6
>
∂∂6 7
SearchAsync
∂∂8 C
(
∂∂C D
string
∂∂D J

searchTerm
∂∂K U
)
∂∂U V
{
∑∑ 

IQueryable
∏∏ 
<
∏∏ 

Department
∏∏ 
>
∏∏ 
query
∏∏ $
=
∏∏% &
_context
∏∏' /
.
∏∏/ 0
Departments
∏∏0 ;
;
∏∏; <
string
ππ 
newSearchTerm
ππ 
=
ππ 

searchTerm
ππ )
.
ππ) *
ToLower
ππ* 1
(
ππ1 2
)
ππ2 3
;
ππ3 4
if
ªª 

(
ªª 
!
ªª 
string
ªª 
.
ªª 
IsNullOrEmpty
ªª !
(
ªª! "

searchTerm
ªª" ,
)
ªª, -
)
ªª- .
{
ºº 	
query
ΩΩ 
=
ΩΩ 
query
ΩΩ 
.
ΩΩ 
Where
ΩΩ 
(
ΩΩ  
d
ΩΩ  !
=>
ΩΩ" $
d
ΩΩ% &
.
ΩΩ& '
Name
ΩΩ' +
.
ΩΩ+ ,
ToLower
ΩΩ, 3
(
ΩΩ3 4
)
ΩΩ4 5
.
ΩΩ5 6
Contains
ΩΩ6 >
(
ΩΩ> ?

searchTerm
ΩΩ? I
.
ΩΩI J
ToLower
ΩΩJ Q
(
ΩΩQ R
)
ΩΩR S
)
ΩΩS T
)
ΩΩT U
;
ΩΩU V
}
ææ 	
var
¡¡ 
departments
¡¡ 
=
¡¡ 
await
¡¡ 
query
¡¡  %
.
¬¬ 
Select
¬¬ 
(
¬¬ 
d
¬¬ 
=>
¬¬ 
new
¬¬ !
DepartmentSearchDTO
¬¬ 0
{
√√ 
Id
ƒƒ 
=
ƒƒ 
d
ƒƒ 
.
ƒƒ 
Id
ƒƒ 
,
ƒƒ 
Name
≈≈ 
=
≈≈ 
d
≈≈ 
.
≈≈ 
Name
≈≈ 
,
≈≈ 
Description
∆∆ 
=
∆∆ 
d
∆∆ 
.
∆∆  
Description
∆∆  +
}
«« 
)
«« 
.
»» 
ToListAsync
»» 
(
»» 
)
»» 
;
»» 
return
   
departments
   
;
   
}
ÀÀ 
}ÃÃ ó™
b/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/DocRequestRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
;% &
public		 
class		  
DocRequestRepository		 !
:		" #
GenericRepository		$ 5
<		5 6
DocumentRequest		6 E
>		E F
,		F G!
IDocRequestRepository		H ]
{

 
private 
readonly 
AppDbContext !
_context" *
;* +
public 
 
DocRequestRepository 
(  
AppDbContext  ,
context- 4
)4 5
:6 7
base8 <
(< =
context= D
)D E
{ 
_context 
= 
context 
?? 
throw #
new$ '!
ArgumentNullException( =
(= >
nameof> D
(D E
contextE L
)L M
)M N
;N O
} 
public 

async 
Task 
< 
PagedResult !
<! "
DocumentRequest" 1
>1 2
>2 3
GetPagedAsync4 A
(A B$
DocumentRequestFilterDTOB Z
filter[ a
)a b
{ 
var 
query 
= 
_context 
. 
DocumentRequests -
. 
Include 
( 
dr 
=> 
dr 
. 
	Requester '
)' (
. 
Include 
( 
dr 
=> 
dr 
. 

Department (
)( )
. 
Include 
( 
dr 
=> 
dr 
. 
ResponseDocument .
). /
. 
Include 
( 
dr 
=> 
dr 
. 
ProcessedBy )
)) *
. 
AsQueryable 
( 
) 
; 
if"" 

("" 
filter"" 
."" 
DepartmentId"" 
.""  
HasValue""  (
)""( )
{## 	
query$$ 
=$$ 
query$$ 
.$$ 
Where$$ 
($$  
dr$$  "
=>$$# %
dr$$& (
.$$( )
DepartmentId$$) 5
==$$6 8
filter$$9 ?
.$$? @
DepartmentId$$@ L
.$$L M
Value$$M R
)$$R S
;$$S T
}%% 	
if'' 

('' 
!'' 
string'' 
.'' 
IsNullOrEmpty'' !
(''! "
filter''" (
.''( )
DocumentType'') 5
)''5 6
)''6 7
{(( 	
query)) 
=)) 
query)) 
.)) 
Where)) 
())  
dr))  "
=>))# %
dr))& (
.))( )
DocumentType))) 5
.))5 6
Contains))6 >
())> ?
filter))? E
.))E F
DocumentType))F R
)))R S
)))S T
;))T U
}** 	
if,, 

(,, 
!,, 
string,, 
.,, 
IsNullOrEmpty,, !
(,,! "
filter,," (
.,,( )
Priority,,) 1
),,1 2
),,2 3
{-- 	
query.. 
=.. 
query.. 
... 
Where.. 
(..  
dr..  "
=>..# %
dr..& (
...( )
Priority..) 1
==..2 4
filter..5 ;
...; <
Priority..< D
)..D E
;..E F
}// 	
if11 

(11 
!11 
string11 
.11 
IsNullOrEmpty11 !
(11! "
filter11" (
.11( )
Status11) /
)11/ 0
)110 1
{22 	
query33 
=33 
query33 
.33 
Where33 
(33  
dr33  "
=>33# %
dr33& (
.33( )
Status33) /
==330 2
filter333 9
.339 :
Status33: @
)33@ A
;33A B
}44 	
if66 

(66 
filter66 
.66 
RequestedFrom66  
.66  !
HasValue66! )
)66) *
{77 	
query88 
=88 
query88 
.88 
Where88 
(88  
dr88  "
=>88# %
dr88& (
.88( )
RequestedAt88) 4
>=885 7
filter888 >
.88> ?
RequestedFrom88? L
.88L M
Value88M R
)88R S
;88S T
}99 	
if;; 

(;; 
filter;; 
.;; 
RequestedTo;; 
.;; 
HasValue;; '
);;' (
{<< 	
query== 
=== 
query== 
.== 
Where== 
(==  
dr==  "
=>==# %
dr==& (
.==( )
RequestedAt==) 4
<===5 7
filter==8 >
.==> ?
RequestedTo==? J
.==J K
Value==K P
)==P Q
;==Q R
}>> 	
ifEE 

(EE 
!EE 
stringEE 
.EE 
IsNullOrEmptyEE !
(EE! "
filterEE" (
.EE( )
SearchEE) /
)EE/ 0
)EE0 1
{FF 	
queryGG 
=GG 
queryGG 
.GG 
WhereGG 
(GG  
drGG  "
=>GG# %
drHH 
.HH 
DocumentTypeHH 
.HH  
ContainsHH  (
(HH( )
filterHH) /
.HH/ 0
SearchHH0 6
)HH6 7
||HH8 :
drII 
.II 
DescriptionII 
.II 
ContainsII '
(II' (
filterII( .
.II. /
SearchII/ 5
)II5 6
||II7 9
drKK 
.KK 

DepartmentKK 
.KK 
NameKK "
.KK" #
ContainsKK# +
(KK+ ,
filterKK, 2
.KK2 3
SearchKK3 9
)KK9 :
)KK: ;
;KK; <
}LL 	
queryOO 
=OO 
ApplySortingOO 
(OO 
queryOO "
,OO" #
filterOO$ *
.OO* +
SortByOO+ 1
,OO1 2
filterOO3 9
.OO9 :
SortDirectionOO: G
)OOG H
;OOH I
varQQ 
totalRecordsQQ 
=QQ 
awaitQQ  
queryQQ! &
.QQ& '

CountAsyncQQ' 1
(QQ1 2
)QQ2 3
;QQ3 4
varSS 
requestsSS 
=SS 
awaitSS 
querySS "
.TT 
SkipTT 
(TT 
(TT 
filterTT 
.TT 

PageNumberTT $
-TT% &
$numTT' (
)TT( )
*TT* +
filterTT, 2
.TT2 3
PageSizeTT3 ;
)TT; <
.UU 
TakeUU 
(UU 
filterUU 
.UU 
PageSizeUU !
)UU! "
.VV 
ToListAsyncVV 
(VV 
)VV 
;VV 
returnXX 
newXX 
PagedResultXX 
<XX 
DocumentRequestXX .
>XX. /
{YY 	
DataZZ 
=ZZ 
requestsZZ 
,ZZ 
TotalRecords[[ 
=[[ 
totalRecords[[ '
,[[' (

PageNumber\\ 
=\\ 
filter\\ 
.\\  

PageNumber\\  *
,\\* +
PageSize]] 
=]] 
filter]] 
.]] 
PageSize]] &
,]]& '

TotalPages^^ 
=^^ 
(^^ 
int^^ 
)^^ 
Math^^ "
.^^" #
Ceiling^^# *
(^^* +
(^^+ ,
double^^, 2
)^^2 3
totalRecords^^3 ?
/^^@ A
filter^^B H
.^^H I
PageSize^^I Q
)^^Q R
,^^R S
HasNextPage__ 
=__ 
filter__  
.__  !

PageNumber__! +
*__, -
filter__. 4
.__4 5
PageSize__5 =
<__> ?
totalRecords__@ L
,__L M
HasPreviousPage`` 
=`` 
filter`` $
.``$ %

PageNumber``% /
>``0 1
$num``2 3
,``3 4
Searchaa 
=aa 
filteraa 
.aa 
Searchaa "
,aa" #
SortBybb 
=bb 
filterbb 
.bb 
SortBybb "
,bb" #
SortDirectioncc 
=cc 
filtercc "
.cc" #
SortDirectioncc# 0
}dd 	
;dd	 

}ee 
publicgg 

asyncgg 
Taskgg 
<gg 
DocumentRequestgg %
?gg% &
>gg& '#
GetByIdWithDetailsAsyncgg( ?
(gg? @
intgg@ C
idggD F
)ggF G
{hh 
returnii 
awaitii 
_contextii 
.ii 
DocumentRequestsii .
.jj 
Includejj 
(jj 
drjj 
=>jj 
drjj 
.jj 
	Requesterjj '
)jj' (
.kk 
Includekk 
(kk 
drkk 
=>kk 
drkk 
.kk 

Departmentkk (
)kk( )
.ll 
Includell 
(ll 
drll 
=>ll 
drll 
.ll 
ResponseDocumentll .
)ll. /
.mm 
Includemm 
(mm 
drmm 
=>mm 
drmm 
.mm 
ProcessedBymm )
)mm) *
.nn 
FirstOrDefaultAsyncnn  
(nn  !
drnn! #
=>nn$ &
drnn' )
.nn) *
Idnn* ,
==nn- /
idnn0 2
)nn2 3
;nn3 4
}oo 
publicqq 

asyncqq 
Taskqq 
<qq 
IEnumerableqq !
<qq! "
DocumentRequestqq" 1
>qq1 2
>qq2 3
GetByRequesterAsyncqq4 G
(qqG H
stringqqH N
requesterIdqqO Z
)qqZ [
{rr 
returnss 
awaitss 
_contextss 
.ss 
DocumentRequestsss .
.tt 
Includett 
(tt 
drtt 
=>tt 
drtt 
.tt 

Departmenttt (
)tt( )
.uu 
Includeuu 
(uu 
druu 
=>uu 
druu 
.uu 
ResponseDocumentuu .
)uu. /
.vv 
Includevv 
(vv 
drvv 
=>vv 
drvv 
.vv 
ProcessedByvv )
)vv) *
.ww 
Whereww 
(ww 
drww 
=>ww 
drww 
.ww 
RequesterIdww '
==ww( *
requesterIdww+ 6
)ww6 7
.xx 
OrderByDescendingxx 
(xx 
drxx !
=>xx" $
drxx% '
.xx' (
RequestedAtxx( 3
)xx3 4
.yy 
ToListAsyncyy 
(yy 
)yy 
;yy 
}zz 
public|| 

async|| 
Task|| 
<|| 
IEnumerable|| !
<||! "
DocumentRequest||" 1
>||1 2
>||2 3 
GetByDepartmentAsync||4 H
(||H I
int||I L
departmentId||M Y
)||Y Z
{}} 
return~~ 
await~~ 
_context~~ 
.~~ 
DocumentRequests~~ .
. 
Include 
( 
dr 
=> 
dr 
. 
	Requester '
)' (
.
ÄÄ 
Include
ÄÄ 
(
ÄÄ 
dr
ÄÄ 
=>
ÄÄ 
dr
ÄÄ 
.
ÄÄ 
ResponseDocument
ÄÄ .
)
ÄÄ. /
.
ÅÅ 
Include
ÅÅ 
(
ÅÅ 
dr
ÅÅ 
=>
ÅÅ 
dr
ÅÅ 
.
ÅÅ 
ProcessedBy
ÅÅ )
)
ÅÅ) *
.
ÇÇ 
Where
ÇÇ 
(
ÇÇ 
dr
ÇÇ 
=>
ÇÇ 
dr
ÇÇ 
.
ÇÇ 
DepartmentId
ÇÇ (
==
ÇÇ) +
departmentId
ÇÇ, 8
)
ÇÇ8 9
.
ÉÉ 
OrderByDescending
ÉÉ 
(
ÉÉ 
dr
ÉÉ !
=>
ÉÉ" $
dr
ÉÉ% '
.
ÉÉ' (
RequestedAt
ÉÉ( 3
)
ÉÉ3 4
.
ÑÑ 
ToListAsync
ÑÑ 
(
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
public
áá 

async
áá 
Task
áá 
<
áá 
IEnumerable
áá !
<
áá! "
DocumentRequest
áá" 1
>
áá1 2
>
áá2 3
GetByStatusAsync
áá4 D
(
ááD E
string
ááE K
status
ááL R
)
ááR S
{
àà 
return
ââ 
await
ââ 
_context
ââ 
.
ââ 
DocumentRequests
ââ .
.
ää 
Include
ää 
(
ää 
dr
ää 
=>
ää 
dr
ää 
.
ää 
	Requester
ää '
)
ää' (
.
ãã 
Include
ãã 
(
ãã 
dr
ãã 
=>
ãã 
dr
ãã 
.
ãã 

Department
ãã (
)
ãã( )
.
åå 
Include
åå 
(
åå 
dr
åå 
=>
åå 
dr
åå 
.
åå 
ResponseDocument
åå .
)
åå. /
.
çç 
Include
çç 
(
çç 
dr
çç 
=>
çç 
dr
çç 
.
çç 
ProcessedBy
çç )
)
çç) *
.
éé 
Where
éé 
(
éé 
dr
éé 
=>
éé 
dr
éé 
.
éé 
Status
éé "
==
éé# %
status
éé& ,
)
éé, -
.
èè 
OrderByDescending
èè 
(
èè 
dr
èè !
=>
èè" $
dr
èè% '
.
èè' (
RequestedAt
èè( 3
)
èè3 4
.
êê 
ToListAsync
êê 
(
êê 
)
êê 
;
êê 
}
ëë 
public
ìì 

async
ìì 
Task
ìì 
<
ìì 
PagedResult
ìì !
<
ìì! "
DocumentRequest
ìì" 1
>
ìì1 2
>
ìì2 3&
GetByRequesterPagedAsync
ìì4 L
(
ììL M
string
ììM S
requesterId
ììT _
,
ìì_ `
PaginationParams
ììa q

pagination
ììr |
)
ìì| }
{
îî 
var
ïï 
query
ïï 
=
ïï 
_context
ïï 
.
ïï 
DocumentRequests
ïï -
.
ññ 
Include
ññ 
(
ññ 
dr
ññ 
=>
ññ 
dr
ññ 
.
ññ 

Department
ññ (
)
ññ( )
.
óó 
Include
óó 
(
óó 
dr
óó 
=>
óó 
dr
óó 
.
óó 
ResponseDocument
óó .
)
óó. /
.
òò 
Include
òò 
(
òò 
dr
òò 
=>
òò 
dr
òò 
.
òò 
ProcessedBy
òò )
)
òò) *
.
ôô 
Where
ôô 
(
ôô 
dr
ôô 
=>
ôô 
dr
ôô 
.
ôô 
RequesterId
ôô '
==
ôô( *
requesterId
ôô+ 6
)
ôô6 7
.
öö 
OrderByDescending
öö 
(
öö 
dr
öö !
=>
öö" $
dr
öö% '
.
öö' (
RequestedAt
öö( 3
)
öö3 4
;
öö4 5
var
úú 
totalRecords
úú 
=
úú 
await
úú  
query
úú! &
.
úú& '

CountAsync
úú' 1
(
úú1 2
)
úú2 3
;
úú3 4
var
ûû 
requests
ûû 
=
ûû 
await
ûû 
query
ûû "
.
üü 
Skip
üü 
(
üü 
(
üü 

pagination
üü 
.
üü 

PageNumber
üü (
-
üü) *
$num
üü+ ,
)
üü, -
*
üü. /

pagination
üü0 :
.
üü: ;
PageSize
üü; C
)
üüC D
.
†† 
Take
†† 
(
†† 

pagination
†† 
.
†† 
PageSize
†† %
)
††% &
.
°° 
ToListAsync
°° 
(
°° 
)
°° 
;
°° 
return
££ 
new
££ 
PagedResult
££ 
<
££ 
DocumentRequest
££ .
>
££. /
{
§§ 	
Data
•• 
=
•• 
requests
•• 
,
•• 
TotalRecords
¶¶ 
=
¶¶ 
totalRecords
¶¶ '
,
¶¶' (

PageNumber
ßß 
=
ßß 

pagination
ßß #
.
ßß# $

PageNumber
ßß$ .
,
ßß. /
PageSize
®® 
=
®® 

pagination
®® !
.
®®! "
PageSize
®®" *
,
®®* +

TotalPages
©© 
=
©© 
(
©© 
int
©© 
)
©© 
Math
©© "
.
©©" #
Ceiling
©©# *
(
©©* +
(
©©+ ,
double
©©, 2
)
©©2 3
totalRecords
©©3 ?
/
©©@ A

pagination
©©B L
.
©©L M
PageSize
©©M U
)
©©U V
,
©©V W
HasNextPage
™™ 
=
™™ 

pagination
™™ $
.
™™$ %

PageNumber
™™% /
*
™™0 1

pagination
™™2 <
.
™™< =
PageSize
™™= E
<
™™F G
totalRecords
™™H T
,
™™T U
HasPreviousPage
´´ 
=
´´ 

pagination
´´ (
.
´´( )

PageNumber
´´) 3
>
´´4 5
$num
´´6 7
}
¨¨ 	
;
¨¨	 

}
≠≠ 
public
ØØ 

async
ØØ 
Task
ØØ 
<
ØØ 
PagedResult
ØØ !
<
ØØ! "
DocumentRequest
ØØ" 1
>
ØØ1 2
>
ØØ2 3'
GetByDepartmentPagedAsync
ØØ4 M
(
ØØM N
int
ØØN Q
departmentId
ØØR ^
,
ØØ^ _
PaginationParams
ØØ` p

pagination
ØØq {
)
ØØ{ |
{
∞∞ 
var
±± 
query
±± 
=
±± 
_context
±± 
.
±± 
DocumentRequests
±± -
.
≤≤ 
Include
≤≤ 
(
≤≤ 
dr
≤≤ 
=>
≤≤ 
dr
≤≤ 
.
≤≤ 
	Requester
≤≤ '
)
≤≤' (
.
≥≥ 
Include
≥≥ 
(
≥≥ 
dr
≥≥ 
=>
≥≥ 
dr
≥≥ 
.
≥≥ 
ResponseDocument
≥≥ .
)
≥≥. /
.
¥¥ 
Include
¥¥ 
(
¥¥ 
dr
¥¥ 
=>
¥¥ 
dr
¥¥ 
.
¥¥ 
ProcessedBy
¥¥ )
)
¥¥) *
.
µµ 
Where
µµ 
(
µµ 
dr
µµ 
=>
µµ 
dr
µµ 
.
µµ 
DepartmentId
µµ (
==
µµ) +
departmentId
µµ, 8
)
µµ8 9
.
∂∂ 
OrderByDescending
∂∂ 
(
∂∂ 
dr
∂∂ !
=>
∂∂" $
dr
∂∂% '
.
∂∂' (
RequestedAt
∂∂( 3
)
∂∂3 4
;
∂∂4 5
var
∏∏ 
totalRecords
∏∏ 
=
∏∏ 
await
∏∏  
query
∏∏! &
.
∏∏& '

CountAsync
∏∏' 1
(
∏∏1 2
)
∏∏2 3
;
∏∏3 4
var
∫∫ 
requests
∫∫ 
=
∫∫ 
await
∫∫ 
query
∫∫ "
.
ªª 
Skip
ªª 
(
ªª 
(
ªª 

pagination
ªª 
.
ªª 

PageNumber
ªª (
-
ªª) *
$num
ªª+ ,
)
ªª, -
*
ªª. /

pagination
ªª0 :
.
ªª: ;
PageSize
ªª; C
)
ªªC D
.
ºº 
Take
ºº 
(
ºº 

pagination
ºº 
.
ºº 
PageSize
ºº %
)
ºº% &
.
ΩΩ 
ToListAsync
ΩΩ 
(
ΩΩ 
)
ΩΩ 
;
ΩΩ 
return
øø 
new
øø 
PagedResult
øø 
<
øø 
DocumentRequest
øø .
>
øø. /
{
¿¿ 	
Data
¡¡ 
=
¡¡ 
requests
¡¡ 
,
¡¡ 
TotalRecords
¬¬ 
=
¬¬ 
totalRecords
¬¬ '
,
¬¬' (

PageNumber
√√ 
=
√√ 

pagination
√√ #
.
√√# $

PageNumber
√√$ .
,
√√. /
PageSize
ƒƒ 
=
ƒƒ 

pagination
ƒƒ !
.
ƒƒ! "
PageSize
ƒƒ" *
,
ƒƒ* +

TotalPages
≈≈ 
=
≈≈ 
(
≈≈ 
int
≈≈ 
)
≈≈ 
Math
≈≈ "
.
≈≈" #
Ceiling
≈≈# *
(
≈≈* +
(
≈≈+ ,
double
≈≈, 2
)
≈≈2 3
totalRecords
≈≈3 ?
/
≈≈@ A

pagination
≈≈B L
.
≈≈L M
PageSize
≈≈M U
)
≈≈U V
,
≈≈V W
HasNextPage
∆∆ 
=
∆∆ 

pagination
∆∆ $
.
∆∆$ %

PageNumber
∆∆% /
*
∆∆0 1

pagination
∆∆2 <
.
∆∆< =
PageSize
∆∆= E
<
∆∆F G
totalRecords
∆∆H T
,
∆∆T U
HasPreviousPage
«« 
=
«« 

pagination
«« (
.
««( )

PageNumber
««) 3
>
««4 5
$num
««6 7
}
»» 	
;
»»	 

}
…… 
public
ÀÀ 

async
ÀÀ 
Task
ÀÀ 
<
ÀÀ 
bool
ÀÀ 
>
ÀÀ 
UpdateStatusAsync
ÀÀ -
(
ÀÀ- .
int
ÀÀ. 1
id
ÀÀ2 4
,
ÀÀ4 5
string
ÀÀ6 <
status
ÀÀ= C
,
ÀÀC D
string
ÀÀE K
?
ÀÀK L
processedById
ÀÀM Z
=
ÀÀ[ \
null
ÀÀ] a
)
ÀÀa b
{
ÃÃ 
var
ÕÕ 
request
ÕÕ 
=
ÕÕ 
await
ÕÕ 
GetByIdAsync
ÕÕ (
(
ÕÕ( )
id
ÕÕ) +
)
ÕÕ+ ,
;
ÕÕ, -
if
ŒŒ 

(
ŒŒ 
request
ŒŒ 
==
ŒŒ 
null
ŒŒ 
)
ŒŒ 
return
ŒŒ #
false
ŒŒ$ )
;
ŒŒ) *
request
–– 
.
–– 
Status
–– 
=
–– 
status
–– 
;
––  
request
—— 
.
—— 
ProcessedById
—— 
=
—— 
processedById
——  -
;
——- .
request
““ 
.
““ 
RespondedAt
““ 
=
““ 
DateTime
““ &
.
““& '
UtcNow
““' -
;
““- .
request
”” 
.
”” 
	UpdatedAt
”” 
=
”” 
DateTime
”” $
.
””$ %
UtcNow
””% +
;
””+ ,
await
’’ 
UpdateAsync
’’ 
(
’’ 
request
’’ !
)
’’! "
;
’’" #
return
÷÷ 
true
÷÷ 
;
÷÷ 
}
◊◊ 
public
ŸŸ 

async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
bool
ŸŸ 
>
ŸŸ )
AssignResponseDocumentAsync
ŸŸ 7
(
ŸŸ7 8
int
ŸŸ8 ;
id
ŸŸ< >
,
ŸŸ> ?
int
ŸŸ@ C 
responseDocumentId
ŸŸD V
,
ŸŸV W
string
ŸŸX ^
?
ŸŸ^ _
processedById
ŸŸ` m
=
ŸŸn o
null
ŸŸp t
)
ŸŸt u
{
⁄⁄ 
var
€€ 
request
€€ 
=
€€ 
await
€€ 
GetByIdAsync
€€ (
(
€€( )
id
€€) +
)
€€+ ,
;
€€, -
if
‹‹ 

(
‹‹ 
request
‹‹ 
==
‹‹ 
null
‹‹ 
)
‹‹ 
return
‹‹ #
false
‹‹$ )
;
‹‹) *
request
ﬁﬁ 
.
ﬁﬁ  
ResponseDocumentId
ﬁﬁ "
=
ﬁﬁ# $ 
responseDocumentId
ﬁﬁ% 7
;
ﬁﬁ7 8
request
ﬂﬂ 
.
ﬂﬂ 
ProcessedById
ﬂﬂ 
=
ﬂﬂ 
processedById
ﬂﬂ  -
;
ﬂﬂ- .
request
‡‡ 
.
‡‡ 
Status
‡‡ 
=
‡‡ 
$str
‡‡ $
;
‡‡$ %
request
·· 
.
·· 
RespondedAt
·· 
=
·· 
DateTime
·· &
.
··& '
UtcNow
··' -
;
··- .
request
‚‚ 
.
‚‚ 
	UpdatedAt
‚‚ 
=
‚‚ 
DateTime
‚‚ $
.
‚‚$ %
UtcNow
‚‚% +
;
‚‚+ ,
await
‰‰ 
UpdateAsync
‰‰ 
(
‰‰ 
request
‰‰ !
)
‰‰! "
;
‰‰" #
return
ÂÂ 
true
ÂÂ 
;
ÂÂ 
}
ÊÊ 
public
ËË 

async
ËË 
Task
ËË 
<
ËË 

Dictionary
ËË  
<
ËË  !
string
ËË! '
,
ËË' (
int
ËË) ,
>
ËË, -
>
ËË- .'
GetRequestStatisticsAsync
ËË/ H
(
ËËH I
int
ËËI L
?
ËËL M
departmentId
ËËN Z
=
ËË[ \
null
ËË] a
)
ËËa b
{
ÈÈ 
var
ÍÍ 
query
ÍÍ 
=
ÍÍ 
_context
ÍÍ 
.
ÍÍ 
DocumentRequests
ÍÍ -
.
ÍÍ- .
AsQueryable
ÍÍ. 9
(
ÍÍ9 :
)
ÍÍ: ;
;
ÍÍ; <
if
ÏÏ 

(
ÏÏ 
departmentId
ÏÏ 
.
ÏÏ 
HasValue
ÏÏ !
)
ÏÏ! "
{
ÌÌ 	
query
ÓÓ 
=
ÓÓ 
query
ÓÓ 
.
ÓÓ 
Where
ÓÓ 
(
ÓÓ  
dr
ÓÓ  "
=>
ÓÓ# %
dr
ÓÓ& (
.
ÓÓ( )
DepartmentId
ÓÓ) 5
==
ÓÓ6 8
departmentId
ÓÓ9 E
.
ÓÓE F
Value
ÓÓF K
)
ÓÓK L
;
ÓÓL M
}
ÔÔ 	
var
ÒÒ 
stats
ÒÒ 
=
ÒÒ 
await
ÒÒ 
query
ÒÒ 
.
ÚÚ 
GroupBy
ÚÚ 
(
ÚÚ 
dr
ÚÚ 
=>
ÚÚ 
dr
ÚÚ 
.
ÚÚ 
Status
ÚÚ $
)
ÚÚ$ %
.
ÛÛ 
Select
ÛÛ 
(
ÛÛ 
g
ÛÛ 
=>
ÛÛ 
new
ÛÛ 
{
ÛÛ 
Status
ÛÛ %
=
ÛÛ& '
g
ÛÛ( )
.
ÛÛ) *
Key
ÛÛ* -
,
ÛÛ- .
Count
ÛÛ/ 4
=
ÛÛ5 6
g
ÛÛ7 8
.
ÛÛ8 9
Count
ÛÛ9 >
(
ÛÛ> ?
)
ÛÛ? @
}
ÛÛA B
)
ÛÛB C
.
ÙÙ 
ToListAsync
ÙÙ 
(
ÙÙ 
)
ÙÙ 
;
ÙÙ 
return
ˆˆ 
stats
ˆˆ 
.
ˆˆ 
ToDictionary
ˆˆ !
(
ˆˆ! "
s
ˆˆ" #
=>
ˆˆ$ &
s
ˆˆ' (
.
ˆˆ( )
Status
ˆˆ) /
,
ˆˆ/ 0
s
ˆˆ1 2
=>
ˆˆ3 5
s
ˆˆ6 7
.
ˆˆ7 8
Count
ˆˆ8 =
)
ˆˆ= >
;
ˆˆ> ?
}
˜˜ 
private
˘˘ 

IQueryable
˘˘ 
<
˘˘ 
DocumentRequest
˘˘ &
>
˘˘& '
ApplySorting
˘˘( 4
(
˘˘4 5

IQueryable
˘˘5 ?
<
˘˘? @
DocumentRequest
˘˘@ O
>
˘˘O P
query
˘˘Q V
,
˘˘V W
string
˘˘X ^
?
˘˘^ _
sortBy
˘˘` f
,
˘˘f g
string
˘˘h n
?
˘˘n o
sortDirection
˘˘p }
)
˘˘} ~
{
˙˙ 
if
˚˚ 

(
˚˚ 
string
˚˚ 
.
˚˚ 
IsNullOrEmpty
˚˚  
(
˚˚  !
sortBy
˚˚! '
)
˚˚' (
)
˚˚( )
{
¸¸ 	
return
˝˝ 
query
˝˝ 
.
˝˝ 
OrderByDescending
˝˝ *
(
˝˝* +
dr
˝˝+ -
=>
˝˝. 0
dr
˝˝1 3
.
˝˝3 4
RequestedAt
˝˝4 ?
)
˝˝? @
;
˝˝@ A
}
˛˛ 	
var
ÄÄ 
isDescending
ÄÄ 
=
ÄÄ 
sortDirection
ÄÄ (
?
ÄÄ( )
.
ÄÄ) *
ToLower
ÄÄ* 1
(
ÄÄ1 2
)
ÄÄ2 3
==
ÄÄ4 6
$str
ÄÄ7 =
;
ÄÄ= >
return
ÇÇ 
sortBy
ÇÇ 
.
ÇÇ 
ToLower
ÇÇ 
(
ÇÇ 
)
ÇÇ 
switch
ÇÇ  &
{
ÉÉ 	
$str
ÑÑ 
=>
ÑÑ 
isDescending
ÑÑ )
?
ÑÑ* +
query
ÑÑ, 1
.
ÑÑ1 2
OrderByDescending
ÑÑ2 C
(
ÑÑC D
dr
ÑÑD F
=>
ÑÑG I
dr
ÑÑJ L
.
ÑÑL M
RequestedAt
ÑÑM X
)
ÑÑX Y
:
ÑÑZ [
query
ÑÑ\ a
.
ÑÑa b
OrderBy
ÑÑb i
(
ÑÑi j
dr
ÑÑj l
=>
ÑÑm o
dr
ÑÑp r
.
ÑÑr s
RequestedAt
ÑÑs ~
)
ÑÑ~ 
,ÑÑ Ä
$str
ÖÖ 
=>
ÖÖ 
isDescending
ÖÖ )
?
ÖÖ* +
query
ÖÖ, 1
.
ÖÖ1 2
OrderByDescending
ÖÖ2 C
(
ÖÖC D
dr
ÖÖD F
=>
ÖÖG I
dr
ÖÖJ L
.
ÖÖL M
RespondedAt
ÖÖM X
)
ÖÖX Y
:
ÖÖZ [
query
ÖÖ\ a
.
ÖÖa b
OrderBy
ÖÖb i
(
ÖÖi j
dr
ÖÖj l
=>
ÖÖm o
dr
ÖÖp r
.
ÖÖr s
RespondedAt
ÖÖs ~
)
ÖÖ~ 
,ÖÖ Ä
$str
ÜÜ 
=>
ÜÜ 
isDescending
ÜÜ *
?
ÜÜ+ ,
query
ÜÜ- 2
.
ÜÜ2 3
OrderByDescending
ÜÜ3 D
(
ÜÜD E
dr
ÜÜE G
=>
ÜÜH J
dr
ÜÜK M
.
ÜÜM N
DocumentType
ÜÜN Z
)
ÜÜZ [
:
ÜÜ\ ]
query
ÜÜ^ c
.
ÜÜc d
OrderBy
ÜÜd k
(
ÜÜk l
dr
ÜÜl n
=>
ÜÜo q
dr
ÜÜr t
.
ÜÜt u
DocumentTypeÜÜu Å
)ÜÜÅ Ç
,ÜÜÇ É
$str
áá 
=>
áá 
isDescending
áá &
?
áá' (
query
áá) .
.
áá. /
OrderByDescending
áá/ @
(
áá@ A
dr
ááA C
=>
ááD F
dr
ááG I
.
ááI J
Priority
ááJ R
)
ááR S
:
ááT U
query
ááV [
.
áá[ \
OrderBy
áá\ c
(
áác d
dr
áád f
=>
áág i
dr
ááj l
.
áál m
Priority
áám u
)
ááu v
,
ááv w
$str
àà 
=>
àà 
isDescending
àà $
?
àà% &
query
àà' ,
.
àà, -
OrderByDescending
àà- >
(
àà> ?
dr
àà? A
=>
ààB D
dr
ààE G
.
ààG H
Status
ààH N
)
ààN O
:
ààP Q
query
ààR W
.
ààW X
OrderBy
ààX _
(
àà_ `
dr
àà` b
=>
ààc e
dr
ààf h
.
ààh i
Status
àài o
)
àào p
,
ààp q
$str
ââ 
=>
ââ 
isDescending
ââ +
?
ââ, -
query
ââ. 3
.
ââ3 4
OrderByDescending
ââ4 E
(
ââE F
dr
ââF H
=>
ââI K
dr
ââL N
.
ââN O
	Requester
ââO X
.
ââX Y
UserName
ââY a
)
ââa b
:
ââc d
query
ââe j
.
ââj k
OrderBy
ââk r
(
ââr s
dr
ââs u
=>
ââv x
dr
âây {
.
ââ{ |
	Requesterââ| Ö
.ââÖ Ü
UserNameââÜ é
)ââé è
,ââè ê
$str
ää 
=>
ää 
isDescending
ää  ,
?
ää- .
query
ää/ 4
.
ää4 5
OrderByDescending
ää5 F
(
ääF G
dr
ääG I
=>
ääJ L
dr
ääM O
.
ääO P

Department
ääP Z
.
ääZ [
Name
ää[ _
)
ää_ `
:
ääa b
query
ääc h
.
ääh i
OrderBy
ääi p
(
ääp q
dr
ääq s
=>
äät v
dr
ääw y
.
ääy z

Departmentääz Ñ
.ääÑ Ö
NameääÖ â
)ääâ ä
,äää ã
_
ãã 
=>
ãã 
query
ãã 
.
ãã 
OrderByDescending
ãã (
(
ãã( )
dr
ãã) +
=>
ãã, .
dr
ãã/ 1
.
ãã1 2
RequestedAt
ãã2 =
)
ãã= >
}
åå 	
;
åå	 

}
çç 
public
èè 

async
èè 
Task
èè 
<
èè %
DocumentRequestStatsDto
èè -
>
èè- .(
GetDocumentStatisticsAsync
èè/ I
(
èèI J
)
èèJ K
{
êê 
try
ëë 
{
íí 	
var
ìì 
totalRequests
ìì 
=
ìì 
await
ìì  %
_context
ìì& .
.
ìì. /
DocumentRequests
ìì/ ?
.
ìì? @

CountAsync
ìì@ J
(
ììJ K
)
ììK L
;
ììL M
var
îî 
pendingRequests
îî 
=
îî  !
await
îî" '
_context
îî( 0
.
îî0 1
DocumentRequests
îî1 A
.
îîA B

CountAsync
îîB L
(
îîL M
dr
îîM O
=>
îîP R
dr
îîS U
.
îîU V
Status
îîV \
==
îî] _
$str
îî` l
)
îîl m
;
îîm n
var
ïï 
completedRequests
ïï !
=
ïï" #
await
ïï$ )
_context
ïï* 2
.
ïï2 3
DocumentRequests
ïï3 C
.
ïïC D

CountAsync
ïïD N
(
ïïN O
dr
ïïO Q
=>
ïïR T
dr
ïïU W
.
ïïW X
Status
ïïX ^
==
ïï_ a
$str
ïïb m
)
ïïm n
;
ïïn o
var
ññ 
rejectedRequests
ññ  
=
ññ! "
await
ññ# (
_context
ññ) 1
.
ññ1 2
DocumentRequests
ññ2 B
.
ññB C

CountAsync
ññC M
(
ññM N
dr
ññN P
=>
ññQ S
dr
ññT V
.
ññV W
Status
ññW ]
==
ññ^ `
$str
ñña k
)
ññk l
;
ññl m
return
òò 
new
òò %
DocumentRequestStatsDto
òò .
{
ôô #
TotalDocumentsRequest
öö %
=
öö& '
totalRequests
öö( 5
,
öö5 6"
TotalPendingRequests
õõ $
=
õõ% &
pendingRequests
õõ' 6
,
õõ6 7$
TotalProcessedRequests
úú &
=
úú' (
completedRequests
úú) :
,
úú: ;#
TotalRejectedRequests
ùù %
=
ùù& '
rejectedRequests
ùù( 8
}
ûû 
;
ûû 
}
üü 	
catch
†† 
(
†† 
System
†† 
.
†† 
	Exception
†† 
)
††  
{
°° 	
throw
££ 
;
££ 
}
§§ 	
}
•• 
public
ßß 

async
ßß 
Task
ßß 
<
ßß %
DocumentRequestStatsDto
ßß -
>
ßß- .0
"GetDocumentStatisticsAsyncByUserId
ßß/ Q
(
ßßQ R
string
ßßR X
userId
ßßY _
)
ßß_ `
{
®® 
try
©© 
{
™™ 	
var
´´ 
totalRequests
´´ 
=
´´ 
await
´´  %
_context
´´& .
.
´´. /
DocumentRequests
´´/ ?
.
´´? @

CountAsync
´´@ J
(
´´J K
dr
´´K M
=>
´´N P
dr
´´Q S
.
´´S T
RequesterId
´´T _
==
´´` b
userId
´´c i
)
´´i j
;
´´j k
var
¨¨ 
pendingRequests
¨¨ 
=
¨¨  !
await
¨¨" '
_context
¨¨( 0
.
¨¨0 1
DocumentRequests
¨¨1 A
.
¨¨A B

CountAsync
¨¨B L
(
¨¨L M
dr
¨¨M O
=>
¨¨P R
dr
¨¨S U
.
¨¨U V
Status
¨¨V \
==
¨¨] _
$str
¨¨` l
&&
¨¨m o
dr
¨¨p r
.
¨¨r s
RequesterId
¨¨s ~
==¨¨ Å
userId¨¨Ç à
)¨¨à â
;¨¨â ä
var
≠≠ 
completedRequests
≠≠ !
=
≠≠" #
await
≠≠$ )
_context
≠≠* 2
.
≠≠2 3
DocumentRequests
≠≠3 C
.
≠≠C D

CountAsync
≠≠D N
(
≠≠N O
dr
≠≠O Q
=>
≠≠R T
dr
≠≠U W
.
≠≠W X
Status
≠≠X ^
==
≠≠_ a
$str
≠≠b m
&&
≠≠n p
dr
≠≠q s
.
≠≠s t
RequesterId
≠≠t 
==≠≠Ä Ç
userId≠≠É â
)≠≠â ä
;≠≠ä ã
var
ÆÆ 
rejectedRequests
ÆÆ  
=
ÆÆ! "
await
ÆÆ# (
_context
ÆÆ) 1
.
ÆÆ1 2
DocumentRequests
ÆÆ2 B
.
ÆÆB C

CountAsync
ÆÆC M
(
ÆÆM N
dr
ÆÆN P
=>
ÆÆQ S
dr
ÆÆT V
.
ÆÆV W
Status
ÆÆW ]
==
ÆÆ^ `
$str
ÆÆa k
&&
ÆÆl n
dr
ÆÆo q
.
ÆÆq r
RequesterId
ÆÆr }
==ÆÆ~ Ä
userIdÆÆÅ á
)ÆÆá à
;ÆÆà â
return
∞∞ 
new
∞∞ %
DocumentRequestStatsDto
∞∞ .
{
±± #
TotalDocumentsRequest
≤≤ %
=
≤≤& '
totalRequests
≤≤( 5
,
≤≤5 6"
TotalPendingRequests
≥≥ $
=
≥≥% &
pendingRequests
≥≥' 6
,
≥≥6 7$
TotalProcessedRequests
¥¥ &
=
¥¥' (
completedRequests
¥¥) :
,
¥¥: ;#
TotalRejectedRequests
µµ %
=
µµ& '
rejectedRequests
µµ( 8
}
∂∂ 
;
∂∂ 
}
∑∑ 	
catch
∏∏ 
(
∏∏ 
System
∏∏ 
.
∏∏ 
	Exception
∏∏ 
)
∏∏  
{
ππ 	
throw
ªª 
;
ªª 
}
ºº 	
}
ΩΩ 
}ææ ˝¯
`/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/DocumentRepository.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
{ 
public 

class 
DocumentRepository #
:$ %
GenericRepository& 7
<7 8
Document8 @
>@ A
,A B
	IDocumentC L
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
public 
DocumentRepository !
(! "
AppDbContext" .
ctx/ 2
,2 3 
IHttpContextAccessor4 H
httpContextAccessorI \
)\ ]
:^ _
base` d
(d e
ctxe h
)h i
{ 	
_context 
= 
ctx 
?? 
throw #
new$ '!
ArgumentNullException( =
(= >
nameof> D
(D E
ctxE H
)H I
)I J
;J K 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
} 	
private 
string 
? 
CurrentUserId %
=>& ( 
_httpContextAccessor) =
.= >
HttpContext> I
?I J
.J K$
GetUserIdFromCookieTokenK c
(c d
)d e
;e f
public 
async 
Task 
< 
DocumentSearchDTO +
[+ ,
], -
>- .
getDocumentByName/ @
(@ A
stringA G
nameH L
)L M
{ 	
var 
userId 
= 
CurrentUserId &
;& '
Console 
. 
	WriteLine 
( 
$"  
$str  J
{J K
userIdK Q
}Q R
"R S
)S T
;T U
try 
{ 
var 
	documents 
= 
await  %
_context& .
.. /
	Documents/ 8
.8 9
Where9 >
(> ?
d? @
=>A C
dD E
.E F
NameF J
.J K
ContainsK S
(S T
nameT X
)X Y
)Y Z
. 
Select 
( 
d 
=> 
new  
DocumentSearchDTO! 2
{   
Id!! 
=!! 
d!! 
.!! 
Id!! 
,!! 
Name"" 
="" 
d"" 
."" 
Name"" !
,""! "
FolderId## 
=## 
d##  
.##  !
FolderId##! )
.##) *
ToString##* 2
(##2 3
)##3 4
,##4 5
UploadedByName$$ "
=$$# $
d$$% &
.$$& '

UploadedBy$$' 1
.$$1 2
UserName$$2 :
,$$: ;
UploadedById%%  
=%%! "
d%%# $
.%%$ %
UploadedById%%% 1
,%%1 2
}'' 
)'' 
.'' 
ToArrayAsync'' 
(''  
)''  !
;''! "
return)) 
	documents))  
;))  !
}** 
catch++ 
(++ 
System++ 
.++ 
	Exception++ #
)++# $
{,, 
throw.. 
;.. 
}// 
}00 	
public33 
async33 
Task33 
<33 
PagedResult33 %
<33% &
Document33& .
>33. /
>33/ 0
GetPagedAsync331 >
(33> ?
DocumentFilterDto33? P
filter33Q W
)33W X
{44 	
var55 
query55 
=55 
_context55  
.55  !
	Documents55! *
.66 
Include66 
(66 
d66 
=>66 
d66 
.66  
Folder66  &
)66& '
.77 
Include77 
(77 
d77 
=>77 
d77 
.77  

UploadedBy77  *
)77* +
.88 
AsQueryable88 
(88 
)88 
;88 
query;; 
=;; 
ApplyFilters;;  
(;;  !
query;;! &
,;;& '
filter;;( .
);;. /
;;;/ 0
var>> 
totalRecords>> 
=>> 
await>> $
query>>% *
.>>* +

CountAsync>>+ 5
(>>5 6
)>>6 7
;>>7 8
var?? 
	totalSize?? 
=?? 
await?? !
query??" '
.??' (
SumAsync??( 0
(??0 1
d??1 2
=>??3 5
d??6 7
.??7 8
FileSize??8 @
)??@ A
;??A B
queryAA 
=AA 
ApplySortingAA  
(AA  !
queryAA! &
,AA& '
filterAA( .
.AA. /
SortByAA/ 5
,AA5 6
filterAA7 =
.AA= >
SortDirectionAA> K
)AAK L
;AAL M
varDD 
	documentsDD 
=DD 
awaitDD !
queryDD" '
.EE 
SkipEE 
(EE 
(EE 
filterEE 
.EE 

PageNumberEE (
-EE) *
$numEE+ ,
)EE, -
*EE. /
filterEE0 6
.EE6 7
PageSizeEE7 ?
)EE? @
.FF 
TakeFF 
(FF 
filterFF 
.FF 
PageSizeFF %
)FF% &
.GG 
ToListAsyncGG 
(GG 
)GG 
;GG 
returnII 
	documentsII 
.II 
ToPagedResultII *
(II* +
filterKK 
.KK 

PageNumberKK !
,KK! "
filterLL 
.LL 
PageSizeLL 
,LL  
totalRecordsMM 
,MM 
filterNN 
.NN 
SearchNN 
,NN 
filterOO 
.OO 
SortByOO 
,OO 
filterPP 
.PP 
SortDirectionPP $
)QQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
PagedResultTT %
<TT% &
DocumentTT& .
>TT. /
>TT/ 0!
GetByFolderPagedAsyncTT1 F
(TTF G
intTTG J
folderIdTTK S
,TTS T
PaginationParamsTTU e

paginationTTf p
)TTp q
{UU 	
varVV 
queryVV 
=VV 
_contextVV  
.VV  !
	DocumentsVV! *
.WW 
IncludeWW 
(WW 
dWW 
=>WW 
dWW 
.WW  
FolderWW  &
)WW& '
.XX 
IncludeXX 
(XX 
dXX 
=>XX 
dXX 
.XX  

UploadedByXX  *
)XX* +
.YY 
WhereYY 
(YY 
dYY 
=>YY 
dYY 
.YY 
FolderIdYY &
==YY' )
folderIdYY* 2
)YY2 3
;YY3 4
if\\ 
(\\ 
!\\ 
string\\ 
.\\ 
IsNullOrEmpty\\ %
(\\% &

pagination\\& 0
.\\0 1
Search\\1 7
)\\7 8
)\\8 9
{]] 
query^^ 
=^^ 
query^^ 
.^^ 
Where^^ #
(^^# $
d^^$ %
=>^^& (
d__ 
.__ 
Name__ 
.__ 
Contains__ #
(__# $

pagination__$ .
.__. /
Search__/ 5
)__5 6
)aa 
;aa 
}bb 
vardd 
totalRecordsdd 
=dd 
awaitdd $
querydd% *
.dd* +

CountAsyncdd+ 5
(dd5 6
)dd6 7
;dd7 8
queryff 
=ff 
ApplySortingff  
(ff  !
queryff! &
,ff& '

paginationff( 2
.ff2 3
SortByff3 9
,ff9 :

paginationff; E
.ffE F
SortDirectionffF S
)ffS T
;ffT U
varhh 
	documentshh 
=hh 
awaithh !
queryhh" '
.ii 
Skipii 
(ii 
(ii 

paginationii !
.ii! "

PageNumberii" ,
-ii- .
$numii/ 0
)ii0 1
*ii2 3

paginationii4 >
.ii> ?
PageSizeii? G
)iiG H
.jj 
Takejj 
(jj 

paginationjj  
.jj  !
PageSizejj! )
)jj) *
.kk 
ToListAsynckk 
(kk 
)kk 
;kk 
returnmm 
	documentsmm 
.mm 
ToPagedResultmm *
(mm* +

paginationnn 
.nn 

PageNumbernn %
,nn% &

paginationoo 
.oo 
PageSizeoo #
,oo# $
totalRecordspp 
,pp 

paginationqq 
.qq 
Searchqq !
,qq! "

paginationrr 
.rr 
SortByrr !
,rr! "

paginationss 
.ss 
SortDirectionss (
)tt 
;tt 
}uu 	
publicww 
asyncww 
Taskww 
<ww 
PagedResultww %
<ww% &
Documentww& .
>ww. /
>ww/ 0
GetByUserPagedAsyncww1 D
(wwD E
stringwwE K
userIdwwL R
,wwR S
DocumentFilterDtowwT e
filterwwf l
)wwl m
{xx 	
varyy 
queryyy 
=yy 
_contextyy 
.yy  
	Documentsyy  )
.zz 
Wherezz 
(zz 
dzz 
=>zz 
dzz 
.zz 
UploadedByIdzz )
==zz* ,
userIdzz- 3
)zz3 4
.{{ 
Include{{ 
({{ 
d{{ 
=>{{ 
d{{ 
.{{ 
Folder{{ %
){{% &
.|| 
Include|| 
(|| 
d|| 
=>|| 
d|| 
.|| 

UploadedBy|| )
)||) *
.}} 
AsQueryable}} 
(}} 
)}} 
;}} 
query
ÄÄ 
=
ÄÄ 
ApplyFilters
ÄÄ  
(
ÄÄ  !
query
ÄÄ! &
,
ÄÄ& '
filter
ÄÄ( .
)
ÄÄ. /
;
ÄÄ/ 0
var
ÉÉ 
totalRecords
ÉÉ 
=
ÉÉ 
await
ÉÉ $
query
ÉÉ% *
.
ÉÉ* +

CountAsync
ÉÉ+ 5
(
ÉÉ5 6
)
ÉÉ6 7
;
ÉÉ7 8
query
ÜÜ 
=
ÜÜ 
ApplySorting
ÜÜ  
(
ÜÜ  !
query
ÜÜ! &
,
ÜÜ& '
filter
ÜÜ( .
.
ÜÜ. /
SortBy
ÜÜ/ 5
,
ÜÜ5 6
filter
ÜÜ7 =
.
ÜÜ= >
SortDirection
ÜÜ> K
)
ÜÜK L
;
ÜÜL M
var
ââ 
	documents
ââ 
=
ââ 
await
ââ !
query
ââ" '
.
ää 
Skip
ää 
(
ää 
(
ää 
filter
ää 
.
ää 

PageNumber
ää (
-
ää) *
$num
ää+ ,
)
ää, -
*
ää. /
filter
ää0 6
.
ää6 7
PageSize
ää7 ?
)
ää? @
.
ãã 
Take
ãã 
(
ãã 
filter
ãã 
.
ãã 
PageSize
ãã %
)
ãã% &
.
åå 
ToListAsync
åå 
(
åå 
)
åå 
;
åå 
return
éé 
	documents
éé 
.
éé 
ToPagedResult
éé *
(
éé* +
filter
èè 
.
èè 

PageNumber
èè !
,
èè! "
filter
êê 
.
êê 
PageSize
êê 
,
êê  
totalRecords
ëë 
,
ëë 
filter
íí 
.
íí 
Search
íí 
,
íí 
filter
ìì 
.
ìì 
SortBy
ìì 
,
ìì 
filter
îî 
.
îî 
SortDirection
îî $
)
ïï 
;
ïï 
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
Document
òò "
>
òò" #
AddAsync
òò$ ,
(
òò, -
Document
òò- 5
document
òò6 >
)
òò> ?
{
ôô 	
if
öö 
(
öö 
document
öö 
==
öö 
null
öö  
)
öö  !
throw
õõ 
new
õõ #
ArgumentNullException
õõ /
(
õõ/ 0
nameof
õõ0 6
(
õõ6 7
document
õõ7 ?
)
õõ? @
)
õõ@ A
;
õõA B
document
ùù 
.
ùù 
	CreatedAt
ùù 
=
ùù  
DateTime
ùù! )
.
ùù) *
UtcNow
ùù* 0
;
ùù0 1
document
ûû 
.
ûû 
	UpdatedAt
ûû 
=
ûû  
DateTime
ûû! )
.
ûû) *
UtcNow
ûû* 0
;
ûû0 1
var
†† 
result
†† 
=
†† 
await
†† 
_context
†† '
.
††' (
	Documents
††( 1
.
††1 2
AddAsync
††2 :
(
††: ;
document
††; C
)
††C D
;
††D E
return
°° 
result
°° 
.
°° 
Entity
°°  
;
°°  !
}
¢¢ 	
public
§§ 
async
§§ 
Task
§§ 
DeleteAsync
§§ %
(
§§% &
int
§§& )
id
§§* ,
)
§§, -
{
•• 	
var
¶¶ 
document
¶¶ 
=
¶¶ 
await
¶¶  
_context
¶¶! )
.
¶¶) *
	Documents
¶¶* 3
.
¶¶3 4
	FindAsync
¶¶4 =
(
¶¶= >
id
¶¶> @
)
¶¶@ A
;
¶¶A B
if
ßß 
(
ßß 
document
ßß 
==
ßß 
null
ßß  
)
ßß  !
throw
®® 
new
®® 
ArgumentException
®® +
(
®®+ ,
$"
®®, .
$str
®®. ?
{
®®? @
id
®®@ B
}
®®B C
$str
®®C M
"
®®M N
)
®®N O
;
®®O P
_context
™™ 
.
™™ 
	Documents
™™ 
.
™™ 
Remove
™™ %
(
™™% &
document
™™& .
)
™™. /
;
™™/ 0
}
´´ 	
public
≠≠ 
async
≠≠ 
Task
≠≠ 
<
≠≠ 
IReadOnlyList
≠≠ '
<
≠≠' (
Document
≠≠( 0
>
≠≠0 1
>
≠≠1 2
GetAllAsync
≠≠3 >
(
≠≠> ?
)
≠≠? @
{
ÆÆ 	
return
ØØ 
await
ØØ 
_context
ØØ !
.
ØØ! "
	Documents
ØØ" +
.
∞∞ 
Include
∞∞ 
(
∞∞ 
d
∞∞ 
=>
∞∞ 
d
∞∞ 
.
∞∞  
Folder
∞∞  &
)
∞∞& '
.
±± 
Include
±± 
(
±± 
d
±± 
=>
±± 
d
±± 
.
±±  

UploadedBy
±±  *
)
±±* +
.
≤≤ 
Include
≤≤ 
(
≤≤ 
d
≤≤ 
=>
≤≤ 
d
≤≤ 
.
≤≤  
DocumentRequests
≤≤  0
)
≤≤0 1
.
¥¥ 
OrderByDescending
¥¥ "
(
¥¥" #
d
¥¥# $
=>
¥¥% '
d
¥¥( )
.
¥¥) *
	CreatedAt
¥¥* 3
)
¥¥3 4
.
µµ 
ToListAsync
µµ 
(
µµ 
)
µµ 
;
µµ 
}
∂∂ 	
public
∏∏ 
async
∏∏ 
Task
∏∏ 
<
∏∏ 
Document
∏∏ "
?
∏∏" #
>
∏∏# $
GetByIdAsync
∏∏% 1
(
∏∏1 2
int
∏∏2 5
id
∏∏6 8
)
∏∏8 9
{
ππ 	
return
∫∫ 
await
∫∫ 
_context
∫∫ !
.
∫∫! "
	Documents
∫∫" +
.
ªª 
Include
ªª 
(
ªª 
d
ªª 
=>
ªª 
d
ªª 
.
ªª  
Folder
ªª  &
)
ªª& '
.
ºº 
Include
ºº 
(
ºº 
d
ºº 
=>
ºº 
d
ºº 
.
ºº  

UploadedBy
ºº  *
)
ºº* +
.
ΩΩ 
Include
ΩΩ 
(
ΩΩ 
d
ΩΩ 
=>
ΩΩ 
d
ΩΩ 
.
ΩΩ  
DocumentRequests
ΩΩ  0
)
ΩΩ0 1
.
ææ !
FirstOrDefaultAsync
ææ $
(
ææ$ %
d
ææ% &
=>
ææ' )
d
ææ* +
.
ææ+ ,
Id
ææ, .
==
ææ/ 1
id
ææ2 4
)
ææ4 5
;
ææ5 6
}
øø 	
public
¡¡ 
async
¡¡ 
Task
¡¡ 
<
¡¡ 
Document
¡¡ "
?
¡¡" #
>
¡¡# $
GetByNameAsync
¡¡% 3
(
¡¡3 4
string
¡¡4 :
name
¡¡; ?
,
¡¡? @
int
¡¡A D
folderId
¡¡E M
)
¡¡M N
{
¬¬ 	
if
√√ 
(
√√ 
string
√√ 
.
√√ 
IsNullOrEmpty
√√ $
(
√√$ %
name
√√% )
)
√√) *
)
√√* +
return
ƒƒ 
null
ƒƒ 
;
ƒƒ 
return
∆∆ 
await
∆∆ 
_context
∆∆ !
.
∆∆! "
	Documents
∆∆" +
.
«« !
FirstOrDefaultAsync
«« $
(
««$ %
d
««% &
=>
««' )
d
««* +
.
««+ ,
Name
««, 0
.
««0 1
ToLower
««1 8
(
««8 9
)
««9 :
==
««; =
name
««> B
.
««B C
ToLower
««C J
(
««J K
)
««K L
&&
««M O
d
»»( )
.
»») *
FolderId
»»* 2
==
»»3 5
folderId
»»6 >
)
»»> ?
;
»»? @
}
…… 	
public
ÀÀ 
async
ÀÀ 
Task
ÀÀ 
UpdateAsync
ÀÀ %
(
ÀÀ% &
Document
ÀÀ& .
document
ÀÀ/ 7
)
ÀÀ7 8
{
ÃÃ 	
if
ÕÕ 
(
ÕÕ 
document
ÕÕ 
==
ÕÕ 
null
ÕÕ  
)
ÕÕ  !
throw
ŒŒ 
new
ŒŒ #
ArgumentNullException
ŒŒ /
(
ŒŒ/ 0
nameof
ŒŒ0 6
(
ŒŒ6 7
document
ŒŒ7 ?
)
ŒŒ? @
)
ŒŒ@ A
;
ŒŒA B
document
–– 
.
–– 
	UpdatedAt
–– 
=
––  
DateTime
––! )
.
––) *
UtcNow
––* 0
;
––0 1
_context
—— 
.
—— 
	Documents
—— 
.
—— 
Update
—— %
(
——% &
document
——& .
)
——. /
;
——/ 0
}
““ 	
public
‘‘ 
async
‘‘ 
Task
‘‘ 
<
‘‘ 
bool
‘‘ 
>
‘‘ 
ExistsAsync
‘‘  +
(
‘‘+ ,
int
‘‘, /
id
‘‘0 2
)
‘‘2 3
{
’’ 	
return
÷÷ 
await
÷÷ 
_context
÷÷ !
.
÷÷! "
	Documents
÷÷" +
.
÷÷+ ,
AnyAsync
÷÷, 4
(
÷÷4 5
d
÷÷5 6
=>
÷÷7 9
d
÷÷: ;
.
÷÷; <
Id
÷÷< >
==
÷÷? A
id
÷÷B D
)
÷÷D E
;
÷÷E F
}
◊◊ 	
public
ŸŸ 
async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
IReadOnlyList
ŸŸ '
<
ŸŸ' (
Document
ŸŸ( 0
>
ŸŸ0 1
>
ŸŸ1 2
GetByFolderAsync
ŸŸ3 C
(
ŸŸC D
int
ŸŸD G
folderId
ŸŸH P
)
ŸŸP Q
{
⁄⁄ 	
return
€€ 
await
€€ 
_context
€€ !
.
€€! "
	Documents
€€" +
.
‹‹ 
Include
‹‹ 
(
‹‹ 
d
‹‹ 
=>
‹‹ 
d
‹‹ 
.
‹‹  

UploadedBy
‹‹  *
)
‹‹* +
.
›› 
Include
›› 
(
›› 
d
›› 
=>
›› 
d
›› 
.
››  
DocumentRequests
››  0
)
››0 1
.
ﬁﬁ 
Where
ﬁﬁ 
(
ﬁﬁ 
d
ﬁﬁ 
=>
ﬁﬁ 
d
ﬁﬁ 
.
ﬁﬁ 
FolderId
ﬁﬁ &
==
ﬁﬁ' )
folderId
ﬁﬁ* 2
)
ﬁﬁ2 3
.
ﬂﬂ 
OrderByDescending
ﬂﬂ "
(
ﬂﬂ" #
d
ﬂﬂ# $
=>
ﬂﬂ% '
d
ﬂﬂ( )
.
ﬂﬂ) *
	CreatedAt
ﬂﬂ* 3
)
ﬂﬂ3 4
.
‡‡ 
ToListAsync
‡‡ 
(
‡‡ 
)
‡‡ 
;
‡‡ 
}
·· 	
public
‚‚ 
async
‚‚ 
Task
‚‚ 
<
‚‚ 
Document
‚‚ "
?
‚‚" #
>
‚‚# $%
GetByIdWithDetailsAsync
‚‚% <
(
‚‚< =
int
‚‚= @
id
‚‚A C
)
‚‚C D
{
„„ 	
return
‰‰ 
await
‰‰ 
_context
‰‰ !
.
‰‰! "
	Documents
‰‰" +
.
ÂÂ 
Include
ÂÂ 
(
ÂÂ 
d
ÂÂ 
=>
ÂÂ 
d
ÂÂ 
.
ÂÂ  
Folder
ÂÂ  &
)
ÂÂ& '
.
ÊÊ 
Include
ÊÊ 
(
ÊÊ 
d
ÊÊ 
=>
ÊÊ 
d
ÊÊ 
.
ÊÊ  

UploadedBy
ÊÊ  *
)
ÊÊ* +
.
ÁÁ !
FirstOrDefaultAsync
ÁÁ $
(
ÁÁ$ %
d
ÁÁ% &
=>
ÁÁ' )
d
ÁÁ* +
.
ÁÁ+ ,
Id
ÁÁ, .
==
ÁÁ/ 1
id
ÁÁ2 4
)
ÁÁ4 5
;
ÁÁ5 6
}
ËË 	
public
ÍÍ 
async
ÍÍ 
Task
ÍÍ 
<
ÍÍ 
IReadOnlyList
ÍÍ '
<
ÍÍ' (
Document
ÍÍ( 0
>
ÍÍ0 1
>
ÍÍ1 2
GetByUserAsync
ÍÍ3 A
(
ÍÍA B
string
ÍÍB H
userId
ÍÍI O
)
ÍÍO P
{
ÎÎ 	
return
ÏÏ 
await
ÏÏ 
_context
ÏÏ !
.
ÏÏ! "
	Documents
ÏÏ" +
.
ÌÌ 
Include
ÌÌ 
(
ÌÌ 
d
ÌÌ 
=>
ÌÌ 
d
ÌÌ 
.
ÌÌ  
Folder
ÌÌ  &
)
ÌÌ& '
.
ÓÓ 
Include
ÓÓ 
(
ÓÓ 
d
ÓÓ 
=>
ÓÓ 
d
ÓÓ 
.
ÓÓ  
DocumentRequests
ÓÓ  0
)
ÓÓ0 1
.
ÔÔ 
Where
ÔÔ 
(
ÔÔ 
d
ÔÔ 
=>
ÔÔ 
d
ÔÔ 
.
ÔÔ 
UploadedById
ÔÔ *
==
ÔÔ+ -
userId
ÔÔ. 4
)
ÔÔ4 5
.
 
OrderByDescending
 "
(
" #
d
# $
=>
% '
d
( )
.
) *
	CreatedAt
* 3
)
3 4
.
ÒÒ 
ToListAsync
ÒÒ 
(
ÒÒ 
)
ÒÒ 
;
ÒÒ 
}
ÚÚ 	
public
ÙÙ 
async
ÙÙ 
Task
ÙÙ 
<
ÙÙ 
IReadOnlyList
ÙÙ '
<
ÙÙ' (
Document
ÙÙ( 0
>
ÙÙ0 1
>
ÙÙ1 2(
GetValidatedDocumentsAsync
ÙÙ3 M
(
ÙÙM N
)
ÙÙN O
{
ıı 	
return
ˆˆ 
await
ˆˆ 
_context
ˆˆ !
.
ˆˆ! "
	Documents
ˆˆ" +
.
˜˜ 
Include
˜˜ 
(
˜˜ 
d
˜˜ 
=>
˜˜ 
d
˜˜ 
.
˜˜  
Folder
˜˜  &
)
˜˜& '
.
¯¯ 
Include
¯¯ 
(
¯¯ 
d
¯¯ 
=>
¯¯ 
d
¯¯ 
.
¯¯  

UploadedBy
¯¯  *
)
¯¯* +
.
˘˘ 
Where
˘˘ 
(
˘˘ 
d
˘˘ 
=>
˘˘ 
d
˘˘ 
.
˘˘ 
IsValidated
˘˘ )
==
˘˘* ,
true
˘˘- 1
)
˘˘1 2
.
˙˙ 
OrderByDescending
˙˙ "
(
˙˙" #
d
˙˙# $
=>
˙˙% '
d
˙˙( )
.
˙˙) *
	CreatedAt
˙˙* 3
)
˙˙3 4
.
˚˚ 
ToListAsync
˚˚ 
(
˚˚ 
)
˚˚ 
;
˚˚ 
}
¸¸ 	
public
˛˛ 
async
˛˛ 
Task
˛˛ 
<
˛˛ 
IReadOnlyList
˛˛ '
<
˛˛' (
Document
˛˛( 0
>
˛˛0 1
>
˛˛1 2'
GetPendingValidationAsync
˛˛3 L
(
˛˛L M
)
˛˛M N
{
ˇˇ 	
return
ÄÄ 
await
ÄÄ 
_context
ÄÄ !
.
ÄÄ! "
	Documents
ÄÄ" +
.
ÅÅ 
Include
ÅÅ 
(
ÅÅ 
d
ÅÅ 
=>
ÅÅ 
d
ÅÅ 
.
ÅÅ  
Folder
ÅÅ  &
)
ÅÅ& '
.
ÇÇ 
Include
ÇÇ 
(
ÇÇ 
d
ÇÇ 
=>
ÇÇ 
d
ÇÇ 
.
ÇÇ  

UploadedBy
ÇÇ  *
)
ÇÇ* +
.
ÉÉ 
Where
ÉÉ 
(
ÉÉ 
d
ÉÉ 
=>
ÉÉ 
!
ÉÉ 
d
ÉÉ 
.
ÉÉ 
IsValidated
ÉÉ *
==
ÉÉ+ -
true
ÉÉ. 2
)
ÉÉ2 3
.
ÑÑ 
OrderByDescending
ÑÑ "
(
ÑÑ" #
d
ÑÑ# $
=>
ÑÑ% '
d
ÑÑ( )
.
ÑÑ) *
	CreatedAt
ÑÑ* 3
)
ÑÑ3 4
.
ÖÖ 
ToListAsync
ÖÖ 
(
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà 
IReadOnlyList
àà '
<
àà' (
Document
àà( 0
>
àà0 1
>
àà1 2 
GetByFileTypeAsync
àà3 E
(
ààE F
string
ààF L
fileType
ààM U
)
ààU V
{
ââ 	
if
ää 
(
ää 
string
ää 
.
ää 
IsNullOrEmpty
ää $
(
ää$ %
fileType
ää% -
)
ää- .
)
ää. /
return
ãã 
new
ãã 
List
ãã 
<
ãã  
Document
ãã  (
>
ãã( )
(
ãã) *
)
ãã* +
;
ãã+ ,
return
çç 
await
çç 
_context
çç !
.
çç! "
	Documents
çç" +
.
éé 
Include
éé 
(
éé 
d
éé 
=>
éé 
d
éé 
.
éé  
Folder
éé  &
)
éé& '
.
èè 
Include
èè 
(
èè 
d
èè 
=>
èè 
d
èè 
.
èè  

UploadedBy
èè  *
)
èè* +
.
êê 
Where
êê 
(
êê 
d
êê 
=>
êê 
d
êê 
.
êê 
FileType
êê &
.
êê& '
ToLower
êê' .
(
êê. /
)
êê/ 0
==
êê1 3
fileType
êê4 <
.
êê< =
ToLower
êê= D
(
êêD E
)
êêE F
)
êêF G
.
ëë 
OrderByDescending
ëë "
(
ëë" #
d
ëë# $
=>
ëë% '
d
ëë( )
.
ëë) *
	CreatedAt
ëë* 3
)
ëë3 4
.
íí 
ToListAsync
íí 
(
íí 
)
íí 
;
íí 
}
ìì 	
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
bool
ïï 
>
ïï #
ValidateDocumentAsync
ïï  5
(
ïï5 6
int
ïï6 9

documentId
ïï: D
,
ïïD E
bool
ïïF J
isValid
ïïK R
)
ïïR S
{
ññ 	
var
óó 
document
óó 
=
óó 
await
óó  
_context
óó! )
.
óó) *
	Documents
óó* 3
.
óó3 4
	FindAsync
óó4 =
(
óó= >

documentId
óó> H
)
óóH I
;
óóI J
if
òò 
(
òò 
document
òò 
==
òò 
null
òò  
)
òò  !
return
ôô 
false
ôô 
;
ôô 
document
õõ 
.
õõ 
IsValidated
õõ  
=
õõ! "
isValid
õõ# *
;
õõ* +
document
úú 
.
úú 
	UpdatedAt
úú 
=
úú  
DateTime
úú! )
.
úú) *
UtcNow
úú* 0
;
úú0 1
return
ûû 
true
ûû 
;
ûû 
}
üü 	
public
°° 
async
°° 
Task
°° 
<
°° 
long
°° 
>
°° #
GetTotalFileSizeAsync
°°  5
(
°°5 6
)
°°6 7
{
¢¢ 	
return
££ 
await
££ 
_context
££ !
.
££! "
	Documents
££" +
.
•• 
SumAsync
•• 
(
•• 
d
•• 
=>
•• 
d
••  
.
••  !
FileSize
••! )
)
••) *
;
••* +
}
¶¶ 	
public
®® 
async
®® 
Task
®® 
<
®® 
int
®® 
>
®® +
GetDocumentCountByFolderAsync
®® <
(
®®< =
int
®®= @
folderId
®®A I
)
®®I J
{
©© 	
return
™™ 
await
™™ 
_context
™™ !
.
™™! "
	Documents
™™" +
.
´´ 

CountAsync
´´ 
(
´´ 
d
´´ 
=>
´´  
d
´´! "
.
´´" #
FolderId
´´# +
==
´´, .
folderId
´´/ 7
)
´´7 8
;
´´8 9
}
¨¨ 	
private
∞∞ 

IQueryable
∞∞ 
<
∞∞ 
Document
∞∞ #
>
∞∞# $
ApplyFilters
∞∞% 1
(
∞∞1 2

IQueryable
∞∞2 <
<
∞∞< =
Document
∞∞= E
>
∞∞E F
query
∞∞G L
,
∞∞L M
DocumentFilterDto
∞∞N _
filter
∞∞` f
)
∞∞f g
{
±± 	
if
≤≤ 
(
≤≤ 
!
≤≤ 
string
≤≤ 
.
≤≤ 
IsNullOrEmpty
≤≤ %
(
≤≤% &
filter
≤≤& ,
.
≤≤, -
Name
≤≤- 1
)
≤≤1 2
)
≤≤2 3
query
≥≥ 
=
≥≥ 
query
≥≥ 
.
≥≥ 
Where
≥≥ #
(
≥≥# $
d
≥≥$ %
=>
≥≥& (
d
≥≥) *
.
≥≥* +
Name
≥≥+ /
.
≥≥/ 0
Contains
≥≥0 8
(
≥≥8 9
filter
≥≥9 ?
.
≥≥? @
Name
≥≥@ D
)
≥≥D E
)
≥≥E F
;
≥≥F G
if
µµ 
(
µµ 
!
µµ 
string
µµ 
.
µµ 
IsNullOrEmpty
µµ %
(
µµ% &
filter
µµ& ,
.
µµ, -
FileType
µµ- 5
)
µµ5 6
)
µµ6 7
query
∂∂ 
=
∂∂ 
query
∂∂ 
.
∂∂ 
Where
∂∂ #
(
∂∂# $
d
∂∂$ %
=>
∂∂& (
d
∂∂) *
.
∂∂* +
FileType
∂∂+ 3
==
∂∂4 6
filter
∂∂7 =
.
∂∂= >
FileType
∂∂> F
)
∂∂F G
;
∂∂G H
if
∏∏ 
(
∏∏ 
filter
∏∏ 
.
∏∏ 
FolderId
∏∏ 
.
∏∏  
HasValue
∏∏  (
)
∏∏( )
query
ππ 
=
ππ 
query
ππ 
.
ππ 
Where
ππ #
(
ππ# $
d
ππ$ %
=>
ππ& (
d
ππ) *
.
ππ* +
FolderId
ππ+ 3
==
ππ4 6
filter
ππ7 =
.
ππ= >
FolderId
ππ> F
)
ππF G
;
ππG H
if
ªª 
(
ªª 
!
ªª 
string
ªª 
.
ªª 
IsNullOrEmpty
ªª %
(
ªª% &
filter
ªª& ,
.
ªª, -

FolderName
ªª- 7
)
ªª7 8
)
ªª8 9
query
ºº 
=
ºº 
query
ºº 
.
ºº 
Where
ºº #
(
ºº# $
d
ºº$ %
=>
ºº& (
d
ºº) *
.
ºº* +
Folder
ºº+ 1
.
ºº1 2
Name
ºº2 6
.
ºº6 7
Contains
ºº7 ?
(
ºº? @
filter
ºº@ F
.
ººF G

FolderName
ººG Q
)
ººQ R
)
ººR S
;
ººS T
if
ææ 
(
ææ 
!
ææ 
string
ææ 
.
ææ 
IsNullOrEmpty
ææ %
(
ææ% &
filter
ææ& ,
.
ææ, -
UploadedById
ææ- 9
)
ææ9 :
)
ææ: ;
query
øø 
=
øø 
query
øø 
.
øø 
Where
øø #
(
øø# $
d
øø$ %
=>
øø& (
d
øø) *
.
øø* +
UploadedById
øø+ 7
.
øø7 8
ToString
øø8 @
(
øø@ A
)
øøA B
==
øøC E
filter
øøF L
.
øøL M
UploadedById
øøM Y
)
øøY Z
;
øøZ [
if
¡¡ 
(
¡¡ 
!
¡¡ 
string
¡¡ 
.
¡¡ 
IsNullOrEmpty
¡¡ %
(
¡¡% &
filter
¡¡& ,
.
¡¡, -
UploadedByName
¡¡- ;
)
¡¡; <
)
¡¡< =
query
¬¬ 
=
¬¬ 
query
¬¬ 
.
¬¬ 
Where
¬¬ #
(
¬¬# $
d
¬¬$ %
=>
¬¬& (
d
√√ 
.
√√ 

UploadedBy
√√  
.
√√  !
UserName
√√! )
.
√√) *
Contains
√√* 2
(
√√2 3
filter
√√3 9
.
√√9 :
UploadedByName
√√: H
)
√√H I
||
√√J L
d
ƒƒ 
.
ƒƒ 

UploadedBy
ƒƒ  
.
ƒƒ  !
UserName
ƒƒ! )
!
ƒƒ) *
.
ƒƒ* +
Contains
ƒƒ+ 3
(
ƒƒ3 4
filter
ƒƒ4 :
.
ƒƒ: ;
UploadedByName
ƒƒ; I
)
ƒƒI J
)
≈≈ 
;
≈≈ 
if
«« 
(
«« 
filter
«« 
.
«« 
IsValidated
«« "
.
««" #
HasValue
««# +
)
««+ ,
query
»» 
=
»» 
query
»» 
.
»» 
Where
»» #
(
»»# $
d
»»$ %
=>
»»& (
d
»») *
.
»»* +
IsValidated
»»+ 6
==
»»7 9
filter
»»: @
.
»»@ A
IsValidated
»»A L
)
»»L M
;
»»M N
if
„„ 
(
„„ 
filter
„„ 
.
„„ 
	FileTypes
„„  
?
„„  !
.
„„! "
Any
„„" %
(
„„% &
)
„„& '
==
„„( *
true
„„+ /
)
„„/ 0
query
‰‰ 
=
‰‰ 
query
‰‰ 
.
‰‰ 
Where
‰‰ #
(
‰‰# $
d
‰‰$ %
=>
‰‰& (
filter
‰‰) /
.
‰‰/ 0
	FileTypes
‰‰0 9
.
‰‰9 :
Contains
‰‰: B
(
‰‰B C
d
‰‰C D
.
‰‰D E
FileType
‰‰E M
)
‰‰M N
)
‰‰N O
;
‰‰O P
if
ÊÊ 
(
ÊÊ 
!
ÊÊ 
string
ÊÊ 
.
ÊÊ 
IsNullOrEmpty
ÊÊ %
(
ÊÊ% &
filter
ÊÊ& ,
.
ÊÊ, -
Search
ÊÊ- 3
)
ÊÊ3 4
)
ÊÊ4 5
{
ÁÁ 
query
ËË 
=
ËË 
query
ËË 
.
ËË 
Where
ËË #
(
ËË# $
d
ËË$ %
=>
ËË& (
d
ÈÈ 
.
ÈÈ 
Name
ÈÈ 
.
ÈÈ 
Contains
ÈÈ #
(
ÈÈ# $
filter
ÈÈ$ *
.
ÈÈ* +
Search
ÈÈ+ 1
)
ÈÈ1 2
||
ÈÈ3 5
d
ÏÏ 
.
ÏÏ 
Folder
ÏÏ 
.
ÏÏ 
Name
ÏÏ !
.
ÏÏ! "
Contains
ÏÏ" *
(
ÏÏ* +
filter
ÏÏ+ 1
.
ÏÏ1 2
Search
ÏÏ2 8
)
ÏÏ8 9
)
ÌÌ 
;
ÌÌ 
}
ÓÓ 
return
 
query
 
;
 
}
ÒÒ 	
private
ÛÛ 

IQueryable
ÛÛ 
<
ÛÛ 
Document
ÛÛ #
>
ÛÛ# $
ApplySorting
ÛÛ% 1
(
ÛÛ1 2

IQueryable
ÛÛ2 <
<
ÛÛ< =
Document
ÛÛ= E
>
ÛÛE F
query
ÛÛG L
,
ÛÛL M
string
ÛÛN T
?
ÛÛT U
sortBy
ÛÛV \
,
ÛÛ\ ]
string
ÛÛ^ d
?
ÛÛd e
sortDirection
ÛÛf s
)
ÛÛs t
{
ÙÙ 	
if
ıı 
(
ıı 
string
ıı 
.
ıı 
IsNullOrEmpty
ıı $
(
ıı$ %
sortBy
ıı% +
)
ıı+ ,
)
ıı, -
return
ˆˆ 
query
ˆˆ 
.
ˆˆ 
OrderByDescending
ˆˆ .
(
ˆˆ. /
d
ˆˆ/ 0
=>
ˆˆ1 3
d
ˆˆ4 5
.
ˆˆ5 6
	CreatedAt
ˆˆ6 ?
)
ˆˆ? @
;
ˆˆ@ A
var
¯¯ 
isDescending
¯¯ 
=
¯¯ 
sortDirection
¯¯ ,
?
¯¯, -
.
¯¯- .
ToLower
¯¯. 5
(
¯¯5 6
)
¯¯6 7
==
¯¯8 :
$str
¯¯; A
;
¯¯A B
return
˙˙ 
sortBy
˙˙ 
.
˙˙ 
ToLower
˙˙ !
(
˙˙! "
)
˙˙" #
switch
˙˙$ *
{
˚˚ 
$str
¸¸ 
=>
¸¸ 
isDescending
¸¸ &
?
¸¸' (
query
¸¸) .
.
¸¸. /
OrderByDescending
¸¸/ @
(
¸¸@ A
d
¸¸A B
=>
¸¸C E
d
¸¸F G
.
¸¸G H
Name
¸¸H L
)
¸¸L M
:
˝˝' (
query
˝˝) .
.
˝˝. /
OrderBy
˝˝/ 6
(
˝˝6 7
d
˝˝7 8
=>
˝˝9 ;
d
˝˝< =
.
˝˝= >
Name
˝˝> B
)
˝˝B C
,
˝˝C D
$str
˛˛ 
=>
˛˛ 
isDescending
˛˛ *
?
˛˛+ ,
query
˛˛- 2
.
˛˛2 3
OrderByDescending
˛˛3 D
(
˛˛D E
d
˛˛E F
=>
˛˛G I
d
˛˛J K
.
˛˛K L
FileSize
˛˛L T
)
˛˛T U
:
ˇˇ+ ,
query
ˇˇ- 2
.
ˇˇ2 3
OrderBy
ˇˇ3 :
(
ˇˇ: ;
d
ˇˇ; <
=>
ˇˇ= ?
d
ˇˇ@ A
.
ˇˇA B
FileSize
ˇˇB J
)
ˇˇJ K
,
ˇˇK L
$str
ÄÄ 
=>
ÄÄ 
isDescending
ÄÄ *
?
ÄÄ+ ,
query
ÄÄ- 2
.
ÄÄ2 3
OrderByDescending
ÄÄ3 D
(
ÄÄD E
d
ÄÄE F
=>
ÄÄG I
d
ÄÄJ K
.
ÄÄK L
FileType
ÄÄL T
)
ÄÄT U
:
ÅÅ+ ,
query
ÅÅ- 2
.
ÅÅ2 3
OrderBy
ÅÅ3 :
(
ÅÅ: ;
d
ÅÅ; <
=>
ÅÅ= ?
d
ÅÅ@ A
.
ÅÅA B
FileType
ÅÅB J
)
ÅÅJ K
,
ÅÅK L
$str
ÇÇ 
=>
ÇÇ 
isDescending
ÇÇ  ,
?
ÇÇ- .
query
ÇÇ/ 4
.
ÇÇ4 5
OrderByDescending
ÇÇ5 F
(
ÇÇF G
d
ÇÇG H
=>
ÇÇI K
d
ÇÇL M
.
ÇÇM N
Folder
ÇÇN T
.
ÇÇT U
Name
ÇÇU Y
)
ÇÇY Z
:
ÉÉ- .
query
ÉÉ/ 4
.
ÉÉ4 5
OrderBy
ÉÉ5 <
(
ÉÉ< =
d
ÉÉ= >
=>
ÉÉ? A
d
ÉÉB C
.
ÉÉC D
Folder
ÉÉD J
.
ÉÉJ K
Name
ÉÉK O
)
ÉÉO P
,
ÉÉP Q
$str
ÖÖ 
=>
ÖÖ 
isDescending
ÖÖ )
?
ÖÖ* +
query
ÖÖ, 1
.
ÖÖ1 2
OrderByDescending
ÖÖ2 C
(
ÖÖC D
d
ÖÖD E
=>
ÖÖF H
d
ÖÖI J
.
ÖÖJ K
Version
ÖÖK R
)
ÖÖR S
:
ÜÜ* +
query
ÜÜ, 1
.
ÜÜ1 2
OrderBy
ÜÜ2 9
(
ÜÜ9 :
d
ÜÜ: ;
=>
ÜÜ< >
d
ÜÜ? @
.
ÜÜ@ A
Version
ÜÜA H
)
ÜÜH I
,
ÜÜI J
$str
áá 
=>
áá 
isDescending
áá +
?
áá, -
query
áá. 3
.
áá3 4
OrderByDescending
áá4 E
(
ááE F
d
ááF G
=>
ááH J
d
ááK L
.
ááL M
	CreatedAt
ááM V
)
ááV W
:
àà, -
query
àà. 3
.
àà3 4
OrderBy
àà4 ;
(
àà; <
d
àà< =
=>
àà> @
d
ààA B
.
ààB C
	CreatedAt
ààC L
)
ààL M
,
ààM N
$str
ââ 
=>
ââ 
isDescending
ââ +
?
ââ, -
query
ââ. 3
.
ââ3 4
OrderByDescending
ââ4 E
(
ââE F
d
ââF G
=>
ââH J
d
ââK L
.
ââL M
	UpdatedAt
ââM V
)
ââV W
:
ää, -
query
ää. 3
.
ää3 4
OrderBy
ää4 ;
(
ää; <
d
ää< =
=>
ää> @
d
ääA B
.
ääB C
	UpdatedAt
ääC L
)
ääL M
,
ääM N
$str
ãã 
=>
ãã  
isDescending
ãã! -
?
ãã. /
query
ãã0 5
.
ãã5 6
OrderByDescending
ãã6 G
(
ããG H
d
ããH I
=>
ããJ L
d
ããM N
.
ããN O
IsValidated
ããO Z
)
ããZ [
:
åå. /
query
åå0 5
.
åå5 6
OrderBy
åå6 =
(
åå= >
d
åå> ?
=>
åå@ B
d
ååC D
.
ååD E
IsValidated
ååE P
)
ååP Q
,
ååQ R
_
éé 
=>
éé 
query
éé 
.
éé 
OrderByDescending
éé ,
(
éé, -
d
éé- .
=>
éé/ 1
d
éé2 3
.
éé3 4
	CreatedAt
éé4 =
)
éé= >
}
èè 
;
èè 
}
êê 	
public
íí 
async
íí 
Task
íí 
<
íí 
DocFolderStats
íí (
>
íí( )&
MyDocumentAndFolderStats
íí* B
(
ííB C
string
ííC I
userId
ííJ P
)
ííP Q
{
ìì 	
try
îî 
{
ïï 
var
óó 
folderCount
óó 
=
óó  !
await
óó" '
_context
óó( 0
.
óó0 1
Folders
óó1 8
.
óó8 9

CountAsync
óó9 C
(
óóC D
f
óóD E
=>
óóF H
f
óóI J
.
óóJ K
CreatedById
óóK V
==
óóW Y
userId
óóZ `
)
óó` a
;
óóa b
var
òò 
totalFileSize
òò !
=
òò" #
await
òò$ )
_context
òò* 2
.
òò2 3
	Documents
òò3 <
.
ôô 
Where
ôô 
(
ôô 
d
ôô 
=>
ôô 
d
ôô  !
.
ôô! "
UploadedById
ôô" .
==
ôô/ 1
userId
ôô2 8
)
ôô8 9
.
öö 
SumAsync
öö 
(
öö 
d
öö 
=>
öö  "
d
öö# $
.
öö$ %
FileSize
öö% -
)
öö- .
;
öö. /
var
õõ 

imageCount
õõ 
=
õõ  
await
õõ! &
_context
õõ' /
.
õõ/ 0
	Documents
õõ0 9
.
õõ9 :

CountAsync
õõ: D
(
õõD E
d
õõE F
=>
õõG I
d
õõJ K
.
õõK L
UploadedById
õõL X
==
õõY [
userId
õõ\ b
&&
õõc e
(
õõf g
d
õõg h
.
õõh i
FileType
õõi q
==
õõr t
$str
õõu z
||
õõ{ }
d
õõ~ 
.õõ Ä
FileTypeõõÄ à
==õõâ ã
$strõõå ë
||õõí î
dõõï ñ
.õõñ ó
FileTypeõõó ü
==õõ† ¢
$strõõ£ ™
)õõ™ ´
)õõ´ ¨
;õõ¨ ≠
var
úú 
	wordCount
úú 
=
úú 
await
úú  %
_context
úú& .
.
úú. /
	Documents
úú/ 8
.
úú8 9

CountAsync
úú9 C
(
úúC D
d
úúD E
=>
úúF H
d
úúI J
.
úúJ K
UploadedById
úúK W
==
úúX Z
userId
úú[ a
&&
úúb d
(
úúe f
d
úúf g
.
úúg h
FileType
úúh p
==
úúq s
$str
úút z
||
úú{ }
d
úú~ 
.úú Ä
FileTypeúúÄ à
==úúâ ã
$strúúå ë
||úúí î
dúúï ñ
.úúñ ó
FileTypeúúó ü
==úú† ¢
$strúú£ ©
)úú© ™
)úú™ ´
;úú´ ¨
var
ùù 
pdfCount
ùù 
=
ùù 
await
ùù $
_context
ùù% -
.
ùù- .
	Documents
ùù. 7
.
ùù7 8

CountAsync
ùù8 B
(
ùùB C
d
ùùC D
=>
ùùE G
d
ùùH I
.
ùùI J
UploadedById
ùùJ V
==
ùùW Y
userId
ùùZ `
&&
ùùa c
d
ùùd e
.
ùùe f
FileType
ùùf n
==
ùùo q
$str
ùùr w
)
ùùw x
;
ùùx y
var
ûû 

audioCount
ûû 
=
ûû  
await
ûû! &
_context
ûû' /
.
ûû/ 0
	Documents
ûû0 9
.
ûû9 :

CountAsync
ûû: D
(
ûûD E
d
ûûE F
=>
ûûG I
d
ûûJ K
.
ûûK L
UploadedById
ûûL X
==
ûûY [
userId
ûû\ b
&&
ûûc e
(
ûûf g
d
ûûg h
.
ûûh i
FileType
ûûi q
==
ûûr t
$str
ûûu z
||
ûû{ }
d
ûû~ 
.ûû Ä
FileTypeûûÄ à
==ûûâ ã
$strûûå ë
||ûûí î
dûûï ñ
.ûûñ ó
FileTypeûûó ü
==ûû† ¢
$strûû£ ™
)ûû™ ´
)ûû´ ¨
;ûû¨ ≠
var
†† 

videoCount
†† 
=
††  
await
††! &
_context
††' /
.
††/ 0
	Documents
††0 9
.
††9 :

CountAsync
††: D
(
††D E
d
††E F
=>
††G I
d
††J K
.
††K L
UploadedById
††L X
==
††Y [
userId
††\ b
&&
††c e
(
††f g
d
††g h
.
††h i
FileType
††i q
==
††r t
$str
††u z
||
††{ }
d
††~ 
.†† Ä
FileType††Ä à
==††â ã
$str††å ë
||††í î
d††ï ñ
.††ñ ó
FileType††ó ü
==††† ¢
$str††£ ™
)††™ ´
)††´ ¨
;††¨ ≠
var
¢¢ 
stats
¢¢ 
=
¢¢ 
new
¢¢ 
DocFolderStats
¢¢  .
{
££ 
FolderCount
¶¶ 
=
¶¶  !
folderCount
¶¶" -
,
¶¶- .
TotalFileSize
ßß !
=
ßß" #
totalFileSize
ßß$ 1
,
ßß1 2

ImageCount
®® 
=
®®  

imageCount
®®! +
,
®®+ ,
	WordCount
©© 
=
©© 
	wordCount
©©  )
,
©©) *
PdfCount
™™ 
=
™™ 
pdfCount
™™ '
,
™™' (

AudioCount
´´ 
=
´´  

audioCount
´´! +
,
´´+ ,

VideoCount
¨¨ 
=
¨¨  

videoCount
¨¨! +
}
≠≠ 
;
≠≠ 
Console
ØØ 
.
ØØ 
	WriteLine
ØØ !
(
ØØ! "
$"
ØØ" $
$str
ØØ$ /
{
ØØ/ 0

imageCount
ØØ0 :
}
ØØ: ;
$str
ØØ; G
{
ØØG H
	wordCount
ØØH Q
}
ØØQ R
$str
ØØR ]
{
ØØ] ^
pdfCount
ØØ^ f
}
ØØf g
$str
ØØg t
{
ØØt u

audioCount
ØØu 
}ØØ Ä
$strØØÄ ç
{ØØç é

videoCountØØé ò
}ØØò ô
"ØØô ö
)ØØö õ
;ØØõ ú
return
∞∞ 
stats
∞∞ 
;
∞∞ 
}
±± 
catch
≤≤ 
{
≥≥ 
throw
µµ 
;
µµ 
}
∂∂ 
}
∑∑ 	
public
ππ 
Task
ππ 
<
ππ 
int
ππ 
>
ππ "
GetTotalFoldersAsync
ππ -
(
ππ- .
)
ππ. /
{
∫∫ 	
return
ªª 
_context
ªª 
.
ªª 
Folders
ªª #
.
ªª# $

CountAsync
ªª$ .
(
ªª. /
)
ªª/ 0
;
ªª0 1
}
ºº 	
}
ΩΩ 
}ææ œ‰
^/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/FolderRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{		 
public

 

class

 
FolderRepository

 !
:

" #
GenericRepository

$ 5
<

5 6
Folder

6 <
>

< =
,

= >
IFolderRepository

? P
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public 
FolderRepository 
(  
AppDbContext  ,
context- 4
)4 5
:6 7
base8 <
(< =
context= D
)D E
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
PagedResult %
<% &
Folder& ,
>, -
>- .
GetHomeFolders/ =
(= >
FolderFilterDto> M
filterN T
,T U
intV Y
departmentIdZ f
)f g
{ 	
var 
query 
= 
_context  
.  !
Folders! (
. 
Include 
( 
f 
=> 
f 
.  
ParentFolder  ,
), -
. 
Include 
( 
f 
=> 
f 
.  

Department  *
)* +
. 
Include 
( 
f 
=> 
f 
.  
	CreatedBy  )
)) *
. 
Include 
( 
f 
=> 
f 
.  

SubFolders  *
)* +
. 
Where 
( 
f 
=> 
f 
. 
DepartmentId *
==+ -
departmentId. :
): ;
. 
Include 
( 
f 
=> 
f 
.  
	Documents  )
)) *
. 
AsQueryable 
( 
) 
; 
query   
=   
ApplyFilters    
(    !
query  ! &
,  & '
filter  ( .
)  . /
;  / 0
var## 
totalRecords## 
=## 
await## $
query##% *
.##* +

CountAsync##+ 5
(##5 6
)##6 7
;##7 8
query&& 
=&& 
ApplySorting&&  
(&&  !
query&&! &
,&&& '
filter&&( .
.&&. /
SortBy&&/ 5
,&&5 6
filter&&7 =
.&&= >
SortDirection&&> K
)&&K L
;&&L M
var)) 
folders)) 
=)) 
await)) 
query))  %
.** 
Skip** 
(** 
(** 
filter** 
.** 

PageNumber** (
-**) *
$num**+ ,
)**, -
***. /
filter**0 6
.**6 7
PageSize**7 ?
)**? @
.++ 
Take++ 
(++ 
filter++ 
.++ 
PageSize++ %
)++% &
.,, 
ToListAsync,, 
(,, 
),, 
;,, 
return.. 
folders.. 
... 
ToPagedResult.. (
(..( )
filter// 
.// 

PageNumber// !
,//! "
filter00 
.00 
PageSize00 
,00  
totalRecords11 
,11 
filter22 
.22 
Search22 
,22 
filter33 
.33 
SortBy33 
,33 
filter44 
.44 
SortDirection44 $
)55 
;55 
}66 	
public88 
async88 
Task88 
<88 
PagedResult88 %
<88% &
Folder88& ,
>88, -
>88- .
GetSubFoldersAsync88/ A
(88A B
FolderFilterDto88B Q
filter88R X
,88X Y
int88Z ]
parentFolderId88^ l
)88l m
{99 	
var:: 
query:: 
=:: 
_context::  
.::  !
Folders::! (
.;; 
Include;; 
(;; 
f;; 
=>;; 
f;; 
.;;  
ParentFolder;;  ,
);;, -
.<< 
Include<< 
(<< 
f<< 
=><< 
f<< 
.<<  

Department<<  *
)<<* +
.== 
Include== 
(== 
f== 
=>== 
f== 
.==  
	CreatedBy==  )
)==) *
.>> 
Include>> 
(>> 
f>> 
=>>> 
f>> 
.>>  

SubFolders>>  *
)>>* +
.?? 
Where?? 
(?? 
f?? 
=>?? 
f?? 
.?? 
ParentFolderId?? ,
==??- /
parentFolderId??0 >
)??> ?
.@@ 
AsQueryable@@ 
(@@ 
)@@ 
;@@ 
queryCC 
=CC 
ApplyFiltersCC  
(CC  !
queryCC! &
,CC& '
filterCC( .
)CC. /
;CC/ 0
varFF 
totalRecordsFF 
=FF 
awaitFF $
queryFF% *
.FF* +

CountAsyncFF+ 5
(FF5 6
)FF6 7
;FF7 8
queryII 
=II 
ApplySortingII  
(II  !
queryII! &
,II& '
filterII( .
.II. /
SortByII/ 5
,II5 6
filterII7 =
.II= >
SortDirectionII> K
)IIK L
;IIL M
varLL 
foldersLL 
=LL 
awaitLL 
queryLL  %
.MM 
SkipMM 
(MM 
(MM 
filterMM 
.MM 

PageNumberMM (
-MM) *
$numMM+ ,
)MM, -
*MM. /
filterMM0 6
.MM6 7
PageSizeMM7 ?
)MM? @
.NN 
TakeNN 
(NN 
filterNN 
.NN 
PageSizeNN %
)NN% &
.OO 
ToListAsyncOO 
(OO 
)OO 
;OO 
returnQQ 
foldersQQ 
.QQ 
ToPagedResultQQ (
(QQ( )
filterRR 
.RR 

PageNumberRR !
,RR! "
filterSS 
.SS 
PageSizeSS 
,SS  
totalRecordsTT 
,TT 
filterUU 
.UU 
SearchUU 
,UU 
filterVV 
.VV 
SortByVV 
,VV 
filterWW 
.WW 
SortDirectionWW $
)XX 
;XX 
}YY 	
public[[ 
async[[ 
Task[[ 
<[[ 
PagedResult[[ %
<[[% &
Folder[[& ,
>[[, -
>[[- .
GetPagedAsync[[/ <
([[< =
FolderFilterDto[[= L
filter[[M S
)[[S T
{\\ 	
var]] 
query]] 
=]] 
_context]]  
.]]  !
Folders]]! (
.^^ 
Include^^ 
(^^ 
f^^ 
=>^^ 
f^^ 
.^^  
ParentFolder^^  ,
)^^, -
.__ 
Include__ 
(__ 
f__ 
=>__ 
f__ 
.__  

Department__  *
)__* +
.`` 
Include`` 
(`` 
f`` 
=>`` 
f`` 
.``  
	CreatedBy``  )
)``) *
.aa 
Includeaa 
(aa 
faa 
=>aa 
faa 
.aa  

SubFoldersaa  *
)aa* +
.bb 
Includebb 
(bb 
fbb 
=>bb 
fbb 
.bb  
	Documentsbb  )
)bb) *
.cc 
AsQueryablecc 
(cc 
)cc 
;cc 
queryff 
=ff 
ApplyFiltersff  
(ff  !
queryff! &
,ff& '
filterff( .
)ff. /
;ff/ 0
varii 
totalRecordsii 
=ii 
awaitii $
queryii% *
.ii* +

CountAsyncii+ 5
(ii5 6
)ii6 7
;ii7 8
queryll 
=ll 
ApplySortingll  
(ll  !
queryll! &
,ll& '
filterll( .
.ll. /
SortByll/ 5
,ll5 6
filterll7 =
.ll= >
SortDirectionll> K
)llK L
;llL M
varoo 
foldersoo 
=oo 
awaitoo 
queryoo  %
.pp 
Skippp 
(pp 
(pp 
filterpp 
.pp 

PageNumberpp (
-pp) *
$numpp+ ,
)pp, -
*pp. /
filterpp0 6
.pp6 7
PageSizepp7 ?
)pp? @
.qq 
Takeqq 
(qq 
filterqq 
.qq 
PageSizeqq %
)qq% &
.rr 
ToListAsyncrr 
(rr 
)rr 
;rr 
returntt 
folderstt 
.tt 
ToPagedResulttt (
(tt( )
filteruu 
.uu 

PageNumberuu !
,uu! "
filtervv 
.vv 
PageSizevv 
,vv  
totalRecordsww 
,ww 
filterxx 
.xx 
Searchxx 
,xx 
filteryy 
.yy 
SortByyy 
,yy 
filterzz 
.zz 
SortDirectionzz $
){{ 
;{{ 
}|| 	
public}} 
async}} 
Task}} 
<}} 
Folder}}  
?}}  !
>}}! "#
GetByIdWithDetailsAsync}}# :
(}}: ;
int}}; >
id}}? A
)}}A B
{~~ 	
return 
await 
_context !
.! "
Folders" )
.
ÄÄ 
Include
ÄÄ 
(
ÄÄ 
f
ÄÄ 
=>
ÄÄ 
f
ÄÄ 
.
ÄÄ  
ParentFolder
ÄÄ  ,
)
ÄÄ, -
.
ÅÅ 
Include
ÅÅ 
(
ÅÅ 
f
ÅÅ 
=>
ÅÅ 
f
ÅÅ 
.
ÅÅ  

Department
ÅÅ  *
)
ÅÅ* +
.
ÇÇ 
Include
ÇÇ 
(
ÇÇ 
f
ÇÇ 
=>
ÇÇ 
f
ÇÇ 
.
ÇÇ  
	CreatedBy
ÇÇ  )
)
ÇÇ) *
.
ÉÉ 
Include
ÉÉ 
(
ÉÉ 
f
ÉÉ 
=>
ÉÉ 
f
ÉÉ 
.
ÉÉ  

SubFolders
ÉÉ  *
)
ÉÉ* +
.
ÑÑ 
Include
ÑÑ 
(
ÑÑ 
f
ÑÑ 
=>
ÑÑ 
f
ÑÑ 
.
ÑÑ  
	Documents
ÑÑ  )
)
ÑÑ) *
.
ÖÖ !
FirstOrDefaultAsync
ÖÖ $
(
ÖÖ$ %
f
ÖÖ% &
=>
ÖÖ' )
f
ÖÖ* +
.
ÖÖ+ ,
Id
ÖÖ, .
==
ÖÖ/ 1
id
ÖÖ2 4
)
ÖÖ4 5
;
ÖÖ5 6
}
ÜÜ 	
public
áá 
async
áá 
Task
áá 
<
áá 
PagedResult
áá %
<
áá% &
Folder
áá& ,
>
áá, -
>
áá- .
GetByFolderID
áá/ <
(
áá< =
FolderFilterDto
áá= L
filter
ááM S
,
ááS T
int
ááU X
folderId
ááY a
)
ááa b
{
àà 	
var
ää 
	documents
ää 
=
ää 
await
ää !
_context
ää" *
.
ää* +
	Documents
ää+ 4
.
ãã 
Where
ãã 
(
ãã 
d
ãã 
=>
ãã 
d
ãã 
.
ãã 
FolderId
ãã #
==
ãã$ &
folderId
ãã' /
)
ãã/ 0
.
åå 
ToListAsync
åå 
(
åå 
)
åå 
;
åå 
var
éé 
query
éé 
=
éé 
_context
éé  
.
éé  !
Folders
éé! (
.
èè 
Include
èè 
(
èè 
f
èè 
=>
èè 
f
èè 
.
èè  
ParentFolder
èè  ,
)
èè, -
.
êê 
Include
êê 
(
êê 
f
êê 
=>
êê 
f
êê 
.
êê  

Department
êê  *
)
êê* +
.
ëë 
Include
ëë 
(
ëë 
f
ëë 
=>
ëë 
f
ëë 
.
ëë  
	CreatedBy
ëë  )
)
ëë) *
.
íí 
Include
íí 
(
íí 
f
íí 
=>
íí 
f
íí 
.
íí  

SubFolders
íí  *
)
íí* +
.
ìì 
Include
ìì 
(
ìì 
f
ìì 
=>
ìì 
f
ìì 
.
ìì  
	Documents
ìì  )
)
ìì) *
.
ïï 
AsQueryable
ïï 
(
ïï 
)
ïï 
;
ïï 
Console
ññ 
.
ññ 
	WriteLine
ññ 
(
ññ 
$str
ññ T
)
ññT U
;
ññU V
Console
óó 
.
óó 
	WriteLine
óó 
(
óó 
$"
óó  
$str
óó  F
{
óóF G
query
óóG L
}
óóL M
"
óóM N
)
óóN O
;
óóO P
query
ôô 
=
ôô 
ApplyFilters
ôô  
(
ôô  !
query
ôô! &
,
ôô& '
filter
ôô( .
)
ôô. /
;
ôô/ 0
foreach
öö 
(
öö 
var
öö 
folder
öö 
in
öö  "
query
öö# (
.
öö( )
ToList
öö) /
(
öö/ 0
)
öö0 1
)
öö1 2
{
õõ 
Console
úú 
.
úú 
	WriteLine
úú !
(
úú! "
$"
úú" $
$str
úú$ .
{
úú. /
folder
úú/ 5
.
úú5 6
	Documents
úú6 ?
}
úú? @
$str
úú@ R
{
úúR S
folder
úúS Y
.
úúY Z
ParentFolderId
úúZ h
}
úúh i
"
úúi j
)
úúj k
;
úúk l
Console
ùù 
.
ùù 
	WriteLine
ùù !
(
ùù! "
$"
ùù" $
$str
ùù$ /
{
ùù/ 0
folder
ùù0 6
.
ùù6 7
Id
ùù7 9
}
ùù9 :
$str
ùù: B
{
ùùB C
folder
ùùC I
.
ùùI J
Name
ùùJ N
}
ùùN O
$str
ùùO a
{
ùùa b
folder
ùùb h
.
ùùh i
ParentFolderId
ùùi w
}
ùùw x
"
ùùx y
)
ùùy z
;
ùùz {
}
ûû 
var
°° 
totalRecords
°° 
=
°° 
await
°° $
query
°°% *
.
°°* +

CountAsync
°°+ 5
(
°°5 6
)
°°6 7
;
°°7 8
query
§§ 
=
§§ 
ApplySorting
§§  
(
§§  !
query
§§! &
,
§§& '
filter
§§( .
.
§§. /
SortBy
§§/ 5
,
§§5 6
filter
§§7 =
.
§§= >
SortDirection
§§> K
)
§§K L
;
§§L M
var
ßß 
folders
ßß 
=
ßß 
await
ßß 
query
ßß  %
.
®® 
Skip
®® 
(
®® 
(
®® 
filter
®® 
.
®® 

PageNumber
®® (
-
®®) *
$num
®®+ ,
)
®®, -
*
®®. /
filter
®®0 6
.
®®6 7
PageSize
®®7 ?
)
®®? @
.
©© 
Take
©© 
(
©© 
filter
©© 
.
©© 
PageSize
©© %
)
©©% &
.
™™ 
ToListAsync
™™ 
(
™™ 
)
™™ 
;
™™ 
return
¨¨ 
folders
¨¨ 
.
¨¨ 
ToPagedResult
¨¨ (
(
¨¨( )
filter
ÆÆ 
.
ÆÆ 

PageNumber
ÆÆ !
,
ÆÆ! "
filter
ØØ 
.
ØØ 
PageSize
ØØ 
,
ØØ  
totalRecords
∞∞ 
,
∞∞ 
filter
±± 
.
±± 
Search
±± 
,
±± 
filter
≤≤ 
.
≤≤ 
SortBy
≤≤ 
,
≤≤ 
filter
≥≥ 
.
≥≥ 
SortDirection
≥≥ $
)
µµ 
;
µµ 
}
∂∂ 	
public
∏∏ 
async
∏∏ 
Task
∏∏ 
<
∏∏ 
PagedResult
∏∏ %
<
∏∏% &
Folder
∏∏& ,
>
∏∏, -
>
∏∏- .'
GetByDepartmentPagedAsync
∏∏/ H
(
∏∏H I
int
∏∏I L
departmentId
∏∏M Y
,
∏∏Y Z
PaginationParams
∏∏[ k

pagination
∏∏l v
)
∏∏v w
{
ππ 	
var
∫∫ 
query
∫∫ 
=
∫∫ 
_context
∫∫  
.
∫∫  !
Folders
∫∫! (
.
ªª 
Include
ªª 
(
ªª 
f
ªª 
=>
ªª 
f
ªª 
.
ªª  
ParentFolder
ªª  ,
)
ªª, -
.
ºº 
Include
ºº 
(
ºº 
f
ºº 
=>
ºº 
f
ºº 
.
ºº  

Department
ºº  *
)
ºº* +
.
ΩΩ 
Include
ΩΩ 
(
ΩΩ 
f
ΩΩ 
=>
ΩΩ 
f
ΩΩ 
.
ΩΩ  
	CreatedBy
ΩΩ  )
)
ΩΩ) *
.
ææ 
Include
ææ 
(
ææ 
f
ææ 
=>
ææ 
f
ææ 
.
ææ  

SubFolders
ææ  *
)
ææ* +
.
øø 
Include
øø 
(
øø 
f
øø 
=>
øø 
f
øø 
.
øø  
	Documents
øø  )
)
øø) *
.
¿¿ 
Where
¿¿ 
(
¿¿ 
f
¿¿ 
=>
¿¿ 
f
¿¿ 
.
¿¿ 
DepartmentId
¿¿ *
==
¿¿+ -
departmentId
¿¿. :
)
¿¿: ;
;
¿¿; <
if
√√ 
(
√√ 
!
√√ 
string
√√ 
.
√√ 
IsNullOrEmpty
√√ %
(
√√% &

pagination
√√& 0
.
√√0 1
Search
√√1 7
)
√√7 8
)
√√8 9
{
ƒƒ 
query
≈≈ 
=
≈≈ 
query
≈≈ 
.
≈≈ 
Where
≈≈ #
(
≈≈# $
f
≈≈$ %
=>
≈≈& (
f
∆∆ 
.
∆∆ 
Name
∆∆ 
.
∆∆ 
Contains
∆∆ #
(
∆∆# $

pagination
∆∆$ .
.
∆∆. /
Search
∆∆/ 5
)
∆∆5 6
)
«« 
;
«« 
}
»» 
var
   
totalRecords
   
=
   
await
   $
query
  % *
.
  * +

CountAsync
  + 5
(
  5 6
)
  6 7
;
  7 8
query
ÃÃ 
=
ÃÃ 
ApplySorting
ÃÃ  
(
ÃÃ  !
query
ÃÃ! &
,
ÃÃ& '

pagination
ÃÃ( 2
.
ÃÃ2 3
SortBy
ÃÃ3 9
,
ÃÃ9 :

pagination
ÃÃ; E
.
ÃÃE F
SortDirection
ÃÃF S
)
ÃÃS T
;
ÃÃT U
var
ŒŒ 
folders
ŒŒ 
=
ŒŒ 
await
ŒŒ 
query
ŒŒ  %
.
œœ 
Skip
œœ 
(
œœ 
(
œœ 

pagination
œœ !
.
œœ! "

PageNumber
œœ" ,
-
œœ- .
$num
œœ/ 0
)
œœ0 1
*
œœ2 3

pagination
œœ4 >
.
œœ> ?
PageSize
œœ? G
)
œœG H
.
–– 
Take
–– 
(
–– 

pagination
––  
.
––  !
PageSize
––! )
)
––) *
.
—— 
ToListAsync
—— 
(
—— 
)
—— 
;
—— 
return
”” 
folders
”” 
.
”” 
ToPagedResult
”” (
(
””( )

pagination
‘‘ 
.
‘‘ 

PageNumber
‘‘ %
,
‘‘% &

pagination
’’ 
.
’’ 
PageSize
’’ #
,
’’# $
totalRecords
÷÷ 
,
÷÷ 

pagination
◊◊ 
.
◊◊ 
Search
◊◊ !
,
◊◊! "

pagination
ÿÿ 
.
ÿÿ 
SortBy
ÿÿ !
,
ÿÿ! "

pagination
ŸŸ 
.
ŸŸ 
SortDirection
ŸŸ (
)
⁄⁄ 
;
⁄⁄ 
}
€€ 	
public
›› 
async
›› 
Task
›› 
<
›› 
PagedResult
›› %
<
››% &
Folder
››& ,
>
››, -
>
››- .#
GetByParentPagedAsync
››/ D
(
››D E
int
››E H
?
››H I
parentFolderId
››J X
,
››X Y
PaginationParams
››Z j

pagination
››k u
)
››u v
{
ﬁﬁ 	
var
ﬂﬂ 
query
ﬂﬂ 
=
ﬂﬂ 
_context
ﬂﬂ  
.
ﬂﬂ  !
Folders
ﬂﬂ! (
.
‡‡ 
Include
‡‡ 
(
‡‡ 
f
‡‡ 
=>
‡‡ 
f
‡‡ 
.
‡‡  
ParentFolder
‡‡  ,
)
‡‡, -
.
·· 
Include
·· 
(
·· 
f
·· 
=>
·· 
f
·· 
.
··  

Department
··  *
)
··* +
.
‚‚ 
Include
‚‚ 
(
‚‚ 
f
‚‚ 
=>
‚‚ 
f
‚‚ 
.
‚‚  
	CreatedBy
‚‚  )
)
‚‚) *
.
„„ 
Include
„„ 
(
„„ 
f
„„ 
=>
„„ 
f
„„ 
.
„„  

SubFolders
„„  *
)
„„* +
.
‰‰ 
Include
‰‰ 
(
‰‰ 
f
‰‰ 
=>
‰‰ 
f
‰‰ 
.
‰‰  
	Documents
‰‰  )
)
‰‰) *
.
ÂÂ 
Where
ÂÂ 
(
ÂÂ 
f
ÂÂ 
=>
ÂÂ 
f
ÂÂ 
.
ÂÂ 
ParentFolderId
ÂÂ ,
==
ÂÂ- /
parentFolderId
ÂÂ0 >
)
ÂÂ> ?
;
ÂÂ? @
if
ËË 
(
ËË 
!
ËË 
string
ËË 
.
ËË 
IsNullOrEmpty
ËË %
(
ËË% &

pagination
ËË& 0
.
ËË0 1
Search
ËË1 7
)
ËË7 8
)
ËË8 9
{
ÈÈ 
query
ÍÍ 
=
ÍÍ 
query
ÍÍ 
.
ÍÍ 
Where
ÍÍ #
(
ÍÍ# $
f
ÍÍ$ %
=>
ÍÍ& (
f
ÎÎ 
.
ÎÎ 
Name
ÎÎ 
.
ÎÎ 
Contains
ÎÎ #
(
ÎÎ# $

pagination
ÎÎ$ .
.
ÎÎ. /
Search
ÎÎ/ 5
)
ÎÎ5 6
)
ÏÏ 
;
ÏÏ 
}
ÌÌ 
var
ÔÔ 
totalRecords
ÔÔ 
=
ÔÔ 
await
ÔÔ $
query
ÔÔ% *
.
ÔÔ* +

CountAsync
ÔÔ+ 5
(
ÔÔ5 6
)
ÔÔ6 7
;
ÔÔ7 8
query
ÒÒ 
=
ÒÒ 
ApplySorting
ÒÒ  
(
ÒÒ  !
query
ÒÒ! &
,
ÒÒ& '

pagination
ÒÒ( 2
.
ÒÒ2 3
SortBy
ÒÒ3 9
,
ÒÒ9 :

pagination
ÒÒ; E
.
ÒÒE F
SortDirection
ÒÒF S
)
ÒÒS T
;
ÒÒT U
var
ÛÛ 
folders
ÛÛ 
=
ÛÛ 
await
ÛÛ 
query
ÛÛ  %
.
ÙÙ 
Skip
ÙÙ 
(
ÙÙ 
(
ÙÙ 

pagination
ÙÙ !
.
ÙÙ! "

PageNumber
ÙÙ" ,
-
ÙÙ- .
$num
ÙÙ/ 0
)
ÙÙ0 1
*
ÙÙ2 3

pagination
ÙÙ4 >
.
ÙÙ> ?
PageSize
ÙÙ? G
)
ÙÙG H
.
ıı 
Take
ıı 
(
ıı 

pagination
ıı  
.
ıı  !
PageSize
ıı! )
)
ıı) *
.
ˆˆ 
ToListAsync
ˆˆ 
(
ˆˆ 
)
ˆˆ 
;
ˆˆ 
return
¯¯ 
folders
¯¯ 
.
¯¯ 
ToPagedResult
¯¯ (
(
¯¯( )

pagination
˘˘ 
.
˘˘ 

PageNumber
˘˘ %
,
˘˘% &

pagination
˙˙ 
.
˙˙ 
PageSize
˙˙ #
,
˙˙# $
totalRecords
˚˚ 
,
˚˚ 

pagination
¸¸ 
.
¸¸ 
Search
¸¸ !
,
¸¸! "

pagination
˝˝ 
.
˝˝ 
SortBy
˝˝ !
,
˝˝! "

pagination
˛˛ 
.
˛˛ 
SortDirection
˛˛ (
)
ˇˇ 
;
ˇˇ 
}
ÄÄ 	
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
PagedResult
ÇÇ %
<
ÇÇ% &
	FolderDTO
ÇÇ& /
>
ÇÇ/ 0
>
ÇÇ0 1!
GetByUserPagedAsync
ÇÇ2 E
(
ÇÇE F
string
ÇÇF L
userId
ÇÇM S
,
ÇÇS T
PaginationParams
ÇÇU e

pagination
ÇÇf p
)
ÇÇp q
{
ÉÉ 	
var
ÑÑ 
query
ÑÑ 
=
ÑÑ 
_context
ÑÑ  
.
ÑÑ  !
Folders
ÑÑ! (
.
ãã 
Include
ãã 
(
ãã 
f
ãã 
=>
ãã 
f
ãã 
.
ãã  
	CreatedBy
ãã  )
)
ãã) *
.
çç 
Where
çç 
(
çç 
f
çç 
=>
çç 
f
çç 
.
çç 
CreatedById
çç )
==
çç* ,
userId
çç- 3
)
çç3 4
.
çç4 5
Select
çç5 ;
(
çç; <
f
çç< =
=>
çç> @
new
ççA D
	FolderDTO
ççE N
{
éé 
Id
èè 
=
èè 
f
èè 
.
èè 
Id
èè 
,
èè 
Name
êê 
=
êê 
f
êê 
.
êê 
Name
êê !
,
êê! "
Description
ëë 
=
ëë  !
f
ëë" #
.
ëë# $
Description
ëë$ /
,
ëë/ 0
DocumentCount
íí !
=
íí" #
f
íí$ %
.
íí% &
	Documents
íí& /
.
íí/ 0
Count
íí0 5
,
íí5 6
	CreatedAt
ìì 
=
ìì 
f
ìì  !
.
ìì! "
	CreatedAt
ìì" +
,
ìì+ ,
	UpdatedAt
îî 
=
îî 
f
îî  !
.
îî! "
	UpdatedAt
îî" +
,
îî+ ,
Size
ïï 
=
ïï 
f
ïï 
.
ïï 
	Documents
ïï &
.
ïï& '
Sum
ïï' *
(
ïï* +
d
ïï+ ,
=>
ïï, .
d
ïï. /
.
ïï/ 0
FileSize
ïï0 8
)
ïï8 9
,
ïï9 :
ParentFolderId
ññ "
=
ññ# $
f
ññ% &
.
ññ& '
ParentFolderId
ññ' 5
,
ññ5 6
ParentFolderName
óó $
=
óó% &
f
óó' (
.
óó( )
ParentFolder
óó) 5
!=
óó6 8
null
óó9 =
?
óó> ?
f
óó@ A
.
óóA B
ParentFolder
óóB N
.
óóN O
Name
óóO S
:
óóT U
null
óóV Z
,
óóZ [
DepartmentId
òò  
=
òò! "
f
òò# $
.
òò$ %
DepartmentId
òò% 1
,
òò1 2
DepartmentName
ôô "
=
ôô# $
f
ôô% &
.
ôô& '

Department
ôô' 1
!=
ôô2 4
null
ôô5 9
?
ôô: ;
f
ôô< =
.
ôô= >

Department
ôô> H
.
ôôH I
Name
ôôI M
:
ôôN O
null
ôôP T
,
ôôT U
CreatedById
öö 
=
öö  !
f
öö" #
.
öö# $
CreatedById
öö$ /
,
öö/ 0
CreatedByName
õõ !
=
õõ" #
f
õõ$ %
.
õõ% &
	CreatedBy
õõ& /
!=
õõ0 2
null
õõ3 7
?
õõ8 9
f
õõ: ;
.
õõ; <
	CreatedBy
õõ< E
.
õõE F
UserName
õõF N
:
õõO P
null
õõQ U
}
úú 
)
úú 
;
úú 
var
®® 
totalRecords
®® 
=
®® 
await
®® $
query
®®% *
.
®®* +

CountAsync
®®+ 5
(
®®5 6
)
®®6 7
;
®®7 8
query
™™ 
=
™™ 
ApplySortingDTO
™™ #
(
™™# $
query
™™$ )
,
™™) *

pagination
™™+ 5
.
™™5 6
SortBy
™™6 <
,
™™< =

pagination
™™> H
.
™™H I
SortDirection
™™I V
)
™™V W
;
™™W X
var
¨¨ 
folders
¨¨ 
=
¨¨ 
await
¨¨ 
query
¨¨  %
.
≠≠ 
Skip
≠≠ 
(
≠≠ 
(
≠≠ 

pagination
≠≠ !
.
≠≠! "

PageNumber
≠≠" ,
-
≠≠- .
$num
≠≠/ 0
)
≠≠0 1
*
≠≠2 3

pagination
≠≠4 >
.
≠≠> ?
PageSize
≠≠? G
)
≠≠G H
.
ÆÆ 
Take
ÆÆ 
(
ÆÆ 

pagination
ÆÆ  
.
ÆÆ  !
PageSize
ÆÆ! )
)
ÆÆ) *
.
ØØ 
ToListAsync
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
return
±± 
folders
±± 
.
±± 
ToPagedResult
±± (
(
±±( )

pagination
≤≤ 
.
≤≤ 

PageNumber
≤≤ %
,
≤≤% &

pagination
≥≥ 
.
≥≥ 
PageSize
≥≥ #
,
≥≥# $
totalRecords
¥¥ 
,
¥¥ 

pagination
µµ 
.
µµ 
Search
µµ !
,
µµ! "

pagination
∂∂ 
.
∂∂ 
SortBy
∂∂ !
,
∂∂! "

pagination
∑∑ 
.
∑∑ 
SortDirection
∑∑ (
)
∏∏ 
;
∏∏ 
}
ππ 	
public
ΩΩ 
async
ΩΩ 
Task
ΩΩ 
<
ΩΩ 
IReadOnlyList
ΩΩ '
<
ΩΩ' (
Folder
ΩΩ( .
>
ΩΩ. /
>
ΩΩ/ 0$
GetAllWithDetailsAsync
ΩΩ1 G
(
ΩΩG H
)
ΩΩH I
{
ææ 	
return
øø 
await
øø 
_context
øø !
.
øø! "
Folders
øø" )
.
¿¿ 
Include
¿¿ 
(
¿¿ 
f
¿¿ 
=>
¿¿ 
f
¿¿ 
.
¿¿  
ParentFolder
¿¿  ,
)
¿¿, -
.
¡¡ 
Include
¡¡ 
(
¡¡ 
f
¡¡ 
=>
¡¡ 
f
¡¡ 
.
¡¡  

Department
¡¡  *
)
¡¡* +
.
¬¬ 
Include
¬¬ 
(
¬¬ 
f
¬¬ 
=>
¬¬ 
f
¬¬ 
.
¬¬  
	CreatedBy
¬¬  )
)
¬¬) *
.
√√ 
Include
√√ 
(
√√ 
f
√√ 
=>
√√ 
f
√√ 
.
√√  

SubFolders
√√  *
)
√√* +
.
ƒƒ 
Include
ƒƒ 
(
ƒƒ 
f
ƒƒ 
=>
ƒƒ 
f
ƒƒ 
.
ƒƒ  
	Documents
ƒƒ  )
)
ƒƒ) *
.
≈≈ 
OrderBy
≈≈ 
(
≈≈ 
f
≈≈ 
=>
≈≈ 
f
≈≈ 
.
≈≈  
Name
≈≈  $
)
≈≈$ %
.
∆∆ 
ToListAsync
∆∆ 
(
∆∆ 
)
∆∆ 
;
∆∆ 
}
«« 	
public
…… 
async
…… 
Task
…… 
<
…… 
Folder
……  
>
……  !
AddAsync
……" *
(
……* +
CreateFolderDTO
……+ :
	folderDto
……; D
)
……D E
{
   	
try
ÀÀ 
{
ÃÃ 
var
ÕÕ 
folder
ÕÕ 
=
ÕÕ 
new
ÕÕ  
Folder
ÕÕ! '
{
ŒŒ 
Name
œœ 
=
œœ 
	folderDto
œœ $
.
œœ$ %
Name
œœ% )
,
œœ) *
ParentFolderId
–– "
=
––# $
	folderDto
––% .
.
––. /
ParentFolderId
––/ =
,
––= >
DepartmentId
——  
=
——! "
	folderDto
——# ,
.
——, -
DepartmentId
——- 9
,
——9 :
CreatedById
”” 
=
””  
	folderDto
””! *
.
””* +
CreatedById
””+ 6
,
””6 7
Description
’’ 
=
’’  !
	folderDto
’’" +
.
’’+ ,
Description
’’, 7
,
’’7 8
	CreatedAt
÷÷ 
=
÷÷ 
DateTime
÷÷  (
.
÷÷( )
UtcNow
÷÷) /
,
÷÷/ 0
	UpdatedAt
◊◊ 
=
◊◊ 
DateTime
◊◊  (
.
◊◊( )
UtcNow
◊◊) /
}
ÿÿ 
;
ÿÿ 
_context
⁄⁄ 
.
⁄⁄ 
Folders
⁄⁄  
.
⁄⁄  !
Add
⁄⁄! $
(
⁄⁄$ %
folder
⁄⁄% +
)
⁄⁄+ ,
;
⁄⁄, -
await
€€ 
_context
€€ 
.
€€ 
SaveChangesAsync
€€ /
(
€€/ 0
)
€€0 1
;
€€1 2
return
‹‹ 
folder
‹‹ 
;
‹‹ 
}
›› 
catch
ﬁﬁ 
(
ﬁﬁ 
System
ﬁﬁ 
.
ﬁﬁ 
	Exception
ﬁﬁ #
)
ﬁﬁ# $
{
ﬂﬂ 
throw
·· 
new
·· 
	Exception
·· #
(
··# $
$str
··$ P
)
··P Q
;
··Q R
}
‚‚ 
}
„„ 	
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
IReadOnlyList
ÂÂ '
<
ÂÂ' (
FolderTreeDto
ÂÂ( 5
>
ÂÂ5 6
>
ÂÂ6 7 
GetFolderTreeAsync
ÂÂ8 J
(
ÂÂJ K
int
ÂÂK N
?
ÂÂN O
parentFolderId
ÂÂP ^
=
ÂÂ_ `
null
ÂÂa e
)
ÂÂe f
{
ÊÊ 	
var
ÁÁ 
folders
ÁÁ 
=
ÁÁ 
await
ÁÁ 
_context
ÁÁ  (
.
ÁÁ( )
Folders
ÁÁ) 0
.
ËË 
Include
ËË 
(
ËË 
f
ËË 
=>
ËË 
f
ËË 
.
ËË  

Department
ËË  *
)
ËË* +
.
ÈÈ 
Include
ÈÈ 
(
ÈÈ 
f
ÈÈ 
=>
ÈÈ 
f
ÈÈ 
.
ÈÈ  

SubFolders
ÈÈ  *
)
ÈÈ* +
.
ÍÍ 
Include
ÍÍ 
(
ÍÍ 
f
ÍÍ 
=>
ÍÍ 
f
ÍÍ 
.
ÍÍ  
	Documents
ÍÍ  )
)
ÍÍ) *
.
ÎÎ 
Where
ÎÎ 
(
ÎÎ 
f
ÎÎ 
=>
ÎÎ 
f
ÎÎ 
.
ÎÎ 
ParentFolderId
ÎÎ ,
==
ÎÎ- /
parentFolderId
ÎÎ0 >
)
ÎÎ> ?
.
ÏÏ 
OrderBy
ÏÏ 
(
ÏÏ 
f
ÏÏ 
=>
ÏÏ 
f
ÏÏ 
.
ÏÏ  
Name
ÏÏ  $
)
ÏÏ$ %
.
ÌÌ 
ToListAsync
ÌÌ 
(
ÌÌ 
)
ÌÌ 
;
ÌÌ 
var
ÔÔ 
result
ÔÔ 
=
ÔÔ 
new
ÔÔ 
List
ÔÔ !
<
ÔÔ! "
FolderTreeDto
ÔÔ" /
>
ÔÔ/ 0
(
ÔÔ0 1
)
ÔÔ1 2
;
ÔÔ2 3
foreach
ÒÒ 
(
ÒÒ 
var
ÒÒ 
folder
ÒÒ 
in
ÒÒ  "
folders
ÒÒ# *
)
ÒÒ* +
{
ÚÚ 
var
ÛÛ 
	folderDto
ÛÛ 
=
ÛÛ 
new
ÛÛ  #
FolderTreeDto
ÛÛ$ 1
{
ÙÙ 
Id
ıı 
=
ıı 
folder
ıı 
.
ıı  
Id
ıı  "
,
ıı" #
Name
ˆˆ 
=
ˆˆ 
folder
ˆˆ !
.
ˆˆ! "
Name
ˆˆ" &
,
ˆˆ& '
ParentFolderId
¯¯ "
=
¯¯# $
folder
¯¯% +
.
¯¯+ ,
ParentFolderId
¯¯, :
,
¯¯: ;
DepartmentId
˘˘  
=
˘˘! "
folder
˘˘# )
.
˘˘) *
DepartmentId
˘˘* 6
,
˘˘6 7
DepartmentName
˙˙ "
=
˙˙# $
folder
˙˙% +
.
˙˙+ ,

Department
˙˙, 6
.
˙˙6 7
Name
˙˙7 ;
,
˙˙; <
SubFolderCount
¸¸ "
=
¸¸# $
folder
¸¸% +
.
¸¸+ ,

SubFolders
¸¸, 6
?
¸¸6 7
.
¸¸7 8
Count
¸¸8 =
(
¸¸= >
)
¸¸> ?
??
¸¸@ B
$num
¸¸C D
,
¸¸D E
DocumentCount
˝˝ !
=
˝˝" #
folder
˝˝$ *
.
˝˝* +
	Documents
˝˝+ 4
?
˝˝4 5
.
˝˝5 6
Count
˝˝6 ;
(
˝˝; <
)
˝˝< =
??
˝˝> @
$num
˝˝A B
,
˝˝B C
	CreatedAt
˛˛ 
=
˛˛ 
folder
˛˛  &
.
˛˛& '
	CreatedAt
˛˛' 0
,
˛˛0 1

SubFolders
ˇˇ 
=
ˇˇ  
(
ˇˇ! "
IEnumerable
ˇˇ" -
<
ˇˇ- .
FolderTreeDto
ˇˇ. ;
>
ˇˇ; <
)
ˇˇ< =
await
ˇˇ= B 
GetFolderTreeAsync
ˇˇC U
(
ˇˇU V
folder
ˇˇV \
.
ˇˇ\ ]
Id
ˇˇ] _
)
ˇˇ_ `
}
ÄÄ 
;
ÄÄ 
result
ÇÇ 
.
ÇÇ 
Add
ÇÇ 
(
ÇÇ 
	folderDto
ÇÇ $
)
ÇÇ$ %
;
ÇÇ% &
}
ÉÉ 
return
ÖÖ 
result
ÖÖ 
;
ÖÖ 
}
ÜÜ 	
public
ää 
async
ää 
Task
ää 
<
ää 
IReadOnlyList
ää '
<
ää' (
Folder
ää( .
>
ää. /
>
ää/ 0 
GetSubFoldersAsync
ää1 C
(
ääC D
int
ääD G
parentFolderId
ääH V
)
ääV W
{
ãã 	
return
åå 
await
åå 
_context
åå !
.
åå! "
Folders
åå" )
.
çç 
Include
çç 
(
çç 
f
çç 
=>
çç 
f
çç 
.
çç  

Department
çç  *
)
çç* +
.
éé 
Include
éé 
(
éé 
f
éé 
=>
éé 
f
éé 
.
éé  
	CreatedBy
éé  )
)
éé) *
.
èè 
Where
èè 
(
èè 
f
èè 
=>
èè 
f
èè 
.
èè 
ParentFolderId
èè ,
==
èè- /
parentFolderId
èè0 >
)
èè> ?
.
êê 
OrderBy
êê 
(
êê 
f
êê 
=>
êê 
f
êê 
.
êê  
Name
êê  $
)
êê$ %
.
ëë 
ToListAsync
ëë 
(
ëë 
)
ëë 
;
ëë 
}
íí 	
public
îî 
async
îî 
Task
îî 
<
îî 
bool
îî 
>
îî &
IsNameTakenInParentAsync
îî  8
(
îî8 9
string
îî9 ?
name
îî@ D
,
îîD E
int
îîF I
?
îîI J
parentFolderId
îîK Y
,
îîY Z
int
îî[ ^
departmentId
îî_ k
,
îîk l
int
îîm p
?
îîp q
	excludeId
îîr {
=
îî| }
nullîî~ Ç
)îîÇ É
{
ïï 	
var
ññ 
query
ññ 
=
ññ 
_context
ññ  
.
ññ  !
Folders
ññ! (
.
óó 
Where
óó 
(
óó 
f
óó 
=>
óó 
f
óó 
.
óó 
Name
óó "
.
óó" #
ToLower
óó# *
(
óó* +
)
óó+ ,
==
óó- /
name
óó0 4
.
óó4 5
ToLower
óó5 <
(
óó< =
)
óó= >
&&
óó? A
f
òò 
.
òò 
ParentFolderId
òò +
==
òò, .
parentFolderId
òò/ =
&&
òò> @
f
ôô 
.
ôô 
DepartmentId
ôô )
==
ôô* ,
departmentId
ôô- 9
)
ôô9 :
;
ôô: ;
if
õõ 
(
õõ 
	excludeId
õõ 
.
õõ 
HasValue
õõ "
)
õõ" #
{
úú 
query
ùù 
=
ùù 
query
ùù 
.
ùù 
Where
ùù #
(
ùù# $
f
ùù$ %
=>
ùù& (
f
ùù) *
.
ùù* +
Id
ùù+ -
!=
ùù. 0
	excludeId
ùù1 :
.
ùù: ;
Value
ùù; @
)
ùù@ A
;
ùùA B
}
ûû 
return
†† 
await
†† 
query
†† 
.
†† 
AnyAsync
†† '
(
††' (
)
††( )
;
††) *
}
°° 	
public
££ 
async
££ 
Task
££ 
<
££ 
bool
££ 
>
££  
HasSubFoldersAsync
££  2
(
££2 3
int
££3 6
folderId
££7 ?
)
££? @
{
§§ 	
return
•• 
await
•• 
_context
•• !
.
••! "
Folders
••" )
.
••) *
AnyAsync
••* 2
(
••2 3
f
••3 4
=>
••5 7
f
••8 9
.
••9 :
ParentFolderId
••: H
==
••I K
folderId
••L T
)
••T U
;
••U V
}
¶¶ 	
public
®® 
async
®® 
Task
®® 
<
®® 
bool
®® 
>
®® 
HasDocumentsAsync
®®  1
(
®®1 2
int
®®2 5
folderId
®®6 >
)
®®> ?
{
©© 	
return
™™ 
await
™™ 
_context
™™ !
.
™™! "
	Documents
™™" +
.
™™+ ,
AnyAsync
™™, 4
(
™™4 5
d
™™5 6
=>
™™7 9
d
™™: ;
.
™™; <
FolderId
™™< D
==
™™E G
folderId
™™H P
)
™™P Q
;
™™Q R
}
´´ 	
public
≠≠ 
async
≠≠ 
Task
≠≠ 
<
≠≠ 
int
≠≠ 
>
≠≠  
GetTotalCountAsync
≠≠ 1
(
≠≠1 2
)
≠≠2 3
{
ÆÆ 	
return
ØØ 
await
ØØ 
_context
ØØ !
.
ØØ! "
Folders
ØØ" )
.
ØØ) *

CountAsync
ØØ* 4
(
ØØ4 5
)
ØØ5 6
;
ØØ6 7
}
∞∞ 	
public
≤≤ 
async
≤≤ 
Task
≤≤ 
<
≤≤ 
int
≤≤ 
>
≤≤ +
GetTotalDepartmentsCountAsync
≤≤ <
(
≤≤< =
)
≤≤= >
{
≥≥ 	
return
¥¥ 
await
¥¥ 
_context
¥¥ !
.
¥¥! "
Folders
¥¥" )
.
µµ 
Select
µµ 
(
µµ 
f
µµ 
=>
µµ 
f
µµ 
.
µµ 
DepartmentId
µµ +
)
µµ+ ,
.
∂∂ 
Distinct
∂∂ 
(
∂∂ 
)
∂∂ 
.
∑∑ 

CountAsync
∑∑ 
(
∑∑ 
)
∑∑ 
;
∑∑ 
}
∏∏ 	
public
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
int
∫∫ 
>
∫∫ )
GetTotalDocumentsCountAsync
∫∫ :
(
∫∫: ;
)
∫∫; <
{
ªª 	
return
ºº 
await
ºº 
_context
ºº !
.
ºº! "
	Documents
ºº" +
.
ææ 

CountAsync
ææ 
(
ææ 
)
ææ 
;
ææ 
}
øø 	
public
¡¡ 
async
¡¡ 
Task
¡¡ 
BulkUpdateAsync
¡¡ )
(
¡¡) *
IEnumerable
¡¡* 5
<
¡¡5 6
int
¡¡6 9
>
¡¡9 :
	folderIds
¡¡; D
,
¡¡D E
UpdateFolderDTO
¡¡F U
	updateDto
¡¡V _
)
¡¡_ `
{
¬¬ 	
var
√√ 
folders
√√ 
=
√√ 
await
√√ 
_context
√√  (
.
√√( )
Folders
√√) 0
.
ƒƒ 
Where
ƒƒ 
(
ƒƒ 
f
ƒƒ 
=>
ƒƒ 
	folderIds
ƒƒ %
.
ƒƒ% &
Contains
ƒƒ& .
(
ƒƒ. /
f
ƒƒ/ 0
.
ƒƒ0 1
Id
ƒƒ1 3
)
ƒƒ3 4
)
ƒƒ4 5
.
≈≈ 
ToListAsync
≈≈ 
(
≈≈ 
)
≈≈ 
;
≈≈ 
foreach
«« 
(
«« 
var
«« 
folder
«« 
in
««  "
folders
««# *
)
««* +
{
»» 
if
…… 
(
…… 
!
…… 
string
…… 
.
…… 
IsNullOrEmpty
…… )
(
……) *
	updateDto
……* 3
.
……3 4
Name
……4 8
)
……8 9
)
……9 :
folder
   
.
   
Name
   
=
    !
	updateDto
  " +
.
  + ,
Name
  , 0
;
  0 1
if
ÕÕ 
(
ÕÕ 
	updateDto
ÕÕ 
.
ÕÕ 
ParentFolderId
ÕÕ ,
.
ÕÕ, -
HasValue
ÕÕ- 5
)
ÕÕ5 6
folder
ŒŒ 
.
ŒŒ 
ParentFolderId
ŒŒ )
=
ŒŒ* +
	updateDto
ŒŒ, 5
.
ŒŒ5 6
ParentFolderId
ŒŒ6 D
;
ŒŒD E
folder
““ 
.
““ 
	UpdatedAt
““  
=
““! "
DateTime
““# +
.
““+ ,
UtcNow
““, 2
;
““2 3
}
”” 
_context
’’ 
.
’’ 
Folders
’’ 
.
’’ 
UpdateRange
’’ (
(
’’( )
folders
’’) 0
)
’’0 1
;
’’1 2
}
÷÷ 	
private
·· 

IQueryable
·· 
<
·· 
Folder
·· !
>
··! "
ApplyFilters
··# /
(
··/ 0

IQueryable
··0 :
<
··: ;
Folder
··; A
>
··A B
query
··C H
,
··H I
FolderFilterDto
··J Y
filter
··Z `
)
··` a
{
‚‚ 	
if
„„ 
(
„„ 
!
„„ 
string
„„ 
.
„„ 
IsNullOrEmpty
„„ %
(
„„% &
filter
„„& ,
.
„„, -
Name
„„- 1
)
„„1 2
)
„„2 3
query
‰‰ 
=
‰‰ 
query
‰‰ 
.
‰‰ 
Where
‰‰ #
(
‰‰# $
f
‰‰$ %
=>
‰‰& (
f
‰‰) *
.
‰‰* +
Name
‰‰+ /
.
‰‰/ 0
Contains
‰‰0 8
(
‰‰8 9
filter
‰‰9 ?
.
‰‰? @
Name
‰‰@ D
)
‰‰D E
)
‰‰E F
;
‰‰F G
if
ÍÍ 
(
ÍÍ 
filter
ÍÍ 
.
ÍÍ 
DepartmentId
ÍÍ #
.
ÍÍ# $
HasValue
ÍÍ$ ,
)
ÍÍ, -
query
ÎÎ 
=
ÎÎ 
query
ÎÎ 
.
ÎÎ 
Where
ÎÎ #
(
ÎÎ# $
f
ÎÎ$ %
=>
ÎÎ& (
f
ÎÎ) *
.
ÎÎ* +
DepartmentId
ÎÎ+ 7
==
ÎÎ8 :
filter
ÎÎ; A
.
ÎÎA B
DepartmentId
ÎÎB N
)
ÎÎN O
;
ÎÎO P
if
ÌÌ 
(
ÌÌ 
!
ÌÌ 
string
ÌÌ 
.
ÌÌ 
IsNullOrEmpty
ÌÌ %
(
ÌÌ% &
filter
ÌÌ& ,
.
ÌÌ, -
DepartmentName
ÌÌ- ;
)
ÌÌ; <
)
ÌÌ< =
query
ÓÓ 
=
ÓÓ 
query
ÓÓ 
.
ÓÓ 
Where
ÓÓ #
(
ÓÓ# $
f
ÓÓ$ %
=>
ÓÓ& (
f
ÓÓ) *
.
ÓÓ* +

Department
ÓÓ+ 5
.
ÓÓ5 6
Name
ÓÓ6 :
.
ÓÓ: ;
Contains
ÓÓ; C
(
ÓÓC D
filter
ÓÓD J
.
ÓÓJ K
DepartmentName
ÓÓK Y
)
ÓÓY Z
)
ÓÓZ [
;
ÓÓ[ \
if
 
(
 
!
 
string
 
.
 
IsNullOrEmpty
 %
(
% &
filter
& ,
.
, -
CreatedById
- 8
)
8 9
)
9 :
query
ÒÒ 
=
ÒÒ 
query
ÒÒ 
.
ÒÒ 
Where
ÒÒ #
(
ÒÒ# $
f
ÒÒ$ %
=>
ÒÒ& (
f
ÒÒ) *
.
ÒÒ* +
CreatedById
ÒÒ+ 6
.
ÒÒ6 7
ToString
ÒÒ7 ?
(
ÒÒ? @
)
ÒÒ@ A
==
ÒÒB D
filter
ÒÒE K
.
ÒÒK L
CreatedById
ÒÒL W
)
ÒÒW X
;
ÒÒX Y
if
ÛÛ 
(
ÛÛ 
!
ÛÛ 
string
ÛÛ 
.
ÛÛ 
IsNullOrEmpty
ÛÛ %
(
ÛÛ% &
filter
ÛÛ& ,
.
ÛÛ, -
CreatedByName
ÛÛ- :
)
ÛÛ: ;
)
ÛÛ; <
query
ÙÙ 
=
ÙÙ 
query
ÙÙ 
.
ÙÙ 
Where
ÙÙ #
(
ÙÙ# $
f
ÙÙ$ %
=>
ÙÙ& (
f
ıı 
.
ıı 
	CreatedBy
ıı 
.
ıı  
UserName
ıı  (
.
ıı( )
Contains
ıı) 1
(
ıı1 2
filter
ıı2 8
.
ıı8 9
CreatedByName
ıı9 F
)
ııF G
||
ııH J
f
ˆˆ 
.
ˆˆ 
	CreatedBy
ˆˆ 
.
ˆˆ  
UserName
ˆˆ  (
!
ˆˆ( )
.
ˆˆ) *
Contains
ˆˆ* 2
(
ˆˆ2 3
filter
ˆˆ3 9
.
ˆˆ9 :
CreatedByName
ˆˆ: G
)
ˆˆG H
)
˜˜ 
;
˜˜ 
if
êê 
(
êê 
!
êê 
string
êê 
.
êê 
IsNullOrEmpty
êê %
(
êê% &
filter
êê& ,
.
êê, -
Search
êê- 3
)
êê3 4
)
êê4 5
{
ëë 
query
íí 
=
íí 
query
íí 
.
íí 
Where
íí #
(
íí# $
f
íí$ %
=>
íí& (
f
ìì 
.
ìì 
Name
ìì 
.
ìì 
Contains
ìì #
(
ìì# $
filter
ìì$ *
.
ìì* +
Search
ìì+ 1
)
ìì1 2
||
ìì3 5
f
ïï 
.
ïï 

Department
ïï  
.
ïï  !
Name
ïï! %
.
ïï% &
Contains
ïï& .
(
ïï. /
filter
ïï/ 5
.
ïï5 6
Search
ïï6 <
)
ïï< =
||
ïï> @
f
ññ 
.
ññ 
	CreatedBy
ññ 
.
ññ  
UserName
ññ  (
.
ññ( )
Contains
ññ) 1
(
ññ1 2
filter
ññ2 8
.
ññ8 9
Search
ññ9 ?
)
ññ? @
)
óó 
;
óó 
}
òò 
return
öö 
query
öö 
;
öö 
}
õõ 	
private
ùù 

IQueryable
ùù 
<
ùù 
	FolderDTO
ùù $
>
ùù$ %
ApplySortingDTO
ùù& 5
(
ùù5 6

IQueryable
ùù6 @
<
ùù@ A
	FolderDTO
ùùA J
>
ùùJ K
query
ùùL Q
,
ùùQ R
string
ùùS Y
?
ùùY Z
sortBy
ùù[ a
,
ùùa b
string
ùùc i
?
ùùi j
sortDirection
ùùk x
)
ùùx y
{
ûû 	
if
üü 
(
üü 
string
üü 
.
üü 
IsNullOrEmpty
üü $
(
üü$ %
sortBy
üü% +
)
üü+ ,
)
üü, -
return
†† 
query
†† 
.
†† 
OrderBy
†† $
(
††$ %
f
††% &
=>
††' )
f
††* +
.
††+ ,
Name
††, 0
)
††0 1
;
††1 2
var
¢¢ 
isDescending
¢¢ 
=
¢¢ 
sortDirection
¢¢ ,
?
¢¢, -
.
¢¢- .
ToLower
¢¢. 5
(
¢¢5 6
)
¢¢6 7
==
¢¢8 :
$str
¢¢; A
;
¢¢A B
return
§§ 
sortBy
§§ 
.
§§ 
ToLower
§§ !
(
§§! "
)
§§" #
switch
§§$ *
{
•• 
$str
¶¶ 
=>
¶¶ 
isDescending
¶¶ &
?
¶¶' (
query
¶¶) .
.
¶¶. /
OrderByDescending
¶¶/ @
(
¶¶@ A
f
¶¶A B
=>
¶¶C E
f
¶¶F G
.
¶¶G H
Name
¶¶H L
)
¶¶L M
:
ßß' (
query
ßß) .
.
ßß. /
OrderBy
ßß/ 6
(
ßß6 7
f
ßß7 8
=>
ßß9 ;
f
ßß< =
.
ßß= >
Name
ßß> B
)
ßßB C
,
ßßC D
$str
©©  
=>
©©! #
isDescending
©©$ 0
?
©©1 2
query
©©3 8
.
©©8 9
OrderByDescending
©©9 J
(
©©J K
f
©©K L
=>
©©M O
f
©©P Q
.
©©Q R
DepartmentName
©©R `
)
©©` a
:
™™1 2
query
™™3 8
.
™™8 9
OrderBy
™™9 @
(
™™@ A
f
™™A B
=>
™™C E
f
™™F G
.
™™G H
DepartmentName
™™H V
)
™™V W
,
™™W X
$str
´´ "
=>
´´# %
isDescending
´´& 2
?
´´3 4
query
´´5 :
.
´´: ;
OrderByDescending
´´; L
(
´´L M
f
´´M N
=>
´´O Q
f
´´R S
.
´´S T
ParentFolderName
´´T d
)
´´d e
:
¨¨3 4
query
¨¨5 :
.
¨¨: ;
OrderBy
¨¨; B
(
¨¨B C
f
¨¨C D
=>
¨¨E G
f
¨¨H I
.
¨¨I J
ParentFolderName
¨¨J Z
)
¨¨Z [
,
¨¨[ \
$str
≠≠ 
=>
≠≠  "
isDescending
≠≠# /
?
≠≠0 1
query
≠≠2 7
.
≠≠7 8
OrderByDescending
≠≠8 I
(
≠≠I J
f
≠≠J K
=>
≠≠L N
f
≠≠O P
.
≠≠P Q
CreatedByName
≠≠Q ^
)
≠≠^ _
:
ÆÆ0 1
query
ÆÆ2 7
.
ÆÆ7 8
OrderBy
ÆÆ8 ?
(
ÆÆ? @
f
ÆÆ@ A
=>
ÆÆB D
f
ÆÆE F
.
ÆÆF G
CreatedByName
ÆÆG T
)
ÆÆT U
,
ÆÆU V
$str
ØØ 
=>
ØØ 
isDescending
ØØ +
?
ØØ, -
query
ØØ. 3
.
ØØ3 4
OrderByDescending
ØØ4 E
(
ØØE F
f
ØØF G
=>
ØØH J
f
ØØK L
.
ØØL M
	CreatedAt
ØØM V
)
ØØV W
:
∞∞, -
query
∞∞. 3
.
∞∞3 4
OrderBy
∞∞4 ;
(
∞∞; <
f
∞∞< =
=>
∞∞> @
f
∞∞A B
.
∞∞B C
	CreatedAt
∞∞C L
)
∞∞L M
,
∞∞M N
$str
±± 
=>
±± 
isDescending
±± +
?
±±, -
query
±±. 3
.
±±3 4
OrderByDescending
±±4 E
(
±±E F
f
±±F G
=>
±±H J
f
±±K L
.
±±L M
	UpdatedAt
±±M V
)
±±V W
:
≤≤, -
query
≤≤. 3
.
≤≤3 4
OrderBy
≤≤4 ;
(
≤≤; <
f
≤≤< =
=>
≤≤> @
f
≤≤A B
.
≤≤B C
	UpdatedAt
≤≤C L
)
≤≤L M
,
≤≤M N
_
¥¥ 
=>
¥¥ 
query
¥¥ 
.
¥¥ 
OrderBy
¥¥ "
(
¥¥" #
f
¥¥# $
=>
¥¥% '
f
¥¥( )
.
¥¥) *
Name
¥¥* .
)
¥¥. /
}
µµ 
;
µµ 
}
∂∂ 	
private
∑∑ 

IQueryable
∑∑ 
<
∑∑ 
Folder
∑∑ !
>
∑∑! "
ApplySorting
∑∑# /
(
∑∑/ 0

IQueryable
∑∑0 :
<
∑∑: ;
Folder
∑∑; A
>
∑∑A B
query
∑∑C H
,
∑∑H I
string
∑∑J P
?
∑∑P Q
sortBy
∑∑R X
,
∑∑X Y
string
∑∑Z `
?
∑∑` a
sortDirection
∑∑b o
)
∑∑o p
{
∏∏ 	
if
ππ 
(
ππ 
string
ππ 
.
ππ 
IsNullOrEmpty
ππ $
(
ππ$ %
sortBy
ππ% +
)
ππ+ ,
)
ππ, -
return
∫∫ 
query
∫∫ 
.
∫∫ 
OrderBy
∫∫ $
(
∫∫$ %
f
∫∫% &
=>
∫∫' )
f
∫∫* +
.
∫∫+ ,
Name
∫∫, 0
)
∫∫0 1
;
∫∫1 2
var
ºº 
isDescending
ºº 
=
ºº 
sortDirection
ºº ,
?
ºº, -
.
ºº- .
ToLower
ºº. 5
(
ºº5 6
)
ºº6 7
==
ºº8 :
$str
ºº; A
;
ººA B
return
ææ 
sortBy
ææ 
.
ææ 
ToLower
ææ !
(
ææ! "
)
ææ" #
switch
ææ$ *
{
øø 
$str
¿¿ 
=>
¿¿ 
isDescending
¿¿ &
?
¿¿' (
query
¿¿) .
.
¿¿. /
OrderByDescending
¿¿/ @
(
¿¿@ A
f
¿¿A B
=>
¿¿C E
f
¿¿F G
.
¿¿G H
Name
¿¿H L
)
¿¿L M
:
¡¡' (
query
¡¡) .
.
¡¡. /
OrderBy
¡¡/ 6
(
¡¡6 7
f
¡¡7 8
=>
¡¡9 ;
f
¡¡< =
.
¡¡= >
Name
¡¡> B
)
¡¡B C
,
¡¡C D
$str
√√  
=>
√√! #
isDescending
√√$ 0
?
√√1 2
query
√√3 8
.
√√8 9
OrderByDescending
√√9 J
(
√√J K
f
√√K L
=>
√√M O
f
√√P Q
.
√√Q R

Department
√√R \
.
√√\ ]
Name
√√] a
)
√√a b
:
ƒƒ1 2
query
ƒƒ3 8
.
ƒƒ8 9
OrderBy
ƒƒ9 @
(
ƒƒ@ A
f
ƒƒA B
=>
ƒƒC E
f
ƒƒF G
.
ƒƒG H

Department
ƒƒH R
.
ƒƒR S
Name
ƒƒS W
)
ƒƒW X
,
ƒƒX Y
$str
≈≈ "
=>
≈≈# %
isDescending
≈≈& 2
?
≈≈3 4
query
≈≈5 :
.
≈≈: ;
OrderByDescending
≈≈; L
(
≈≈L M
f
≈≈M N
=>
≈≈O Q
f
≈≈R S
.
≈≈S T
ParentFolder
≈≈T `
!
≈≈` a
.
≈≈a b
Name
≈≈b f
)
≈≈f g
:
∆∆3 4
query
∆∆5 :
.
∆∆: ;
OrderBy
∆∆; B
(
∆∆B C
f
∆∆C D
=>
∆∆E G
f
∆∆H I
.
∆∆I J
ParentFolder
∆∆J V
!
∆∆V W
.
∆∆W X
Name
∆∆X \
)
∆∆\ ]
,
∆∆] ^
$str
«« 
=>
««  "
isDescending
««# /
?
««0 1
query
««2 7
.
««7 8
OrderByDescending
««8 I
(
««I J
f
««J K
=>
««L N
f
««O P
.
««P Q
	CreatedBy
««Q Z
.
««Z [
UserName
««[ c
)
««c d
:
»»0 1
query
»»2 7
.
»»7 8
OrderBy
»»8 ?
(
»»? @
f
»»@ A
=>
»»B D
f
»»E F
.
»»F G
	CreatedBy
»»G P
.
»»P Q
UserName
»»Q Y
)
»»Y Z
,
»»Z [
$str
…… 
=>
…… 
isDescending
…… +
?
……, -
query
……. 3
.
……3 4
OrderByDescending
……4 E
(
……E F
f
……F G
=>
……H J
f
……K L
.
……L M
	CreatedAt
……M V
)
……V W
:
  , -
query
  . 3
.
  3 4
OrderBy
  4 ;
(
  ; <
f
  < =
=>
  > @
f
  A B
.
  B C
	CreatedAt
  C L
)
  L M
,
  M N
$str
ÀÀ 
=>
ÀÀ 
isDescending
ÀÀ +
?
ÀÀ, -
query
ÀÀ. 3
.
ÀÀ3 4
OrderByDescending
ÀÀ4 E
(
ÀÀE F
f
ÀÀF G
=>
ÀÀH J
f
ÀÀK L
.
ÀÀL M
	UpdatedAt
ÀÀM V
)
ÀÀV W
:
ÃÃ, -
query
ÃÃ. 3
.
ÃÃ3 4
OrderBy
ÃÃ4 ;
(
ÃÃ; <
f
ÃÃ< =
=>
ÃÃ> @
f
ÃÃA B
.
ÃÃB C
	UpdatedAt
ÃÃC L
)
ÃÃL M
,
ÃÃM N
_
ŒŒ 
=>
ŒŒ 
query
ŒŒ 
.
ŒŒ 
OrderBy
ŒŒ "
(
ŒŒ" #
f
ŒŒ# $
=>
ŒŒ% '
f
ŒŒ( )
.
ŒŒ) *
Name
ŒŒ* .
)
ŒŒ. /
}
œœ 
;
œœ 
}
–– 	
public
‘‘ 
Task
‘‘ 
<
‘‘ 
Folder
‘‘ 
?
‘‘ 
>
‘‘ 
GetByNameAsync
‘‘ +
(
‘‘+ ,
string
‘‘, 2
name
‘‘3 7
,
‘‘7 8
int
‘‘9 <
departmentId
‘‘= I
)
‘‘I J
{
’’ 	
throw
÷÷ 
new
÷÷ %
NotImplementedException
÷÷ -
(
÷÷- .
)
÷÷. /
;
÷÷/ 0
}
◊◊ 	
public
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
bool
ŸŸ 
>
ŸŸ 
ExistsAsync
ŸŸ %
(
ŸŸ% &
int
ŸŸ& )
id
ŸŸ* ,
)
ŸŸ, -
{
⁄⁄ 	
throw
€€ 
new
€€ %
NotImplementedException
€€ -
(
€€- .
)
€€. /
;
€€/ 0
}
‹‹ 	
public
ﬁﬁ 
Task
ﬁﬁ 
<
ﬁﬁ 
IReadOnlyList
ﬁﬁ !
<
ﬁﬁ! "
Folder
ﬁﬁ" (
>
ﬁﬁ( )
>
ﬁﬁ) *"
GetByDepartmentAsync
ﬁﬁ+ ?
(
ﬁﬁ? @
int
ﬁﬁ@ C
departmentId
ﬁﬁD P
)
ﬁﬁP Q
{
ﬂﬂ 	
throw
‡‡ 
new
‡‡ %
NotImplementedException
‡‡ -
(
‡‡- .
)
‡‡. /
;
‡‡/ 0
}
·· 	
public
„„ 
Task
„„ 
<
„„ 
IReadOnlyList
„„ !
<
„„! "
Folder
„„" (
>
„„( )
>
„„) *!
GetRootFoldersAsync
„„+ >
(
„„> ?
int
„„? B
departmentId
„„C O
)
„„O P
{
‰‰ 	
throw
ÂÂ 
new
ÂÂ %
NotImplementedException
ÂÂ -
(
ÂÂ- .
)
ÂÂ. /
;
ÂÂ/ 0
}
ÊÊ 	
public
ËË 
Task
ËË 
<
ËË 
IReadOnlyList
ËË !
<
ËË! "
Folder
ËË" (
>
ËË( )
>
ËË) * 
GetFolderTreeAsync
ËË+ =
(
ËË= >
int
ËË> A
departmentId
ËËB N
)
ËËN O
{
ÈÈ 	
throw
ÍÍ 
new
ÍÍ %
NotImplementedException
ÍÍ -
(
ÍÍ- .
)
ÍÍ. /
;
ÍÍ/ 0
}
ÎÎ 	
public
ÌÌ 
Task
ÌÌ 
<
ÌÌ 
IReadOnlyList
ÌÌ !
<
ÌÌ! "
Folder
ÌÌ" (
>
ÌÌ( )
>
ÌÌ) *
GetByUserAsync
ÌÌ+ 9
(
ÌÌ9 :
string
ÌÌ: @
userId
ÌÌA G
)
ÌÌG H
{
ÓÓ 	
throw
ÔÔ 
new
ÔÔ %
NotImplementedException
ÔÔ -
(
ÔÔ- .
)
ÔÔ. /
;
ÔÔ/ 0
}
 	
}
ÛÛ 
}ÙÙ ï=
[/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/GenerateToken.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
;

% &
public 
class 
GenerateToken 
: 
IGenerateToken +
{ 
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
public 

GenerateToken 
( 
IConfiguration '
configuration( 5
)5 6
{ 
_configuration 
= 
configuration &
;& '
} 
public 

Task 
< 
string 
> 
GetAndCreateToken )
() *
AppUser* 1
user2 6
,6 7
string8 >
role? C
,C D
stringE K
departmentIdL X
=Y Z
null[ _
)_ `
{ 
List 
< 
Claim 
> 
claims 
= 
new  
List! %
<% &
Claim& +
>+ ,
{ 	
new 
Claim 
( 

ClaimTypes  
.  !
Name! %
,% &
user' +
.+ ,
UserName, 4
??5 7
$str8 :
): ;
,; <
new 
Claim 
( 

ClaimTypes  
.  !
NameIdentifier! /
,/ 0
user1 5
.5 6
Id6 8
.8 9
ToString9 A
(A B
)B C
)C D
,D E
} 	
;	 

if 

( 
! 
user 
. 
DepartmentId 
. 
Equals %
(% &
Guid& *
.* +
Empty+ 0
)0 1
)1 2
{   	
claims!! 
.!! 
Add!! 
(!! 
new!! 
Claim!!  
(!!  !
$str!!! /
,!!/ 0
user!!1 5
.!!5 6
DepartmentId!!6 B
.!!B C
ToString!!C K
(!!K L
)!!L M
)!!M N
)!!N O
;!!O P
}"" 	
if## 

(## 
!## 
string## 
.## 
IsNullOrEmpty## !
(##! "
user##" &
.##& '
Cin##' *
.##* +
ToString##+ 3
(##3 4
)##4 5
)##5 6
)##6 7
{$$ 	
claims%% 
.%% 
Add%% 
(%% 
new%% 
Claim%%  
(%%  !
$str%%! &
,%%& '
user%%( ,
.%%, -
Cin%%- 0
.%%0 1
ToString%%1 9
(%%9 :
)%%: ;
)%%; <
)%%< =
;%%= >
}&& 	
if++ 

(++ 
!++ 
string++ 
.++ 
IsNullOrEmpty++ !
(++! "
role++" &
)++& '
)++' (
{,, 	
claims-- 
.-- 
Add-- 
(-- 
new-- 
Claim--  
(--  !
$str--! '
,--' (
role--) -
)--- .
)--. /
;--/ 0
}.. 	
if33 

(33 
!33 
string33 
.33 
IsNullOrEmpty33 !
(33! "
departmentId33" .
)33. /
)33/ 0
{44 	
claims55 
.55 
Add55 
(55 
new55 
Claim55  
(55  !
$str55! /
,55/ 0
departmentId551 =
)55= >
)55> ?
;55? @
}66 	
if88 

(88 
!88 
string88 
.88 
IsNullOrEmpty88 !
(88! "
user88" &
.88& '
Email88' ,
)88, -
)88- .
{99 	
claims:: 
.:: 
Add:: 
(:: 
new:: 
Claim::  
(::  !

ClaimTypes::! +
.::+ ,
Email::, 1
,::1 2
user::3 7
.::7 8
Email::8 =
)::= >
)::> ?
;::? @
};; 	
if>> 	
(>>
 
!>> 
string>> 
.>> 
IsNullOrEmpty>>  
(>>  !
role>>! %
)>>% &
)>>& '
{?? 
claims@@ 
.@@ 
Add@@ 
(@@ 
new@@ 
Claim@@ 
(@@  

ClaimTypes@@  *
.@@* +
Role@@+ /
,@@/ 0
role@@1 5
)@@5 6
)@@6 7
;@@7 8
}AA 
ConsoleCC 
.CC 
	WriteLineCC 
(CC 
$strCC ?
)CC? @
;CC@ A
foreachDD 
(DD 
varDD 
claimDD 
inDD 
claimsDD $
)DD$ %
{EE 	
ConsoleFF 
.FF 
	WriteLineFF 
(FF 
$"FF  
$strFF  ,
{FF, -
claimFF- 2
.FF2 3
TypeFF3 7
}FF7 8
$strFF8 }
{FF} ~
claim	FF~ É
.
FFÉ Ñ
Value
FFÑ â
}
FFâ ä
"
FFä ã
)
FFã å
;
FFå ç
}GG 	
varII 
SecurityII 
=II 
_configurationII %
[II% &
$strII& 4
]II4 5
;II5 6
varKK 
keyKK 
=KK 
EncodingKK 
.KK 
ASCIIKK  
.KK  !
GetBytesKK! )
(KK) *
SecurityKK* 2
)KK2 3
;KK3 4
SigningCredentialsMM 
credentialsMM &
=MM' (
newMM) ,
SigningCredentialsMM- ?
(MM? @
newNN  
SymmetricSecurityKeyNN $
(NN$ %
keyNN% (
)NN( )
,NN) *
SecurityAlgorithmsNN+ =
.NN= >
HmacSha256SignatureNN> Q
)OO 	
;OO	 
#
SecurityTokenDescriptorPP 
tokenPP  %
=PP& '
newPP( +#
SecurityTokenDescriptorPP, C
{QQ 	
SubjectRR 
=RR 
newRR 
ClaimsIdentityRR (
(RR( )
claimsRR) /
)RR/ 0
,RR0 1
ExpiresSS 
=SS 
DateTimeSS 
.SS 
NowSS "
.SS" #
AddDaysSS# *
(SS* +
$numSS+ ,
)SS, -
,SS- .
IssuerTT 
=TT 
_configurationTT #
[TT# $
$strTT$ 2
]TT2 3
,TT3 4
AudienceUU 
=UU 
_configurationUU %
[UU% &
$strUU& 6
]UU6 7
,UU7 8
SigningCredentialsWW 
=WW  
credentialsWW! ,
,WW, -
	NotBeforeXX 
=XX 
DateTimeXX  
.XX  !
NowXX! $
}YY 	
;YY	 
#
JwtSecurityTokenHandler[[ 
tokenHandler[[  ,
=[[- .
new[[/ 2#
JwtSecurityTokenHandler[[3 J
([[J K
)[[K L
;[[L M
SecurityToken\\ 
securityToken\\ #
=\\$ %
tokenHandler\\& 2
.\\2 3
CreateToken\\3 >
(\\> ?
token\\? D
)\\D E
;\\E F
string]] 
tokenString]] 
=]] 
tokenHandler]] )
.]]) *

WriteToken]]* 4
(]]4 5
securityToken]]5 B
)]]B C
;]]C D
return^^ 
Task^^ 
.^^ 

FromResult^^ 
(^^ 
tokenString^^ *
)^^* +
;^^+ ,
}__ 
}`` Î9
_/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/GenericRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
;% &
public		 
class		 
GenericRepository		 
<		 
T		  
>		  !
:		" #
IGenericRepository		$ 6
<		6 7
T		7 8
>		8 9
where		: ?
T		@ A
:		B C
class		D I
{

 
private 
readonly 
AppDbContext !
_context" *
;* +
public 

GenericRepository 
( 
AppDbContext )
context* 1
)1 2
{ 
_context 
= 
context 
; 
} 
public 

async 
Task 
AddAsync 
( 
T  
entity! '
)' (
{ 
await 
_context 
. 
Set 
< 
T 
> 
( 
) 
.  
AddAsync  (
(( )
entity) /
)/ 0
;0 1
await 
_context 
. 
SaveChangesAsync '
(' (
)( )
;) *
} 
public 

async 
Task 
< 
int 
> 

CountAsync %
(% &
)& '
=>( *
await+ 0
_context1 9
.9 :
Set: =
<= >
T> ?
>? @
(@ A
)A B
.B C

CountAsyncC M
(M N
)N O
;O P
public 

async 
Task 
DeleteAsync !
(! "
int" %
id& (
)( )
{ 
var 
entity 
= 
await 
_context #
.# $
Set$ '
<' (
T( )
>) *
(* +
)+ ,
., -
	FindAsync- 6
(6 7
id7 9
)9 :
;: ;
if 

( 
entity 
!= 
null 
) 
{ 	
_context 
. 
Set 
< 
T 
> 
( 
) 
. 
Remove $
($ %
entity% +
)+ ,
;, -
await   
_context   
.   
SaveChangesAsync   +
(  + ,
)  , -
;  - .
}!! 	
else"" 
{## 	
throw$$ 
new$$ 
	Exception$$ 
($$  
$"$$  "
$str$$" 1
{$$1 2
id$$2 4
}$$4 5
$str$$5 @
"$$@ A
)$$A B
;$$B C
}%% 	
}&& 
public(( 

async(( 
Task(( 
<(( 
IReadOnlyList(( #
<((# $
T(($ %
>((% &
>((& '
GetAllAsync((( 3
(((3 4
)((4 5
{)) 
return** 
await** 
_context** 
.** 
Set** !
<**! "
T**" #
>**# $
(**$ %
)**% &
.**& '
AsNoTracking**' 3
(**3 4
)**4 5
.**5 6
ToListAsync**6 A
(**A B
)**B C
;**C D
}++ 
public-- 

async-- 
Task-- 
<-- 
IReadOnlyList-- #
<--# $
T--$ %
>--% &
>--& '
GetAllAsync--( 3
(--3 4
params--4 :

Expression--; E
<--E F
Func--F J
<--J K
T--K L
,--L M
object--N T
>--T U
>--U V
[--V W
]--W X
includes--Y a
)--a b
{.. 
var// 
query// 
=// 
_context// 
.// 
Set//  
<//  !
T//! "
>//" #
(//# $
)//$ %
.//% &
AsQueryable//& 1
(//1 2
)//2 3
;//3 4
foreach00 
(00 
var00 
item00 
in00 
includes00 %
)00% &
{11 	
query22 
=22 
query22 
.22 
Include22 !
(22! "
item22" &
)22& '
;22' (
}33 	
return44 
await44 
query44 
.44 
ToListAsync44 &
(44& '
)44' (
;44( )
}55 
public77 

async77 
Task77 
<77 
T77 
>77 
GetByIdAsync77 %
(77% &
int77& )
id77* ,
)77, -
{88 
var99 
entity99 
=99 
await99 
_context99 #
.99# $
Set99$ '
<99' (
T99( )
>99) *
(99* +
)99+ ,
.99, -
	FindAsync99- 6
(996 7
id997 9
)999 :
;99: ;
return:: 
entity:: 
;:: 
};; 
public== 

async== 
Task== 
<== 
T== 
>== 
GetByIdAsync== %
(==% &
int==& )
id==* ,
,==, -
params==. 4

Expression==5 ?
<==? @
Func==@ D
<==D E
T==E F
,==F G
object==H N
>==N O
>==O P
[==P Q
]==Q R
includes==S [
)==[ \
{>> 
var?? 
query?? 
=?? 
_context?? 
.?? 
Set??  
<??  !
T??! "
>??" #
(??# $
)??$ %
.??% &
AsQueryable??& 1
(??1 2
)??2 3
;??3 4
foreach@@ 
(@@ 
var@@ 
item@@ 
in@@ 
includes@@ %
)@@% &
{AA 	
queryBB 
=BB 
queryBB 
.BB 
IncludeBB !
(BB! "
itemBB" &
)BB& '
;BB' (
}CC 	
varDD 
entityDD 
=DD 
awaitDD 
queryDD  
.DD  !
FirstOrDefaultAsyncDD! 4
(DD4 5
xDD5 6
=>DD7 9
EFDD: <
.DD< =
PropertyDD= E
<DDE F
intDDF I
>DDI J
(DDJ K
xDDK L
,DDL M
$strDDN R
)DDR S
==DDT V
idDDW Y
)DDY Z
;DDZ [
returnFF 
entityFF 
;FF 
}GG 
publicII 

asyncII 
TaskII 
UpdateAsyncII !
(II! "
TII" #
entityII$ *
)II* +
{JJ 
_contextKK 
.KK 
EntryKK 
(KK 
entityKK 
)KK 
.KK 
StateKK $
=KK% &
EntityStateKK' 2
.KK2 3
ModifiedKK3 ;
;KK; <
awaitLL 
_contextLL 
.LL 
SaveChangesAsyncLL '
(LL' (
)LL( )
;LL) *
}MM 
}NN ˜C
\/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/HomeRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
;% &
public		 
class		 
HomeRepository		 
:		 
IHomeRepository		 -
{

 
private 
readonly 
AppDbContext !
_context" *
;* +
public 

HomeRepository 
( 
AppDbContext &
context' .
). /
{ 
_context 
= 
context 
?? 
throw #
new$ '!
ArgumentNullException( =
(= >
nameof> D
(D E
contextE L
)L M
)M N
;N O
} 
public 

async 
Task 
< 
HomeDto 
> "
GetHomeDocumentFolders 5
(5 6
HomeFilterDto6 C
filterD J
)J K
{ 
var 
query 
= 
_context 
. 
Folders $
. 
Include 
( 
f 
=> 
f 
. 

Department &
)& '
. 
Include 
( 
f 
=> 
f 
. 
	Documents %
)% &
. 
Where 
( 
f 
=> 
f 
. 
DepartmentId &
==' )
filter* 0
.0 1
DepartmentId1 =
||> @
filterA G
.G H
DepartmentIdH T
==U W
nullX \
)\ ]
;] ^
if 

( 
filter 
. 
CreatedFrom 
!= !
null" &
)& '
{ 	
query 
= 
query 
. 
Where 
(  
f  !
=>" $
f% &
.& '
	CreatedAt' 0
>=1 3
filter4 :
.: ;
CreatedFrom; F
)F G
;G H
} 	
if 

( 
filter 
. 
	CreatedTo 
!= 
null  $
)$ %
{ 	
query   
=   
query   
.   
Where   
(    
f    !
=>  " $
f  % &
.  & '
	CreatedAt  ' 0
<=  1 3
filter  4 :
.  : ;
	CreatedTo  ; D
)  D E
;  E F
}!! 	
var$$ 
folders$$ 
=$$ 
await$$ 
query$$ !
.%% 
Skip%% 
(%% 
(%% 
filter%% 
.%% 

PageNumber%% $
-%%% &
$num%%' (
)%%( )
*%%* +
filter%%, 2
.%%2 3
PageSize%%3 ;
)%%; <
.&& 
Take&& 
(&& 
filter&& 
.&& 
PageSize&& !
)&&! "
.'' 
ToListAsync'' 
('' 
)'' 
;'' 
var)) 

folderDtos)) 
=)) 
folders))  
.))  !
Select))! '
())' (
folder))( .
=>))/ 1
new))2 5
HomeFolderDto))6 C
{** 	
Id++ 
=++ 
folder++ 
.++ 
Id++ 
,++ 
Name,, 
=,, 
folder,, 
.,, 
Name,, 
,,, 
DepartmentId-- 
=-- 
folder-- !
.--! "
DepartmentId--" .
,--. /
	CreatedAt.. 
=.. 
folder.. 
... 
	CreatedAt.. (
,..( )
DocumentsCount// 
=// 
folder// #
.//# $
	Documents//$ -
.//- .
Count//. 3
,//3 4
SubFoldersCount00 
=00 
$num00 
}11 	
)11	 

.11
 
ToList11 
(11 
)11 
;11 
var33 
documentDtos33 
=33 
folders33 "
.44 

SelectMany44 
(44 
f44 
=>44 
f44 
.44 
	Documents44 (
)44( )
.55 
Select55 
(55 
doc55 
=>55 
new55 
HomeDocumentDTO55 .
{66 
Id77 
=77 
doc77 
.77 
Id77 
,77 
Name88 
=88 
doc88 
.88 
Name88 
,88  
FileSize99 
=99 
doc99 
.99 
FileSize99 '
,99' (
FileType:: 
=:: 
doc:: 
.:: 
FileType:: '
,::' (
	CreatedAt;; 
=;; 
doc;; 
.;;  
	CreatedAt;;  )
,;;) *
	UpdatedAt<< 
=<< 
doc<< 
.<<  
	UpdatedAt<<  )
}== 
)== 
.== 
ToList== 
(== 
)== 
;== 
var?? 
	documents?? 
=?? 
await?? 
_context?? &
.??& '
	Documents??' 0
.@@ 
Where@@ 
(@@ 
d@@ 
=>@@ 
d@@ 
.@@ 
DepartmentId@@ &
==@@' )
filter@@* 0
.@@0 1
DepartmentId@@1 =
||@@> @
filter@@A G
.@@G H
DepartmentId@@H T
==@@U W
null@@X \
)@@\ ]
.AA 
ToListAsyncAA 
(AA 
)AA 
;AA 
documentDtosCC 
.CC 
AddRangeCC 
(CC 
	documentsCC '
.CC' (
SelectCC( .
(CC. /
docCC/ 2
=>CC3 5
newCC6 9
HomeDocumentDTOCC: I
{DD 	
IdEE 
=EE 
docEE 
.EE 
IdEE 
,EE 
NameFF 
=FF 
docFF 
.FF 
NameFF 
,FF 
FileSizeGG 
=GG 
docGG 
.GG 
FileSizeGG #
,GG# $
FileTypeHH 
=HH 
docHH 
.HH 
FileTypeHH #
,HH# $
	CreatedAtII 
=II 
docII 
.II 
	CreatedAtII %
,II% &
	UpdatedAtJJ 
=JJ 
docJJ 
.JJ 
	UpdatedAtJJ %
}KK 	
)KK	 

)KK
 
;KK 
returnOO 
newOO 
HomeDtoOO 
{PP 	
TotalFoldersQQ 
=QQ 

folderDtosQQ %
.QQ% &
CountQQ& +
,QQ+ ,
TotalDocumentsRR 
=RR 
documentDtosRR )
.RR) *
CountRR* /
,RR/ 0
LastUpdatedSS 
=SS 
DateTimeSS "
.SS" #
UtcNowSS# )
,SS) *
FoldersTT 
=TT 

folderDtosTT  
,TT  !
	DocumentsUU 
=UU 
documentDtosUU $
}VV 	
;VV	 

}WW 
privateZZ 

IQueryableZZ 
<ZZ 
HomeDtoZZ 
>ZZ 
ApplySortingZZ  ,
(ZZ, -

IQueryableZZ- 7
<ZZ7 8
HomeDtoZZ8 ?
>ZZ? @
queryZZA F
,ZZF G
stringZZH N
?ZZN O
sortByZZP V
,ZZV W
stringZZX ^
?ZZ^ _
sortDirectionZZ` m
)ZZm n
{[[ 
returnaa 
sortDirectionaa 
?aa 
.aa 
ToLoweraa %
(aa% &
)aa& '
==aa( *
$straa+ 1
?bb 
querybb 
.bb 
OrderByDescendingbb %
(bb% &
fbb& '
=>bb( *
EFbb+ -
.bb- .
Propertybb. 6
<bb6 7
objectbb7 =
>bb= >
(bb> ?
fbb? @
,bb@ A
sortBybbB H
)bbH I
)bbI J
:cc 
querycc 
.cc 
OrderBycc 
(cc 
fcc 
=>cc  
EFcc! #
.cc# $
Propertycc$ ,
<cc, -
objectcc- 3
>cc3 4
(cc4 5
fcc5 6
,cc6 7
sortBycc8 >
)cc> ?
)cc? @
;cc@ A
}dd 
}jj “Ä
d/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/NotificationRepository.cs
	namespace 	
Infrastructure
 
; 
public

 
class

 "
NotificationRepository

 #
:

# $#
INotificationRepository

$ ;
{ 
private 
readonly 
AppDbContext !
_context" *
;* +
public 
"
NotificationRepository !
(! "
AppDbContext" .
context/ 6
)6 7
{ 
_context 
= 
context 
; 
} 
public 
async	 
Task 
< 
Notification  
>  !
GetByIdAsync" .
(. /
int/ 2
id3 5
)5 6
{ 	
return 
await 
_context !
.! "
Notifications" /
. 
Include 
( 
n 
=> 
n 
.  
User  $
)$ %
. 
Include 
( 
n 
=> 
n 
.  
Sender  &
)& '
. 
FirstOrDefaultAsync $
($ %
n% &
=>' )
n* +
.+ ,
Id, .
==/ 1
id2 4
)4 5
;5 6
} 	
public 
async 
Task 
< 
PagedResult %
<% &
Notification& 2
>2 3
>3 4
GetAllAsync5 @
(@ A
PaginationParamsA Q
paginationParamsR b
)b c
{ 	
var 
query 
= 
_context  
.  !
Notifications! .
. 
Include 
( 
n 
=> 
n 
.  
User  $
)$ %
. 
Include 
( 
n 
=> 
n 
.  
Sender  &
)& '
.   
AsQueryable   
(   
)   
;   
var"" 
totalRecords"" 
="" 
await"" $
query""% *
.""* +

CountAsync""+ 5
(""5 6
)""6 7
;""7 8
query$$ 
=$$ 
ApplySorting$$  
($$  !
query$$! &
,$$& '
paginationParams$$( 8
.$$8 9
SortBy$$9 ?
,$$? @
paginationParams$$A Q
.$$Q R
SortDirection$$R _
)$$_ `
;$$` a
var&& 
notifications&& 
=&& 
await&&  %
query&&& +
.'' 
Skip'' 
('' 
('' 
paginationParams'' '
.''' (

PageNumber''( 2
-''3 4
$num''5 6
)''6 7
*''8 9
paginationParams'': J
.''J K
PageSize''K S
)''S T
.(( 
Take(( 
((( 
paginationParams(( &
.((& '
PageSize((' /
)((/ 0
.)) 
ToListAsync)) 
()) 
))) 
;)) 
return++ 
notifications++  
.++  !
ToPagedResult++! .
(++. /
paginationParams,,  
.,,  !

PageNumber,,! +
,,,+ ,
paginationParams--  
.--  !
PageSize--! )
,--) *
totalRecords.. 
,.. 
paginationParams//  
.//  !
Search//! '
,//' (
paginationParams00  
.00  !
SortBy00! '
,00' (
paginationParams11  
.11  !
SortDirection11! .
)22 
;22 
}33 	
private55 

IQueryable55 
<55 
Notification55 '
>55' (
ApplySorting55) 5
(555 6

IQueryable556 @
<55@ A
Notification55A M
>55M N
query55O T
,55T U
string55V \
sortBy55] c
,55c d
string55e k
sortDirection55l y
)55y z
{66 	
if77 
(77 
string77 
.77 
IsNullOrEmpty77 $
(77$ %
sortBy77% +
)77+ ,
)77, -
{88 
return99 
query99 
.99 
OrderByDescending99 .
(99. /
n99/ 0
=>991 3
n994 5
.995 6
	CreatedAt996 ?
)99? @
;99@ A
}:: 
switch>> 
(>> 
sortBy>> 
)>> 
{?? 
case@@ 
$str@@  
:@@  !
queryAA 
=AA 
sortDirectionAA )
==AA* ,
$strAA- 3
?BB 
queryBB 
.BB  
OrderByDescendingBB  1
(BB1 2
nBB2 3
=>BB4 6
nBB7 8
.BB8 9
	CreatedAtBB9 B
)BBB C
:CC 
queryCC 
.CC  
OrderByCC  '
(CC' (
nCC( )
=>CC* ,
nCC- .
.CC. /
	CreatedAtCC/ 8
)CC8 9
;CC9 :
breakDD 
;DD 
caseEE 
$strEE 
:EE 
queryFF 
=FF 
sortDirectionFF )
==FF* ,
$strFF- 3
?GG 
queryGG 
.GG  
OrderByDescendingGG  1
(GG1 2
nGG2 3
=>GG4 6
nGG7 8
.GG8 9
titleGG9 >
)GG> ?
:HH 
queryHH 
.HH  
OrderByHH  '
(HH' (
nHH( )
=>HH* ,
nHH- .
.HH. /
titleHH/ 4
)HH4 5
;HH5 6
breakII 
;II 
defaultJJ 
:JJ 
queryKK 
=KK 
queryKK !
.KK! "
OrderByDescendingKK" 3
(KK3 4
nKK4 5
=>KK6 8
nKK9 :
.KK: ;
	CreatedAtKK; D
)KKD E
;KKE F
breakLL 
;LL 
}MM 
returnOO 
queryOO 
;OO 
}PP 	
publicTT 
asyncTT 
TaskTT 
<TT 
intTT 
>TT 
GetUnreadCountAsyncTT 2
(TT2 3
stringTT3 9
userIdTT: @
)TT@ A
{UU 	
returnVV 
awaitVV 
_contextVV !
.VV! "
NotificationsVV" /
.WW 

CountAsyncWW 
(WW 
nWW 
=>WW  
nWW! "
.WW" #
UserIdWW# )
==WW* ,
userIdWW- 3
&&WW4 6
!WW7 8
nWW8 9
.WW9 :
IsReadWW: @
)WW@ A
;WWA B
}XX 	
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
NotificationZZ &
>ZZ& '
AddAsyncZZ( 0
(ZZ0 1
NotificationZZ1 =
notificationZZ> J
)ZZJ K
{[[ 	
var\\ 
nowUtc\\ 
=\\ 
DateTime\\ !
.\\! "
UtcNow\\" (
;\\( )
notification]] 
.]] 
	CreatedAt]] "
=]]# $
nowUtc]]% +
;]]+ ,
await__ 
_context__ 
.__ 
Notifications__ (
.__( )
AddAsync__) 1
(__1 2
notification__2 >
)__> ?
;__? @
await`` 
_context`` 
.`` 
SaveChangesAsync`` +
(``+ ,
)``, -
;``- .
returnaa 
notificationaa 
;aa  
}bb 	
publicdd 
asyncdd 
Taskdd 
UpdateAsyncdd %
(dd% &
Notificationdd& 2
notificationdd3 ?
)dd? @
{ee 	
_contextff 
.ff 
Notificationsff "
.ff" #
Updateff# )
(ff) *
notificationff* 6
)ff6 7
;ff7 8
awaitgg 
_contextgg 
.gg 
SaveChangesAsyncgg +
(gg+ ,
)gg, -
;gg- .
}hh 	
publicjj 
asyncjj 
Taskjj 
DeleteAsyncjj %
(jj% &
Notificationjj& 2
notificationjj3 ?
)jj? @
{kk 	
_contextll 
.ll 
Notificationsll "
.ll" #
Removell# )
(ll) *
notificationll* 6
)ll6 7
;ll7 8
awaitmm 
_contextmm 
.mm 
SaveChangesAsyncmm +
(mm+ ,
)mm, -
;mm- .
}nn 	
publicpp 
asyncpp 
Taskpp 
MarkAsReadAsyncpp )
(pp) *
intpp* -
idpp. 0
)pp0 1
{qq 	
varrr 
notificationrr 
=rr 
awaitrr $
_contextrr% -
.rr- .
Notificationsrr. ;
.rr; <
	FindAsyncrr< E
(rrE F
idrrF H
)rrH I
;rrI J
ifss 
(ss 
notificationss 
!=ss 
nullss  $
&&ss% '
!ss( )
notificationss) 5
.ss5 6
IsReadss6 <
)ss< =
{tt 
notificationuu 
.uu 
IsReaduu #
=uu$ %
trueuu& *
;uu* +
awaitvv 
_contextvv 
.vv 
SaveChangesAsyncvv /
(vv/ 0
)vv0 1
;vv1 2
}ww 
}xx 	
publiczz 
asynczz 
Taskzz 
MarkAllAsReadAsynczz ,
(zz, -
stringzz- 3
userIdzz4 :
)zz: ;
{{{ 	
var|| 
unreadNotifications|| #
=||$ %
await||& +
_context||, 4
.||4 5
Notifications||5 B
.}} 
Where}} 
(}} 
n}} 
=>}} 
n}} 
.}} 
UserId}} $
==}}% '
userId}}( .
&&}}/ 1
!}}2 3
n}}3 4
.}}4 5
IsRead}}5 ;
)}}; <
.~~ 
ToListAsync~~ 
(~~ 
)~~ 
;~~ 
foreach
ÄÄ 
(
ÄÄ 
var
ÄÄ 
notification
ÄÄ %
in
ÄÄ& (!
unreadNotifications
ÄÄ) <
)
ÄÄ< =
{
ÅÅ 
notification
ÇÇ 
.
ÇÇ 
IsRead
ÇÇ #
=
ÇÇ$ %
true
ÇÇ& *
;
ÇÇ* +
}
ÉÉ 
await
ÖÖ 
_context
ÖÖ 
.
ÖÖ 
SaveChangesAsync
ÖÖ +
(
ÖÖ+ ,
)
ÖÖ, -
;
ÖÖ- .
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà 
bool
àà 
>
àà 
ExistsAsync
àà  +
(
àà+ ,
int
àà, /
id
àà0 2
)
àà2 3
{
ââ 	
return
ää 
await
ää 
_context
ää !
.
ää! "
Notifications
ää" /
.
ää/ 0
AnyAsync
ää0 8
(
ää8 9
n
ää9 :
=>
ää; =
n
ää> ?
.
ää? @
Id
ää@ B
==
ääC E
id
ääF H
)
ääH I
;
ääI J
}
ãã 	
public
çç 

async
çç 
Task
çç 
<
çç 
PagedResult
çç !
<
çç! "
Notification
çç" .
>
çç. /
>
çç/ 0
GetAllAsync
çç1 <
(
çç< =
)
çç= >
{
éé 
var
èè 
notifications
èè 
=
èè 
await
èè !
_context
èè" *
.
èè* +
Notifications
èè+ 8
.
êê 
Include
êê 
(
êê 
n
êê 
=>
êê 
n
êê 
.
êê 
User
êê  
)
êê  !
.
ëë 
Include
ëë 
(
ëë 
n
ëë 
=>
ëë 
n
ëë 
.
ëë 
Sender
ëë "
)
ëë" #
.
íí 
OrderByDescending
íí 
(
íí 
n
íí  
=>
íí! #
n
íí$ %
.
íí% &
	CreatedAt
íí& /
)
íí/ 0
.
ìì 
ToListAsync
ìì 
(
ìì 
)
ìì 
;
ìì 
return
ïï 
notifications
ïï 
.
ïï 
ToPagedResult
ïï *
(
ïï* +
$num
ïï+ ,
,
ïï, -
notifications
ïï. ;
.
ïï; <
Count
ïï< A
,
ïïA B
notifications
ïïC P
.
ïïP Q
Count
ïïQ V
,
ïïV W
null
ïïX \
,
ïï\ ]
$str
ïï^ i
,
ïïi j
$str
ïïk q
)
ïïq r
;
ïïr s
}
ññ 
public
òò 

async
òò 
Task
òò 
<
òò 
PagedResult
òò !
<
òò! "
Notification
òò" .
>
òò. /
>
òò/ 0
GetByUserIdAsync
òò1 A
(
òòA B
string
òòB H
userId
òòI O
)
òòO P
{
ôô 
var
öö 
notifications
öö 
=
öö 
await
öö !
_context
öö" *
.
öö* +
Notifications
öö+ 8
.
õõ 
Include
õõ 
(
õõ 
n
õõ 
=>
õõ 
n
õõ 
.
õõ 
User
õõ  
)
õõ  !
.
úú 
Include
úú 
(
úú 
n
úú 
=>
úú 
n
úú 
.
úú 
Sender
úú "
)
úú" #
.
ùù 
Where
ùù 
(
ùù 
n
ùù 
=>
ùù 
n
ùù 
.
ùù 
UserId
ùù  
==
ùù! #
userId
ùù$ *
)
ùù* +
.
ûû 
OrderByDescending
ûû 
(
ûû 
n
ûû  
=>
ûû! #
n
ûû$ %
.
ûû% &
	CreatedAt
ûû& /
)
ûû/ 0
.
üü 
ToListAsync
üü 
(
üü 
)
üü 
;
üü 
return
°° 
notifications
°° 
.
°° 
ToPagedResult
°° *
(
°°* +
$num
°°+ ,
,
°°, -
notifications
°°. ;
.
°°; <
Count
°°< A
,
°°A B
notifications
°°C P
.
°°P Q
Count
°°Q V
,
°°V W
null
°°X \
,
°°\ ]
$str
°°^ i
,
°°i j
$str
°°k q
)
°°q r
;
°°r s
}
¢¢ 
public
§§ 

async
§§ 
Task
§§ 
<
§§ 
PagedResult
§§ !
<
§§! "
Notification
§§" .
>
§§. /
>
§§/ 0$
GetUnreadByUserIdAsync
§§1 G
(
§§G H
string
§§H N
userId
§§O U
)
§§U V
{
•• 
var
¶¶ 
notifications
¶¶ 
=
¶¶ 
await
¶¶ !
_context
¶¶" *
.
¶¶* +
Notifications
¶¶+ 8
.
ßß 
Include
ßß 
(
ßß 
n
ßß 
=>
ßß 
n
ßß 
.
ßß 
User
ßß  
)
ßß  !
.
®® 
Include
®® 
(
®® 
n
®® 
=>
®® 
n
®® 
.
®® 
Sender
®® "
)
®®" #
.
©© 
Where
©© 
(
©© 
n
©© 
=>
©© 
n
©© 
.
©© 
UserId
©©  
==
©©! #
userId
©©$ *
&&
©©+ -
!
©©. /
n
©©/ 0
.
©©0 1
IsRead
©©1 7
)
©©7 8
.
™™ 
OrderByDescending
™™ 
(
™™ 
n
™™  
=>
™™! #
n
™™$ %
.
™™% &
	CreatedAt
™™& /
)
™™/ 0
.
´´ 
ToListAsync
´´ 
(
´´ 
)
´´ 
;
´´ 
return
≠≠ 
notifications
≠≠ 
.
≠≠ 
ToPagedResult
≠≠ *
(
≠≠* +
$num
≠≠+ ,
,
≠≠, -
notifications
≠≠. ;
.
≠≠; <
Count
≠≠< A
,
≠≠A B
notifications
≠≠C P
.
≠≠P Q
Count
≠≠Q V
,
≠≠V W
null
≠≠X \
,
≠≠\ ]
$str
≠≠^ i
,
≠≠i j
$str
≠≠k q
)
≠≠q r
;
≠≠r s
}
ÆÆ 
}ØØ ◊Ù
b/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/PermissionRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{		 
public

 

class

 !
PermissionsRepository

 &
:

' (
GenericRepository

) :
<

: ;
AccessRight

; F
>

F G
,

G H"
IPermissionsRepository

I _
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
public !
PermissionsRepository $
($ %
AppDbContext% 1
context2 9
)9 :
:; <
base= A
(A B
contextB I
)I J
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
async 
Task 
< 
PagedResult %
<% &
AccessRight& 1
>1 2
>2 3
GetPagedAsync4 A
(A B 
AccessRightFilterDtoB V
filterW ]
)] ^
{ 	
var 
query 
= 
_context  
.  !
AccessRights! -
. 
Include 
( 
ar 
=> 
ar !
.! "
User" &
)& '
. 
Include 
( 
ar 
=> 
ar !
.! "
Document" *
)* +
. 
Include 
( 
ar 
=> 
ar !
.! "
Folder" (
)( )
. 
AsQueryable 
( 
) 
; 
query 
= 
ApplyFilters  
(  !
query! &
,& '
filter( .
). /
;/ 0
var   
totalRecords   
=   
await   $
query  % *
.  * +

CountAsync  + 5
(  5 6
)  6 7
;  7 8
query## 
=## 
ApplySorting##  
(##  !
query##! &
,##& '
filter##( .
.##. /
SortBy##/ 5
,##5 6
filter##7 =
.##= >
SortDirection##> K
)##K L
;##L M
var&& 
accessRights&& 
=&& 
await&& $
query&&% *
.'' 
Skip'' 
('' 
('' 
filter'' 
.'' 

PageNumber'' (
-'') *
$num''+ ,
)'', -
*''. /
filter''0 6
.''6 7
PageSize''7 ?
)''? @
.(( 
Take(( 
((( 
filter(( 
.(( 
PageSize(( %
)((% &
.)) 
ToListAsync)) 
()) 
))) 
;)) 
return++ 
accessRights++ 
.++  
ToPagedResult++  -
(++- .
filter,, 
.,, 

PageNumber,, !
,,,! "
filter-- 
.-- 
PageSize-- 
,--  
totalRecords.. 
,.. 
filter// 
.// 
Search// 
,// 
filter00 
.00 
SortBy00 
,00 
filter11 
.11 
SortDirection11 $
)22 
;22 
}33 	
public55 
async55 
Task55 
<55 
PagedResult55 %
<55% &
AccessRight55& 1
>551 2
>552 3)
GetUserAccessRightsPagedAsync554 Q
(55Q R
string55R X
userId55Y _
,55_ `
PaginationParams55a q

pagination55r |
)55| }
{66 	
var77 
query77 
=77 
_context77  
.77  !
AccessRights77! -
.88 
Include88 
(88 
ar88 
=>88 
ar88 !
.88! "
User88" &
)88& '
.99 
Include99 
(99 
ar99 
=>99 
ar99 !
.99! "
Document99" *
)99* +
.:: 
Include:: 
(:: 
ar:: 
=>:: 
ar:: !
.::! "
Folder::" (
)::( )
.;; 
Where;; 
(;; 
ar;; 
=>;; 
ar;; 
.;;  
UserId;;  &
.;;& '
ToString;;' /
(;;/ 0
);;0 1
==;;2 4
userId;;5 ;
);;; <
;;;< =
var== 
totalRecords== 
=== 
await== $
query==% *
.==* +

CountAsync==+ 5
(==5 6
)==6 7
;==7 8
query@@ 
=@@ 
ApplySorting@@  
(@@  !
query@@! &
,@@& '

pagination@@( 2
.@@2 3
SortBy@@3 9
,@@9 :

pagination@@; E
.@@E F
SortDirection@@F S
)@@S T
;@@T U
varBB 
accessRightsBB 
=BB 
awaitBB $
queryBB% *
.CC 
SkipCC 
(CC 
(CC 

paginationCC !
.CC! "

PageNumberCC" ,
-CC- .
$numCC/ 0
)CC0 1
*CC2 3

paginationCC4 >
.CC> ?
PageSizeCC? G
)CCG H
.DD 
TakeDD 
(DD 

paginationDD  
.DD  !
PageSizeDD! )
)DD) *
.EE 
ToListAsyncEE 
(EE 
)EE 
;EE 
returnGG 
accessRightsGG 
.GG  
ToPagedResultGG  -
(GG- .

paginationHH 
.HH 

PageNumberHH %
,HH% &

paginationII 
.II 
PageSizeII #
,II# $
totalRecordsJJ 
,JJ 

paginationKK 
.KK 
SearchKK !
,KK! "

paginationLL 
.LL 
SortByLL !
,LL! "

paginationMM 
.MM 
SortDirectionMM (
)NN 
;NN 
}OO 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
PagedResultQQ %
<QQ% &
AccessRightQQ& 1
>QQ1 2
>QQ2 3-
!GetDocumentAccessRightsPagedAsyncQQ4 U
(QQU V
intQQV Y

documentIdQQZ d
,QQd e
PaginationParamsQQf v

pagination	QQw Å
)
QQÅ Ç
{RR 	
varSS 
querySS 
=SS 
_contextSS  
.SS  !
AccessRightsSS! -
.TT 
IncludeTT 
(TT 
arTT 
=>TT 
arTT !
.TT! "
UserTT" &
)TT& '
.UU 
IncludeUU 
(UU 
arUU 
=>UU 
arUU !
.UU! "
DocumentUU" *
)UU* +
.VV 
WhereVV 
(VV 
arVV 
=>VV 
arVV 
.VV  

DocumentIdVV  *
==VV+ -

documentIdVV. 8
)VV8 9
;VV9 :
varXX 
totalRecordsXX 
=XX 
awaitXX $
queryXX% *
.XX* +

CountAsyncXX+ 5
(XX5 6
)XX6 7
;XX7 8
queryZZ 
=ZZ 
ApplySortingZZ  
(ZZ  !
queryZZ! &
,ZZ& '

paginationZZ( 2
.ZZ2 3
SortByZZ3 9
,ZZ9 :

paginationZZ; E
.ZZE F
SortDirectionZZF S
)ZZS T
;ZZT U
var\\ 
accessRights\\ 
=\\ 
await\\ $
query\\% *
.]] 
Skip]] 
(]] 
(]] 

pagination]] !
.]]! "

PageNumber]]" ,
-]]- .
$num]]/ 0
)]]0 1
*]]2 3

pagination]]4 >
.]]> ?
PageSize]]? G
)]]G H
.^^ 
Take^^ 
(^^ 

pagination^^  
.^^  !
PageSize^^! )
)^^) *
.__ 
ToListAsync__ 
(__ 
)__ 
;__ 
returnaa 
accessRightsaa 
.aa  
ToPagedResultaa  -
(aa- .

paginationbb 
.bb 

PageNumberbb %
,bb% &

paginationcc 
.cc 
PageSizecc #
,cc# $
totalRecordsdd 
,dd 

paginationee 
.ee 
Searchee !
,ee! "

paginationff 
.ff 
SortByff !
,ff! "

paginationgg 
.gg 
SortDirectiongg (
)hh 
;hh 
}ii 	
publickk 
asynckk 
Taskkk 
<kk 
PagedResultkk %
<kk% &
AccessRightkk& 1
>kk1 2
>kk2 3+
GetFolderAccessRightsPagedAsynckk4 S
(kkS T
intkkT W
folderIdkkX `
,kk` a
PaginationParamskkb r

paginationkks }
)kk} ~
{ll 	
varmm 
querymm 
=mm 
_contextmm  
.mm  !
AccessRightsmm! -
.nn 
Includenn 
(nn 
arnn 
=>nn 
arnn !
.nn! "
Usernn" &
)nn& '
.oo 
Includeoo 
(oo 
aroo 
=>oo 
aroo !
.oo! "
Folderoo" (
)oo( )
.pp 
Wherepp 
(pp 
arpp 
=>pp 
arpp 
.pp  
FolderIdpp  (
==pp) +
folderIdpp, 4
)pp4 5
;pp5 6
varrr 
totalRecordsrr 
=rr 
awaitrr $
queryrr% *
.rr* +

CountAsyncrr+ 5
(rr5 6
)rr6 7
;rr7 8
querytt 
=tt 
ApplySortingtt  
(tt  !
querytt! &
,tt& '

paginationtt( 2
.tt2 3
SortBytt3 9
,tt9 :

paginationtt; E
.ttE F
SortDirectionttF S
)ttS T
;ttT U
varvv 
accessRightsvv 
=vv 
awaitvv $
queryvv% *
.ww 
Skipww 
(ww 
(ww 

paginationww !
.ww! "

PageNumberww" ,
-ww- .
$numww/ 0
)ww0 1
*ww2 3

paginationww4 >
.ww> ?
PageSizeww? G
)wwG H
.xx 
Takexx 
(xx 

paginationxx  
.xx  !
PageSizexx! )
)xx) *
.yy 
ToListAsyncyy 
(yy 
)yy 
;yy 
return{{ 
accessRights{{ 
.{{  
ToPagedResult{{  -
({{- .

pagination|| 
.|| 

PageNumber|| %
,||% &

pagination}} 
.}} 
PageSize}} #
,}}# $
totalRecords~~ 
,~~ 

pagination 
. 
Search !
,! "

pagination
ÄÄ 
.
ÄÄ 
SortBy
ÄÄ !
,
ÄÄ! "

pagination
ÅÅ 
.
ÅÅ 
SortDirection
ÅÅ (
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
int
ÖÖ 
>
ÖÖ  
GetTotalCountAsync
ÖÖ 1
(
ÖÖ1 2"
AccessRightFilterDto
ÖÖ2 F
?
ÖÖF G
filter
ÖÖH N
=
ÖÖO P
null
ÖÖQ U
)
ÖÖU V
{
ÜÜ 	
var
áá 
query
áá 
=
áá 
_context
áá  
.
áá  !
AccessRights
áá! -
.
áá- .
AsQueryable
áá. 9
(
áá9 :
)
áá: ;
;
áá; <
if
ââ 
(
ââ 
filter
ââ 
!=
ââ 
null
ââ 
)
ââ 
{
ää 
query
ãã 
=
ãã 
ApplyFilters
ãã $
(
ãã$ %
query
ãã% *
,
ãã* +
filter
ãã, 2
)
ãã2 3
;
ãã3 4
}
åå 
return
éé 
await
éé 
query
éé 
.
éé 

CountAsync
éé )
(
éé) *
)
éé* +
;
éé+ ,
}
èè 	
private
ëë 

IQueryable
ëë 
<
ëë 
AccessRight
ëë &
>
ëë& '
ApplyFilters
ëë( 4
(
ëë4 5

IQueryable
ëë5 ?
<
ëë? @
AccessRight
ëë@ K
>
ëëK L
query
ëëM R
,
ëëR S"
AccessRightFilterDto
ëëT h
filter
ëëi o
)
ëëo p
{
íí 	
if
ìì 
(
ìì 
!
ìì 
string
ìì 
.
ìì 
IsNullOrEmpty
ìì %
(
ìì% &
filter
ìì& ,
.
ìì, -
UserId
ìì- 3
)
ìì3 4
)
ìì4 5
query
îî 
=
îî 
query
îî 
.
îî 
Where
îî #
(
îî# $
ar
îî$ &
=>
îî' )
ar
îî* ,
.
îî, -
UserId
îî- 3
.
îî3 4
ToString
îî4 <
(
îî< =
)
îî= >
==
îî? A
filter
îîB H
.
îîH I
UserId
îîI O
)
îîO P
;
îîP Q
if
ññ 
(
ññ 
!
ññ 
string
ññ 
.
ññ 
IsNullOrEmpty
ññ %
(
ññ% &
filter
ññ& ,
.
ññ, -
UserName
ññ- 5
)
ññ5 6
)
ññ6 7
query
óó 
=
óó 
query
óó 
.
óó 
Where
óó #
(
óó# $
ar
óó$ &
=>
óó' )
ar
óó* ,
.
óó, -
User
óó- 1
.
óó1 2
UserName
óó2 :
!
óó: ;
.
óó; <
Contains
óó< D
(
óóD E
filter
óóE K
.
óóK L
UserName
óóL T
)
óóT U
)
óóU V
;
óóV W
if
ôô 
(
ôô 
filter
ôô 
.
ôô 

DocumentId
ôô !
.
ôô! "
HasValue
ôô" *
)
ôô* +
query
öö 
=
öö 
query
öö 
.
öö 
Where
öö #
(
öö# $
ar
öö$ &
=>
öö' )
ar
öö* ,
.
öö, -

DocumentId
öö- 7
==
öö8 :
filter
öö; A
.
ööA B

DocumentId
ööB L
)
ööL M
;
ööM N
if
úú 
(
úú 
filter
úú 
.
úú 
FolderId
úú 
.
úú  
HasValue
úú  (
)
úú( )
query
ùù 
=
ùù 
query
ùù 
.
ùù 
Where
ùù #
(
ùù# $
ar
ùù$ &
=>
ùù' )
ar
ùù* ,
.
ùù, -
FolderId
ùù- 5
==
ùù6 8
filter
ùù9 ?
.
ùù? @
FolderId
ùù@ H
)
ùùH I
;
ùùI J
if
üü 
(
üü 
!
üü 
string
üü 
.
üü 
IsNullOrEmpty
üü %
(
üü% &
filter
üü& ,
.
üü, -
Type
üü- 1
)
üü1 2
)
üü2 3
{
†† 
if
°° 
(
°° 
filter
°° 
.
°° 
Type
°° 
.
°°  
ToLower
°°  '
(
°°' (
)
°°( )
==
°°* ,
$str
°°- 7
)
°°7 8
query
¢¢ 
=
¢¢ 
query
¢¢ !
.
¢¢! "
Where
¢¢" '
(
¢¢' (
ar
¢¢( *
=>
¢¢+ -
ar
¢¢. 0
.
¢¢0 1

DocumentId
¢¢1 ;
.
¢¢; <
HasValue
¢¢< D
)
¢¢D E
;
¢¢E F
else
££ 
if
££ 
(
££ 
filter
££ 
.
££  
Type
££  $
.
££$ %
ToLower
££% ,
(
££, -
)
££- .
==
££/ 1
$str
££2 :
)
££: ;
query
§§ 
=
§§ 
query
§§ !
.
§§! "
Where
§§" '
(
§§' (
ar
§§( *
=>
§§+ -
ar
§§. 0
.
§§0 1
FolderId
§§1 9
.
§§9 :
HasValue
§§: B
)
§§B C
;
§§C D
}
•• 
if
©© 
(
©© 
filter
©© 
.
©© 
	CanCreate
©©  
.
©©  !
HasValue
©©! )
)
©©) *
query
™™ 
=
™™ 
query
™™ 
.
™™ 
Where
™™ #
(
™™# $
ar
™™$ &
=>
™™' )
ar
™™* ,
.
™™, -
	CanCreate
™™- 6
==
™™7 9
filter
™™: @
.
™™@ A
	CanCreate
™™A J
)
™™J K
;
™™K L
if
¨¨ 
(
¨¨ 
filter
¨¨ 
.
¨¨ 
CanRead
¨¨ 
.
¨¨ 
HasValue
¨¨ '
)
¨¨' (
query
≠≠ 
=
≠≠ 
query
≠≠ 
.
≠≠ 
Where
≠≠ #
(
≠≠# $
ar
≠≠$ &
=>
≠≠' )
ar
≠≠* ,
.
≠≠, -
CanRead
≠≠- 4
==
≠≠5 7
filter
≠≠8 >
.
≠≠> ?
CanRead
≠≠? F
)
≠≠F G
;
≠≠G H
if
ØØ 
(
ØØ 
filter
ØØ 
.
ØØ 
	CanUpdate
ØØ  
.
ØØ  !
HasValue
ØØ! )
)
ØØ) *
query
∞∞ 
=
∞∞ 
query
∞∞ 
.
∞∞ 
Where
∞∞ #
(
∞∞# $
ar
∞∞$ &
=>
∞∞' )
ar
∞∞* ,
.
∞∞, -
	CanUpdate
∞∞- 6
==
∞∞7 9
filter
∞∞: @
.
∞∞@ A
	CanUpdate
∞∞A J
)
∞∞J K
;
∞∞K L
if
≤≤ 
(
≤≤ 
filter
≤≤ 
.
≤≤ 
	CanDelete
≤≤  
.
≤≤  !
HasValue
≤≤! )
)
≤≤) *
query
≥≥ 
=
≥≥ 
query
≥≥ 
.
≥≥ 
Where
≥≥ #
(
≥≥# $
ar
≥≥$ &
=>
≥≥' )
ar
≥≥* ,
.
≥≥, -
	CanDelete
≥≥- 6
==
≥≥7 9
filter
≥≥: @
.
≥≥@ A
	CanDelete
≥≥A J
)
≥≥J K
;
≥≥K L
if
µµ 
(
µµ 
filter
µµ 
.
µµ 
CreatedFrom
µµ "
.
µµ" #
HasValue
µµ# +
)
µµ+ ,
query
∂∂ 
=
∂∂ 
query
∂∂ 
.
∂∂ 
Where
∂∂ #
(
∂∂# $
ar
∂∂$ &
=>
∂∂' )
ar
∂∂* ,
.
∂∂, -
	CreatedAt
∂∂- 6
>=
∂∂7 9
filter
∂∂: @
.
∂∂@ A
CreatedFrom
∂∂A L
)
∂∂L M
;
∂∂M N
if
∏∏ 
(
∏∏ 
filter
∏∏ 
.
∏∏ 
	CreatedTo
∏∏  
.
∏∏  !
HasValue
∏∏! )
)
∏∏) *
query
ππ 
=
ππ 
query
ππ 
.
ππ 
Where
ππ #
(
ππ# $
ar
ππ$ &
=>
ππ' )
ar
ππ* ,
.
ππ, -
	CreatedAt
ππ- 6
<=
ππ7 9
filter
ππ: @
.
ππ@ A
	CreatedTo
ππA J
)
ππJ K
;
ππK L
if
ªª 
(
ªª 
!
ªª 
string
ªª 
.
ªª 
IsNullOrEmpty
ªª %
(
ªª% &
filter
ªª& ,
.
ªª, -
Search
ªª- 3
)
ªª3 4
)
ªª4 5
{
ºº 
query
ΩΩ 
=
ΩΩ 
query
ΩΩ 
.
ΩΩ 
Where
ΩΩ #
(
ΩΩ# $
ar
ΩΩ$ &
=>
ΩΩ' )
ar
ææ 
.
ææ 
User
ææ 
.
ææ 
UserName
ææ $
!
ææ$ %
.
ææ% &
Contains
ææ& .
(
ææ. /
filter
ææ/ 5
.
ææ5 6
Search
ææ6 <
)
ææ< =
||
ææ> @
(
¿¿ 
ar
¿¿ 
.
¿¿ 
Document
¿¿  
!=
¿¿! #
null
¿¿$ (
&&
¿¿) +
ar
¿¿, .
.
¿¿. /
Document
¿¿/ 7
.
¿¿7 8
Name
¿¿8 <
.
¿¿< =
Contains
¿¿= E
(
¿¿E F
filter
¿¿F L
.
¿¿L M
Search
¿¿M S
)
¿¿S T
)
¿¿T U
||
¿¿V X
(
¡¡ 
ar
¡¡ 
.
¡¡ 
Folder
¡¡ 
!=
¡¡ !
null
¡¡" &
&&
¡¡' )
ar
¡¡* ,
.
¡¡, -
Folder
¡¡- 3
.
¡¡3 4
Name
¡¡4 8
.
¡¡8 9
Contains
¡¡9 A
(
¡¡A B
filter
¡¡B H
.
¡¡H I
Search
¡¡I O
)
¡¡O P
)
¡¡P Q
)
¬¬ 
;
¬¬ 
}
√√ 
return
≈≈ 
query
≈≈ 
;
≈≈ 
}
∆∆ 	
private
»» 

IQueryable
»» 
<
»» 
AccessRight
»» &
>
»»& '
ApplySorting
»»( 4
(
»»4 5

IQueryable
»»5 ?
<
»»? @
AccessRight
»»@ K
>
»»K L
query
»»M R
,
»»R S
string
»»T Z
?
»»Z [
sortBy
»»\ b
,
»»b c
string
»»d j
?
»»j k
sortDirection
»»l y
)
»»y z
{
…… 	
if
   
(
   
string
   
.
   
IsNullOrEmpty
   $
(
  $ %
sortBy
  % +
)
  + ,
)
  , -
return
ÀÀ 
query
ÀÀ 
.
ÀÀ 
OrderByDescending
ÀÀ .
(
ÀÀ. /
ar
ÀÀ/ 1
=>
ÀÀ2 4
ar
ÀÀ5 7
.
ÀÀ7 8
	CreatedAt
ÀÀ8 A
)
ÀÀA B
;
ÀÀB C
var
ÕÕ 
isDescending
ÕÕ 
=
ÕÕ 
sortDirection
ÕÕ ,
?
ÕÕ, -
.
ÕÕ- .
ToLower
ÕÕ. 5
(
ÕÕ5 6
)
ÕÕ6 7
==
ÕÕ8 :
$str
ÕÕ; A
;
ÕÕA B
return
œœ 
sortBy
œœ 
.
œœ 
ToLower
œœ !
(
œœ! "
)
œœ" #
switch
œœ$ *
{
–– 
$str
—— 
=>
—— 
isDescending
—— *
?
——+ ,
query
——- 2
.
——2 3
OrderByDescending
——3 D
(
——D E
ar
——E G
=>
——H J
ar
——K M
.
——M N
User
——N R
.
——R S
UserName
——S [
)
——[ \
:
““* +
query
““, 1
.
““1 2
OrderBy
““2 9
(
““9 :
ar
““: <
=>
““= ?
ar
““@ B
.
““B C
User
““C G
.
““G H
UserName
““H P
)
““P Q
,
““Q R
$str
‘‘ 
=>
‘‘ !
isDescending
‘‘" .
?
‘‘/ 0
query
‘‘1 6
.
‘‘6 7
OrderByDescending
‘‘7 H
(
‘‘H I
ar
‘‘I K
=>
‘‘L N
ar
‘‘O Q
.
‘‘Q R
Document
‘‘R Z
!
‘‘Z [
.
‘‘[ \
Name
‘‘\ `
)
‘‘` a
:
’’/ 0
query
’’1 6
.
’’6 7
OrderBy
’’7 >
(
’’> ?
ar
’’? A
=>
’’B D
ar
’’E G
.
’’G H
Document
’’H P
!
’’P Q
.
’’Q R
Name
’’R V
)
’’V W
,
’’W X
$str
÷÷ 
=>
÷÷ 
isDescending
÷÷  ,
?
÷÷- .
query
÷÷/ 4
.
÷÷4 5
OrderByDescending
÷÷5 F
(
÷÷F G
ar
÷÷G I
=>
÷÷J L
ar
÷÷M O
.
÷÷O P
Folder
÷÷P V
!
÷÷V W
.
÷÷W X
Name
÷÷X \
)
÷÷\ ]
:
◊◊- .
query
◊◊/ 4
.
◊◊4 5
OrderBy
◊◊5 <
(
◊◊< =
ar
◊◊= ?
=>
◊◊@ B
ar
◊◊C E
.
◊◊E F
Folder
◊◊F L
!
◊◊L M
.
◊◊M N
Name
◊◊N R
)
◊◊R S
,
◊◊S T
$str
ÿÿ 
=>
ÿÿ 
isDescending
ÿÿ +
?
ÿÿ, -
query
ÿÿ. 3
.
ÿÿ3 4
OrderByDescending
ÿÿ4 E
(
ÿÿE F
ar
ÿÿF H
=>
ÿÿI K
ar
ÿÿL N
.
ÿÿN O
	CreatedAt
ÿÿO X
)
ÿÿX Y
:
ŸŸ, -
query
ŸŸ. 3
.
ŸŸ3 4
OrderBy
ŸŸ4 ;
(
ŸŸ; <
ar
ŸŸ< >
=>
ŸŸ? A
ar
ŸŸB D
.
ŸŸD E
	CreatedAt
ŸŸE N
)
ŸŸN O
,
ŸŸO P
$str
⁄⁄ 
=>
⁄⁄ 
isDescending
⁄⁄ +
?
⁄⁄, -
query
⁄⁄. 3
.
⁄⁄3 4
OrderByDescending
⁄⁄4 E
(
⁄⁄E F
ar
⁄⁄F H
=>
⁄⁄I K
ar
⁄⁄L N
.
⁄⁄N O
	UpdatedAt
⁄⁄O X
)
⁄⁄X Y
:
€€, -
query
€€. 3
.
€€3 4
OrderBy
€€4 ;
(
€€; <
ar
€€< >
=>
€€? A
ar
€€B D
.
€€D E
	UpdatedAt
€€E N
)
€€N O
,
€€O P
_
›› 
=>
›› 
query
›› 
.
›› 
OrderByDescending
›› ,
(
››, -
ar
››- /
=>
››0 2
ar
››3 5
.
››5 6
	CreatedAt
››6 ?
)
››? @
}
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
public
·· 
async
·· 
Task
·· 
<
·· 
AccessRight
·· %
>
··% &
AddAsync
··' /
(
··/ 0
AccessRight
··0 ;
accessRight
··< G
)
··G H
{
‚‚ 	
if
„„ 
(
„„ 
accessRight
„„ 
==
„„ 
null
„„ #
)
„„# $
throw
‰‰ 
new
‰‰ #
ArgumentNullException
‰‰ /
(
‰‰/ 0
nameof
‰‰0 6
(
‰‰6 7
accessRight
‰‰7 B
)
‰‰B C
)
‰‰C D
;
‰‰D E
if
ÁÁ 
(
ÁÁ 
(
ÁÁ 
accessRight
ÁÁ 
.
ÁÁ 

DocumentId
ÁÁ '
.
ÁÁ' (
HasValue
ÁÁ( 0
&&
ÁÁ1 3
accessRight
ÁÁ4 ?
.
ÁÁ? @
FolderId
ÁÁ@ H
.
ÁÁH I
HasValue
ÁÁI Q
)
ÁÁQ R
||
ÁÁS U
(
ËË 
!
ËË 
accessRight
ËË 
.
ËË 

DocumentId
ËË (
.
ËË( )
HasValue
ËË) 1
&&
ËË2 4
!
ËË5 6
accessRight
ËË6 A
.
ËËA B
FolderId
ËËB J
.
ËËJ K
HasValue
ËËK S
)
ËËS T
)
ËËT U
{
ÈÈ 
throw
ÍÍ 
new
ÍÍ 
ArgumentException
ÍÍ +
(
ÍÍ+ ,
$str
ÍÍ, e
)
ÍÍe f
;
ÍÍf g
}
ÎÎ 
var
 
result
 
=
 
await
 
_context
 '
.
' (
AccessRights
( 4
.
4 5
AddAsync
5 =
(
= >
accessRight
> I
)
I J
;
J K
return
ÒÒ 
result
ÒÒ 
.
ÒÒ 
Entity
ÒÒ  
;
ÒÒ  !
}
ÚÚ 	
public
ÙÙ 
async
ÙÙ 
Task
ÙÙ 
DeleteAsync
ÙÙ %
(
ÙÙ% &
int
ÙÙ& )
id
ÙÙ* ,
)
ÙÙ, -
{
ıı 	
var
ˆˆ 
accessRight
ˆˆ 
=
ˆˆ 
await
ˆˆ #
_context
ˆˆ$ ,
.
ˆˆ, -
AccessRights
ˆˆ- 9
.
ˆˆ9 :
	FindAsync
ˆˆ: C
(
ˆˆC D
id
ˆˆD F
)
ˆˆF G
;
ˆˆG H
if
˜˜ 
(
˜˜ 
accessRight
˜˜ 
==
˜˜ 
null
˜˜ #
)
˜˜# $
throw
¯¯ 
new
¯¯ 
ArgumentException
¯¯ +
(
¯¯+ ,
$"
¯¯, .
$str
¯¯. B
{
¯¯B C
id
¯¯C E
}
¯¯E F
$str
¯¯F P
"
¯¯P Q
)
¯¯Q R
;
¯¯R S
_context
˙˙ 
.
˙˙ 
AccessRights
˙˙ !
.
˙˙! "
Remove
˙˙" (
(
˙˙( )
accessRight
˙˙) 4
)
˙˙4 5
;
˙˙5 6
}
˚˚ 	
public
˝˝ 
async
˝˝ 
Task
˝˝ 
<
˝˝ 
IReadOnlyList
˝˝ '
<
˝˝' (
AccessRight
˝˝( 3
>
˝˝3 4
>
˝˝4 5
GetAllAsync
˝˝6 A
(
˝˝A B
)
˝˝B C
{
˛˛ 	
return
ˇˇ 
await
ˇˇ 
_context
ˇˇ !
.
ˇˇ! "
AccessRights
ˇˇ" .
.
ÄÄ 
Include
ÄÄ 
(
ÄÄ 
ar
ÄÄ 
=>
ÄÄ 
ar
ÄÄ !
.
ÄÄ! "
User
ÄÄ" &
)
ÄÄ& '
.
ÅÅ 
Include
ÅÅ 
(
ÅÅ 
ar
ÅÅ 
=>
ÅÅ 
ar
ÅÅ !
.
ÅÅ! "
Document
ÅÅ" *
)
ÅÅ* +
.
ÇÇ 
Include
ÇÇ 
(
ÇÇ 
ar
ÇÇ 
=>
ÇÇ 
ar
ÇÇ !
.
ÇÇ! "
Folder
ÇÇ" (
)
ÇÇ( )
.
ÑÑ 
OrderBy
ÑÑ 
(
ÑÑ 
ar
ÑÑ 
=>
ÑÑ 
ar
ÑÑ !
.
ÑÑ! "
User
ÑÑ" &
.
ÑÑ& '
UserName
ÑÑ' /
)
ÑÑ/ 0
.
ÖÖ 
ToListAsync
ÖÖ 
(
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà 
AccessRight
àà %
?
àà% &
>
àà& '
GetByIdAsync
àà( 4
(
àà4 5
int
àà5 8
id
àà9 ;
)
àà; <
{
ââ 	
return
ää 
await
ää 
_context
ää !
.
ää! "
AccessRights
ää" .
.
ãã 
Include
ãã 
(
ãã 
ar
ãã 
=>
ãã 
ar
ãã !
.
ãã! "
User
ãã" &
)
ãã& '
.
åå 
Include
åå 
(
åå 
ar
åå 
=>
åå 
ar
åå !
.
åå! "
Document
åå" *
)
åå* +
.
çç 
Include
çç 
(
çç 
ar
çç 
=>
çç 
ar
çç !
.
çç! "
Folder
çç" (
)
çç( )
.
éé !
FirstOrDefaultAsync
éé $
(
éé$ %
ar
éé% '
=>
éé( *
ar
éé+ -
.
éé- .
Id
éé. 0
==
éé1 3
id
éé4 6
)
éé6 7
;
éé7 8
}
èè 	
public
ëë 
async
ëë 
Task
ëë 
UpdateAsync
ëë %
(
ëë% &
AccessRight
ëë& 1
accessRight
ëë2 =
)
ëë= >
{
íí 	
if
ìì 
(
ìì 
accessRight
ìì 
==
ìì 
null
ìì #
)
ìì# $
throw
îî 
new
îî #
ArgumentNullException
îî /
(
îî/ 0
nameof
îî0 6
(
îî6 7
accessRight
îî7 B
)
îîB C
)
îîC D
;
îîD E
_context
óó 
.
óó 
AccessRights
óó !
.
óó! "
Update
óó" (
(
óó( )
accessRight
óó) 4
)
óó4 5
;
óó5 6
}
òò 	
public
öö 
async
öö 
Task
öö 
<
öö 
bool
öö 
>
öö 
ExistsAsync
öö  +
(
öö+ ,
int
öö, /
id
öö0 2
)
öö2 3
{
õõ 	
return
úú 
await
úú 
_context
úú !
.
úú! "
AccessRights
úú" .
.
úú. /
AnyAsync
úú/ 7
(
úú7 8
ar
úú8 :
=>
úú; =
ar
úú> @
.
úú@ A
Id
úúA C
==
úúD F
id
úúG I
)
úúI J
;
úúJ K
}
ùù 	
public
üü 
async
üü 
Task
üü 
<
üü 
IReadOnlyList
üü '
<
üü' (
AccessRight
üü( 3
>
üü3 4
>
üü4 5
GetByUserAsync
üü6 D
(
üüD E
string
üüE K
userId
üüL R
)
üüR S
{
†† 	
return
°° 
await
°° 
_context
°° !
.
°°! "
AccessRights
°°" .
.
¢¢ 
Include
¢¢ 
(
¢¢ 
ar
¢¢ 
=>
¢¢ 
ar
¢¢ !
.
¢¢! "
Document
¢¢" *
)
¢¢* +
.
££ 
Include
££ 
(
££ 
ar
££ 
=>
££ 
ar
££ !
.
££! "
Folder
££" (
)
££( )
.
•• 
OrderBy
•• 
(
•• 
ar
•• 
=>
•• 
ar
•• !
.
••! "
Type
••" &
)
••& '
.
¶¶ 
ToListAsync
¶¶ 
(
¶¶ 
)
¶¶ 
;
¶¶ 
}
ßß 	
public
©© 
async
©© 
Task
©© 
<
©© 
IReadOnlyList
©© '
<
©©' (
AccessRight
©©( 3
>
©©3 4
>
©©4 5 
GetByDocumentAsync
©©6 H
(
©©H I
int
©©I L

documentId
©©M W
)
©©W X
{
™™ 	
return
´´ 
await
´´ 
_context
´´ !
.
´´! "
AccessRights
´´" .
.
¨¨ 
Include
¨¨ 
(
¨¨ 
ar
¨¨ 
=>
¨¨ 
ar
¨¨ !
.
¨¨! "
User
¨¨" &
)
¨¨& '
.
≠≠ 
Where
≠≠ 
(
≠≠ 
ar
≠≠ 
=>
≠≠ 
ar
≠≠ 
.
≠≠  

DocumentId
≠≠  *
==
≠≠+ -

documentId
≠≠. 8
)
≠≠8 9
.
ÆÆ 
OrderBy
ÆÆ 
(
ÆÆ 
ar
ÆÆ 
=>
ÆÆ 
ar
ÆÆ !
.
ÆÆ! "
User
ÆÆ" &
.
ÆÆ& '
UserName
ÆÆ' /
)
ÆÆ/ 0
.
ØØ 
ToListAsync
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
}
∞∞ 	
public
≤≤ 
async
≤≤ 
Task
≤≤ 
<
≤≤ 
IReadOnlyList
≤≤ '
<
≤≤' (
AccessRight
≤≤( 3
>
≤≤3 4
>
≤≤4 5
GetByFolderAsync
≤≤6 F
(
≤≤F G
int
≤≤G J
folderId
≤≤K S
)
≤≤S T
{
≥≥ 	
return
¥¥ 
await
¥¥ 
_context
¥¥ !
.
¥¥! "
AccessRights
¥¥" .
.
µµ 
Include
µµ 
(
µµ 
ar
µµ 
=>
µµ 
ar
µµ !
.
µµ! "
User
µµ" &
)
µµ& '
.
∂∂ 
Where
∂∂ 
(
∂∂ 
ar
∂∂ 
=>
∂∂ 
ar
∂∂ 
.
∂∂  
FolderId
∂∂  (
==
∂∂) +
folderId
∂∂, 4
)
∂∂4 5
.
∑∑ 
OrderBy
∑∑ 
(
∑∑ 
ar
∑∑ 
=>
∑∑ 
ar
∑∑ !
.
∑∑! "
User
∑∑" &
.
∑∑& '
UserName
∑∑' /
)
∑∑/ 0
.
∏∏ 
ToListAsync
∏∏ 
(
∏∏ 
)
∏∏ 
;
∏∏ 
}
ππ 	
public
ªª 
async
ªª 
Task
ªª 
<
ªª 
AccessRight
ªª %
?
ªª% &
>
ªª& '(
GetUserDocumentAccessAsync
ªª( B
(
ªªB C
string
ªªC I
userId
ªªJ P
,
ªªP Q
int
ªªR U

documentId
ªªV `
)
ªª` a
{
ºº 	
return
ΩΩ 
await
ΩΩ 
_context
ΩΩ !
.
ΩΩ! "
AccessRights
ΩΩ" .
.
ææ !
FirstOrDefaultAsync
ææ $
(
ææ$ %
ar
ææ% '
=>
ææ( *
ar
ææ+ -
.
ææ- .
UserId
ææ. 4
==
ææ5 7
userId
ææ8 >
&&
ææ? A
ar
øø* ,
.
øø, -

DocumentId
øø- 7
==
øø8 :

documentId
øø; E
)
¿¿* +
;
¿¿+ ,
}
¡¡ 	
public
√√ 
async
√√ 
Task
√√ 
<
√√ 
AccessRight
√√ %
?
√√% &
>
√√& '&
GetUserFolderAccessAsync
√√( @
(
√√@ A
string
√√A G
userId
√√H N
,
√√N O
int
√√P S
folderId
√√T \
)
√√\ ]
{
ƒƒ 	
return
≈≈ 
await
≈≈ 
_context
≈≈ !
.
≈≈! "
AccessRights
≈≈" .
.
∆∆ !
FirstOrDefaultAsync
∆∆ $
(
∆∆$ %
ar
∆∆% '
=>
∆∆( *
ar
∆∆+ -
.
∆∆- .
UserId
∆∆. 4
==
∆∆5 7
userId
∆∆8 >
&&
∆∆? A
ar
««* ,
.
««, -
FolderId
««- 5
==
««6 8
folderId
««9 A
)
»»* +
;
»»+ ,
}
…… 	
public
ÀÀ 
async
ÀÀ 
Task
ÀÀ 
<
ÀÀ 
bool
ÀÀ 
>
ÀÀ  
HasPermissionAsync
ÀÀ  2
(
ÀÀ2 3
string
ÀÀ3 9
userId
ÀÀ: @
,
ÀÀ@ A
int
ÀÀB E
?
ÀÀE F

documentId
ÀÀG Q
,
ÀÀQ R
int
ÀÀS V
?
ÀÀV W
folderId
ÀÀX `
,
ÀÀ` a
string
ÀÀb h

permission
ÀÀi s
)
ÀÀs t
{
ÃÃ 	
var
ÕÕ 
query
ÕÕ 
=
ÕÕ 
_context
ÕÕ  
.
ÕÕ  !
AccessRights
ÕÕ! -
.
ŒŒ 
Where
ŒŒ 
(
ŒŒ 
ar
ŒŒ 
=>
ŒŒ 
ar
ŒŒ 
.
ŒŒ  
UserId
ŒŒ  &
==
ŒŒ' )
userId
ŒŒ* 0
)
ŒŒ0 1
;
ŒŒ1 2
if
–– 
(
–– 

documentId
–– 
.
–– 
HasValue
–– #
)
––# $
query
—— 
=
—— 
query
—— 
.
—— 
Where
—— #
(
——# $
ar
——$ &
=>
——' )
ar
——* ,
.
——, -

DocumentId
——- 7
==
——8 :

documentId
——; E
)
——E F
;
——F G
if
”” 
(
”” 
folderId
”” 
.
”” 
HasValue
”” !
)
””! "
query
‘‘ 
=
‘‘ 
query
‘‘ 
.
‘‘ 
Where
‘‘ #
(
‘‘# $
ar
‘‘$ &
=>
‘‘' )
ar
‘‘* ,
.
‘‘, -
FolderId
‘‘- 5
==
‘‘6 8
folderId
‘‘9 A
)
‘‘A B
;
‘‘B C
var
÷÷ 
accessRight
÷÷ 
=
÷÷ 
await
÷÷ #
query
÷÷$ )
.
÷÷) *!
FirstOrDefaultAsync
÷÷* =
(
÷÷= >
)
÷÷> ?
;
÷÷? @
if
◊◊ 
(
◊◊ 
accessRight
◊◊ 
==
◊◊ 
null
◊◊ #
)
◊◊# $
return
◊◊% +
false
◊◊, 1
;
◊◊1 2
return
ŸŸ 

permission
ŸŸ 
.
ŸŸ 
ToLower
ŸŸ %
(
ŸŸ% &
)
ŸŸ& '
switch
ŸŸ( .
{
⁄⁄ 
$str
€€ 
=>
€€ 
accessRight
€€ '
.
€€' (
	CanCreate
€€( 1
,
€€1 2
$str
‹‹ 
=>
‹‹ 
accessRight
‹‹ %
.
‹‹% &
CanRead
‹‹& -
,
‹‹- .
$str
›› 
=>
›› 
accessRight
›› '
.
››' (
	CanUpdate
››( 1
,
››1 2
$str
ﬁﬁ 
=>
ﬁﬁ 
accessRight
ﬁﬁ '
.
ﬁﬁ' (
	CanDelete
ﬁﬁ( 1
,
ﬁﬁ1 2
_
ﬂﬂ 
=>
ﬂﬂ 
false
ﬂﬂ 
}
‡‡ 
;
‡‡ 
}
·· 	
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
bool
„„ 
>
„„  
CanUserCreateAsync
„„  2
(
„„2 3
string
„„3 9
userId
„„: @
,
„„@ A
int
„„B E
?
„„E F
folderId
„„G O
=
„„P Q
null
„„R V
)
„„V W
{
‰‰ 	
return
ÂÂ 
await
ÂÂ  
HasPermissionAsync
ÂÂ +
(
ÂÂ+ ,
userId
ÂÂ, 2
,
ÂÂ2 3
null
ÂÂ4 8
,
ÂÂ8 9
folderId
ÂÂ: B
,
ÂÂB C
$str
ÂÂD L
)
ÂÂL M
;
ÂÂM N
}
ÊÊ 	
public
ËË 
async
ËË 
Task
ËË 
<
ËË 
bool
ËË 
>
ËË 
CanUserReadAsync
ËË  0
(
ËË0 1
string
ËË1 7
userId
ËË8 >
,
ËË> ?
int
ËË@ C
?
ËËC D

documentId
ËËE O
=
ËËP Q
null
ËËR V
,
ËËV W
int
ËËX [
?
ËË[ \
folderId
ËË] e
=
ËËf g
null
ËËh l
)
ËËl m
{
ÈÈ 	
return
ÍÍ 
await
ÍÍ  
HasPermissionAsync
ÍÍ +
(
ÍÍ+ ,
userId
ÍÍ, 2
,
ÍÍ2 3

documentId
ÍÍ4 >
,
ÍÍ> ?
folderId
ÍÍ@ H
,
ÍÍH I
$str
ÍÍJ P
)
ÍÍP Q
;
ÍÍQ R
}
ÎÎ 	
public
ÌÌ 
async
ÌÌ 
Task
ÌÌ 
<
ÌÌ 
bool
ÌÌ 
>
ÌÌ  
CanUserUpdateAsync
ÌÌ  2
(
ÌÌ2 3
string
ÌÌ3 9
userId
ÌÌ: @
,
ÌÌ@ A
int
ÌÌB E
?
ÌÌE F

documentId
ÌÌG Q
=
ÌÌR S
null
ÌÌT X
,
ÌÌX Y
int
ÌÌZ ]
?
ÌÌ] ^
folderId
ÌÌ_ g
=
ÌÌh i
null
ÌÌj n
)
ÌÌn o
{
ÓÓ 	
return
ÔÔ 
await
ÔÔ  
HasPermissionAsync
ÔÔ +
(
ÔÔ+ ,
userId
ÔÔ, 2
,
ÔÔ2 3

documentId
ÔÔ4 >
,
ÔÔ> ?
folderId
ÔÔ@ H
,
ÔÔH I
$str
ÔÔJ R
)
ÔÔR S
;
ÔÔS T
}
 	
public
ÚÚ 
async
ÚÚ 
Task
ÚÚ 
<
ÚÚ 
bool
ÚÚ 
>
ÚÚ  
CanUserDeleteAsync
ÚÚ  2
(
ÚÚ2 3
string
ÚÚ3 9
userId
ÚÚ: @
,
ÚÚ@ A
int
ÚÚB E
?
ÚÚE F

documentId
ÚÚG Q
=
ÚÚR S
null
ÚÚT X
,
ÚÚX Y
int
ÚÚZ ]
?
ÚÚ] ^
folderId
ÚÚ_ g
=
ÚÚh i
null
ÚÚj n
)
ÚÚn o
{
ÛÛ 	
return
ÙÙ 
await
ÙÙ  
HasPermissionAsync
ÙÙ +
(
ÙÙ+ ,
userId
ÙÙ, 2
,
ÙÙ2 3

documentId
ÙÙ4 >
,
ÙÙ> ?
folderId
ÙÙ@ H
,
ÙÙH I
$str
ÙÙJ R
)
ÙÙR S
;
ÙÙS T
}
ıı 	
public
˜˜ 
async
˜˜ 
Task
˜˜ 
BulkCreateAsync
˜˜ )
(
˜˜) *
List
˜˜* .
<
˜˜. /
AccessRight
˜˜/ :
>
˜˜: ;
accessRights
˜˜< H
)
˜˜H I
{
¯¯ 	
if
˘˘ 
(
˘˘ 
accessRights
˘˘ 
==
˘˘ 
null
˘˘  $
||
˘˘% '
!
˘˘( )
accessRights
˘˘) 5
.
˘˘5 6
Any
˘˘6 9
(
˘˘9 :
)
˘˘: ;
)
˘˘; <
return
˙˙ 
;
˙˙ 
foreach
¸¸ 
(
¸¸ 
var
¸¸ 
accessRight
¸¸ $
in
¸¸% '
accessRights
¸¸( 4
)
¸¸4 5
{
˝˝ 
}
ÄÄ 
await
ÇÇ 
_context
ÇÇ 
.
ÇÇ 
AccessRights
ÇÇ '
.
ÇÇ' (
AddRangeAsync
ÇÇ( 5
(
ÇÇ5 6
accessRights
ÇÇ6 B
)
ÇÇB C
;
ÇÇC D
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ #
RemoveUserAccessAsync
ÖÖ /
(
ÖÖ/ 0
string
ÖÖ0 6
userId
ÖÖ7 =
,
ÖÖ= >
int
ÖÖ? B
?
ÖÖB C

documentId
ÖÖD N
=
ÖÖO P
null
ÖÖQ U
,
ÖÖU V
int
ÖÖW Z
?
ÖÖZ [
folderId
ÖÖ\ d
=
ÖÖe f
null
ÖÖg k
)
ÖÖk l
{
ÜÜ 	
var
áá 
query
áá 
=
áá 
_context
áá  
.
áá  !
AccessRights
áá! -
.
àà 
Where
àà 
(
àà 
ar
àà 
=>
àà 
ar
àà 
.
àà  
UserId
àà  &
==
àà' )
userId
àà* 0
)
àà0 1
;
àà1 2
if
ää 
(
ää 

documentId
ää 
.
ää 
HasValue
ää #
)
ää# $
query
ãã 
=
ãã 
query
ãã 
.
ãã 
Where
ãã #
(
ãã# $
ar
ãã$ &
=>
ãã' )
ar
ãã* ,
.
ãã, -

DocumentId
ãã- 7
==
ãã8 :

documentId
ãã; E
)
ããE F
;
ããF G
if
çç 
(
çç 
folderId
çç 
.
çç 
HasValue
çç !
)
çç! "
query
éé 
=
éé 
query
éé 
.
éé 
Where
éé #
(
éé# $
ar
éé$ &
=>
éé' )
ar
éé* ,
.
éé, -
FolderId
éé- 5
==
éé6 8
folderId
éé9 A
)
ééA B
;
ééB C
var
êê 
accessRights
êê 
=
êê 
await
êê $
query
êê% *
.
êê* +
ToListAsync
êê+ 6
(
êê6 7
)
êê7 8
;
êê8 9
_context
ëë 
.
ëë 
AccessRights
ëë !
.
ëë! "
RemoveRange
ëë" -
(
ëë- .
accessRights
ëë. :
)
ëë: ;
;
ëë; <
}
íí 	
public
îî 
async
îî 
Task
îî 
<
îî 
IReadOnlyList
îî '
<
îî' (
AccessRight
îî( 3
>
îî3 4
>
îî4 50
"GetInheritedFolderPermissionsAsync
îî6 X
(
îîX Y
string
îîY _
userId
îî` f
,
îîf g
int
îîh k
folderId
îîl t
)
îît u
{
ïï 	
var
óó 
folder
óó 
=
óó 
await
óó 
_context
óó '
.
óó' (
Folders
óó( /
.
òò 
Include
òò 
(
òò 
f
òò 
=>
òò 
f
òò 
.
òò  
ParentFolder
òò  ,
)
òò, -
.
ôô !
FirstOrDefaultAsync
ôô $
(
ôô$ %
f
ôô% &
=>
ôô' )
f
ôô* +
.
ôô+ ,
Id
ôô, .
==
ôô/ 1
folderId
ôô2 :
)
ôô: ;
;
ôô; <
var
õõ 
permissions
õõ 
=
õõ 
new
õõ !
List
õõ" &
<
õõ& '
AccessRight
õõ' 2
>
õõ2 3
(
õõ3 4
)
õõ4 5
;
õõ5 6
var
úú 
currentFolder
úú 
=
úú 
folder
úú  &
;
úú& '
while
ûû 
(
ûû 
currentFolder
ûû  
!=
ûû! #
null
ûû$ (
)
ûû( )
{
üü 
var
†† 
folderPermission
†† $
=
††% &
await
††' ,&
GetUserFolderAccessAsync
††- E
(
††E F
userId
††F L
,
††L M
currentFolder
††N [
.
††[ \
Id
††\ ^
)
††^ _
;
††_ `
if
°° 
(
°° 
folderPermission
°° $
!=
°°% '
null
°°( ,
)
°°, -
{
¢¢ 
permissions
££ 
.
££  
Add
££  #
(
££# $
folderPermission
££$ 4
)
££4 5
;
££5 6
}
§§ 
currentFolder
¶¶ 
=
¶¶ 
currentFolder
¶¶  -
.
¶¶- .
ParentFolder
¶¶. :
;
¶¶: ;
}
ßß 
return
©© 
permissions
©© 
;
©© 
}
™™ 	
}
´´ 
}¨¨ áÜ
\/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/RoleRepository.cs
	namespace		 	
Infrastructure		
 
.		 
Repositories		 %
{

 
public 

class 
RoleRepository 
:  !
IRoleRepository" 1
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly 
RoleManager $
<$ %
Role% )
>) *
_roleManager+ 7
;7 8
public 
RoleRepository 
( 
AppDbContext *
context+ 2
,2 3
RoleManager4 ?
<? @
Role@ D
>D E
roleManagerF Q
)Q R
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
_roleManager 
= 
roleManager &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
roleManagerQ \
)\ ]
)] ^
;^ _
} 	
public 
async 
Task 
< 
string  
>  !
testapi" )
() *
)* +
{ 	
return 
$str 7
;7 8
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
IdentityRole& 2
<2 3
string3 9
>9 :
>: ;
>; <
GetAllAsync= H
(H I
)I J
{ 	
return 
await 
_roleManager %
.% &
Roles& +
. 
Select 
( 
r 
=> 
new  
IdentityRole! -
<- .
string. 4
>4 5
{ 
Id 
= 
r 
. 
Id 
. 
ToString &
(& '
)' (
,( )
Name   
=   
r   
.   
Name   !
,  ! "
NormalizedName!! "
=!!# $
r!!% &
.!!& '
NormalizedName!!' 5
,!!5 6
ConcurrencyStamp"" $
=""% &
r""' (
.""( )
ConcurrencyStamp"") 9
}## 
)## 
.$$ 
ToListAsync$$ 
($$ 
)$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
Role'' 
?'' 
>''  
GetByIdAsync''! -
(''- .
string''. 4
id''5 7
)''7 8
{(( 	
return)) 
await)) 
_roleManager)) %
.))% &
FindByIdAsync))& 3
())3 4
id))4 6
)))6 7
;))7 8
}** 	
public,, 
async,, 
Task,, 
<,, 
Role,, 
?,, 
>,,  
GetByNameAsync,,! /
(,,/ 0
string,,0 6
name,,7 ;
),,; <
{-- 	
if.. 
(.. 
string.. 
... 
IsNullOrEmpty.. $
(..$ %
name..% )
)..) *
)..* +
return// 
null// 
;// 
return11 
await11 
_roleManager11 %
.11% &
FindByNameAsync11& 5
(115 6
name116 :
)11: ;
;11; <
}22 	
public44 
async44 
Task44 
<44 
Role44 
?44 
>44  
AddAsync44! )
(44) *
Role44* .
role44/ 3
)443 4
{55 	
if66 
(66 
role66 
==66 
null66 
)66 
throw77 
new77 !
ArgumentNullException77 /
(77/ 0
nameof770 6
(776 7
role777 ;
)77; <
)77< =
;77= >
var99 
result99 
=99 
await99 
_roleManager99 +
.99+ ,
CreateAsync99, 7
(997 8
role998 <
)99< =
;99= >
if:: 
(:: 
result:: 
.:: 
	Succeeded::  
)::  !
{;; 
return<< 
role<< 
;<< 
}== 
return>> 
null>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
boolAA 
>AA 
UpdateAsyncAA  +
(AA+ ,
RoleAA, 0
roleAA1 5
)AA5 6
{BB 	
ifCC 
(CC 
roleCC 
==CC 
nullCC 
)CC 
throwDD 
newDD !
ArgumentNullExceptionDD /
(DD/ 0
nameofDD0 6
(DD6 7
roleDD7 ;
)DD; <
)DD< =
;DD= >
varFF 
resultFF 
=FF 
awaitFF 
_roleManagerFF +
.FF+ ,
UpdateAsyncFF, 7
(FF7 8
roleFF8 <
)FF< =
;FF= >
returnGG 
resultGG 
.GG 
	SucceededGG #
;GG# $
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 
DeleteAsyncJJ  +
(JJ+ ,
stringJJ, 2
idJJ3 5
)JJ5 6
{KK 	
varLL 
roleLL 
=LL 
awaitLL 
_roleManagerLL )
.LL) *
FindByIdAsyncLL* 7
(LL7 8
idLL8 :
)LL: ;
;LL; <
ifMM 
(MM 
roleMM 
!=MM 
nullMM 
)MM 
{NN 
varOO 
resultOO 
=OO 
awaitOO "
_roleManagerOO# /
.OO/ 0
DeleteAsyncOO0 ;
(OO; <
roleOO< @
)OO@ A
;OOA B
returnPP 
resultPP 
.PP 
	SucceededPP '
;PP' (
}QQ 
returnRR 
falseRR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
boolUU 
>UU 
ExistsAsyncUU  +
(UU+ ,
stringUU, 2
idUU3 5
)UU5 6
{VV 	
varWW 
roleWW 
=WW 
awaitWW 
_roleManagerWW )
.WW) *
FindByIdAsyncWW* 7
(WW7 8
idWW8 :
)WW: ;
;WW; <
returnXX 
roleXX 
!=XX 
nullXX 
;XX  
}YY 	
public[[ 
async[[ 
Task[[ 
<[[ 
bool[[ 
>[[ 
ExistsByNameAsync[[  1
([[1 2
string[[2 8
name[[9 =
)[[= >
{\\ 	
if]] 
(]] 
string]] 
.]] 
IsNullOrEmpty]] $
(]]$ %
name]]% )
)]]) *
)]]* +
return^^ 
false^^ 
;^^ 
var`` 
role`` 
=`` 
await`` 
_roleManager`` )
.``) *
FindByNameAsync``* 9
(``9 :
name``: >
)``> ?
;``? @
returnaa 
roleaa 
!=aa 
nullaa 
;aa  
}bb 	
Taskdd 
<dd 
IReadOnlyListdd 
<dd 
Roledd 
>dd  
>dd  !
IGenericRepositorydd" 4
<dd4 5
Roledd5 9
>dd9 :
.dd: ;
GetAllAsyncdd; F
(ddF G
)ddG H
{ee 	
throwff 
newff #
NotImplementedExceptionff -
(ff- .
)ff. /
;ff/ 0
}gg 	
Taskii 
IGenericRepositoryii 
<ii  
Roleii  $
>ii$ %
.ii% &
AddAsyncii& .
(ii. /
Roleii/ 3
entityii4 :
)ii: ;
{jj 	
returnkk 
AddAsynckk 
(kk 
entitykk "
)kk" #
;kk# $
}ll 	
publicnn 
asyncnn 
Tasknn 
<nn 
PagedResultnn %
<nn% &
Rolenn& *
>nn* +
>nn+ ,
GetPagedAsyncnn- :
(nn: ;
RoleFilterDtonn; H
filternnI O
,nnO P
PaginationParamsnnQ a
paginationParamsnnb r
)nnr s
{oo 	
varpp 
querypp 
=pp 
_roleManagerpp $
.pp$ %
Rolespp% *
.pp* +
AsQueryablepp+ 6
(pp6 7
)pp7 8
;pp8 9
queryrr 
=rr 
ApplyFiltersrr  
(rr  !
queryrr! &
,rr& '
filterrr( .
)rr. /
;rr/ 0
varss 
totalRecordsss 
=ss 
awaitss $
queryss% *
.ss* +

CountAsyncss+ 5
(ss5 6
)ss6 7
;ss7 8
queryuu 
=uu 
ApplySortinguu  
(uu  !
queryuu! &
,uu& '
paginationParamsuu( 8
.uu8 9
SortByuu9 ?
,uu? @
paginationParamsuuA Q
.uuQ R
SortDirectionuuR _
)uu_ `
;uu` a
varvv 
rolesvv 
=vv 
awaitvv 
queryvv #
.vv# $
Skipvv$ (
(vv( )
(vv) *
filtervv* 0
.vv0 1

PageNumbervv1 ;
-vv< =
$numvv> ?
)vv? @
*vvA B
filtervvC I
.vvI J
PageSizevvJ R
)vvR S
.ww# $
Takeww$ (
(ww( )
filterww) /
.ww/ 0
PageSizeww0 8
)ww8 9
.xx# $
ToListAsyncxx$ /
(xx/ 0
)xx0 1
;xx1 2
returnzz 
roleszz 
.zz 
ToPagedResultzz &
(zz& '
filter{{ 
.{{ 

PageNumber{{ !
,{{! "
filter|| 
.|| 
PageSize|| 
,||  
totalRecords}} 
,}} 
filter~~ 
.~~ 
Search~~ 
,~~ 
filter 
. 
SortBy 
, 
filter
ÄÄ 
.
ÄÄ 
SortDirection
ÄÄ $
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
private
ÑÑ 

IQueryable
ÑÑ 
<
ÑÑ 
Role
ÑÑ 
>
ÑÑ  
ApplyFilters
ÑÑ! -
(
ÑÑ- .

IQueryable
ÑÑ. 8
<
ÑÑ8 9
Role
ÑÑ9 =
>
ÑÑ= >
query
ÑÑ? D
,
ÑÑD E
RoleFilterDto
ÑÑF S
filter
ÑÑT Z
)
ÑÑZ [
{
ÖÖ 	
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
string
ÜÜ 
.
ÜÜ 
IsNullOrEmpty
ÜÜ %
(
ÜÜ% &
filter
ÜÜ& ,
.
ÜÜ, -
Name
ÜÜ- 1
)
ÜÜ1 2
)
ÜÜ2 3
query
áá 
=
áá 
query
áá 
.
áá 
Where
áá #
(
áá# $
r
áá$ %
=>
áá& (
r
áá) *
.
áá* +
Name
áá+ /
.
áá/ 0
Contains
áá0 8
(
áá8 9
filter
áá9 ?
.
áá? @
Name
áá@ D
)
ááD E
)
ááE F
;
ááF G
if
ââ 
(
ââ 
!
ââ 
string
ââ 
.
ââ 
IsNullOrEmpty
ââ %
(
ââ% &
filter
ââ& ,
.
ââ, -
Search
ââ- 3
)
ââ3 4
)
ââ4 5
{
ää 
query
ãã 
=
ãã 
query
ãã 
.
ãã 
Where
ãã #
(
ãã# $
r
ãã$ %
=>
ãã& (
r
åå 
.
åå 
Name
åå 
.
åå 
Contains
åå #
(
åå# $
filter
åå$ *
.
åå* +
Search
åå+ 1
)
åå1 2
)
çç 
;
çç 
}
éé 
return
êê 
query
êê 
;
êê 
}
ëë 	
private
ìì 

IQueryable
ìì 
<
ìì 
Role
ìì 
>
ìì  
ApplySorting
ìì! -
(
ìì- .

IQueryable
ìì. 8
<
ìì8 9
Role
ìì9 =
>
ìì= >
query
ìì? D
,
ììD E
string
ììF L
?
ììL M
sortBy
ììN T
,
ììT U
string
ììV \
?
ìì\ ]
sortDirection
ìì^ k
)
ììk l
{
îî 	
if
ïï 
(
ïï 
string
ïï 
.
ïï 
IsNullOrEmpty
ïï $
(
ïï$ %
sortBy
ïï% +
)
ïï+ ,
)
ïï, -
return
ññ 
query
ññ 
.
ññ 
OrderBy
ññ $
(
ññ$ %
r
ññ% &
=>
ññ' )
r
ññ* +
.
ññ+ ,
Name
ññ, 0
)
ññ0 1
;
ññ1 2
var
òò 
isDescending
òò 
=
òò 
sortDirection
òò ,
?
òò, -
.
òò- .
ToLower
òò. 5
(
òò5 6
)
òò6 7
==
òò8 :
$str
òò; A
;
òòA B
return
öö 
sortBy
öö 
.
öö 
ToLower
öö !
(
öö! "
)
öö" #
switch
öö$ *
{
õõ 
$str
úú 
=>
úú 
isDescending
úú &
?
úú' (
query
úú) .
.
úú. /
OrderByDescending
úú/ @
(
úú@ A
r
úúA B
=>
úúC E
r
úúF G
.
úúG H
Name
úúH L
)
úúL M
:
ùù' (
query
ùù) .
.
ùù. /
OrderBy
ùù/ 6
(
ùù6 7
r
ùù7 8
=>
ùù9 ;
r
ùù< =
.
ùù= >
Name
ùù> B
)
ùùB C
,
ùùC D
_
ûû 
=>
ûû 
query
ûû 
.
ûû 
OrderBy
ûû "
(
ûû" #
r
ûû# $
=>
ûû% '
r
ûû( )
.
ûû) *
Name
ûû* .
)
ûû. /
}
üü 
;
üü 
}
†† 	
public
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
Role
¢¢ 
[
¢¢ 
]
¢¢  
>
¢¢  !
SearchAsync
¢¢" -
(
¢¢- .
string
¢¢. 4

searchTerm
¢¢5 ?
)
¢¢? @
{
££ 	
if
§§ 
(
§§ 
string
§§ 
.
§§ 
IsNullOrEmpty
§§ $
(
§§$ %

searchTerm
§§% /
)
§§/ 0
)
§§0 1
return
•• 
await
•• 
_roleManager
•• )
.
••) *
Roles
••* /
.
¶¶ 
OrderBy
¶¶ 
(
¶¶ 
r
¶¶ 
=>
¶¶ !
r
¶¶" #
.
¶¶# $
Name
¶¶$ (
)
¶¶( )
.
ßß 
ToArrayAsync
ßß !
(
ßß! "
)
ßß" #
;
ßß# $
return
©© 
await
©© 
_roleManager
©© %
.
©©% &
Roles
©©& +
.
™™ 
Where
™™ 
(
™™ 
r
™™ 
=>
™™ 
r
™™ 
.
™™ 
Name
™™ "
.
™™" #
ToLower
™™# *
(
™™* +
)
™™+ ,
.
™™, -
Contains
™™- 5
(
™™5 6

searchTerm
™™6 @
.
™™@ A
ToLower
™™A H
(
™™H I
)
™™I J
)
™™J K
)
™™K L
.
´´ 
OrderBy
´´ 
(
´´ 
r
´´ 
=>
´´ 
r
´´ 
.
´´  
Name
´´  $
)
´´$ %
.
¨¨ 
ToArrayAsync
¨¨ 
(
¨¨ 
)
¨¨ 
;
¨¨  
}
≠≠ 	
public
ØØ 
Task
ØØ 
<
ØØ 
Role
ØØ 
>
ØØ 
GetByIdAsync
ØØ &
(
ØØ& '
int
ØØ' *
id
ØØ+ -
)
ØØ- .
{
∞∞ 	
throw
±± 
new
±± %
NotImplementedException
±± -
(
±±- .
)
±±. /
;
±±/ 0
}
≤≤ 	
Task
¥¥  
IGenericRepository
¥¥ 
<
¥¥  
Role
¥¥  $
>
¥¥$ %
.
¥¥% &
UpdateAsync
¥¥& 1
(
¥¥1 2
Role
¥¥2 6
entity
¥¥7 =
)
¥¥= >
{
µµ 	
return
∂∂ 
UpdateAsync
∂∂ 
(
∂∂ 
entity
∂∂ %
)
∂∂% &
;
∂∂& '
}
∑∑ 	
public
ππ 
Task
ππ 
DeleteAsync
ππ 
(
ππ  
int
ππ  #
id
ππ$ &
)
ππ& '
{
∫∫ 	
throw
ªª 
new
ªª %
NotImplementedException
ªª -
(
ªª- .
)
ªª. /
;
ªª/ 0
}
ºº 	
}
ΩΩ 
}ææ ø
h/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/Service/AccessRightService.cs
	namespace 	
Infrastructure
 
. 
Repositories %
.% &
Service& -
;- .
public 
class 
AccessRightService 
:  !
IAccessRightService" 5
{		 
private

 
readonly

 
AppDbContext

 !
_ctx

" &
;

& '
public 

AccessRightService 
( 
AppDbContext *
ctx+ .
). /
=>0 2
_ctx3 7
=8 9
ctx: =
;= >
public 

async 
Task 

GrantAsync  
(  !
string! '
userId( .
,. /
int0 3

documentId4 >
,> ?
bool@ D
readE I
,I J
boolK O
writeP U
,U V
boolW [
delete\ b
)b c
{ 
Console 
. 
	WriteLine 
( 
$str c
)c d
;d e
var 
existing 
= 
await 
_ctx !
.! "
AccessRights" .
. 
FirstOrDefaultAsync  
(  !
r! "
=># %
r& '
.' (
UserId( .
==/ 1
userId2 8
&&9 ;
r< =
.= >

DocumentId> H
==I K

documentIdL V
)V W
;W X
if 

( 
existing 
== 
null 
) 
{ 	
existing 
= 
new 
AccessRight &
{ 
UserId 
= 
userId 
,  

DocumentId 
= 

documentId '
,' (
CanRead 
= 
read 
, 
	CanCreate 
= 
write !
,! "
	CanUpdate 
= 
write !
,! "
	CanDelete 
= 
delete "
} 
; 
await 
_ctx 
. 
AccessRights #
.# $
AddAsync$ ,
(, -
existing- 5
)5 6
;6 7
} 	
else 
{   	
existing!! 
.!! 
CanRead!! 
|=!! 
read!!  $
;!!$ %
existing"" 
."" 
	CanCreate"" 
|="" !
write""" '
;""' (
existing## 
.## 
	CanUpdate## 
|=## !
write##" '
;##' (
existing$$ 
.$$ 
	CanDelete$$ 
|=$$ !
delete$$" (
;$$( )
}%% 	
await&& 
_ctx&& 
.&& 
SaveChangesAsync&& #
(&&# $
)&&$ %
;&&% &
}'' 
}(( ÒF
k/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/Service/DocumentAccessService.cs
	namespace 	
Infrastructure
 
. 
Repositories %
.% &
Service& -
{ 
public 

class !
DocumentAccessService &
:' ("
IDocumentAccessService) ?
{ 
private 
readonly 
IMemoryCache %
_cache& ,
;, -
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IGenericRepository +
<+ ,
AccessRequest, 9
>9 :$
_accessRequestRepository; S
;S T
public !
DocumentAccessService $
($ %
IMemoryCache% 1
cache2 7
,7 8
IConfiguration9 G
configurationH U
,U V
IGenericRepository# 5
<5 6
AccessRequest6 C
>C D#
accessRequestRepositoryE \
)\ ]
{ 	
_cache 
= 
cache 
; 
_configuration 
= 
configuration *
;* +$
_accessRequestRepository $
=% &#
accessRequestRepository' >
;> ?
} 	
public 
async 
Task 
< 
string  
>  !
GenerateAccessLink" 4
(4 5
int5 8

documentId9 C
,C D
stringE K
userIdL R
,R S
TimeSpan3 ;
validityDuration< L
,L M
bool3 7
canRead8 ?
,? @
boolA E
	canUpdateF O
,O P
boolQ U
	canDeleteV _
)3 4
{ 	
var!! 
token!! 
=!! 
GenerateSecureToken!! +
(!!+ ,
)!!, -
;!!- .
var"" 
	expiresAt"" 
="" 
DateTime"" $
.""$ %
UtcNow""% +
.""+ ,
Add"", /
(""/ 0
validityDuration""0 @
)""@ A
;""A B
var$$ 

accessLink$$ 
=$$ 
new$$  
DocumentAccessLink$$! 3
{%% 
Token&& 
=&& 
token&& 
,&& 

DocumentId'' 
='' 

documentId'' '
,''' (
UserId(( 
=(( 
userId(( 
,((  
	ExpiresAt)) 
=)) 
	expiresAt)) %
,))% &
CanRead** 
=** 
canRead** !
,**! "
	CanUpdate++ 
=++ 
	canUpdate++ %
,++% &
	CanDelete,, 
=,, 
	canDelete,, %
,,,% &
	CreatedAt-- 
=-- 
DateTime-- $
.--$ %
UtcNow--% +
,--+ ,
}// 
;// 
var22 
cacheKey22 
=22 
$"22 
$str22 (
{22( )
token22) .
}22. /
"22/ 0
;220 1
_cache33 
.33 
Set33 
(33 
cacheKey33 
,33  

accessLink33! +
,33+ ,
	expiresAt33- 6
)336 7
;337 8
await77 #
LogAccessLinkGeneration77 )
(77) *

documentId77* 4
,774 5
userId776 <
,77< =
token77> C
,77C D
	expiresAt77E N
,77N O
canRead88( /
,88/ 0
	canUpdate881 :
,88: ;
	canDelete88< E
)88E F
;88F G
var== 
baseUrl== 
=== 
_configuration== (
[==( )
$str==) >
]==> ?
??==@ B
$str==C j
;==j k
return?? 
$"?? 
{?? 
baseUrl?? 
}?? 
$str?? 
{??  
token??  %
}??% &
"??& '
;??' (
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
DocumentAccessLinkBB ,
?BB, -
>BB- .
ValidateAccessLinkBB/ A
(BBA B
stringBBB H
tokenBBI N
)BBN O
{CC 	
varDD 
cacheKeyDD 
=DD 
$"DD 
$strDD (
{DD( )
tokenDD) .
}DD. /
"DD/ 0
;DD0 1
ifFF 
(FF 
_cacheFF 
.FF 
TryGetValueFF "
(FF" #
cacheKeyFF# +
,FF+ ,
outFF- 0
DocumentAccessLinkFF1 C

accessLinkFFD N
)FFN O
)FFO P
{GG 
ifII 
(II 

accessLinkII 
.II 
	ExpiresAtII (
<II) *
DateTimeII+ 3
.II3 4
UtcNowII4 :
)II: ;
{JJ 
_cacheKK 
.KK 
RemoveKK !
(KK! "
cacheKeyKK" *
)KK* +
;KK+ ,
returnLL 
nullLL 
;LL  
}MM 
returnNN 

accessLinkNN !
;NN! "
}OO 
returnPP 
nullPP 
;PP 
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
boolSS 
>SS 
HasPermissionSS  -
(SS- .
stringSS. 4
tokenSS5 :
,SS: ;
stringSS< B
requiredPermissionSSC U
)SSU V
{TT 	
varUU 

accessLinkUU 
=UU 
awaitUU "
ValidateAccessLinkUU# 5
(UU5 6
tokenUU6 ;
)UU; <
;UU< =
ifVV 
(VV 

accessLinkVV 
==VV 
nullVV "
)VV" #
returnVV$ *
falseVV+ 0
;VV0 1
returnXX 
requiredPermissionXX %
.XX% &
ToLowerXX& -
(XX- .
)XX. /
switchXX0 6
{YY 
$strZZ 
=>ZZ 

accessLinkZZ $
.ZZ$ %
CanReadZZ% ,
,ZZ, -
$str[[ 
=>[[ 

accessLink[[ &
.[[& '
	CanUpdate[[' 0
,[[0 1
$str\\ 
=>\\ 

accessLink\\ &
.\\& '
	CanDelete\\' 0
,\\0 1
_]] 
=>]] 
false]] 
}^^ 
;^^ 
}__ 	
publicaa 
asyncaa 
Taskaa 
RevokeAccessLinkaa *
(aa* +
stringaa+ 1
tokenaa2 7
)aa7 8
{bb 	
varcc 
cacheKeycc 
=cc 
$"cc 
$strcc (
{cc( )
tokencc) .
}cc. /
"cc/ 0
;cc0 1
_cachedd 
.dd 
Removedd 
(dd 
cacheKeydd "
)dd" #
;dd# $
awaitgg "
UpdateAccessLinkStatusgg (
(gg( )
tokengg) .
,gg. /
$strgg0 9
)gg9 :
;gg: ;
}hh 	
privatejj 
stringjj 
GenerateSecureTokenjj *
(jj* +
)jj+ ,
{kk 	
usingll 
varll 
rngll 
=ll !
RandomNumberGeneratorll 1
.ll1 2
Createll2 8
(ll8 9
)ll9 :
;ll: ;
varmm 
	tokenDatamm 
=mm 
newmm 
bytemm  $
[mm$ %
$nummm% '
]mm' (
;mm( )
rngnn 
.nn 
GetBytesnn 
(nn 
	tokenDatann "
)nn" #
;nn# $
returnoo 
Convertoo 
.oo 
ToBase64Stringoo )
(oo) *
	tokenDataoo* 3
)oo3 4
.pp 
Replacepp !
(pp! "
$strpp" %
,pp% &
$strpp' *
)pp* +
.qq 
Replaceqq !
(qq! "
$strqq" %
,qq% &
$strqq' *
)qq* +
.rr 
Replacerr !
(rr! "
$strrr" %
,rr% &
$strrr' )
)rr) *
;rr* +
}ss 	
privateuu 
asyncuu 
Taskuu #
LogAccessLinkGenerationuu 2
(uu2 3
intuu3 6

documentIduu7 A
,uuA B
stringuuC I
userIduuJ P
,uuP Q
stringuuR X
tokenuuY ^
,uu^ _
DateTimevv1 9
	expiresAtvv: C
,vvC D
boolvvE I
canReadvvJ Q
,vvQ R
boolww1 5
	canUpdateww6 ?
,ww? @
boolwwA E
	canDeletewwF O
)wwO P
{xx 	
}{{ 	
private}} 
async}} 
Task}} "
UpdateAccessLinkStatus}} 1
(}}1 2
string}}2 8
token}}9 >
,}}> ?
string}}@ F
status}}G M
)}}M N
{~~ 	
}
ÄÄ 	
}
ÅÅ 
}ÇÇ Ì
b/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/Service/EmailService.cs
	namespace 	
Infrastructure
 
. 
Repositories %
.% &
Service& -
{ 
public		 

class		 
EmailService		 
:		 
IEmailService		  -
{

 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
EmailService 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
_configuration 
= 
configuration *
;* +
} 	
}22 
}33 ¿
f/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/Service/OllamaRagService.cs
	namespace 	
Core
 
. 
Services 
{ 
public 

class 
OllamaRagService !
:" #
IRagService$ /
{ 
private 
readonly 
Kernel 
_kernel  '
;' (
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly +
ITextEmbeddingGenerationService 8
_embeddingService9 J
;J K
private 
const 
string 
CollectionName +
=, -
$str. ?
;? @
private 
const 
int 
	ChunkSize #
=$ %
$num& *
;* +
private 
const 
int 
ChunkOverlap &
=' (
$num) ,
;, -
public 
Task 
< 
string 
> 

QueryAsync &
(& '
string' -
question. 6
,6 7
string8 >
?> ?
context@ G
=H I
nullJ N
)N O
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
public!! 
Task!! 
IndexDocumentAsync!! &
(!!& '
int!!' *

documentId!!+ 5
,!!5 6
string!!7 =
content!!> E
,!!E F
string!!G M
metadata!!N V
)!!V W
{"" 	
throw## 
new## #
NotImplementedException## -
(##- .
)##. /
;##/ 0
}$$ 	
public&& 
Task&& 
<&& 
List&& 
<&& 
DocumentChunk&& &
>&&& '
>&&' ('
RetrieveRelevantChunksAsync&&) D
(&&D E
string&&E K
query&&L Q
,&&Q R
int&&S V
topK&&W [
=&&\ ]
$num&&^ _
)&&_ `
{'' 	
throw(( 
new(( #
NotImplementedException(( -
(((- .
)((. /
;((/ 0
})) 	
public++ 
Task++ 
<++ 
bool++ 
>++ (
RemoveDocumentFromIndexAsync++ 6
(++6 7
int++7 :

documentId++; E
)++E F
{,, 	
throw-- 
new-- #
NotImplementedException-- -
(--- .
)--. /
;--/ 0
}.. 	
}
∆∆ 
}…… ÓJ
X/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/UnitOfWork.cs
	namespace		 	
Infrastructure		
 
.		 
Repositories		 %
;		% &
public 
class 

UnitOfWork 
: 
IUnitOfWork %
{ 
private 
readonly 
AppDbContext !
_context" *
;* +
private 
readonly 
UserManager  
<  !
AppUser! (
>( )
_userManager* 6
;6 7
public 

IAuth 
Auth 
{ 
get 
; 
} 
public 
#
INotificationRepository ""
NotificationRepository# 9
{: ;
get< ?
;? @
}A B
public 
$
IAccessRequestRepository ##
AccessRequestRepository$ ;
{< =
get> A
;A B
}C D
public 
!
IDocRequestRepository   
DocRequestRepository! 5
{6 7
get8 ;
;; <
}= >
public 

	IDocument 
DocumentRepository '
{( )
get* -
;- .
}/ 0
public 

IFolderRepository 
FolderRepository -
{. /
get0 3
;3 4
}5 6
public 

IHomeRepository 
HomeRepository )
{* +
get, /
;/ 0
}1 2
public 

IMessageRepository 
MessageRepository /
{0 1
get2 5
;5 6
}7 8
public 

ICurrentUserService 
CurrentUserService 1
{2 3
get4 7
;7 8
}9 :
public 

IUserRepository 
UserRepository )
{* +
get, /
;/ 0
}1 2
private 
readonly 
IGenerateToken #
token$ )
;) *
public 
!
IDepartmentRepository   
DepartmentRepository! 5
{6 7
get8 ;
;; <
}= >
public 
"
IPermissionsRepository !!
PermissionsRepository" 7
{8 9
get: =
;= >
}? @
public 

IRoleRepository 
RoleRepository )
{* +
get, /
;/ 0
}1 2
private 
readonly 
RoleManager  
<  !
Role! %
>% &
_roleManager' 3
;3 4
public!! 
"
IDocumentAccessService!! !!
DocumentAccessService!!" 7
{!!8 9
get!!: =
;!!= >
}!!? @
public## 

UserManager## 
<## 
AppUser## 
>## 
UserManager##  +
=>##, .
_userManager##/ ;
;##; <
public$$ 

RoleManager$$ 
<$$ 
Role$$ 
>$$ 
RoleManager$$ (
=>$$) +
_roleManager$$, 8
;$$8 9
public&& 


UnitOfWork&& 
(&& "
IDocumentAccessService'' !
documentAccessService'' 4
,''4 5
RoleManager(( 
<(( 
Role(( 
>(( 
roleManager(( %
,((% &
IAuth)) 
auth)) 
,)) 
AppDbContext** 
context** 
,** !
IDepartmentRepository++  
departmentRepository++ 2
,++2 3
IFolderRepository-- 
folderRepository-- *
,--* +
UserManager.. 
<.. 
AppUser.. 
>.. 
userManager.. (
,..( )"
IPermissionsRepository// !
permissionsRepository// 4
,//4 5
IRoleRepository00 
roleRepository00 &
,00& '
IHomeRepository11 
homeRepository11 &
,11& '$
IAccessRequestRepository22  #
accessRequestRepository22! 8
,228 9
	IDocument33 
documentRepository33 $
,33$ %
IUserRepository44 
userRepository44 &
,44& '!
IDocRequestRepository55  
docRequestRepository55 2
,552 3#
INotificationRepository66 "
notificationRepository66  6
,666 7
ICurrentUserService77 
currentUserService77 .
,77. /
IGenerateToken88 
token88 
)<< 	
{== "
NotificationRepository>> 
=>>  "
notificationRepository>>! 7
??>>8 :
throw>>; @
new>>A D!
ArgumentNullException>>E Z
(>>Z [
nameof>>[ a
(>>a b"
notificationRepository>>b x
)>>x y
)>>y z
;>>z {
_roleManager?? 
=?? 
roleManager?? "
;??" #
_context@@ 
=@@ 
context@@ 
;@@ 
_userManagerAA 
=AA 
userManagerAA "
;AA" #
DocumentRepositoryBB 
=BB 
documentRepositoryBB /
??BB0 2
throwBB3 8
newBB9 <!
ArgumentNullExceptionBB= R
(BBR S
nameofBBS Y
(BBY Z
documentRepositoryBBZ l
)BBl m
)BBm n
;BBn o 
DepartmentRepositoryCC 
=CC  
departmentRepositoryCC 3
??CC4 6
throwCC7 <
newCC= @!
ArgumentNullExceptionCCA V
(CCV W
nameofCCW ]
(CC] ^ 
departmentRepositoryCC^ r
)CCr s
)CCs t
;CCt u
FolderRepositoryDD 
=DD 
folderRepositoryDD +
??DD, .
throwDD/ 4
newDD5 8!
ArgumentNullExceptionDD9 N
(DDN O
nameofDDO U
(DDU V
folderRepositoryDDV f
)DDf g
)DDg h
;DDh i
RoleRepositoryEE 
=EE 
roleRepositoryEE '
??EE( *
throwEE+ 0
newEE1 4!
ArgumentNullExceptionEE5 J
(EEJ K
nameofEEK Q
(EEQ R
roleRepositoryEER `
)EE` a
)EEa b
;EEb c
UserRepositoryFF 
=FF 
userRepositoryFF '
??FF( *
throwFF+ 0
newFF1 4!
ArgumentNullExceptionFF5 J
(FFJ K
nameofFFK Q
(FFQ R
userRepositoryFFR `
)FF` a
)FFa b
;FFb c!
PermissionsRepositoryGG 
=GG !
permissionsRepositoryGG  5
??GG6 8
throwGG9 >
newGG? B!
ArgumentNullExceptionGGC X
(GGX Y
nameofGGY _
(GG_ `!
permissionsRepositoryGG` u
)GGu v
)GGv w
;GGw x
AuthHH 
=HH 
authHH 
??HH 
throwHH 
newHH  !
ArgumentNullExceptionHH! 6
(HH6 7
nameofHH7 =
(HH= >
authHH> B
)HHB C
)HHC D
;HHD E
HomeRepositoryII 
=II 
homeRepositoryII '
??II( *
throwII+ 0
newII1 4!
ArgumentNullExceptionII5 J
(IIJ K
nameofIIK Q
(IIQ R
homeRepositoryIIR `
)II` a
)IIa b
;IIb c 
DocRequestRepositoryJJ 
=JJ  
docRequestRepositoryJJ 3
??JJ4 6
throwJJ7 <
newJJ= @!
ArgumentNullExceptionJJA V
(JJV W
nameofJJW ]
(JJ] ^ 
docRequestRepositoryJJ^ r
)JJr s
)JJs t
;JJt u#
AccessRequestRepositoryKK 
=KK  !#
accessRequestRepositoryKK" 9
??KK: <
throwKK= B
newKKC F!
ArgumentNullExceptionKKG \
(KK\ ]
nameofKK] c
(KKc d#
accessRequestRepositoryKKd {
)KK{ |
)KK| }
;KK} ~
thisLL 
.LL 
tokenLL 
=LL 
tokenLL 
;LL 
CurrentUserServiceMM 
=MM 
currentUserServiceMM /
??MM0 2
throwMM3 8
newMM9 <!
ArgumentNullExceptionMM= R
(MMR S
nameofMMS Y
(MMY Z
currentUserServiceMMZ l
)MMl m
)MMm n
;MMn o!
DocumentAccessServiceNN 
=NN !
documentAccessServiceNN  5
??NN6 8
throwNN9 >
newNN? B!
ArgumentNullExceptionNNC X
(NNX Y
nameofNNY _
(NN_ `!
documentAccessServiceNN` u
)NNu v
)NNv w
;NNw x
}OO 
publicQQ 

asyncQQ 
TaskQQ 
<QQ 
intQQ 
>QQ 
SaveChangesAsyncQQ +
(QQ+ ,
)QQ, -
{RR 
trySS 
{TT 	
returnUU 
awaitUU 
_contextUU !
.UU! "
SaveChangesAsyncUU" 2
(UU2 3
)UU3 4
;UU4 5
}VV 	
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW 
{XX 	
ConsoleYY 
.YY 
	WriteLineYY 
(YY 
$"YY  
$strYY  6
{YY6 7
exYY7 9
.YY9 :
MessageYY: A
}YYA B
"YYB C
)YYC D
;YYD E
throwZZ 
;ZZ 
}[[ 	
}\\ 
}]] È“
\/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Repositories/UserRepository.cs
	namespace

 	
Infrastructure


 
.

 
Repositories

 %
{ 
public 

class 
UserRepository 
:  !
GenericRepository" 3
<3 4
AppUser4 ;
>; <
,< =
IUserRepository> M
{ 
private 
readonly 
AppDbContext %
_context& .
;. /
private 
readonly 
RoleManager $
<$ %
Role% )
>) *
_roleManager+ 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
UserManager $
<$ %
AppUser% ,
>, -
_userManager. :
;: ;
public 
UserRepository 
( 
AppDbContext *
context+ 2
,2 3
UserManager4 ?
<? @
AppUser@ G
>G H
userManagerI T
,T U
IMapperV ]
mapper^ d
)d e
:f g
baseh l
(l m
contextm t
)t u
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
_userManager 
= 
userManager &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
userManagerQ \
)\ ]
)] ^
;^ _
_mapper 
= 
mapper 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
mapperG M
)M N
)N O
;O P
} 	
public 
async 
Task 
< 
AppUser !
>! "
AddAsync# +
(+ ,
AppUser, 3
user4 8
)8 9
{ 	
if 
( 
user 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
user7 ;
); <
)< =
;= >
user 
. 
	CreatedAt 
= 
DateTime %
.% &
UtcNow& ,
;, -
user   
.   
	UpdatedAt   
=   
DateTime   %
.  % &
UtcNow  & ,
;  , -
var## 
result## 
=## 
await## 
_userManager## +
.##+ ,
CreateAsync##, 7
(##7 8
user##8 <
)##< =
;##= >
return$$ 
result$$ 
.$$ 
	Succeeded$$ #
?$$$ %
user$$& *
:$$+ ,
null$$- 1
;$$1 2
}%% 	
public'' 
async'' 
Task'' 
DeleteAsync'' %
(''% &
string''& ,
id''- /
)''/ 0
{(( 	
var)) 
user)) 
=)) 
await)) 
_context)) %
.))% &
Users))& +
.))+ ,
	FindAsync)), 5
())5 6
id))6 8
)))8 9
;))9 :
if** 
(** 
user** 
==** 
null** 
)** 
throw++ 
new++ 
ArgumentException++ +
(+++ ,
$"++, .
$str++. ;
{++; <
id++< >
}++> ?
$str++? I
"++I J
)++J K
;++K L
_context-- 
.-- 
Users-- 
.-- 
Remove-- !
(--! "
user--" &
)--& '
;--' (
}.. 	
public00 
async00 
Task00 
<00 
IReadOnlyList00 '
<00' (
AppUser00( /
>00/ 0
>000 1
GetAllAsync002 =
(00= >
)00> ?
{11 	
return22 
await22 
_context22 !
.22! "
Users22" '
.33 
Include33 
(33 
u33 
=>33 
u33 
.33  

Department33  *
)33* +
.55 
ToListAsync55 
(55 
)55 
;55 
}66 	
public99 
async99 
Task99 
<99 
AppUser99 !
?99! "
>99" #
GetByIdAsync99$ 0
(990 1
string991 7
id998 :
)99: ;
{:: 	
var>> 
user>> 
=>> 
await>> 
_context>> %
.>>% &
Users>>& +
.>>+ ,
Include>>, 3
(>>3 4
u>>4 5
=>>>6 8
u>>9 :
.>>: ;

Department>>; E
)>>E F
.@@ 
FirstOrDefaultAsync@@ $
(@@$ %
u@@% &
=>@@' )
u@@* +
.@@+ ,
Id@@, .
==@@/ 1
id@@2 4
)@@4 5
;@@5 6
returnCC 
userCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
UserDtoFF !
?FF! "
>FF" #
UpdateAsyncFF$ /
(FF/ 0
UserDtoFF0 7
userDtoFF8 ?
)FF? @
{GG 	
ConsoleHH 
.HH 
	WriteLineHH 
(HH 
$strHH \
)HH\ ]
;HH] ^
ifJJ 
(JJ 
userDtoJJ 
==JJ 
nullJJ 
)JJ  
throwKK 
newKK !
ArgumentNullExceptionKK /
(KK/ 0
nameofKK0 6
(KK6 7
userDtoKK7 >
)KK> ?
)KK? @
;KK@ A
varMM 
existingUserMM 
=MM 
awaitMM $
_contextMM% -
.MM- .
UsersMM. 3
.MM3 4
	FindAsyncMM4 =
(MM= >
userDtoMM> E
.MME F
IdMMF H
)MMH I
;MMI J
ifNN 
(NN 
existingUserNN 
==NN 
nullNN  $
)NN$ %
{OO 
throwPP 
newPP 
ArgumentExceptionPP +
(PP+ ,
$"PP, .
$strPP. ;
{PP; <
userDtoPP< C
.PPC D
IdPPD F
}PPF G
$strPPG Q
"PPQ R
)PPR S
;PPS T
}QQ 
ConsoleRR 
.RR 
	WriteLineRR 
(RR 
$strRR \
)RR\ ]
;RR] ^
ConsoleSS 
.SS 
	WriteLineSS 
(SS 
userDtoSS %
.SS% &
RoleIdSS& ,
)SS, -
;SS- .
_mapperUU 
.UU 
MapUU 
(UU 
userDtoUU 
,UU  
existingUserUU! -
)UU- .
;UU. /
existingUserWW 
.WW 
	UpdatedAtWW "
=WW# $
DateTimeWW% -
.WW- .
UtcNowWW. 4
;WW4 5
ifZZ 
(ZZ 
userDtoZZ 
.ZZ 
RoleIdZZ 
!=ZZ !
nullZZ" &
)ZZ& '
{[[ 
var\\ 
currentRoles\\  
=\\! "
await\\# (
_userManager\\) 5
.\\5 6
GetRolesAsync\\6 C
(\\C D
existingUser\\D P
)\\P Q
;\\Q R
if]] 
(]] 
currentRoles]]  
.]]  !
Any]]! $
(]]$ %
)]]% &
)]]& '
{^^ 
await__ 
_userManager__ &
.__& ' 
RemoveFromRolesAsync__' ;
(__; <
existingUser__< H
,__H I
currentRoles__J V
)__V W
;__W X
}`` 
awaitaa 
_userManageraa "
.aa" #
AddToRoleAsyncaa# 1
(aa1 2
existingUseraa2 >
,aa> ?
userDtoaa@ G
.aaG H
RoleIdaaH N
.aaN O
ToStringaaO W
(aaW X
)aaX Y
)aaY Z
;aaZ [
}bb 
_contextdd 
.dd 
Usersdd 
.dd 
Updatedd !
(dd! "
existingUserdd" .
)dd. /
;dd/ 0
returnff 
_mapperff 
.ff 
Mapff 
<ff 
UserDtoff &
>ff& '
(ff' (
existingUserff( 4
)ff4 5
;ff5 6
}gg 	
publicjj 
asyncjj 
Taskjj 
<jj 
AppUserjj !
?jj! "
>jj" #
GetByUserNameAsyncjj$ 6
(jj6 7
stringjj7 =
userNamejj> F
)jjF G
{kk 	
returnll 
awaitll 
_contextll !
.ll! "
Usersll" '
.mm 
Includemm 
(mm 
umm 
=>mm 
umm 
.mm  

Departmentmm  *
)mm* +
.oo 
FirstOrDefaultAsyncoo $
(oo$ %
uoo% &
=>oo' )
uoo* +
.oo+ ,
UserNameoo, 4
==oo5 7
userNameoo8 @
)oo@ A
;ooA B
}pp 	
publicrr 
asyncrr 
Taskrr 
<rr 
IReadOnlyListrr '
<rr' (
AppUserrr( /
>rr/ 0
>rr0 1 
GetByDepartmentAsyncrr2 F
(rrF G
intrrG J
departmentIdrrK W
)rrW X
{ss 	
returntt 
awaittt 
_contexttt !
.tt! "
Userstt" '
.uu 
Includeuu 
(uu 
uuu 
=>uu 
uuu 
.uu  

Departmentuu  *
)uu* +
.ww 
Whereww 
(ww 
uww 
=>ww 
uww 
.ww 
DepartmentIdww *
==ww+ -
departmentIdww. :
)ww: ;
.yy 
ToListAsyncyy 
(yy 
)yy 
;yy 
}zz 	
public|| 
async|| 
Task|| 
<|| 
IReadOnlyList|| '
<||' (
AppUser||( /
>||/ 0
>||0 1
GetByRoleAsync||2 @
(||@ A
int||A D
roleId||E K
)||K L
{}} 	
return~~ 
await~~ 
_context~~ !
.~~! "
Users~~" '
. 
Include 
( 
u 
=> 
u 
.  

Department  *
)* +
.
ÉÉ 
ToListAsync
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
IReadOnlyList
ÜÜ '
<
ÜÜ' (
AppUser
ÜÜ( /
>
ÜÜ/ 0
>
ÜÜ0 1!
GetActiveUsersAsync
ÜÜ2 E
(
ÜÜE F
)
ÜÜF G
{
áá 	
return
àà 
await
àà 
_context
àà !
.
àà! "
Users
àà" '
.
ââ 
Include
ââ 
(
ââ 
u
ââ 
=>
ââ 
u
ââ 
.
ââ  

Department
ââ  *
)
ââ* +
.
ãã 
Where
ãã 
(
ãã 
u
ãã 
=>
ãã 
u
ãã 
.
ãã 
IsActive
ãã &
)
ãã& '
.
çç 
ToListAsync
çç 
(
çç 
)
çç 
;
çç 
}
éé 	
public
êê 
async
êê 
Task
êê 
<
êê 
IReadOnlyList
êê '
<
êê' (
AppUser
êê( /
>
êê/ 0
>
êê0 1#
GetInactiveUsersAsync
êê2 G
(
êêG H
)
êêH I
{
ëë 	
return
íí 
await
íí 
_context
íí !
.
íí! "
Users
íí" '
.
ìì 
Include
ìì 
(
ìì 
u
ìì 
=>
ìì 
u
ìì 
.
ìì  

Department
ìì  *
)
ìì* +
.
ïï 
Where
ïï 
(
ïï 
u
ïï 
=>
ïï 
!
ïï 
u
ïï 
.
ïï 
IsActive
ïï '
)
ïï' (
.
óó 
ToListAsync
óó 
(
óó 
)
óó 
;
óó 
}
òò 	
public
úú 
async
úú 
Task
úú 
<
úú 
bool
úú 
>
úú "
IsUserNameTakenAsync
úú  4
(
úú4 5
string
úú5 ;
userName
úú< D
,
úúD E
string
úúF L
?
úúL M
excludeUserId
úúN [
=
úú\ ]
null
úú^ b
)
úúb c
{
ùù 	
var
ûû 
query
ûû 
=
ûû 
_context
ûû  
.
ûû  !
Users
ûû! &
.
ûû& '
Where
ûû' ,
(
ûû, -
u
ûû- .
=>
ûû/ 1
u
ûû2 3
.
ûû3 4
UserName
ûû4 <
==
ûû= ?
userName
ûû@ H
)
ûûH I
;
ûûI J
if
†† 
(
†† 
excludeUserId
†† 
!=
††  
null
††! %
)
††% &
{
°° 
query
¢¢ 
=
¢¢ 
query
¢¢ 
.
¢¢ 
Where
¢¢ #
(
¢¢# $
u
¢¢$ %
=>
¢¢& (
u
¢¢) *
.
¢¢* +
Id
¢¢+ -
!=
¢¢. 0
excludeUserId
¢¢1 >
)
¢¢> ?
;
¢¢? @
}
££ 
return
¶¶ 
await
¶¶ 
query
¶¶ 
.
¶¶ 
AnyAsync
¶¶ '
(
¶¶' (
)
¶¶( )
;
¶¶) *
}
ßß 	
public
©© 
async
©© 
Task
©© 
<
©© 
int
©© 
>
©© 
GetUserCountAsync
©© 0
(
©©0 1
)
©©1 2
{
™™ 	
return
´´ 
await
´´ 
_context
´´ !
.
´´! "
Users
´´" '
.
´´' (

CountAsync
´´( 2
(
´´2 3
)
´´3 4
;
´´4 5
}
¨¨ 	
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
int
ÆÆ 
>
ÆÆ %
GetActiveUserCountAsync
ÆÆ 6
(
ÆÆ6 7
)
ÆÆ7 8
{
ØØ 	
return
∞∞ 
await
∞∞ 
_context
∞∞ !
.
∞∞! "
Users
∞∞" '
.
∞∞' (

CountAsync
∞∞( 2
(
∞∞2 3
u
∞∞3 4
=>
∞∞5 7
u
∞∞8 9
.
∞∞9 :
IsActive
∞∞: B
)
∞∞B C
;
∞∞C D
}
±± 	
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
IReadOnlyList
≥≥ '
<
≥≥' (
AppUser
≥≥( /
>
≥≥/ 0
>
≥≥0 1
SearchUsersAsync
≥≥2 B
(
≥≥B C
string
≥≥C I

searchTerm
≥≥J T
)
≥≥T U
{
¥¥ 	
return
µµ 
await
µµ 
_context
µµ !
.
µµ! "
Users
µµ" '
.
∂∂ 
Include
∂∂ 
(
∂∂ 
u
∂∂ 
=>
∂∂ 
u
∂∂ 
.
∂∂  

Department
∂∂  *
)
∂∂* +
.
∏∏ 
Where
∏∏ 
(
∏∏ 
u
∏∏ 
=>
∏∏ 
u
ππ 
.
ππ 
Email
ππ "
.
ππ" #
Contains
ππ# +
(
ππ+ ,

searchTerm
ππ, 6
)
ππ6 7
||
ππ8 :
u
∫∫ 
.
∫∫ 
UserName
∫∫ %
!
∫∫% &
.
∫∫& '
Contains
∫∫' /
(
∫∫/ 0

searchTerm
∫∫0 :
)
∫∫: ;
)
∫∫; <
.
ºº 
ToListAsync
ºº 
(
ºº 
)
ºº 
;
ºº 
}
ΩΩ 	
public
øø 
async
øø 
Task
øø !
DeactivateUserAsync
øø -
(
øø- .
string
øø. 4
userId
øø5 ;
)
øø; <
{
¿¿ 	
var
¡¡ 
user
¡¡ 
=
¡¡ 
await
¡¡ 
_context
¡¡ %
.
¡¡% &
Users
¡¡& +
.
¡¡+ ,
	FindAsync
¡¡, 5
(
¡¡5 6
userId
¡¡6 <
)
¡¡< =
;
¡¡= >
if
¬¬ 
(
¬¬ 
user
¬¬ 
!=
¬¬ 
null
¬¬ 
)
¬¬ 
{
√√ 
user
ƒƒ 
.
ƒƒ 
IsActive
ƒƒ 
=
ƒƒ 
false
ƒƒ  %
;
ƒƒ% &
user
≈≈ 
.
≈≈ 
	UpdatedAt
≈≈ 
=
≈≈  
DateTime
≈≈! )
.
≈≈) *
UtcNow
≈≈* 0
;
≈≈0 1
_context
∆∆ 
.
∆∆ 
Users
∆∆ 
.
∆∆ 
Update
∆∆ %
(
∆∆% &
user
∆∆& *
)
∆∆* +
;
∆∆+ ,
}
«« 
}
»» 	
public
   
async
   
Task
   
ActivateUserAsync
   +
(
  + ,
string
  , 2
userId
  3 9
)
  9 :
{
ÀÀ 	
var
ÃÃ 
user
ÃÃ 
=
ÃÃ 
await
ÃÃ 
_context
ÃÃ %
.
ÃÃ% &
Users
ÃÃ& +
.
ÃÃ+ ,
	FindAsync
ÃÃ, 5
(
ÃÃ5 6
userId
ÃÃ6 <
)
ÃÃ< =
;
ÃÃ= >
if
ÕÕ 
(
ÕÕ 
user
ÕÕ 
!=
ÕÕ 
null
ÕÕ 
)
ÕÕ 
{
ŒŒ 
user
œœ 
.
œœ 
IsActive
œœ 
=
œœ 
true
œœ  $
;
œœ$ %
user
–– 
.
–– 
	UpdatedAt
–– 
=
––  
DateTime
––! )
.
––) *
UtcNow
––* 0
;
––0 1
_context
—— 
.
—— 
Users
—— 
.
—— 
Update
—— %
(
——% &
user
——& *
)
——* +
;
——+ ,
}
““ 
}
”” 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
IReadOnlyList
’’ '
<
’’' (
AppUser
’’( /
>
’’/ 0
>
’’0 1$
GetUsersWithRolesAsync
’’2 H
(
’’H I
)
’’I J
{
÷÷ 	
return
◊◊ 
await
◊◊ 
_context
◊◊ !
.
◊◊! "
Users
◊◊" '
.
ÿÿ 
Include
ÿÿ 
(
ÿÿ 
u
ÿÿ 
=>
ÿÿ 
u
ÿÿ 
.
ÿÿ  

Department
ÿÿ  *
)
ÿÿ* +
.
‹‹ 
ToListAsync
‹‹ 
(
‹‹ 
)
‹‹ 
;
‹‹ 
}
›› 	
public
ﬂﬂ 
async
ﬂﬂ 
Task
ﬂﬂ 
<
ﬂﬂ 
IReadOnlyList
ﬂﬂ '
<
ﬂﬂ' (
AppUser
ﬂﬂ( /
>
ﬂﬂ/ 0
>
ﬂﬂ0 1!
GetRecentUsersAsync
ﬂﬂ2 E
(
ﬂﬂE F
int
ﬂﬂF I
count
ﬂﬂJ O
=
ﬂﬂP Q
$num
ﬂﬂR T
)
ﬂﬂT U
{
‡‡ 	
return
·· 
await
·· 
_context
·· !
.
··! "
Users
··" '
.
‚‚ 
Include
‚‚ 
(
‚‚ 
u
‚‚ 
=>
‚‚ 
u
‚‚ 
.
‚‚  

Department
‚‚  *
)
‚‚* +
.
‰‰ 
OrderByDescending
‰‰ "
(
‰‰" #
u
‰‰# $
=>
‰‰% '
u
‰‰( )
.
‰‰) *
	CreatedAt
‰‰* 3
)
‰‰3 4
.
ÂÂ 
Take
ÂÂ 
(
ÂÂ 
count
ÂÂ 
)
ÂÂ 
.
ÊÊ 
ToListAsync
ÊÊ 
(
ÊÊ 
)
ÊÊ 
;
ÊÊ 
}
ÁÁ 	
public
ÍÍ 
async
ÍÍ 
Task
ÍÍ 
<
ÍÍ 
PagedResult
ÍÍ %
<
ÍÍ% &
UserDto
ÍÍ& -
>
ÍÍ- .
>
ÍÍ. /
GetPagedAsync
ÍÍ0 =
(
ÍÍ= >
UserFilterDto
ÍÍ> K
filter
ÍÍL R
)
ÍÍR S
{
ÎÎ 	
var
ÏÏ 
query
ÏÏ 
=
ÏÏ 
_context
ÏÏ  
.
ÏÏ  !
Users
ÏÏ! &
.
ÌÌ 
Include
ÌÌ 
(
ÌÌ 
u
ÌÌ 
=>
ÌÌ 
u
ÌÌ 
.
ÌÌ  

Department
ÌÌ  *
)
ÌÌ* +
.
ÓÓ 
Include
ÓÓ 
(
ÓÓ 
u
ÓÓ 
=>
ÓÓ 
u
ÓÓ 
.
ÓÓ  
UploadedDocuments
ÓÓ  1
)
ÓÓ1 2
.
ÔÔ 
AsNoTracking
ÔÔ 
(
ÔÔ 
)
ÔÔ 
;
ÔÔ  
query
ÚÚ 
=
ÚÚ 
ApplyFilters
ÚÚ  
(
ÚÚ  !
query
ÚÚ! &
,
ÚÚ& '
filter
ÚÚ( .
)
ÚÚ. /
;
ÚÚ/ 0
var
ıı 
totalRecords
ıı 
=
ıı 
await
ıı $
query
ıı% *
.
ıı* +

CountAsync
ıı+ 5
(
ıı5 6
)
ıı6 7
;
ıı7 8
query
¯¯ 
=
¯¯ 
ApplySorting
¯¯  
(
¯¯  !
query
¯¯! &
,
¯¯& '
filter
¯¯( .
.
¯¯. /
SortBy
¯¯/ 5
,
¯¯5 6
filter
¯¯7 =
.
¯¯= >
SortDirection
¯¯> K
)
¯¯K L
;
¯¯L M
var
˚˚ 
users
˚˚ 
=
˚˚ 
await
˚˚ 
query
˚˚ #
.
¸¸ 
Skip
¸¸ 
(
¸¸ 
(
¸¸ 
filter
¸¸ 
.
¸¸ 

PageNumber
¸¸ (
-
¸¸) *
$num
¸¸+ ,
)
¸¸, -
*
¸¸. /
filter
¸¸0 6
.
¸¸6 7
PageSize
¸¸7 ?
)
¸¸? @
.
˝˝ 
Take
˝˝ 
(
˝˝ 
filter
˝˝ 
.
˝˝ 
PageSize
˝˝ %
)
˝˝% &
.
˛˛ 
ToListAsync
˛˛ 
(
˛˛ 
)
˛˛ 
;
˛˛ 
var
ÅÅ 
userDtos
ÅÅ 
=
ÅÅ 
new
ÅÅ 
List
ÅÅ #
<
ÅÅ# $
UserDto
ÅÅ$ +
>
ÅÅ+ ,
(
ÅÅ, -
)
ÅÅ- .
;
ÅÅ. /
foreach
ÉÉ 
(
ÉÉ 
var
ÉÉ 
user
ÉÉ 
in
ÉÉ  
users
ÉÉ! &
)
ÉÉ& '
{
ÑÑ 
var
ÖÖ 
roles
ÖÖ 
=
ÖÖ 
await
ÖÖ !
_userManager
ÖÖ" .
.
ÖÖ. /
GetRolesAsync
ÖÖ/ <
(
ÖÖ< =
user
ÖÖ= A
)
ÖÖA B
;
ÖÖB C
var
ÜÜ 
userDto
ÜÜ 
=
ÜÜ 
_mapper
ÜÜ %
.
ÜÜ% &
Map
ÜÜ& )
<
ÜÜ) *
UserDto
ÜÜ* 1
>
ÜÜ1 2
(
ÜÜ2 3
user
ÜÜ3 7
)
ÜÜ7 8
;
ÜÜ8 9
userDto
áá 
.
áá 
RoleName
áá  
=
áá! "
roles
áá# (
.
áá( )
FirstOrDefault
áá) 7
(
áá7 8
)
áá8 9
;
áá9 :
userDtos
àà 
.
àà 
Add
àà 
(
àà 
userDto
àà $
)
àà$ %
;
àà% &
}
ââ 
return
ãã 
userDtos
ãã 
.
ãã 
ToPagedResult
ãã )
(
ãã) *
filter
åå 
.
åå 

PageNumber
åå !
,
åå! "
filter
çç 
.
çç 
PageSize
çç 
,
çç  
totalRecords
éé 
,
éé 
filter
èè 
.
èè 
Search
èè 
,
èè 
filter
êê 
.
êê 
SortBy
êê 
,
êê 
filter
ëë 
.
ëë 
SortDirection
ëë $
)
íí 
;
íí 
}
ìì 	
public
îî 
async
îî 
Task
îî 
<
îî 
UserDto
îî !
?
îî! "
>
îî" #%
GetByIdWithDetailsAsync
îî$ ;
(
îî; <
string
îî< B
id
îîC E
)
îîE F
{
ïï 	
var
òò 
user
òò 
=
òò 
await
òò 
_context
òò %
.
òò% &
Users
òò& +
.
öö 
Include
öö 
(
öö 
u
öö 
=>
öö 
u
öö 
.
öö  

Department
öö  *
)
öö* +
.
õõ 
Include
õõ 
(
õõ 
u
õõ 
=>
õõ 
u
õõ 
.
õõ  
UploadedDocuments
õõ  1
)
õõ1 2
.
úú 
Include
úú 
(
úú 
u
úú 
=>
úú 
u
úú 
.
úú  
CreatedFolders
úú  .
)
úú. /
.
ûû !
FirstOrDefaultAsync
ûû $
(
ûû$ %
u
ûû% &
=>
ûû' )
u
ûû* +
.
ûû+ ,
Id
ûû, .
==
ûû/ 1
id
ûû2 4
)
ûû4 5
;
ûû5 6
var
†† 
userDto
†† 
=
†† 
_mapper
†† 
.
††  
Map
††  #
<
††# $
UserDto
††$ +
>
††+ ,
(
††, -
user
††- 1
)
††1 2
;
††2 3
var
°° 
role
°° 
=
°° 
await
°° 
_userManager
°° )
.
°°) *
GetRolesAsync
°°* 7
(
°°7 8
user
°°8 <
)
°°< =
;
°°= >
userDto
¢¢ 
.
¢¢ 
RoleName
¢¢ 
=
¢¢ 
role
¢¢ #
.
¢¢# $
FirstOrDefault
¢¢$ 2
(
¢¢2 3
)
¢¢3 4
;
¢¢4 5
return
££ 
userDto
££ 
;
££ 
}
§§ 	
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ 
AppUser
¶¶ !
?
¶¶! "
>
¶¶" #
GetByEmailAsync
¶¶$ 3
(
¶¶3 4
string
¶¶4 :
email
¶¶; @
)
¶¶@ A
{
ßß 	
return
®® 
await
®® 
_context
®® !
.
®®! "
Users
®®" '
.
™™ 
Include
™™ 
(
™™ 
u
™™ 
=>
™™ 
u
™™ 
.
™™  

Department
™™  *
)
™™* +
.
´´ !
FirstOrDefaultAsync
´´ $
(
´´$ %
u
´´% &
=>
´´' )
u
´´* +
.
´´+ ,
Email
´´, 1
.
´´1 2
ToLower
´´2 9
(
´´9 :
)
´´: ;
==
´´< >
email
´´? D
.
´´D E
ToLower
´´E L
(
´´L M
)
´´M N
)
´´N O
;
´´O P
}
¨¨ 	
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
IReadOnlyList
ÆÆ '
<
ÆÆ' (
AppUser
ÆÆ( /
>
ÆÆ/ 0
>
ÆÆ0 1'
GetUsersByDepartmentAsync
ÆÆ2 K
(
ÆÆK L
int
ÆÆL O
departmentId
ÆÆP \
)
ÆÆ\ ]
{
ØØ 	
return
∞∞ 
await
∞∞ 
_context
∞∞ !
.
∞∞! "
Users
∞∞" '
.
≤≤ 
Where
≤≤ 
(
≤≤ 
u
≤≤ 
=>
≤≤ 
u
≤≤ 
.
≤≤ 
DepartmentId
≤≤ *
==
≤≤+ -
departmentId
≤≤. :
)
≤≤: ;
.
≥≥ 
OrderBy
≥≥ 
(
≥≥ 
u
≥≥ 
=>
≥≥ 
u
≥≥ 
.
≥≥  
UserName
≥≥  (
)
≥≥( )
.
¥¥ 
ToListAsync
¥¥ 
(
¥¥ 
)
¥¥ 
;
¥¥ 
}
∂∂ 	
public
∏∏ 
async
∏∏ 
Task
∏∏ 
<
∏∏ 
IReadOnlyList
∏∏ '
<
∏∏' (
AppUser
∏∏( /
>
∏∏/ 0
>
∏∏0 1!
GetUsersByRoleAsync
∏∏2 E
(
∏∏E F
int
∏∏F I
roleId
∏∏J P
)
∏∏P Q
{
ππ 	
return
∫∫ 
await
∫∫ 
_context
∫∫ !
.
∫∫! "
Users
∫∫" '
.
ªª 
Include
ªª 
(
ªª 
u
ªª 
=>
ªª 
u
ªª 
.
ªª  

Department
ªª  *
)
ªª* +
.
ææ 
ToListAsync
ææ 
(
ææ 
)
ææ 
;
ææ 
}
øø 	
public
¡¡ 
Task
¡¡ 
<
¡¡ 
bool
¡¡ 
>
¡¡ 
IsEmailTakenAsync
¡¡ +
(
¡¡+ ,
string
¡¡, 2
email
¡¡3 8
,
¡¡8 9
string
¡¡: @
?
¡¡@ A
	excludeId
¡¡B K
=
¡¡L M
null
¡¡N R
)
¡¡R S
{
¬¬ 	
throw
√√ 
new
√√ %
NotImplementedException
√√ -
(
√√- .
)
√√. /
;
√√/ 0
}
ƒƒ 	
public
∆∆ 
async
∆∆ 
Task
∆∆ 
<
∆∆ 
int
∆∆ 
>
∆∆  
GetTotalCountAsync
∆∆ 1
(
∆∆1 2
)
∆∆2 3
{
«« 	
return
»» 
await
»» 
_context
»» !
.
»»! "
Users
»»" '
.
»»' (

CountAsync
»»( 2
(
»»2 3
)
»»3 4
;
»»4 5
}
…… 	
public
ÀÀ 
async
ÀÀ 
Task
ÀÀ 
<
ÀÀ 
int
ÀÀ 
>
ÀÀ !
GetActiveCountAsync
ÀÀ 2
(
ÀÀ2 3
)
ÀÀ3 4
{
ÃÃ 	
return
ÕÕ 
await
ÕÕ 
_context
ÕÕ !
.
ÕÕ! "
Users
ÕÕ" '
.
ÕÕ' (

CountAsync
ÕÕ( 2
(
ÕÕ2 3
u
ÕÕ3 4
=>
ÕÕ5 7
u
ÕÕ8 9
.
ÕÕ9 :
IsActive
ÕÕ: B
)
ÕÕB C
;
ÕÕC D
}
ŒŒ 	
public
–– 
async
–– 
Task
–– 
<
–– 
int
–– 
>
–– #
GetInactiveCountAsync
–– 4
(
––4 5
)
––5 6
{
—— 	
return
““ 
await
““ 
_context
““ !
.
““! "
Users
““" '
.
““' (

CountAsync
““( 2
(
““2 3
u
““3 4
=>
““5 7
!
““8 9
u
““9 :
.
““: ;
IsActive
““; C
)
““C D
;
““D E
}
”” 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
int
’’ 
>
’’ *
GetConfirmedEmailsCountAsync
’’ ;
(
’’; <
)
’’< =
{
÷÷ 	
return
◊◊ 
await
◊◊ 
_context
◊◊ !
.
◊◊! "
Users
◊◊" '
.
◊◊' (

CountAsync
◊◊( 2
(
◊◊2 3
u
◊◊3 4
=>
◊◊5 7
u
◊◊8 9
.
◊◊9 :
EmailConfirmed
◊◊: H
)
◊◊H I
;
◊◊I J
}
ÿÿ 	
private
›› 

IQueryable
›› 
<
›› 
AppUser
›› "
>
››" #
ApplyFilters
››$ 0
(
››0 1

IQueryable
››1 ;
<
››; <
AppUser
››< C
>
››C D
query
››E J
,
››J K
UserFilterDto
››L Y
filter
››Z `
)
››` a
{
ﬁﬁ 	
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
string
ﬂﬂ 
.
ﬂﬂ 
IsNullOrEmpty
ﬂﬂ %
(
ﬂﬂ% &
filter
ﬂﬂ& ,
.
ﬂﬂ, -
UserName
ﬂﬂ- 5
)
ﬂﬂ5 6
)
ﬂﬂ6 7
query
‡‡ 
=
‡‡ 
query
‡‡ 
.
‡‡ 
Where
‡‡ #
(
‡‡# $
u
‡‡$ %
=>
‡‡& (
u
‡‡) *
.
‡‡* +
UserName
‡‡+ 3
.
‡‡3 4
Contains
‡‡4 <
(
‡‡< =
filter
‡‡= C
.
‡‡C D
UserName
‡‡D L
)
‡‡L M
)
‡‡M N
;
‡‡N O
if
ÊÊ 
(
ÊÊ 
!
ÊÊ 
string
ÊÊ 
.
ÊÊ 
IsNullOrEmpty
ÊÊ %
(
ÊÊ% &
filter
ÊÊ& ,
.
ÊÊ, -
PhoneNumber
ÊÊ- 8
)
ÊÊ8 9
)
ÊÊ9 :
query
ÁÁ 
=
ÁÁ 
query
ÁÁ 
.
ÁÁ 
Where
ÁÁ #
(
ÁÁ# $
u
ÁÁ$ %
=>
ÁÁ& (
u
ÁÁ) *
.
ÁÁ* +
PhoneNumber
ÁÁ+ 6
.
ÁÁ6 7
Contains
ÁÁ7 ?
(
ÁÁ? @
filter
ÁÁ@ F
.
ÁÁF G
PhoneNumber
ÁÁG R
)
ÁÁR S
)
ÁÁS T
;
ÁÁT U
if
ÈÈ 
(
ÈÈ 
filter
ÈÈ 
.
ÈÈ 
IsActive
ÈÈ 
.
ÈÈ  
HasValue
ÈÈ  (
)
ÈÈ( )
query
ÍÍ 
=
ÍÍ 
query
ÍÍ 
.
ÍÍ 
Where
ÍÍ #
(
ÍÍ# $
u
ÍÍ$ %
=>
ÍÍ& (
u
ÍÍ) *
.
ÍÍ* +
IsActive
ÍÍ+ 3
==
ÍÍ4 6
filter
ÍÍ7 =
.
ÍÍ= >
IsActive
ÍÍ> F
)
ÍÍF G
;
ÍÍG H
if
ÉÉ 
(
ÉÉ 
filter
ÉÉ 
.
ÉÉ 
DepartmentId
ÉÉ #
.
ÉÉ# $
HasValue
ÉÉ$ ,
)
ÉÉ, -
query
ÑÑ 
=
ÑÑ 
query
ÑÑ 
.
ÑÑ 
Where
ÑÑ #
(
ÑÑ# $
u
ÑÑ$ %
=>
ÑÑ& (
u
ÑÑ) *
.
ÑÑ* +
DepartmentId
ÑÑ+ 7
==
ÑÑ8 :
filter
ÑÑ; A
.
ÑÑA B
DepartmentId
ÑÑB N
)
ÑÑN O
;
ÑÑO P
if
ÜÜ 
(
ÜÜ 
!
ÜÜ 
string
ÜÜ 
.
ÜÜ 
IsNullOrEmpty
ÜÜ %
(
ÜÜ% &
filter
ÜÜ& ,
.
ÜÜ, -
DepartmentName
ÜÜ- ;
)
ÜÜ; <
)
ÜÜ< =
query
áá 
=
áá 
query
áá 
.
áá 
Where
áá #
(
áá# $
u
áá$ %
=>
áá& (
u
áá) *
.
áá* +

Department
áá+ 5
.
áá5 6
Name
áá6 :
.
áá: ;
Contains
áá; C
(
ááC D
filter
ááD J
.
ááJ K
DepartmentName
ááK Y
)
ááY Z
)
ááZ [
;
áá[ \
if
∑∑ 
(
∑∑ 
!
∑∑ 
string
∑∑ 
.
∑∑ 
IsNullOrEmpty
∑∑ %
(
∑∑% &
filter
∑∑& ,
.
∑∑, -
Search
∑∑- 3
)
∑∑3 4
)
∑∑4 5
{
∏∏ 
query
ππ 
=
ππ 
query
ππ 
.
ππ 
Where
ππ #
(
ππ# $
u
ππ$ %
=>
ππ& (
u
∫∫ 
.
∫∫ 
UserName
∫∫ 
.
∫∫ 
Contains
∫∫ '
(
∫∫' (
filter
∫∫( .
.
∫∫. /
Search
∫∫/ 5
)
∫∫5 6
||
∫∫7 9
u
ªª 
.
ªª 
Email
ªª 
.
ªª 
Contains
ªª $
(
ªª$ %
filter
ªª% +
.
ªª+ ,
Search
ªª, 2
)
ªª2 3
||
ªª4 6
u
ΩΩ 
.
ΩΩ 
PhoneNumber
ΩΩ !
.
ΩΩ! "
Contains
ΩΩ" *
(
ΩΩ* +
filter
ΩΩ+ 1
.
ΩΩ1 2
Search
ΩΩ2 8
)
ΩΩ8 9
)
ææ 
;
ææ 
}
øø 
return
¡¡ 
query
¡¡ 
;
¡¡ 
}
¬¬ 	
private
ƒƒ 

IQueryable
ƒƒ 
<
ƒƒ 
AppUser
ƒƒ "
>
ƒƒ" #
ApplySorting
ƒƒ$ 0
(
ƒƒ0 1

IQueryable
ƒƒ1 ;
<
ƒƒ; <
AppUser
ƒƒ< C
>
ƒƒC D
query
ƒƒE J
,
ƒƒJ K
string
ƒƒL R
?
ƒƒR S
sortBy
ƒƒT Z
,
ƒƒZ [
string
ƒƒ\ b
?
ƒƒb c
sortDirection
ƒƒd q
)
ƒƒq r
{
≈≈ 	
if
∆∆ 
(
∆∆ 
string
∆∆ 
.
∆∆ 
IsNullOrEmpty
∆∆ $
(
∆∆$ %
sortBy
∆∆% +
)
∆∆+ ,
)
∆∆, -
return
«« 
query
«« 
.
«« 
OrderBy
«« $
(
««$ %
u
««% &
=>
««' )
u
««* +
.
««+ ,
	CreatedAt
««, 5
)
««5 6
;
««6 7
var
…… 
isDescending
…… 
=
…… 
sortDirection
…… ,
?
……, -
.
……- .
ToLower
……. 5
(
……5 6
)
……6 7
==
……8 :
$str
……; A
;
……A B
return
ÀÀ 
sortBy
ÀÀ 
.
ÀÀ 
ToLower
ÀÀ !
(
ÀÀ! "
)
ÀÀ" #
switch
ÀÀ$ *
{
ÃÃ 
$str
ÕÕ 
=>
ÕÕ 
isDescending
ÕÕ *
?
ÕÕ+ ,
query
ÕÕ- 2
.
ÕÕ2 3
OrderByDescending
ÕÕ3 D
(
ÕÕD E
u
ÕÕE F
=>
ÕÕG I
u
ÕÕJ K
.
ÕÕK L
UserName
ÕÕL T
)
ÕÕT U
:
ŒŒ+ ,
query
ŒŒ- 2
.
ŒŒ2 3
OrderBy
ŒŒ3 :
(
ŒŒ: ;
u
ŒŒ; <
=>
ŒŒ= ?
u
ŒŒ@ A
.
ŒŒA B
UserName
ŒŒB J
)
ŒŒJ K
,
ŒŒK L
$str
œœ 
=>
œœ 
isDescending
œœ '
?
œœ( )
query
œœ* /
.
œœ/ 0
OrderByDescending
œœ0 A
(
œœA B
u
œœB C
=>
œœD F
u
œœG H
.
œœH I
Email
œœI N
)
œœN O
:
––( )
query
––* /
.
––/ 0
OrderBy
––0 7
(
––7 8
u
––8 9
=>
––: <
u
––= >
.
––> ?
Email
––? D
)
––D E
,
––E F
$str
““ 
=>
““  
isDescending
““! -
?
““. /
query
““0 5
.
““5 6
OrderByDescending
““6 G
(
““G H
u
““H I
=>
““J L
u
““M N
.
““N O
PhoneNumber
““O Z
)
““Z [
:
””. /
query
””0 5
.
””5 6
OrderBy
””6 =
(
””= >
u
””> ?
=>
””@ B
u
””C D
.
””D E
PhoneNumber
””E P
)
””P Q
,
””Q R
$str
‘‘ 
=>
‘‘ 
isDescending
‘‘ +
?
‘‘, -
query
‘‘. 3
.
‘‘3 4
OrderByDescending
‘‘4 E
(
‘‘E F
u
‘‘F G
=>
‘‘H J
u
‘‘K L
.
‘‘L M
	CreatedAt
‘‘M V
)
‘‘V W
:
’’, -
query
’’. 3
.
’’3 4
OrderBy
’’4 ;
(
’’; <
u
’’< =
=>
’’> @
u
’’A B
.
’’B C
	CreatedAt
’’C L
)
’’L M
,
’’M N
$str
÷÷ 
=>
÷÷ 
isDescending
÷÷ +
?
÷÷, -
query
÷÷. 3
.
÷÷3 4
OrderByDescending
÷÷4 E
(
÷÷E F
u
÷÷F G
=>
÷÷H J
u
÷÷K L
.
÷÷L M
	UpdatedAt
÷÷M V
)
÷÷V W
:
◊◊, -
query
◊◊. 3
.
◊◊3 4
OrderBy
◊◊4 ;
(
◊◊; <
u
◊◊< =
=>
◊◊> @
u
◊◊A B
.
◊◊B C
	UpdatedAt
◊◊C L
)
◊◊L M
,
◊◊M N
$str
ÿÿ 
=>
ÿÿ 
isDescending
ÿÿ *
?
ÿÿ+ ,
query
ÿÿ- 2
.
ÿÿ2 3
OrderByDescending
ÿÿ3 D
(
ÿÿD E
u
ÿÿE F
=>
ÿÿG I
u
ÿÿJ K
.
ÿÿK L
IsActive
ÿÿL T
)
ÿÿT U
:
ŸŸ+ ,
query
ŸŸ- 2
.
ŸŸ2 3
OrderBy
ŸŸ3 :
(
ŸŸ: ;
u
ŸŸ; <
=>
ŸŸ= ?
u
ŸŸ@ A
.
ŸŸA B
IsActive
ŸŸB J
)
ŸŸJ K
,
ŸŸK L
$str
‹‹  
=>
‹‹! #
isDescending
‹‹$ 0
?
‹‹1 2
query
‹‹3 8
.
‹‹8 9
OrderByDescending
‹‹9 J
(
‹‹J K
u
‹‹K L
=>
‹‹M O
u
‹‹P Q
.
‹‹Q R

Department
‹‹R \
.
‹‹\ ]
Name
‹‹] a
)
‹‹a b
:
››1 2
query
››3 8
.
››8 9
OrderBy
››9 @
(
››@ A
u
››A B
=>
››C E
u
››F G
.
››G H

Department
››H R
.
››R S
Name
››S W
)
››W X
,
››X Y
$str
ﬁﬁ  
=>
ﬁﬁ! #
isDescending
ﬁﬁ$ 0
?
ﬁﬁ1 2
query
ﬁﬁ3 8
.
ﬁﬁ8 9
OrderByDescending
ﬁﬁ9 J
(
ﬁﬁJ K
u
ﬁﬁK L
=>
ﬁﬁM O
u
ﬁﬁP Q
.
ﬁﬁQ R
EmailConfirmed
ﬁﬁR `
)
ﬁﬁ` a
:
ﬂﬂ1 2
query
ﬂﬂ3 8
.
ﬂﬂ8 9
OrderBy
ﬂﬂ9 @
(
ﬂﬂ@ A
u
ﬂﬂA B
=>
ﬂﬂC E
u
ﬂﬂF G
.
ﬂﬂG H
EmailConfirmed
ﬂﬂH V
)
ﬂﬂV W
,
ﬂﬂW X
$str
‡‡ #
=>
‡‡$ &
isDescending
‡‡' 3
?
‡‡4 5
query
‡‡6 ;
.
‡‡; <
OrderByDescending
‡‡< M
(
‡‡M N
u
‡‡N O
=>
‡‡P R
u
‡‡S T
.
‡‡T U
AccessFailedCount
‡‡U f
)
‡‡f g
:
··4 5
query
··6 ;
.
··; <
OrderBy
··< C
(
··C D
u
··D E
=>
··F H
u
··I J
.
··J K
AccessFailedCount
··K \
)
··\ ]
,
··] ^
_
‚‚ 
=>
‚‚ 
query
‚‚ 
.
‚‚ 
OrderBy
‚‚ "
(
‚‚" #
u
‚‚# $
=>
‚‚% '
u
‚‚( )
.
‚‚) *
	CreatedAt
‚‚* 3
)
‚‚3 4
}
„„ 
;
„„ 
}
‰‰ 	
public
ÊÊ 
Task
ÊÊ 
<
ÊÊ 
UserStatisticsDto
ÊÊ %
>
ÊÊ% &$
GetUserStatisticsAsync
ÊÊ' =
(
ÊÊ= >
)
ÊÊ> ?
{
ÁÁ 	
var
ËË 

totalUsers
ËË 
=
ËË 
_context
ËË %
.
ËË% &
Users
ËË& +
.
ËË+ ,
Count
ËË, 1
(
ËË1 2
)
ËË2 3
;
ËË3 4
var
ÈÈ 
activeUsers
ÈÈ 
=
ÈÈ 
_context
ÈÈ &
.
ÈÈ& '
Users
ÈÈ' ,
.
ÈÈ, -
Count
ÈÈ- 2
(
ÈÈ2 3
u
ÈÈ3 4
=>
ÈÈ5 7
u
ÈÈ8 9
.
ÈÈ9 :
IsActive
ÈÈ: B
)
ÈÈB C
;
ÈÈC D
var
ÍÍ 
inactiveUsers
ÍÍ 
=
ÍÍ 

totalUsers
ÍÍ  *
-
ÍÍ+ ,
activeUsers
ÍÍ- 8
;
ÍÍ8 9
var
ÎÎ 
totalDocuments
ÎÎ 
=
ÎÎ  
_context
ÎÎ! )
.
ÎÎ) *
	Documents
ÎÎ* 3
.
ÎÎ3 4
Count
ÎÎ4 9
(
ÎÎ9 :
)
ÎÎ: ;
;
ÎÎ; <
var
ÏÏ 
totalFolders
ÏÏ 
=
ÏÏ 
_context
ÏÏ '
.
ÏÏ' (
Folders
ÏÏ( /
.
ÏÏ/ 0
Count
ÏÏ0 5
(
ÏÏ5 6
)
ÏÏ6 7
;
ÏÏ7 8
var
ÓÓ 
stats
ÓÓ 
=
ÓÓ 
new
ÓÓ 
UserStatisticsDto
ÓÓ -
{
ÔÔ 

TotalUsers
 
=
 

totalUsers
 '
,
' (
ActiveUsers
ÒÒ 
=
ÒÒ 
activeUsers
ÒÒ )
,
ÒÒ) *
InactiveUsers
ÚÚ 
=
ÚÚ 
inactiveUsers
ÚÚ  -
,
ÚÚ- .
TotalDocuments
ÛÛ 
=
ÛÛ  
totalDocuments
ÛÛ! /
,
ÛÛ/ 0
TotalFolders
ÙÙ 
=
ÙÙ 
totalFolders
ÙÙ +
}
ıı 
;
ıı 
return
˜˜ 
Task
˜˜ 
.
˜˜ 

FromResult
˜˜ "
(
˜˜" #
stats
˜˜# (
)
˜˜( )
;
˜˜) *
}
¯¯ 	
}
˘˘ 
}˙˙ †(
Z/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Seeding/DepartmentSeeding.cs
	namespace 	
Infrastructure
 
. 
Seeding  
{		 
public

 

static

 
class

 
DepartmentSeeder

 (
{ 
private 
static 
readonly 
(  !
int! $
id% '
,( )
string) /
Name0 4
,4 5
string6 <
Description= H
)H I
[I J
]J K
DepartmentsL W
=X Y
newZ ]
[] ^
]^ _
{ 	
( 
$num 
, 
$str #
,# $
$str% L
)L M
,M N
( 
$num 
, 
$str $
,$ %
$str& U
)U V
,V W
( 
$num 
, 
$str 
, 
$str D
)D E
,E F
( 
$num 
, 
$str &
,& '
$str( {
){ |
,| }
( 
$num 
, 
$str 
, 
$str e
)e f
,f g
( 
$num 
, 
$str '
,' (
$str) \
)\ ]
,] ^
( 
$num 
, 
$str 
, 
$str >
)> ?
,? @
( 
$num 
, 
$str $
,$ %
$str& P
)P Q
,Q R
( 
$num 
, 
$str +
,+ ,
$str- s
)s t
,t u
( 
$num 
, 
$str 3
,3 4
$str5 T
)T U
,U V
( 
$num 
, 
$str 
, 
$str H
)H I
,I J
( 
$num 
, 
$str ,
,, -
$str. Q
)Q R
,R S
( 
$num 
, 
$str .
,. /
$str0 P
)P Q
,Q R
( 
$num 
, 
$str 
, 
$str R
)R S
,S T
( 
$num 
, 
$str 
, 
$str 8
)8 9
,9 :
( 
$num 
, 
$str '
,' (
$str) ]
)] ^
} 	
;	 

public   
static   
async   
Task    
	SeedAsync  ! *
(  * +
AppDbContext  + 7
context  8 ?
)  ? @
{!! 	
if"" 
("" 
context"" 
=="" 
null"" 
)""  
throw""! &
new""' *!
ArgumentNullException""+ @
(""@ A
nameof""A G
(""G H
context""H O
)""O P
)""P Q
;""Q R
try%% 
{&& 
await'' 
context'' 
.'' 
Database'' &
.''& '
MigrateAsync''' 3
(''3 4
)''4 5
;''5 6
}(( 
catch)) 
{** 
},, 
foreach.. 
(.. 
var.. 
(.. 
id.. 
,.. 
name.. !
,..! "
description..# .
)... /
in..0 2
Departments..3 >
)..> ?
{// 
var00 
exists00 
=00 
await00 "
context00# *
.00* +
Departments00+ 6
.11 
AsNoTracking11 !
(11! "
)11" #
.22 
AnyAsync22 
(22 
d22 
=>22  "
d22# $
.22$ %
Name22% )
==22* ,
name22- 1
)221 2
;222 3
if44 
(44 
!44 
exists44 
)44 
{55 
var66 
dept66 
=66 
new66 "

Department66# -
{77 
Id88 
=88 
id88 
,88 
Name99 
=99 
name99 #
,99# $
Description:: #
=::$ %
description::& 1
,::1 2
	CreatedAt;; !
=;;" #
DateTime;;$ ,
.;;, -
UtcNow;;- 3
,;;3 4
	UpdatedAt<< !
=<<" #
DateTime<<$ ,
.<<, -
UtcNow<<- 3
}== 
;== 
await?? 
context?? !
.??! "
Departments??" -
.??- .
AddAsync??. 6
(??6 7
dept??7 ;
)??; <
;??< =
}@@ 
}AA 
awaitCC 
contextCC 
.CC 
SaveChangesAsyncCC *
(CC* +
)CC+ ,
;CC, -
}DD 	
}EE 
}FF Ö"
S/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Seeding/RoleSeeder.cs
	namespace 	
Infrastructure
 
. 
Seeding  
{ 
public 

static 
class 

RoleSeeder "
{		 
private

 
static

 
readonly

 
(

  !
string

! '
Name

( ,
,

, -
string

. 4
Description

5 @
)

@ A
[

A B
]

B C
Roles

D I
=

J K
new

L O
[

O P
]

P Q
{ 	
( 
$str 
, 
$str :
): ;
,; <
( 
$str 
, 
$str +
)+ ,
,, -
( 
$str 
, 
$str G
)G H
,H I
( 
$str 
, 
$str &
)& '
,' (
( 
$str 
, 
$str "
)" #
,# $
( 
$str 
, 
$str #
)# $
,$ %
( 
$str 
, 
$str '
)' (
,( )
( 
$str 
, 
$str *
)* +
,+ ,
( 
$str 
, 
$str .
). /
,/ 0
( 
$str 
,  
$str  6
)6 7
,7 8
( 
$str 
, 
$str -
)- .
,. /
( 
$str  
,  !
$str! 5
)5 6
,6 7
( 
$str !
,! "
$str" 7
)7 8
,8 9
( 
$str 
, 
$str 5
)5 6
,6 7
( 
$str 
, 
$str 0
)0 1
,1 2
( 
$str 
, 
$str 0
)0 1
,1 2
( 
$str 
, 
$str %
)% &
,& '
( 
$str 
, 
$str .
). /
,/ 0
( 
$str  
,  !
$str! ;
); <
,< =
( 
$str 
, 
$str *
)* +
,+ ,
(   
$str   
,   
$str   (
)  ( )
,  ) *
(!! 
$str!! 
,!! 
$str!! (
)!!( )
}"" 	
;""	 

public$$ 
static$$ 
async$$ 
Task$$  
SeedRolesAsync$$! /
($$/ 0
RoleManager$$0 ;
<$$; <
Role$$< @
>$$@ A
roleManager$$B M
)$$M N
{%% 	
if&& 
(&& 
roleManager&& 
==&& 
null&& #
)&&# $
throw&&% *
new&&+ .!
ArgumentNullException&&/ D
(&&D E
nameof&&E K
(&&K L
roleManager&&L W
)&&W X
)&&X Y
;&&Y Z
foreach'' 
('' 
var'' 
('' 
name'' 
,'' 
desc''  $
)''$ %
in''& (
Roles'') .
)''. /
{(( 
if)) 
()) 
!)) 
await)) 
roleManager)) &
.))& '
RoleExistsAsync))' 6
())6 7
name))7 ;
))); <
)))< =
{** 
var++ 
role++ 
=++ 
new++ "
Role++# '
{,, 
Name-- 
=-- 
name-- #
,--# $
NormalizedName.. &
=..' (
name..) -
...- .
ToUpperInvariant... >
(..> ?
)..? @
,..@ A
Description// #
=//$ %
desc//& *
}00 
;00 
var11 
result11 
=11  
await11! &
roleManager11' 2
.112 3
CreateAsync113 >
(11> ?
role11? C
)11C D
;11D E
}33 
}44 
}55 	
}66 
}77 ∞
S/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Seeding/UserSeeder.cs
	namespace		 	
Infrastructure		
 
.		 
Seeding		  
;		  !
public 
static 
class 

UserSeeder 
{ 
public 

static 
async 
Task 
SeedUsersAsync +
(+ ,
UserManager, 7
<7 8
AppUser8 ?
>? @

userMangerA K
,K L
RoleManagerL W
<W X
CoreX \
.\ ]
Entities] e
.e f
Rolef j
>j k
roleManagerl w
)w x
{ 
if 
( 

userManger 
== 
null 
) 
throw !
new" %!
ArgumentNullException& ;
(; <
nameof< B
(B C

userMangerC M
)M N
)N O
;O P
if 

( 
! 
await 
roleManager 
. 
RoleExistsAsync .
(. /
$str/ 6
)6 7
)7 8
{ 	
await 
roleManager 
. 
CreateAsync )
() *
new* -
Role. 2
{2 3
Name 
= 
$str 
} 
) 
; 
} 	
var 
email 
= 
$str +
;+ ,
var 
user 
= 
await 

userManger 
.  
FindByEmailAsync  0
(0 1
email1 6
)6 7
;7 8
if 
( 
user 
!= 
null 
) 
return 
; 
user 
=	 

new 
AppUser 
{   
Id!! 

=!!
 
Guid!! 
.!! 
NewGuid!! 
(!! 
)!! 
.!! 
ToString!! "
(!!" #
)!!# $
,!!$ %
Email"" 
="" 
email"" 
,"" 
UserName## 
=## 
email## 
,## 
Cin$$ 
=$$ 
$num$$ 
,$$ 
EmailConfirmed%% 
=%% 
true%% 
,%% 
DepartmentId&& 
=&& 
$num&& 
}(( 
;(( 
var** 
result** 
=** 
await** 

userManger** !
.**! "
CreateAsync**" -
(**- .
user**. 2
,**2 3
$str**4 @
)**@ A
;**A B
if++ 
(++ 
result++ 
.++ 
	Succeeded++ 
)++ 
{,, 
await-- 

userManger-- 
.-- 
AddToRoleAsync-- '
(--' (
user--( ,
,--, -
$str--. 5
)--5 6
;--6 7
}.. 
}// 
}22 ¥
P/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Utils/AuthUtils.cs
	namespace 	
Infrastructure
 
. 
Utils 
; ’k
Y/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Utils/CurrentUserService.cs
	namespace 	
Infrastructure
 
. 
Services !
{ 
public 

class 
CurrentUserService #
:$ %
ICurrentUserService& 9
{ 
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
private 
readonly %
TokenValidationParameters 2&
_tokenValidationParameters3 M
;M N
private 
string 
? 
_userId 
;  
private 
string 
? 
	_userName !
;! "
private 
string 
? 
_departmentId %
;% &
private 
string 
? 
	_roleName !
;! "
private 
string 
? 
_roleId 
;  
private	 
List 
< 
string 
> 

_userRoles (
;( )
private 
bool 
_initialized !
;! "
public 
CurrentUserService !
(! " 
IHttpContextAccessor" 6
httpContextAccessor7 J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
var 
key 
= 
configuration #
[# $
$str$ 2
]2 3
??4 6
throw7 <
new= @!
ArgumentNullExceptionA V
(V W
$strW q
)q r
;r s&
_tokenValidationParameters &
=' (
new) ,%
TokenValidationParameters- F
{ $
ValidateIssuerSigningKey   (
=  ) *
true  + /
,  / 0
IssuerSigningKey!!  
=!!! "
new!!# & 
SymmetricSecurityKey!!' ;
(!!; <
System!!< B
.!!B C
Text!!C G
.!!G H
Encoding!!H P
.!!P Q
UTF8!!Q U
.!!U V
GetBytes!!V ^
(!!^ _
key!!_ b
)!!b c
)!!c d
,!!d e
ValidateIssuer"" 
=""  
!""! "
string""" (
.""( )
IsNullOrEmpty"") 6
(""6 7
configuration""7 D
[""D E
$str""E S
]""S T
)""T U
,""U V
ValidIssuer## 
=## 
configuration## +
[##+ ,
$str##, :
]##: ;
,##; <
ValidateAudience$$  
=$$! "
!$$# $
string$$$ *
.$$* +
IsNullOrEmpty$$+ 8
($$8 9
configuration$$9 F
[$$F G
$str$$G W
]$$W X
)$$X Y
,$$Y Z
ValidAudience%% 
=%% 
configuration%%  -
[%%- .
$str%%. >
]%%> ?
,%%? @
ValidateLifetime&&  
=&&! "
true&&# '
,&&' (
	ClockSkew'' 
='' 
TimeSpan'' $
.''$ %
FromMinutes''% 0
(''0 1
$num''1 2
)''2 3
,''3 4
RoleClaimType(( 
=(( 

ClaimTypes((  *
.((* +
Role((+ /
})) 
;)) 

_userRoles++ 
=++ 
new++ 
List++ "
<++" #
string++# )
>++) *
(++* +
)+++ ,
;++, -
},, 	
private.. 
void.. 
EnsureInitialized.. &
(..& '
)..' (
{// 	
if00 
(00 
_initialized00 
)00 
return00 $
;00$ %
_initialized11 
=11 
true11 
;11  
var33 
ctx33 
=33  
_httpContextAccessor33 *
.33* +
HttpContext33+ 6
;336 7
if44 
(44 
ctx44 
==44 
null44 
)44 
return44 #
;44# $
if77 
(77 
!77 
ctx77 
.77 
Request77 
.77 
Cookies77 $
.77$ %
TryGetValue77% 0
(770 1
$str771 8
,778 9
out77: =
var77> A
token77B G
)77G H
||77I K
string77L R
.77R S
IsNullOrEmpty77S `
(77` a
token77a f
)77f g
)77g h
return88 
;88 
try:: 
{;; 
var<< 
	principal<< 
=<< 
JwtUtils<<  (
.<<( )
ValidateToken<<) 6
(<<6 7
token<<7 <
,<<< =&
_tokenValidationParameters<<> X
)<<X Y
;<<Y Z
Console>> 
.>> 
	WriteLine>> !
(>>! "
$">>" $
$str>>$ ?
">>? @
,>>@ A
	principal>>B K
)>>K L
;>>L M
Console?? 
.?? 
	WriteLine?? !
(??! "
$"??" $
$str??$ -
{??- .
	principal??. 7
.??7 8
	FindFirst??8 A
(??A B
System??B H
.??H I
Security??I Q
.??Q R
Claims??R X
.??X Y

ClaimTypes??Y c
.??c d
NameIdentifier??d r
)??r s
???s t
.??t u
Value??u z
}??z {
"??{ |
)??| }
;??} ~
Console@@ 
.@@ 
	WriteLine@@ !
(@@! "
$str@@" *
,@@* +
	principal@@, 5
.@@5 6
	FindFirst@@6 ?
(@@? @
$str@@@ H
)@@H I
?@@I J
.@@J K
Value@@K P
)@@P Q
;@@Q R
ConsoleAA 
.AA 
	WriteLineAA !
(AA! "
$strAA" {
,AA{ |
	principal	AA} Ü
.
AAÜ á
	FindFirst
AAá ê
(
AAê ë
$str
AAë ü
)
AAü †
?
AA† °
.
AA° ¢
Value
AA¢ ß
)
AAß ®
;
AA® ©
_departmentIdBB 
=BB 
	principalBB  )
.BB) *
	FindFirstBB* 3
(BB3 4
$strBB4 B
)BBB C
?BBC D
.BBD E
ValueBBE J
;BBJ K
ConsoleCC 
.CC 
	WriteLineCC !
(CC! "
$strCC" _
,CC_ `
	principalCCa j
.CCj k
	FindFirstCCk t
(CCt u
$strCCu {
)CC{ |
)CC| }
;CC} ~
ConsoleDD 
.DD 
	WriteLineDD !
(DD! "
$strDD" _
,DD_ `
	principalDDa j
.DDj k
	FindFirstDDk t
(DDt u

ClaimTypesDDu 
.	DD Ä
Role
DDÄ Ñ
)
DDÑ Ö
?
DDÖ Ü
.
DDÜ á
Value
DDá å
)
DDå ç
;
DDç é
ConsoleFF 
.FF 
	WriteLineFF !
(FF! "
$strFF" /
)FF/ 0
;FF0 1

_userRolesHH 
=HH 
	principalHH &
.HH& '
ClaimsHH' -
.II 
WhereII 
(II 
cII 
=>II 
cII  !
.II! "
TypeII" &
==II' )

ClaimTypesII* 4
.II4 5
RoleII5 9
)II9 :
.JJ 
SelectJJ 
(JJ 
cJJ 
=>JJ  
cJJ! "
.JJ" #
ValueJJ# (
)JJ( )
.KK 
ToListKK 
(KK 
)KK 
;KK 
	_roleNameLL 
=LL 
	principalLL %
.LL% &
	FindFirstLL& /
(LL/ 0
$strLL0 6
)LL6 7
?LL7 8
.LL8 9
ValueLL9 >
;LL> ?
_roleIdNN 
=NN 
	principalNN #
.NN# $
	FindFirstNN$ -
(NN- .
$strNN. 6
)NN6 7
?NN7 8
.NN8 9
ValueNN9 >
;NN> ?
_userIdPP 
=PP 
	principalPP #
.PP# $
	FindFirstPP$ -
(PP- .
SystemPP. 4
.PP4 5
SecurityPP5 =
.PP= >
ClaimsPP> D
.PPD E

ClaimTypesPPE O
.PPO P
NameIdentifierPPP ^
)PP^ _
?PP_ `
.PP` a
ValuePPa f
??QQ 
	principalQQ &
.QQ& '
	FindFirstQQ' 0
(QQ0 1
$strQQ1 5
)QQ5 6
?QQ6 7
.QQ7 8
ValueQQ8 =
??RR 
	principalRR &
.RR& '
	FindFirstRR' 0
(RR0 1
$strRR1 6
)RR6 7
?RR7 8
.RR8 9
ValueRR9 >
;RR> ?
	_userNameSS 
=SS 
	principalSS %
.SS% &
IdentitySS& .
?SS. /
.SS/ 0
NameSS0 4
??SS5 7
	principalSS8 A
.SSA B
	FindFirstSSB K
(SSK L
$strSSL Y
)SSY Z
?SSZ [
.SS[ \
ValueSS\ a
;SSa b
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
ConsoleXX 
.XX 
	WriteLineXX !
(XX! "
$strXX" =
+XX> ?
exXX@ B
.XXB C
MessageXXC J
)XXJ K
;XXK L
_roleIdZZ 
=ZZ 
nullZZ 
;ZZ 
_departmentId[[ 
=[[ 
null[[  $
;[[$ %
_userId\\ 
=\\ 
null\\ 
;\\ 
	_userName]] 
=]] 
null]]  
;]]  !

_userRoles^^ 
=^^ 
new^^  
List^^! %
<^^% &
string^^& ,
>^^, -
(^^- .
)^^. /
;^^/ 0
	_roleName__ 
=__ 
null__  
;__  !
}`` 
}aa 	
publicee 
stringee 
?ee 
UserIdee 
{ee 
getee  #
{ee$ %
EnsureInitializedee& 7
(ee7 8
)ee8 9
;ee9 :
returnee; A
_userIdeeB I
;eeI J
}eeK L
}eeM N
publicff 
stringff 
?ff 
UserNameff 
{ff  !
getff" %
{ff& '
EnsureInitializedff( 9
(ff9 :
)ff: ;
;ff; <
returnff= C
	_userNameffD M
;ffM N
}ffO P
}ffQ R
publicgg 
boolgg 
IsAuthenticatedgg #
{gg$ %
getgg& )
{gg* +
EnsureInitializedgg, =
(gg= >
)gg> ?
;gg? @
returnggA G
!ggH I
stringggI O
.ggO P
IsNullOrEmptyggP ]
(gg] ^
_userIdgg^ e
)gge f
;ggf g
}ggh i
}ggj k
publichh 
Listhh 
<hh 
stringhh 
>hh 
	UserRoleshh %
{hh& '
gethh( +
{hh, -
EnsureInitializedhh. ?
(hh? @
)hh@ A
;hhA B
returnhhC I

_userRoleshhJ T
;hhT U
}hhV W
}hhX Y
publicii 
stringii 
?ii 
DepartmentIdii #
{ii$ %
getii& )
{ii* +
EnsureInitializedii, =
(ii= >
)ii> ?
;ii? @
returniiA G
_departmentIdiiH U
;iiU V
}iiW X
}iiY Z
publickk 
stringkk 
?kk 
RoleNamekk 
{kk  !
getkk" %
{kk& '
EnsureInitializedkk( 9
(kk9 :
)kk: ;
;kk; <
returnkk= C
	_roleNamekkD M
;kkM N
}kkO P
}kkQ R
publicll 
stringll 
?ll 
RoleIdll 
{ll 
getll  #
{ll$ %
EnsureInitializedll& 7
(ll7 8
)ll8 9
;ll9 :
returnll; A
_roleIdllB I
;llI J
}llK L
}llM N
publicoo 
booloo 
IsInRoleoo 
(oo 
stringoo #
roleoo$ (
)oo( )
{pp 	
EnsureInitializedqq 
(qq 
)qq 
;qq  
returnrr 

_userRolesrr 
.rr 
Containsrr &
(rr& '
rolerr' +
)rr+ ,
;rr, -
}ss 	
publicuu 
booluu 
IsInAnyRoleuu 
(uu  
paramsuu  &
stringuu' -
[uu- .
]uu. /
rolesuu0 5
)uu5 6
{vv 	
EnsureInitializedww 
(ww 
)ww 
;ww  
returnxx 
rolesxx 
.xx 
Anyxx 
(xx 
rolexx !
=>xx" $

_userRolesxx% /
.xx/ 0
Containsxx0 8
(xx8 9
rolexx9 =
)xx= >
)xx> ?
;xx? @
}yy 	
public{{ 
bool{{ 
IsInAllRoles{{  
({{  !
params{{! '
string{{( .
[{{. /
]{{/ 0
roles{{1 6
){{6 7
{|| 	
EnsureInitialized}} 
(}} 
)}} 
;}}  
return~~ 
roles~~ 
.~~ 
All~~ 
(~~ 
role~~ !
=>~~" $

_userRoles~~% /
.~~/ 0
Contains~~0 8
(~~8 9
role~~9 =
)~~= >
)~~> ?
;~~? @
} 	
}
ÄÄ 
}ÉÉ ˙
O/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Utils/JwtUtils.cs
	namespace 	
Infrastructure
 
. 
Utils 
{ 
public 

static 
class 
JwtUtils  
{		 
public 
static 
ClaimsPrincipal %
ValidateToken& 3
(3 4
string4 :
token; @
,@ A%
TokenValidationParametersB [ 
validationParameters\ p
)p q
{ 	
var 
handler 
= 
new #
JwtSecurityTokenHandler 5
(5 6
)6 7
;7 8
return 
handler 
. 
ValidateToken (
(( )
token) .
,. / 
validationParameters0 D
,D E
outF I
_J K
)K L
;L M
} 	
public 
static 
JwtSecurityToken &
?& '
	ReadToken( 1
(1 2
string2 8
token9 >
)> ?
{ 	
var 
handler 
= 
new #
JwtSecurityTokenHandler 5
(5 6
)6 7
;7 8
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *
token* /
)/ 0
)0 1
return2 8
null9 =
;= >
return 
handler 
. 
ReadJwtToken '
(' (
token( -
)- .
;. /
} 	
public 
static 
string 
? 
GetClaimFromToken /
(/ 0
string0 6
token7 <
,< =
string> D
	claimTypeE N
=O P

ClaimTypesQ [
.[ \
NameIdentifier\ j
)j k
{ 	
var 
jwt 
= 
	ReadToken 
(  
token  %
)% &
;& '
if 
( 
jwt 
== 
null 
) 
return #
null$ (
;( )
var 
claim 
= 
jwt 
. 
Claims "
." #
FirstOrDefault# 1
(1 2
c2 3
=>4 6
c7 8
.8 9
Type9 =
==> @
	claimTypeA J
||K M
cN O
.O P
TypeP T
==U W
$strX \
||] _
c` a
.a b
Typeb f
==g i
$strj o
)o p
;p q
return 
claim 
? 
. 
Value 
;  
}   	
}!! 
}"" Ù
L/home/ubuntu/Bureau/github/MazraaDrive/backend/Infrastructure/Utils/Utils.cs
	namespace 	
Infrastructure
 
. 
Utils 
{ 
public 

static 
class !
HttpContextExtensions -
{ 
public		 
static		 
string		 
?		 
GetTokenFromCookies		 1
(		1 2
this		2 6
HttpContext		7 B
ctx		C F
,		F G
string		H N

cookieName		O Y
=		Z [
$str		\ c
)		c d
=>

 
ctx

 
.

 
Request

 
.

 
Cookies

 "
.

" #
TryGetValue

# .
(

. /

cookieName

/ 9
,

9 :
out

; >
var

? B
t

C D
)

D E
?

F G
t

H I
:

J K
null

L P
;

P Q
public 
static 
string 
? $
GetUserIdFromCookieToken 6
(6 7
this7 ;
HttpContext< G
ctxH K
,K L
stringM S

cookieNameT ^
=_ `
$stra h
)h i
{ 	
var 
token 
= 
ctx 
. 
GetTokenFromCookies /
(/ 0

cookieName0 :
): ;
;; <
if 
( 
string 
. 
IsNullOrEmpty $
($ %
token% *
)* +
)+ ,
return- 3
null4 8
;8 9
var 
jwt 
= 
new #
JwtSecurityTokenHandler 1
(1 2
)2 3
.3 4
ReadJwtToken4 @
(@ A
tokenA F
)F G
;G H
var 
claim 
= 
jwt 
. 
Claims "
." #
FirstOrDefault# 1
(1 2
c2 3
=>4 6
c7 8
.8 9
Type9 =
==> @
SystemA G
.G H
SecurityH P
.P Q
ClaimsQ W
.W X

ClaimTypesX b
.b c
NameIdentifierc q
||r t
cu v
.v w
Typew {
==| ~
$str	 É
||
Ñ Ü
c
á à
.
à â
Type
â ç
==
é ê
$str
ë ñ
)
ñ ó
;
ó ò
return 
claim 
? 
. 
Value 
;  
} 	
} 
} 