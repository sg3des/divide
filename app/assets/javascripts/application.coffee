# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
znam_val=0;
chis_val=0;
cval=[];
zval=[];
level=0;
point=0;
score=0;
intervalTime=setInterval('',1000)
slogan = [
	'go to the school',
	'ho ho ho, are you sure you`re ready?',
	'ok, then go to the HELL!!!',
	'Welcome you of first circle of the HELL',
	'second circle! scary?',
	'third circle! tremble human!',
	'fourth circle! ...',
	'fifth circle! Are you sure?',
	'sixth circle! stop until it`s too late',
	'seventh circle! late!!!!',
	'Welcome to the hell of divide',
	'hell of infinity dividy!!! HO HO HO!!!',
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
		intervalTime=setInterval(scoretime,650)
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
		intervalTime=setInterval(scoretime,500)


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
	restart()
	
	
reducefun = (cval,zval) ->
	for i in [0...cval.length]
		do (i)->
			result = reduce(cval[i],zval[i])
			cval[i]=result[0]
			zval[i]=result[1]
			return

restart=()->
	get('time').innerHTML=0
	get('loose').className='loose'
	znam_val=0;
	chis_val=0;
	cval=[];
	zval=[];
	level=0;
	point=0;
	score=0;

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
	if parseInt(chis)==chis_val
		get("chislitel").className='inputCorrect'
	if parseInt(znam)==znam_val and parseInt(chis)==chis_val or parseInt(znam)/parseInt(chis)==znam_val/chis_val
		clearInterval(intervalTime)
		get('score').innerHTML=parseInt(get('score').innerHTML)+parseInt(get('point').innerHTML)
		restart()
	return


window.onload = start
get=(id)->document.getElementById(id)