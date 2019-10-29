# -*- coding: utf-8 -*-
"""
Created on Thu Oct 17 11:43:03 2019

@author: browse
"""
import time
def file_to_tuple(f, closeFile):
    list_tuple=[];
    for x in f:
        _tuple=x.split();
        if len(_tuple)<2:
            continue
        list_tuple.append((int(_tuple[0]),int(_tuple[1])));
    if closeFile: f.close();
    return list_tuple;


def permuted_row_index(x, c1, c2, c3):
    return (c1*x + c2)%c3


def swap_key_value(_tuple):
    return (_tuple[1],_tuple[0])


def value_only_from_tuple(_tuple):
    return _tuple[1]


def group_by_value(list_of_tuple1, list_of_tuple2):
    grouped_tuple_list=[]
    index=-1
    for _tuple in list_of_tuple1:
        for i in range(len(list_of_tuple2)):
            if _tuple[1] in list_of_tuple2[i]:
                _tuple=tuple(set(_tuple + list_of_tuple2[i]))
                index=i
                break
        grouped_tuple_list.append(_tuple)
        if index!=-1:
            list_of_tuple2.pop(index)
            index=-1
    grouped_tuple_list.extend(list_of_tuple2)          
    return grouped_tuple_list


def minhashing(hash_count, list_of_tuple, const1_hash, const2_hash):
#    print(list_of_tuple)
    key=list_of_tuple[0][0]
    minhash=c;
    list_of_minhash=[]
    list_of_value=list(map(value_only_from_tuple, list_of_tuple))
#    print(list_of_value)
    i=0
    while(i<hash_count):
        const1_hash+=2
        const2_hash+=3
        for x in list_of_value:
            temp=permuted_row_index(x, const1_hash, const2_hash, c);
            if minhash>temp:
                 minhash=temp
        list_of_minhash.append(minhash)
        i+=1
#    print(list_of_minhash)
    return list(map(lambda x:(key,x), list_of_minhash))
        


def jaccard_similarity(doc1,doc2):
   val_grpd_tuple_list=group_by_value(doc1,doc2)
   union_cnt=len(val_grpd_tuple_list)
#   print(union_cnt)
   intersection_cnt=len(list(x for x in val_grpd_tuple_list if len(x)>2))
#   print(intersection_cnt)
   return (intersection_cnt/union_cnt)
        



def task1():
    print("comparing 2 documents")
    print("enter ID of the first document:")
    n1=input()
    print("enter ID of the second document:")
    n2=input()
    try:
        doc_id1=int(n1)
        doc_id2=int(n2)
    except:
        raise Exception("Document ID should be numbers")
    
    if doc_id1>no_of_docs or doc_id2>no_of_docs :
        raise Exception("Document IDs should be lesser the total document count which is "+str(no_of_docs))
        
    list_of_tuples= file_to_tuple(f, 1)
    doc1=list(x for x in list_of_tuples if x[0]==doc_id1)
    doc2=list(x for x in list_of_tuples if x[0]==doc_id2)
    print("=======================JACCARD SIMILARITY========================")
    print("With actual document")
    print(jaccard_similarity(doc1,doc2))
    doc1=minhashing(100, doc1, a, b) 
    doc2=minhashing(100, doc2, a, b)   
    print("After minhashing")    
    print(jaccard_similarity(doc1,doc2))


def findingKNN(k):
    print("enter the ID of the document to find KNN")
    n1=input()
    try:
        doc_id=int(n1)
    except:
        raise Exception("Document ID should be number")
        
    if doc_id>no_of_docs :
        raise Exception("Document IDs should be lesser the total document count which is "+str(no_of_docs))
        
    
    list_of_tuples= file_to_tuple(f,0)    
    doc1=list(x for x in list_of_tuples if x[0]==doc_id)   
    doc1=minhashing(100, doc1, a, b)
    
    knn=[]
# =============================================================================
#     for i in range(1, no_of_docs):
#         if i==doc_id:
#             continue
#         print("JACCARD SIMILARITY: "+str(doc_id)+" - "+str(i))
#         doc2=list(x for x in list_of_tuples if x[0]==i)
#         k_neighbour=jaccard_similarity(doc1,doc2);
#         if len(knn)<k:
#             knn.append(k_neighbour)
#             knn.sort()
#         else:
#             m=k
#             while(m!=0):
#                 if(knn[m]<k_neighbour):
#                     knn.insert(m, k_neighbour)
#                     del knn[k]
#                     break;
#                 else:
#                     break;
#                 --m;
# =============================================================================
#    f1=open("docword.enron", "r");
    f1=open("docword.sample", "r")
    f1.readline()
    f1.readline()
    f1.readline()
    old=-1
    try:
        while(1):
            i=0
            list_tuple=[]
            while(1):
                i+=1
                ff=f1.readline().split()
                if int(ff[0]) != old:
                    if i==1:
                        list_tuple.append((int(ff[0]),int(ff[1])));
                        old=int(ff[0])
                    else:
                        break
                else:
                    list_tuple.append((int(ff[0]),int(ff[1])));
                
    #        print("JACCARD SIMILARITY: "+str(doc_id)+" - "+str(list_tuple[0][0]))
            doc2=minhashing(100, list_tuple, a, b)
            k_neighbour=jaccard_similarity(doc1,doc2);
            if len(knn)<k:
                knn.append((k_neighbour,list_tuple[0][0]))
                knn.sort(key=lambda a: a[0])
            else:         
                if knn[k-1]<k_neighbour:
                    knn.insert(k-1, k_neighbour)
                    del knn[k]
                    knn.sort(key=lambda a: a[0])
    except:
        print(knn)
                    
                    
                
    
    
c=28102
a=13011
b=5676
#f=open("docword.enron", "r");
f=open("docword.sample", "r")
no_of_docs=int(f.readline())
f.readline()
f.readline()

print(no_of_docs)
print("enter the value of k, keep the value less than 5:")
input_k=input()
try:
    k=int(input_k)
except:
    raise Exception("value of k should be a number")
#findingKNN(k)
task1()
# =============================================================================
# for i in range(1,no_of_docs):
#     for j in range(i+1, no_of_docs):
#         print("JACCARD SIMILARITY: "+str(i)+" - "+str(j))
#         doc1=list(x for x in list_of_tuples if x[0]==i)
#         doc2=list(x for x in list_of_tuples if x[0]==j)
#         jaccard_similarity(doc1,doc2)
#         doc1=0
#         doc2=0
# =============================================================================
        