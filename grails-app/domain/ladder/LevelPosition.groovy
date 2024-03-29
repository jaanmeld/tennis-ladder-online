package ladder
class LevelPosition  implements Comparable, EntityBase {
    int pos
    Ladder ladder
    static belongsTo = [level:Level]
    Team team
    static transients = [ 'name','abovePositions','loserTeam' ]
    static constraints = {
        //teams.size <=level
	team(nullable:true)
    }
    static mapping = {
        sort "pos"
    }

    int compareTo(obj) {
    	        	  if( ladder.name!=obj.ladder.name){
    	    	throw new     LadderSystemException("can not compare levels for different ladder!")
    	    }	
        return ((this.level-obj.level)!=0)?(this.level-obj.level):(pos-obj.pos)
    }

    public String getName(){
        return "L"+level?.name+":P"+pos
    }

    public String info(){
    	    return getName()+":${team}"
    }

    public static List listOfLevelPositon (Ladder ladder){
        return LevelPosition.withCriteria {
            eq('ladder',ladder)
            order('level','asc') // or 'asc'
            order('pos', 'asc') // or 'asc'
        }
    }
    
        public static List listByLadderName (String ladderName){
		return LevelPosition.findAllByLadder(Ladder.findByName(ladderName))?.sort{it}
    }
     public  SortedSet belowPositions (){
        Level levelBelow=level.belowLevel()
	return levelBelow?.levelposition
}
    
    public  SortedSet abovePositions (){
        Level levelAbove=level.aboveLevel()
	return levelAbove?.levelposition
	/*
        return LevelPosition.withCriteria {
            eq('level',levelAbove)
            order('pos', 'asc') // or 'asc'
        }
	*/
    }

    public boolean atLadderTop(){
        return level.lev==0
    }
    /*
    public static LevelPosition firstAvailable(){
	    def result=
        LevelPosition.findAll().sort{it}.find{it->
            (null==it.team)
        }
	return result
    }
    */
    
    public boolean inBottomQueue(){
	    /*
        def maxLev=Level.findAll().max()
        if(maxLev==null){
            throw new LadderSystemException("level is not created!")
        }
        int maxLevValue=maxLev.lev
        log.info("maxLel.lev:${maxLev.lev}")
        return (level.lev==maxLevValue)
	*/
	log.info("lp:${info()}in botton?first available leve:${ladder.firstAvailable().level.lev}")
	return level.lev==(ladder.firstAvailable().level.lev)
    }
    public void posLoserTeam(Team loser){
        //if(isInBottomQueue()){
        this.setTeam(null)
            level.pushLoserToEndOfLevel(loser)
//            return
//        }
//        this.team=loser
    }
}
