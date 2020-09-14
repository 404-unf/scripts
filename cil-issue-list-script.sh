#!/usr/bin/env zsh

gils(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mMilestone - $1\033[0m"
        #echo "Milestone - Planning"
        gh issue list -l "$1"

}

# Metawork Planning Ideas

ghmeta(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mAoL - METAWORK \033[0m"
        echo -e "\033[01;35mIncludes :- Planning, Metawork, Ideas\033[0m"
        #echo "Milestone - Planning"
        gh issue list -l "Planning,Metawork,Ideas"

}

# Reading

ghreading(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mAoL - READING\033[0m"
        echo -e "\033[01;35mIncludes :- Reading\033[0m"
        #echo "Milestone - Reading"
        gh issue list -l "Reading"

}

# Projects - yasdb, rkosh, rdnss, sakgames

ghprojects(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mAoL - PROJECTS\033[0m"
        echo -e "\033[01;35mIncludes :- yasdb, rkosh, rdnss, sakgames, Project, Language, Tools, Linux\033[0m"
        #echo "Milestone - Reading"
        gh issue list -l "yasdb,rkosh,rdnss,sakgames,Project,Language,Tools,Linux"

}

# Development - Tools, Web Development, iOS Development, Android Development, Linux Programming, Language

# Computer Science - Database, Operating System, Networking, Compilers / Interpreters, Algorithms, System Design, MathematiCS

ghconcepts(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mAoL - CONCEPTS\033[0m"
        echo -e "\033[01;35mIncludes :- Database, Operating System, Networking, Compilers, Interpreters, Algorithms, Design, MathematiCS\033[0m"
        gh issue list -l "Database,Operating System,Networking,Compilers,Interpreters,Algorithms,Design,MathematiCS"
}

ghwellness(){
        cbs
        echo ""
        echo ""
        echo -e "\033[01;35mAoL - WELLNESS \033[0m"
        echo -e "\033[01;35mIncludes :- Wellness\033[0m"
        #echo "Milestone - Reading"
        gh issue list -l "Wellness"
}

# all milestones
ghall(){
        cl
        ghmeta
        ghreading
        ghprojects
        ghconcepts
        ghwellness
}
