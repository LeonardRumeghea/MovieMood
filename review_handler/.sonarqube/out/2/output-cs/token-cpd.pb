®
gD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\CreateReviewCommand.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class 
CreateReviewCommand $
:% &
IRequest' /
</ 0
ResultOfEntity0 >
<> ?
ReviewResponse? M
>M N
>N O
{ 
public		 
Guid		 
MovieId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
Guid

 
UserId

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
int 
MovieRating 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 

CastRating 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 
DirectorRating "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
GenreRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
SciptRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 

ReviewText !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ä
pD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\CreateReviewCommandValidator.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class (
CreateReviewCommandValidator -
:. /
AbstractValidator0 A
<A B
CreateReviewCommandB U
>U V
{ 
public (
CreateReviewCommandValidator +
(+ ,
), -
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
MovieId		 "
)		" #
.		# $
NotEmpty		$ ,
(		, -
)		- .
;		. /
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
UserId

 !
)

! "
.

" #
NotEmpty

# +
(

+ ,
)

, -
;

- .
RuleFor 
( 
x 
=> 
x 
. 
MovieRating &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
InclusiveBetween3 C
(C D
$numD E
,E F
$numG H
)H I
;I J
RuleFor 
( 
x 
=> 
x 
. 

CastRating %
)% &
.& '
NotEmpty' /
(/ 0
)0 1
.1 2
InclusiveBetween2 B
(B C
$numC D
,D E
$numF G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
DirectorRating )
)) *
.* +
NotEmpty+ 3
(3 4
)4 5
.5 6
InclusiveBetween6 F
(F G
$numG H
,H I
$numJ K
)K L
;L M
RuleFor 
( 
x 
=> 
x 
. 
GenreRating &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
InclusiveBetween3 C
(C D
$numD E
,E F
$numG H
)H I
;I J
RuleFor 
( 
x 
=> 
x 
. 
SciptRating &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
InclusiveBetween3 C
(C D
$numD E
,E F
$numG H
)H I
;I J
RuleFor 
( 
x 
=> 
x 
. 

ReviewText %
)% &
.& '
NotEmpty' /
(/ 0
)0 1
.1 2
MaximumLength2 ?
(? @
$num@ D
)D E
;E F
} 	
} 
} “
gD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\DeleteReviewCommand.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class 
DeleteReviewCommand $
:% &
IRequest' /
</ 0
Result0 6
>6 7
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 ≤
pD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\DeleteReviewCommandValidator.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class (
DeleteReviewCommandValidator -
:. /
AbstractValidator0 A
<A B
DeleteReviewCommandB U
>U V
{ 
public (
DeleteReviewCommandValidator +
(+ ,
), -
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
;		) *
}

 	
} 
} …
gD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\UpdateReviewCommand.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class 
UpdateReviewCommand $
:% &
IRequest' /
</ 0
Result0 6
>6 7
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public		 
int		 
MovieRating		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
?

 

CastRating

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
int 
? 
DirectorRating "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
GenreRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
SciptRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 

ReviewText !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} •
pD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Commands\UpdateReviewCommandValidator.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Commands% -
{ 
public 

class (
UpdateReviewCommandValidator -
:. /
AbstractValidator0 A
<A B
UpdateReviewCommandB U
>U V
{ 
public (
UpdateReviewCommandValidator +
(+ ,
), -
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
;		) *
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
MovieRating

 &
)

& '
.

' (
NotEmpty

( 0
(

0 1
)

1 2
.

2 3
InclusiveBetween

3 C
(

C D
$num

D E
,

E F
$num

G H
)

H I
;

I J
RuleFor 
( 
x 
=> 
x 
. 

CastRating %
)% &
.& '
NotEmpty' /
(/ 0
)0 1
.1 2
InclusiveBetween2 B
(B C
$numC D
,D E
$numF G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
DirectorRating )
)) *
.* +
NotEmpty+ 3
(3 4
)4 5
.5 6
InclusiveBetween6 F
(F G
$numG H
,H I
$numJ K
)K L
;L M
RuleFor 
( 
x 
=> 
x 
. 
GenreRating &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
InclusiveBetween3 C
(C D
$numD E
,E F
$numG H
)H I
;I J
RuleFor 
( 
x 
=> 
x 
. 
SciptRating &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
.2 3
InclusiveBetween3 C
(C D
$numD E
,E F
$numG H
)H I
;I J
RuleFor 
( 
x 
=> 
x 
. 

ReviewText %
)% &
.& '
NotEmpty' /
(/ 0
)0 1
.1 2
MaximumLength2 ?
(? @
$num@ D
)D E
;E F
} 	
} 
} Ú

\D:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\ConfigureServices.cs
	namespace 	
review_handler
 
. 
Application $
{ 
public		 

static		 
class		 
ConfigureServices		 )
{

 
public 
static 
IServiceCollection ("
AddApplicationServices) ?
(? @
this@ D
IServiceCollectionE W
servicesX `
)` a
{ 	
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. -
!AddFluentValidationAutoValidation 6
(6 7
)7 8
;8 9
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
return 
services 
; 
} 	
} 
} ˝
nD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Handlers\CreateReviewCommandHandler.cs
	namespace		 	
review_handler		
 
.		 
Application		 $
.		$ %
Handlers		% -
{

 
public 

class &
CreateReviewCommandHandler +
:, -
IRequestHandler. =
<= >
CreateReviewCommand> Q
,Q R
ResultOfEntityS a
<a b
ReviewResponseb p
>p q
>q r
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public &
CreateReviewCommandHandler )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
_unitOfWorkE P
=Q R

unitOfWorkS ]
;] ^
public 
async 
Task 
< 
ResultOfEntity (
<( )
ReviewResponse) 7
>7 8
>8 9
Handle: @
(@ A
CreateReviewCommandA T
requestU \
,\ ]
CancellationToken^ o
cancellationToken	p Å
)
Å Ç
{ 	
var 
reviewEntity 
= 
ReviewMapper +
.+ ,
Mapper, 2
.2 3
Map3 6
<6 7
Review7 =
>= >
(> ?
request? F
)F G
;G H
var 
review 
= 
await 
_unitOfWork *
.* +
ReviewRepository+ ;
.; <
AddAsync< D
(D E
reviewEntityE Q
)Q R
;R S
await 
_unitOfWork 
. 
SaveChanges )
() *
)* +
;+ ,
return 
ResultOfEntity !
<! "
ReviewResponse" 0
>0 1
.1 2
Success2 9
(9 :
HttpStatusCode: H
.H I
CreatedI P
,P Q
ReviewMapperR ^
.^ _
Mapper_ e
.e f
Mapf i
<i j
ReviewResponsej x
>x y
(y z
review	z Ä
)
Ä Å
)
Å Ç
;
Ç É
} 	
} 
} ñ
nD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Handlers\DeleteReviewCommandHandler.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Handlers% -
{ 
public 

class &
DeleteReviewCommandHandler +
:, -
IRequestHandler. =
<= >
DeleteReviewCommand> Q
,Q R
ResultS Y
>Y Z
{		 
private

 
readonly

 
IUnitOfWork

 $
_unitOfWork

% 0
;

0 1
public &
DeleteReviewCommandHandler )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
_unitOfWorkE P
=Q R

unitOfWorkS ]
;] ^
public 
async 
Task 
< 
Result  
>  !
Handle" (
(( )
DeleteReviewCommand) <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
reviewEntity 
= 
await $
_unitOfWork% 0
.0 1
ReviewRepository1 A
.A B
GetByIdAsyncB N
(N O
requestO V
.V W
IdW Y
)Y Z
;Z [
if 
( 
reviewEntity 
== 
null  $
)$ %
{ 
return 
Result 
. 
Failure %
(% &
HttpStatusCode& 4
.4 5
NotFound5 =
,= >
$"? A
$strA P
{P Q
requestQ X
.X Y
IdY [
}[ \
$str\ g
"g h
)h i
;i j
} 
await 
_unitOfWork 
. 
ReviewRepository .
.. /
DeleteAsync/ :
(: ;
reviewEntity; G
)G H
;H I
return 
Result 
. 
Success !
(! "
HttpStatusCode" 0
.0 1
OK1 3
)3 4
;4 5
} 	
} 
} À
nD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Handlers\UpdateReviewCommandHandler.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Handlers% -
{ 
public 

class &
UpdateReviewCommandHandler +
:, -
IRequestHandler. =
<= >
UpdateReviewCommand> Q
,Q R
ResultS Y
>Y Z
{		 
private

 
readonly

 
IUnitOfWork

 $
_unitOfWork

% 0
;

0 1
public &
UpdateReviewCommandHandler )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
_unitOfWorkE P
=Q R

unitOfWorkS ]
;] ^
public 
async 
Task 
< 
Result  
>  !
Handle" (
(( )
UpdateReviewCommand) <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
reviewEntity 
= 
await $
_unitOfWork% 0
.0 1
ReviewRepository1 A
.A B
GetByIdAsyncB N
(N O
requestO V
.V W
IdW Y
)Y Z
;Z [
if 
( 
reviewEntity 
== 
null  $
)$ %
{ 
return 
Result 
. 
Failure %
(% &
HttpStatusCode& 4
.4 5
NotFound5 =
,= >
$"? A
$strA P
{P Q
requestQ X
.X Y
IdY [
}[ \
$str\ g
"g h
)h i
;i j
} 
reviewEntity 
. 

ReviewText #
=$ %
request& -
.- .

ReviewText. 8
;8 9
reviewEntity 
. 
SciptRating $
=% &
request' .
.. /
SciptRating/ :
;: ;
reviewEntity 
. 

CastRating #
=$ %
request& -
.- .

CastRating. 8
;8 9
reviewEntity 
. 
MovieRating $
=% &
request' .
.. /
MovieRating/ :
;: ;
reviewEntity 
. 
DirectorRating '
=( )
request* 1
.1 2
DirectorRating2 @
;@ A
reviewEntity 
. 
GenreRating $
=% &
request' .
.. /
GenreRating/ :
;: ;
await 
_unitOfWork 
. 
ReviewRepository .
.. /
UpdateAsync/ :
(: ;
reviewEntity; G
)G H
;H I
return   
Result   
.   
Success   !
(  ! "
HttpStatusCode  " 0
.  0 1
Created  1 8
)  8 9
;  9 :
}!! 	
}"" 
}## ò
[D:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\IDatabaseContext.cs
	namespace 	
review_handler
 
. 
Application $
{ 
public 

	interface 
IDatabaseContext %
{ 
public 
DbSet 
< 
User 
> 
User 
{  !
get" %
;% &
}' (
public		 
DbSet		 
<		 
Review		 
>		 
Review		 #
{		$ %
get		& )
;		) *
}		+ ,
public

 
DbSet

 
<

 
Movie

 
>

 
Movies

 "
{

# $
get

% (
;

( )
}

* +
public 
void 
Save 
( 
) 
; 
} 
} Ù
VD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\IUnitOfWork.cs
	namespace 	
review_handler
 
. 
Application $
{ 
public 

	interface 
IUnitOfWork  
{ 
IRepository 
< 
Movie 
> 
MovieRepository *
{+ ,
get- 0
;0 1
}2 3
IRepository		 
<		 
Review		 
>		 
ReviewRepository		 ,
{		- .
get		/ 2
;		2 3
}		4 5
IRepository

 
<

 
User

 
>

 
UserRepository

 (
{

) *
get

+ .
;

. /
}

0 1
Task 
SaveChanges 
( 
) 
; 
} 
} À
_D:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Mappers\ReviewMapper.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

static 
class 
ReviewMapper $
{ 
private 
static 
readonly 
Lazy  $
<$ %
IMapper% ,
>, -
Lazy. 2
=3 4
new		 
(		 
(		 
)		 
=>		 
{

 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
{ 
cfg 
. 
ShouldMapProperty )
=* +
p, -
=>. 0
p1 2
.2 3
	GetMethod3 <
.< =
IsPublic= E
||F H
pI J
.J K
	GetMethodK T
.T U

IsAssemblyU _
;_ `
cfg 
. 

AddProfile "
<" #
ReviewMapperProfile# 6
>6 7
(7 8
)8 9
;9 :
} 
) 
; 
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
return 
mapper 
; 
} 
) 
; 
public 
static 
IMapper 
Mapper $
=>% '
Lazy( ,
., -
Value- 2
;2 3
} 
} À
fD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Mappers\ReviewMapperProfile.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Mappers% ,
{ 
public 

class 
ReviewMapperProfile $
:% &
Profile' .
{		 
public

 
ReviewMapperProfile

 "
(

" #
)

# $
{ 	
	CreateMap 
< 
Review 
, 
ReviewResponse ,
>, -
(- .
). /
./ 0

ReverseMap0 :
(: ;
); <
;< =
	CreateMap 
< 
Review 
, 
CreateReviewCommand 1
>1 2
(2 3
)3 4
.4 5

ReverseMap5 ?
(? @
)@ A
;A B
} 	
} 
} …
gD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetAllReviewsOfMovie.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public 

class  
GetAllReviewsOfMovie %
:& '
IRequest( 0
<0 1
ResultOfEntity1 ?
<? @
List@ D
<D E
ReviewResponseE S
>S T
>T U
>U V
{ 
public		 
Guid		 
MovieId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ⁄
nD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetAllReviewsOfMovieHandler.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public		 

class		 '
GetAllReviewsOfMovieHandler		 ,
:		- .
IRequestHandler		/ >
<		> ? 
GetAllReviewsOfMovie		? S
,		S T
ResultOfEntity		U c
<		c d
List		d h
<		h i
ReviewResponse		i w
>		w x
>		x y
>		y z
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public '
GetAllReviewsOfMovieHandler *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
=>C E
_unitOfWorkF Q
=R S

unitOfWorkT ^
;^ _
public 
async 
Task 
< 
ResultOfEntity (
<( )
List) -
<- .
ReviewResponse. <
>< =
>= >
>> ?
Handle@ F
(F G 
GetAllReviewsOfMovieG [
request\ c
,c d
CancellationTokene v
cancellationToken	w à
)
à â
{ 	
var 
reviews 
= 
( 
await  
_unitOfWork! ,
., -
ReviewRepository- =
.= >
GetAllAsync> I
(I J
)J K
)K L
.L M
WhereM R
(R S
xS T
=>U W
xX Y
.Y Z
MovieIdZ a
==b d
requeste l
.l m
MovieIdm t
)t u
.u v
ToListv |
(| }
)} ~
;~ 
if 
( 
reviews 
. 
Count 
==  
$num! "
)" #
{ 
return 
ResultOfEntity %
<% &
List& *
<* +
ReviewResponse+ 9
>9 :
>: ;
.; <
Failure< C
(C D
HttpStatusCodeD R
.R S
NotFoundS [
,[ \
$"] _
$str	_ Ç
{
Ç É
request
É ä
.
ä ã
MovieId
ã í
}
í ì
$str
ì î
"
î ï
)
ï ñ
;
ñ ó
} 
return 
ResultOfEntity !
<! "
List" &
<& '
ReviewResponse' 5
>5 6
>6 7
.7 8
Success8 ?
(? @
HttpStatusCode 
. 
OK !
,! "
ReviewMapper 
. 
Mapper #
.# $
Map$ '
<' (
List( ,
<, -
ReviewResponse- ;
>; <
>< =
(= >
reviews> E
)E F
) 
; 
} 	
} 
} ∆
fD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetAllReviewsOfUser.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public 

class 
GetAllReviewsOfUser $
:% &
IRequest' /
</ 0
ResultOfEntity0 >
<> ?
List? C
<C D
ReviewResponseD R
>R S
>S T
>T U
{ 
public		 
Guid		 
UserId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} €
mD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetAllReviewsOfUserHandler.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public		 

class		 &
GetAllReviewsOfUserHandler		 +
:		, -
IRequestHandler		. =
<		= >
GetAllReviewsOfUser		> Q
,		Q R
ResultOfEntity		S a
<		a b
List		b f
<		f g
ReviewResponse		g u
>		u v
>		v w
>		w x
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public &
GetAllReviewsOfUserHandler )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
=>B D
_unitOfWorkE P
=Q R

unitOfWorkS ]
;] ^
public 
async 
Task 
< 
ResultOfEntity (
<( )
List) -
<- .
ReviewResponse. <
>< =
>= >
>> ?
Handle@ F
(F G
GetAllReviewsOfUserG Z
request[ b
,b c
CancellationTokend u
cancellationToken	v á
)
á à
{ 	
var 
reviewEntities 
=  
(! "
await" '
_unitOfWork( 3
.3 4
ReviewRepository4 D
.D E
GetAllAsyncE P
(P Q
)Q R
)R S
.S T
WhereT Y
(Y Z
rZ [
=>\ ^
r_ `
.` a
UserIda g
==h j
requestk r
.r s
UserIds y
)y z
.z {
ToList	{ Å
(
Å Ç
)
Ç É
;
É Ñ
if 
( 
reviewEntities 
. 
Count $
==% '
$num( )
)) *
{ 
return 
ResultOfEntity %
<% &
List& *
<* +
ReviewResponse+ 9
>9 :
>: ;
. 
Failure 
( 
HttpStatusCode +
.+ ,
NotFound, 4
,4 5
$"6 8
$str8 Z
{Z [
request[ b
.b c
UserIdc i
}i j
$strj k
"k l
)l m
;m n
} 
return 
ResultOfEntity !
<! "
List" &
<& '
ReviewResponse' 5
>5 6
>6 7
.7 8
Success8 ?
(? @
HttpStatusCode 
. 
OK !
,! "
ReviewMapper 
. 
Mapper #
.# $
Map$ '
<' (
List( ,
<, -
ReviewResponse- ;
>; <
>< =
(= >
reviewEntities> L
)L M
) 
; 
} 	
} 
} Ü
`D:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetReviewById.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public 

class 
GetReviewById 
:  
IRequest! )
<) *
ResultOfEntity* 8
<8 9
ReviewResponse9 G
>G H
>H I
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
}

 
} «
gD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Queries\GetReviewByIdHandler.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Queries% ,
{ 
public		 

class		  
GetReviewByIdHandler		 %
:		& '
IRequestHandler		( 7
<		7 8
GetReviewById		8 E
,		E F
ResultOfEntity		G U
<		U V
ReviewResponse		V d
>		d e
>		e f
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public  
GetReviewByIdHandler #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
=>< >
_unitOfWork? J
=K L

unitOfWorkM W
;W X
public 
async 
Task 
< 
ResultOfEntity (
<( )
ReviewResponse) 7
>7 8
>8 9
Handle: @
(@ A
GetReviewByIdA N
requestO V
,V W
CancellationTokenX i
cancellationTokenj {
){ |
{ 	
var 
reviewEntity 
= 
await $
_unitOfWork% 0
.0 1
ReviewRepository1 A
.A B
GetByIdAsyncB N
(N O
requestO V
.V W
IdW Y
)Y Z
;Z [
if 
( 
reviewEntity 
== 
null  $
)$ %
{ 
return 
ResultOfEntity %
<% &
ReviewResponse& 4
>4 5
.5 6
Failure6 =
(= >
HttpStatusCode> L
.L M
NotFoundM U
,U V
$strW i
)i j
;j k
} 
return 
ResultOfEntity !
<! "
ReviewResponse" 0
>0 1
.1 2
Success2 9
(9 :
ReviewMapper: F
.F G
MapperG M
.M N
MapN Q
<Q R
ReviewResponseR `
>` a
(a b
reviewEntityb n
)n o
)o p
;p q
} 	
} 
} ô
bD:\Documents\GitHub\MovieMood\review_handler\review_handler.Application\Response\ReviewResponse.cs
	namespace 	
review_handler
 
. 
Application $
.$ %
Response% -
{ 
public 

class 
ReviewResponse 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
Guid 
MovieId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
MovieRating 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
?		 

CastRating		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
?

 
DirectorRating

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 
int 
? 
GenreRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
SciptRating 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 

ReviewText !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} 