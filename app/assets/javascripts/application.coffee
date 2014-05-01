znam_val=0;
chis_val=0;
cval=[];
zval=[];
level=0;
point=0;
score=0;
intervalTime=setInterval('',1000)
slogan = [
	'get ready, rookie!',
	'ho ho ho, are you sure you`re ready?',
	'ok, now welcome to the MATHELL!!!',
	'Congratulations! you are on the first circle of MATHELL',
	'the second circle! tremble!',
	'the third circle! so MATHELLISH!',
	'the fourth circle! Uhh it has become too hot!',
	'the fifth circle! Are you still so sure?',
	'the sixth circle! stop until it`s too late',
	'the seventh circle! make yourself mathellishly rageful for surviving',
	'Guru of the divine perpetuity of MATHELL!',
	'MATHELL is just a game made you godlike! HO HO HO!!!',
]

start=()->
	point=11
	scoretime()
	
	
	get("content").innerHTML=''
	get("znamenatel").className='input'
	get("znamenatel").value=''
	get("chislitel").className='input'
	get("chislitel").value=''

	

	level+=1
	get('level').innerHTML=level
	zmin=4
	zmax=10+level
	cmin=2

	if level<=10
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(znam_val-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + 1
		second=chis_val-first
		cval=[first,second]
		zval=[znam_val,znam_val]
		actionval=['+']
		intervalTime=setInterval(scoretime,1000)
	if 10<level<=20
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(znam_val-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + 1
		second=Math.floor(Math.random()*(first-cmin)) + 1
		third=chis_val-first-second
		cval=[first,second,third]
		zval=[znam_val,znam_val,znam_val]
		actionval=['+','+']
		shuffle(cval)
		intervalTime=setInterval(scoretime,1000)
	if 20<level<=30
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(zmax-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + 1
		second=Math.floor(Math.random()*(first-cmin)) + 1
		third=chis_val-first-second
		cval=[first,second,third]
		zval=[znam_val,znam_val,znam_val]
		actionval=['+','+']
		shuffle(cval)	
		reducefun(cval,zval)
		intervalTime=setInterval(scoretime,1000)
	if 30<level<=40
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(zmax-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + cmin
		second=-Math.floor(Math.random()*(chis_val-cmin)) + cmin
		third=chis_val-first-second

		cval=[first,second,third]
		zval=[znam_val,znam_val,znam_val]
		actionval=['+','+']
		shuffle(cval)	
		reducefun(cval,zval)
		maskznam(cval,zval)
		intervalTime=setInterval(scoretime,800)
	if 40<level<=50
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(zmax-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + cmin
		second=-Math.floor(Math.random()*(chis_val-cmin)) + cmin
		third=-Math.floor(Math.random()*(zmax-chis_val-cmin)) + cmin
		fourth=chis_val-first-second-third
		cval=[first,second,third,fourth]
		zval=[znam_val,znam_val,znam_val,znam_val]
		actionval=['+','+','+']
		shuffle(cval)	
		reducefun(cval,zval)
		maskznam(cval,zval)
		intervalTime=setInterval(scoretime,700)
	if 50<level
		znam_val=Math.floor(Math.random()*(zmax-zmin)) + zmin
		chis_val=Math.floor(Math.random()*(zmax-cmin)) + cmin
		first=Math.floor(Math.random()*(chis_val-cmin)) + cmin
		second=-Math.floor(Math.random()*(chis_val-cmin)) + cmin
		third=-Math.floor(Math.random()*(zmax-chis_val-cmin)) + cmin
		fourth=chis_val-first-second-third
		cval=[first,second,third,fourth]
		zval=[znam_val,znam_val,znam_val,znam_val]
		actionval=['+','+','+']
		shuffle(cval)
		reducefun(cval,zval)
		maskznam(cval,zval)
		intervalTime=setInterval(scoretime,600)


	console.log chis_val,znam_val
	get('slogan').innerHTML=slogan[Math.floor(level/10)]
	content = get("content")
	
	actiondiv=create('actiondiv','')
	content.appendChild(actiondiv)


	for i in [0...actionval.length]
		do (i)->
			if cval[i]<0 
				actionval[i]="-"
			action=create('action',actionval[i])
			actiondiv.appendChild(action)
	for i in [0...cval.length]
		do (i)->
			if cval[i]<0 
				cval[i]=-cval[i]
			column=create('column','')
			c1=create('input',cval[i])
			z1=create('input',zval[i])
			content.appendChild(column)
			column.appendChild(c1)
			column.appendChild(z1)
	return;
maskznam = (cval,zval) ->
	for i in [0...cval.length]
		do (i)->
			if zval[i]==znam_val
				zval[i]=zval[i]*Math.floor(level/20)
				cval[i]=cval[i]*Math.floor(level/20)
				return

scoretime = () ->
	get('point').innerHTML=point-=1
	get('time').innerHTML=parseInt(get('time').innerHTML)+1
	if point<0 && 0>parseInt(get('score').innerHTML)+point
		loose()

loose = () ->
	console.log 'loose'
	clearInterval(intervalTime)
	get('loose').className='loose1'
	get('totalscore').innerHTML = get('time').innerHTML
	
	
	
reducefun = (cval,zval) ->
	for i in [0...cval.length]
		do (i)->
			result = reduce(cval[i],zval[i])
			cval[i]=result[0]
			zval[i]=result[1]
			return

restart=()->
	get('time').innerHTML=0
	get('score').innerHTML=0
	get('loose').className='loose'
	znam_val=0;
	chis_val=0;
	cval=[];
	zval=[];
	level=0;
	point=0;
	score=0;

	countdown()

shuffle=(array)->
    counter = array.length
    index=;
    temp=;
    while counter > 0 
        index = Math.floor(Math.random() * counter);
        counter--;
        temp = array[counter];
        array[counter] = array[index];
        array[index] = temp;
    return array;


create = (className,inner) ->
	div=document.createElement('div')
	div.className=className
	div.innerHTML=inner
	return div

	
check = (znam,chis) ->
	if parseInt(znam)==znam_val
		get("znamenatel").className='inputCorrect'
	else
		get("znamenatel").className='input'
	if parseInt(chis)==chis_val
		get("chislitel").className='inputCorrect'
	else
		get("chislitel").className='input'
	if parseInt(znam)==znam_val and parseInt(chis)==chis_val or parseInt(znam)/parseInt(chis)==znam_val/chis_val
		clearInterval(intervalTime)
		get('score').innerHTML=parseInt(get('score').innerHTML)+parseInt(get('point').innerHTML)
		setTimeout(start,500)
	return


numpad = (val) ->
	console.log val,get("chislitel").className
	if get("chislitel").className=='input'
		get('chislitel').value=get('chislitel').value+parseInt(val)
	else
		get('znamenatel').value=get('znamenatel').value+parseInt(val)
	check(get("znamenatel").value,get("chislitel").value)

clearinput = (id) ->
	get(id).value=''
	check(get("znamenatel").value,get("chislitel").value)

countdown = () ->
	get('count').innerHTML=1
	get('countdown').className='countdown'
	count=()->
		console.log get('count').innerHTML
		get('count').innerHTML=parseInt(get('count').innerHTML)-1
		if parseInt(get('count').innerHTML)<1
			clearInterval(intervalCount)
			get('countdown').className='countdown2'
			start()
			
	intervalCount=setInterval(count,1000)
	return


window.onload = countdown
get=(id)->document.getElementById(id)