def past202004_b():
    vote_str=input()
    na = vote_str.count("a")
    nb = vote_str.count("b")
    nc = vote_str.count("c")
    max_vote = max(na, nb, nc)
    if na == max_vote:
        print("a")
    elif nb == max_vote:
        print("b")
    elif nc == max_vote:
        print("c")
    else:
        print("")

past202004_b()

            
    
