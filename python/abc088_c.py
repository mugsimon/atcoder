def get_grid(n):
    C = []
    for _ in range(0,n):
        row = list(map(int, input().split()))
        C.append(row)
    return C

def get_row(C, row):
    row_C = []
    for _ in range(0,len(C)):
        num = C[row][_]
        row_C.append(num)
    return row_C

def get_col(C, col):
    col_C = []
    for _ in range(0,len(C)):
        num = C[_][col]
        col_C.append(num)
    return col_C

def list_sub(lst1, lst2):
    return list(map(lambda x,y:x-y, lst1, lst2))

def is_list_all_same(lst):
    return lst[1:] == lst[:-1]

def check_grid(C):
    # row
    row0 = get_row(C,0)
    row1 = get_row(C,1)
    row2 = get_row(C,2)
    # col
    col0 = get_col(C,0)
    col1 = get_col(C,1)
    col2 = get_col(C,2)
    # dif
    dif_row01 = list_sub(row0,row1)
    dif_row12 = list_sub(row1,row2)
    dif_col01 = list_sub(col0,col1)
    dif_col12 = list_sub(col1,col2)
    # judge
    jdg_row01 = is_list_all_same(dif_row01)
    jdg_row12 = is_list_all_same(dif_row12)
    jdg_col01 = is_list_all_same(dif_col01)
    jdg_col12 = is_list_all_same(dif_col12)
    return (jdg_row01 and jdg_row12) and (jdg_col01 and jdg_col12)

def abc088_c():
    C = get_grid(3)
    if check_grid(C):
        print("Yes")
    else:
        print("No")
            
abc088_c()
