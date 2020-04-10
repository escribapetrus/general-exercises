from functools import reduce
# a) Crie uma classe chamada Aluno, com os atributos supracitados. (0,5)
class Aluno:
    def __init__(self,mat,nom,sem_in,sem_at,scr,disp):
        self.matricula = mat
        self.nome = nom
        self.sem_ingresso = sem_in
        self.sem_atual = sem_at
        self.escore = scr
        self.disciplinas = disp
    def __str__(self):
        return self.nome

johnsnow = Aluno(123821,"John Snow","2.2018","2.2020",9.5,["EXA801","TEC502"])
mauricio = Aluno(342343,"Mauricio de Sousa","2.2016","2.2020",7.5,["EXA801","TEC502"])
clara = Aluno(756865,"Maria Clara","1.2017","2.2020",4.5,["EXA801","TEC502"])

# b) Elabore uma função que permita ao colegiado cadastrar as disciplinas ofertadas no semestre
disciplinas = {'EXA801':"Algoritmos e Programação I", 'TEC502':'Concorrência e Conectividade'}

def add_disc(lista):
    codigo = input("Informe o codigo da disciplina: ")
    nome = input("Informe o nome da disciplina: ")
    lista.update({codigo:nome})
# c) Elabore uma função responsável por cadastrar os alunos em um dicionário chamado alunos.
alunos = {'123821':johnsnow,'342343':mauricio,'756865':clara}
def add_aluno(lista,disc):
    try:
        mat = int(input("Informe o codigo da matricula: "))
        nom = input("Informe o nome do aluno: ")
        sem_in = input("Semestre de ingresso: ")
        sem_at = 1.2020 #input("Semestre atual: ")
        scr = float(input("Escore: "))
        print("Lista de disciplinas: ")
        for d in disc:
            print(d,disc[d])
        disp = (input("Informe as disciplinas escolhidas (apenas o código): ")).split(", ")
        alunos.update({mat:Aluno(mat,nom,sem_in,sem_at,scr,disp)})
    except:
        print("Oops,error")
    novo = input("Inserir novo? (sim / nao)")
    if novo == "sim": add_aluno(lista,disc)

# d) Faça uma função que retorne a matrícula do estudante com maior escore
def best_score(alunos):
    best_aluno = reduce(lambda x,y: x if x.escore > y.escore else y,alunos.values())
    return best_aluno
# e) Faça uma função que retorne uma lista com os alunos com escore abaixo de 7
def reprova(alunos):
    reprovados = list(filter(lambda x: x.escore >= 7, alunos.values()))
    return list(map(lambda x: "{} - {} - {}".format(x.nome,x.escore,x.matricula),reprovados))
# f) Faça uma função que gere um arquivo de texto com as informações dos estudantes
def gen_file(alunos,disc):
    f = open('matriculas.txt','w')
    f.write("Semestre Atual: 2019.2\n")
    for a in alunos.values():
        f.write("Estudante Matricula Score Semestre de Ingresso\n")
        f.write("{}\n{}\n{}\n{}".format(a.nome,a.matricula,a.escore,a.sem_ingresso))
        f.write("Disciplinas matriculadas:\n")
        for d in a.disciplinas:
            f.write("{} {}\n".format(d,disc[d]))
    f.close()
# g) No programa principal, o sistema deverá imprimir os resultados retornados

def main():
    add_aluno(alunos, disciplinas)
    al = list(map(lambda x: x.nome,alunos.values()))
    print(al)
    best = best_score(alunos)
    print(best.nome,best.escore,best.matricula)

    rec = reprova(alunos)
    print(rec)

    gen_file(alunos,disciplinas)
main()