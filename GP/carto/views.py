from django.shortcuts import get_object_or_404, render
from django.template import loader
from django.http import HttpResponse
from .models import Messagetiers, Rapport, FileForm, Layer, Utilisateur, Projet, Evenement, Travaux, Desordre, Observation, Infralineaire, Noeud, Environnement, Equipement, Interventiontiers, Ressource, Photo, Etudestrategie, bdd, Intervenant
from django.http import Http404
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.forms import modelform_factory
from django import forms
import os
from django.conf import settings
import datetime
from .forms import LayerForm, ConnexionForm, modifPWForm, demandeModifPWForm, MessageForm
from django.contrib.auth import authenticate, login, logout
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
import random, string
from django.contrib.staticfiles.templatetags.staticfiles import static

def index(request):
    return render(request, 'carto/index.html')

def AccesCartes(request):

    #TUTO POP-UP : https://www.w3schools.com/howto/howto_js_popup.asp

    list_layers_dispo=[]
    list_layers=[]

    if request.user.is_authenticated():
        user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    list_layers_dispo=Layer.objects.using(projet.nomDB).all()

    layerObjects = Layer.objects.using(projet.nomDB).all()

    #On selectionne celles qu'on veut
    if request.method == 'POST':
        try:
            for layer in request.POST.getlist('Layers'):
                try :
                    lay = Layer.objects.using(projet.nomDB).get(id_layer=int(layer))
                    if not layer in list_layers:
                        list_layers=list_layers+[lay]
                except :
                    pass
            form = LayerForm(layers=list_layers_dispo)
            return render(request, 'carto/cartes.html', {'form':form,'list_layers':list_layers, 'list_layers_dispo':list_layers_dispo, 'layerObjects':layerObjects})
        except:
            form = LayerForm(layers=list_layers_dispo)
            return render(request, 'carto/cartes.html', {'form':form,'list_layers':list_layers, 'list_layers_dispo':list_layers_dispo, 'layerObjects':layerObjects})

    else:
        form = LayerForm(layers=list_layers_dispo)
        return render(request, 'carto/cartes.html', {'form':form,'list_layers':list_layers, 'list_layers_dispo':list_layers_dispo, 'layerObjects':layerObjects})

def DescriptionOutil(request):
    return render(request, 'carto/description.html')



def RenderPhotosName(request, path):
    print(path)
    image_file = open('d:/myproject/GP/carto/static/BD/photo/'+path, 'br+')
    image_data = image_file.read()
    image_file.close()
    return HttpResponse(image_data, content_type="image/png")

@login_required(login_url='http://lamia.arteliagroup.com/carto/connexion')
def Rapports(request):

    liste_rapports=[]
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    liste_rapports=Rapport.objects.using(projet.nomDB).all()


    bases_de_donnees=bdd.objects.using(projet.nomDB).all()
    print(len(bases_de_donnees))


    if request.method == 'POST':
        form = FileForm(request.POST, request.FILES)
        if form.is_valid():
            print()
            obj = Objet()
            obj.save()
            res = Ressource()
            res.save()
            rap = Rapport(id_objet=obj, id_ressource=res, libelle = request.POST['libelle'], file = request.FILES['file'])
            rap.save()
        return render(request, 'carto/rapports.html', {'form':form, 'message':'Votre fichier a bien été sauvegardé', 'liste_rapports': liste_rapports, 'bases_de_donnees':bases_de_donnees})
    else:
        form = modelform_factory(Rapport, form=FileForm)
        return render(request, 'carto/rapports.html', {'form':form, 'liste_rapports': liste_rapports, 'bases_de_donnees':bases_de_donnees})

@login_required
def telecharger(request,id):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    f = Rapport.objects.using(projet.nomDB).filter(id_rapport = id).first()
    if f is not None:
      my_file = os.path.join(settings.BASE_DIR, settings.MEDIA_ROOT, f.file.url)
      data = open(my_file, 'rb').read()

      extension = f.file.name[f.file.name.find('.')+1:]
      if extension =='pdf':
        response = HttpResponse(data, content_type='application/pdf')
      elif extension =='xlsx'or extension =='xls' or extension =='doc' or extension =='odt' or extension =='docx'or extension =='ppt' or extension =='pptx' or extension =='txt':
        response = HttpResponse(data, content_type='application/word')
      else :
        response = HttpResponse(data)
      response["Content-Disposition"] = u"attachment; filename={0}.".format(f.libelle)+extension
      return response
    else:
      raise Http404

@login_required
def telechargerbdd(request,id):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    f = bdd.objects.using(projet.nomDB).filter(id_bdd = id).first()
    if f is not None:
      my_file = os.path.join(settings.BASE_DIR, settings.MEDIA_ROOT, f.bdd.url)
      data = open(my_file, 'rb').read()
      response = HttpResponse(data)
      response["Content-Disposition"] = u"attachment; filename={0}.sql".format(f.datecreation)
      return response
    else:
      raise Http404

@login_required
def CalendrierMonth(request, month):
    month = int(month)
    list_evenements = []
    list_dates = []
    user=request.user
    utilisateur= Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    list_events = Evenement.objects.using(projet.nomDB).all()
    list_trav = Travaux.objects.using(projet.nomDB).all()
    list_interv = Interventiontiers.objects.using(projet.nomDB).all()
    for evt in list_events:
        list_evenements = list_evenements+[evt.description]
        list_dates = list_dates+[evt.datecreation]
    for trav in list_trav:
        list_evenements = list_evenements+[trav.libelle]
        list_dates = list_dates+[trav.datedebut]
    for interv in list_interv:
        list_evenements = list_evenements+[interv.libelle]
        list_dates = list_dates+[interv.datedebut]

    calendar=ecrireCalendrier(list_evenements, list_dates, month)
    gantt = ecrireGantt(list_trav, list_interv)

    return render(request, 'carto/calendrier.html', context={'month':month, 'calendrier':calendar, 'gantt':gantt})

@login_required
def Calendrier(request):
    month=0
    list_evenements = []
    list_dates = []
    user=request.user
    utilisateur= Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    list_events = Evenement.objects.using(projet.nomDB).all()
    list_trav = Travaux.objects.using(projet.nomDB).all()
    list_interv = Interventiontiers.objects.using(projet.nomDB).all()
    for evt in list_events:
        list_evenements = list_evenements+[evt.libelle]
        list_dates = list_dates+[evt.datecreation]
    for trav in list_trav:
        if trav.datedebut is not None:
            list_dates = list_dates+[trav.datedebut]
        else :
            list_dates = list_dates+[trav.datecreation]
        list_evenements = list_evenements+[trav.libelle]
    for interv in list_interv:
        if interv.datedebut is not None:
            list_dates = list_dates+[interv.datedebut]
        else :
            list_dates = list_dates+[interv.datecreation]
        list_evenements = list_evenements+[interv.libelle]

    calendar=ecrireCalendrier(list_evenements, list_dates, month)
    gantt = ecrireGantt(list_trav, list_interv)


    return render(request, 'carto/calendrier.html',  context={'month':month, 'calendrier':calendar, 'gantt':gantt})


@login_required
def CalendrierJour(request, month, day):
    list_evenements = []
    list_dates = []
    user=request.user
    utilisateur= Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    list_events = Evenement.objects.using(projet.nomDB).all()
    year = datetime.datetime.now().year
    if datetime.datetime.now().month+int(month)>12 :
        year=year+1
        month = datetime.today.month+int(month)-12
    else :
        month = datetime.datetime.now().month+int(month)

    list_events2=[]
    for evt in list_events:
        if evt.datecreation.day==int(day) and evt.datecreation.month == month and evt.datecreation.year == year:
            list_events2=list_events2+[evt]
    return render(request, 'carto/jour.html', locals())



def Forum(request):

    post=False
    success=False
    if request.method == 'POST':
        post=True
        success=False
        form = MessageForm(request.POST)
        if form.is_valid():
            destinataire=Projet.objects.get(id_projet=request.POST['destinataire'])
            newMessage=Messagetiers.create(request.POST['sender'], destinataire, request.POST['text'], request.POST['objet'], destinataire.nomDB)
            newMessage.save(using=destinataire.nomDB)
            success=True

    list_messages=[]
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    for message in Messagetiers.objects.using(projet.nomDB).all():
            list_messages=list_messages+[message]
    MessageForm.base_fields['destinataire']=forms.ModelChoiceField(queryset=Projet.objects.all(), widget=forms.Select(attrs={'class': 'select2_single form-control', 'blank': 'True'}))
    form=MessageForm()
    form.fields['text'].widget.attrs['style'] = 'width:1000px; height:400px;'
    return render(request, 'carto/forum.html', {'list_messages':list_messages, 'form':form, 'success':success, 'post':post})

@login_required
def Message(request, id):
    user=request.user
    utilisateur= Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    message= Messagetiers.objects.using(projet.nomDB).get(id_messagetiers=id)
    message.lu = True
    message.save(using=projet.nomDB)
    return render(request, 'carto/message.html', {'message':message})

@login_required
def deleteMessage(request,id):
    user=request.user
    utilisateur= Utilisateur.objects.get(id_user=user.id)
    projet=utilisateur.lk_projet
    message= Messagetiers.objects.using(projet.nomDB).get(id_messagetiers=id)
    message.delete(using=projet.nomDB)
    return render(request, 'carto/deleteMessage.html')


def connexion(request):
    error = False
    if request.method == "POST":

        form = ConnexionForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            user = authenticate(username=username, password=password)  # Nous vérifions si les données sont correctes

            if user:  # Si l'objet renvoyé n'est pas None
                login(request, user)  # nous connectons l'utilisateur
            else: # sinon une erreur sera affichée
                error = True

    else:

        form = ConnexionForm()


    return render(request, 'carto/connexion.html', locals())

def ecrireCalendrier(list_evenments, list_dates, month):
    date = datetime.datetime.now()
    jour = date.day
    moi = date.month-1+month
    annee = date.year

    list_dateEv=[]
    m=0
    for date in list_dates:
        if date.month==moi+1 and date.year==annee:
            list_dateEv=list_dateEv+[(list_evenments[m],list_dates[m])]
        m=m+1

    while moi>11:
        moi = moi-12
        annee=annee+1
    while moi<0:
        moi = moi+12
        annee=annee-1
    if annee<=200:
        annee += 1900

    mois = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre']
    jours_dans_moi = [31,28,31,30,31,30,31,31,30,31,30,31]

    if annee%4 == 0 and annee!=1900:
        jours_dans_moi[1]=29

    total = jours_dans_moi[moi]
    date_aujourdui = str(jour)+' '+str(mois[moi])+' '+str(annee)
    dep_j = datetime.datetime(annee,moi+1,1).weekday()+1
    if dep_j>6:
        dep_j=dep_j-7


    res = '<div class="planner"><div class="calendar"><div class="calendar-header"><a href="http://127.0.0.1:8000/carto/calendrier/'+str(month-1)+'" class="btn btn-prev"><i class="icon-angle-left"></i></a>'
    res = res +'<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+str(date_aujourdui)+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="http://127.0.0.1:8000/carto/calendrier/'+str(month+1)+'" class="btn btn-next"><i class="icon-angle-right"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>'
    res = res + '<table><thead><tr><th>Dim</th><th>Lun</th><th>Mar</th><th>Mer</th><th>Jeu</th><th>Ven</th><th>Sam</th></tr></thead></tbody>'
    sem = 0;

    i=1
    while i <= dep_j :
        res=res+'<td class="cal_jours_av_ap">'+str(jours_dans_moi[moi-1]-dep_j+i)+'</td>'
        sem=sem+1
        i=i+1
    i=1

    while i<=total :
        if sem==0:
            res=res+'<tr>'
        if jour==i:
            activ=False
            for evet in list_dateEv:
                if evet[1].day==i:
                    activ = True
            if activ:
                res=res+'<td class="cal_aujourdhui "><a class =  "active" href = "http://127.0.0.1:8000/carto/calendrier/'+str(month)+'/'+str(i)+'">'+str(i)+'</a>'
                for evet in list_dateEv:
                    if evet[1].day==i:
                        res=res+'<br />'+evet[0]
            else :
                res=res+'<td class="cal_aujourdhui"><a href = "http://127.0.0.1:8000/carto/calendrier/'+str(month)+'/'+str(i)+'">'+str(i)+'</a>'
            res=res+'</td>'
        else :
            activ=False
            for evet in list_dateEv:
                if evet[1].day==i:
                    activ = True
            if activ:
                res=res+'<td><a class =  "active" href = "http://127.0.0.1:8000/carto/calendrier/'+str(month)+'/'+str(i)+'">'+str(i)+'</a>'
                for evet in list_dateEv:
                    if evet[1].day==i and evet[0]:
                        res=res+'<br />'+evet[0]
            else :
                res=res+'<td ><a href = "http://127.0.0.1:8000/carto/calendrier/'+str(month)+'/'+str(i)+'">'+str(i)+'</a>'
            res=res+'</td>'
        sem=sem+1
        if sem==7:
            res=res+'</tr>'
            sem=0
        i=i+1
    i=1
    while sem!=0 :
        res=res+'<td class="cal_jours_av_ap">'+str(i)+'</td>'
        sem=sem+1
        i=i+1
        if sem==7:
            res=res+'</tr>'
            sem=0

    res=res+ '</tbody></table></div></div>'

    return res


def ecrireGantt(list_trav, list_interv):
    date = datetime.datetime.now()
    jour = date.day
    moi = date.month-1
    annee = date.year


    #D'abord calculer les lundis des 6 prochains mois
    list_monday=[]
    i=0
    days_ahead = 0-date.weekday()
    d=date+datetime.timedelta(days_ahead)
    list_monday=list_monday+[d.date()]
    while i<53:
        d=d + datetime.timedelta(7)
        list_monday=list_monday+[d.date()]
        i=i+1

    #Ensuite trier les évènements à afficher

    list_Ev=[]
    m=0
    for travaux in list_trav:
        if travaux.datedebut is not None :
            if travaux.datedebut<list_monday[-1] :
                list_Ev=list_Ev+[travaux]
        elif travaux.datefin is not None :
            if travaux.datefin>list_monday[0]:
                list_Ev=list_Ev+[travaux]
        m=m+1
    m=0
    for interv in list_interv:
        if interv.datedebut is not None :
            if interv.datedebut<list_monday[-1] :
                list_Ev=list_Ev+[interv]
        elif interv.datefin is not None :
            if interv.datefin>list_monday[0]:
                list_Ev=list_Ev+[interv]
        m=m+1



    #Pour chaque lundi, pour chaque évènement, si entre date de début et date de fin : colorer la case (construire le tableau en même temps)

    res =  '<div class="planner" style="overflow-x:auto; padding: 20px; background-color: rgba(255,255,255,0.2); color: #fff; width: 70%"><table><thead><tr><th><h2>Semaine:</h2></th>'
    for monday in list_monday :
        res=res+ '<th>'+str(monday.day)+'/'+str(monday.month)+'<br />&nbsp;&nbsp;&nbsp;'+str(monday.year)+'&nbsp;&nbsp;&nbsp;</th>'
    res = res + '</tr></thead>'
    sem = 0

    for evt in list_Ev :
        color = str(random.randint(59,255))+','+str(random.randint(59,109))+','+str(random.randint(59,109))
        res=res+'<tr><td><h2>'+str(evt.libelle)+'</h2></td>'
        debut = False
        fin = evt.datefin is not None
        if fin and evt.datedebut is None :
            debut = True

        for monday in list_monday:
            if debut :
                if fin :
                    res=res+'<td></td>'
                else :
                    if evt.datefin is not None :
                        fin = evt.datefin<monday+ datetime.timedelta(6)
                    res=res+'<td style="background:rgba(0, '+color + ');"></td>'
            else :
                debut = evt.datedebut<monday+ datetime.timedelta(6)
                if debut :
                    res=res+'<td style="background:rgba(0, '+ color+ ');"></td>'
                    if evt.datefin is not None and evt.datedebut is not None:
                        fin =evt.datefin<evt.datedebut+ datetime.timedelta(6)
                else:
                    res=res+'<td></td>'



    res=res+'</tbody></table></div></div></div><br /><br /><br /><br />'

    return res


def deconnexion(request):

    logout(request)
    return redirect(reverse('carto:connexion'))



def modifPW(request, id):
    error = False
    if request.method == "POST":
        form = modifPWForm(request.POST)
        if form.is_valid():
            password1 = form.cleaned_data["password1"]
            password2 = form.cleaned_data["password2"]
            id_user = int(id[34])+int(id[21])*10+int(id[3])*100
            try:
                user = User.objects.using(projet.nomDB).get(id=id_user)
                if password1==password2:
                    user.password=password1
                    user.save()
                    user = authenticate(username=username, password=password1)  # Nous vérifions si les données sont correctes
                    if user:  # Si l'objet renvoyé n'est pas None
                        login(request, user)  # nous connectons l'utilisateur
                        return render(request, 'carto/successModifPW.html')
                    else :
                        error=True
                else: # sinon une erreur sera affichée
                    error = True
            except User.DoesNotExist:
                error = True
    else:

        form = modifPWForm()

    return render(request, 'carto/modifPW.html', locals())

def successModifPW(request):
    return render(request, 'carto/successModifPW.html')

def mailModifMDP(request):
    error = False
    if request.method == "POST":
        form = demandeModifPWForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            try:
                user = User.objects.using(projet.nomDB).get(username=username)
            except User.DoesNotExist:
                error = True
                return render(request, 'carto/mailModifMDP.html', locals())
            id=user.id
            ref="http://127.0.0.1:8000/carto/ModifMDP"
            if id<100 :
                ref=ref+(random.choice(string.ascii_uppercase + string.digits) for _ in range(20))+str(int(id/10))+(random.choice(string.ascii_uppercase + string.digits) for _ in range(12))+str(int(id-int(id/10)*10))+(random.choice(string.ascii_uppercase + string.digits) for _ in range(67))
            elif id>99:
                ref = ref+(random.choice(string.ascii_uppercase + string.digits) for _ in range(2))+str(int(id/100))+(random.choice(string.ascii_uppercase + string.digits) for _ in range(16))+str(int(id/10-10*int(id/100)))+(random.choice(string.ascii_uppercase + string.digits) for _ in range(12))+str(int(id-10*int(id/10)))+(random.choice(string.ascii_uppercase + string.digits) for _ in range(67))

            return render(request, 'carto/successMailModifMDP.html')
    else:
        form = demandeModifPWForm()
    return render(request, 'carto/mailModifMDP.html', locals())

def successMailModifMDP(request):
    return render(request, 'carto/successMailModifMDP.html')

@login_required
def TableauDeBord(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet

    nb_message=0
    nb_messages_new=0
    liste_messages=Messagetiers.objects.using(projet.nomDB).filter(destinataire = projet)
    nb_messages=liste_messages.count()
    for message in liste_messages :
        if not message.lu:
                nb_messages_new=nb_messages_new+1


    nb_troncons=Infralineaire.objects.using(projet.nomDB).all().count()

    nb_equipements=Equipement.objects.using(projet.nomDB).all().count()

    nb_photos=Photo.objects.using(projet.nomDB).all().count()

    nb_cartes=Layer.objects.using(projet.nomDB).all().count()

    nb_element_env=Environnement.objects.using(projet.nomDB).all().count()

    nb_noeuds=Noeud.objects.using(projet.nomDB).all().count()

    nb_desordres=Desordre.objects.using(projet.nomDB).all().count()

    nb_observations=Observation.objects.using(projet.nomDB).all().count()




    start_date = datetime.datetime.now().date()
    end_date = start_date + datetime.timedelta(days=90)
    list_evenements=Evenement.objects.using(projet.nomDB).filter(datecreation__range=(start_date, end_date))
    list_travaux=Travaux.objects.using(projet.nomDB).filter(datecreation__range=(start_date, end_date))

    a_venir = list_evenements.count()+list_travaux.count()

    list_layers_dispo=Layer.objects.using(projet.nomDB).all()
    list_layers=[]
    for layer in list_layers_dispo:
        if not layer in list_layers:
            list_layers=list_layers+[layer]

    return render(request, 'carto/TableauDeBord.html', locals())

@login_required
def Troncons(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    troncons=Infralineaire.objects.using(projet.nomDB).all()
    return render(request, 'carto/troncons.html', locals())

@login_required
def TronconsDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        troncon=Infralineaire.objects.using(projet.nomDB).get(id_infralineaire=int(id))
        list_environnement=Environnement.objects.using(projet.nomDB).filter(lk_lineaire=troncon)
        list_gestionnaire=troncon.id_objet.lk_Intervenant
        list_equipement=Equipement.objects.using(projet.nomDB).filter(lk_lineaire=troncon)
        list_desordre=Desordre.objects.using(projet.nomDB).filter(lk_DescriptionSystem=troncon.id_descriptionsystem)
        list_travaux=Travaux.objects.using(projet.nomDB).filter(lk_observation__lk_desordre__lk_DescriptionSystem=troncon.id_descriptionsystem)
        list_ressource=troncon.id_objet.lk_Ressource
        list_zoneGeo=troncon.id_objet.lk_ZoneGeo

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]



        return render(request, 'carto/tronconsDetail.html', locals())
    except :
        return render(request, 'carto/troncons.html', locals())


@login_required
def Noeuds(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    noeuds=Noeud.objects.using(projet.nomDB).all()
    return render(request, 'carto/noeuds.html', locals())

@login_required
def NoeudsDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        noeud=Noeud.objects.using(projet.nomDB).get(id_noeud=int(id))

        list_environnement=Environnement.objects.using(projet.nomDB).filter(lk_noeud=noeud)
        list_gestionnaire=noeud.id_objet.lk_Intervenant
        list_equipement=Equipement.objects.using(projet.nomDB).filter(lk_noeud=noeud)
        list_desordre=Desordre.objects.using(projet.nomDB).filter(lk_DescriptionSystem=noeud.id_descriptionsystem)
        list_travaux=Travaux.objects.using(projet.nomDB).filter(lk_observation__lk_desordre__lk_DescriptionSystem=noeud.id_descriptionsystem)
        list_ressource=noeud.id_objet.lk_Ressource
        list_zoneGeo=noeud.id_objet.lk_ZoneGeo

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/noeudsDetail.html', locals())
    except :
        return render(request, 'carto/noeuds.html', locals())

@login_required
def Equipements(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    equipements=Equipement.objects.using(projet.nomDB).all()
    return render(request, 'carto/equipements.html', locals())

@login_required
def EquipementsDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        equipement=Equipement.objects.using(projet.nomDB).get(id_equipement=int(id))

        list_gestionnaire=equipement.id_objet.lk_Intervenant
        list_desordre=Desordre.objects.using(projet.nomDB).filter(lk_DescriptionSystem=equipement.id_descriptionsystem)
        list_travaux=Travaux.objects.using(projet.nomDB).filter(lk_observation__lk_desordre__lk_DescriptionSystem=equipement.id_descriptionsystem)
        list_ressource=equipement.id_objet.lk_Ressource
        list_zoneGeo=equipement.id_objet.lk_ZoneGeo
        lineaire=False
        noeud = False
        if equipement.lk_lineaire:
            list_equipement=equipement.lk_lineaire
            lineaire=True
        elif equipement.lk_noeud:
            list_equipement=equipement.lk_noeud
            noeud = True

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/equipementsDetail.html', locals())
    except :
        return render(request, 'carto/equipements.html', locals())

@login_required
def Environnements(request):
    if request.user.is_authenticated():
        user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    environnements=Environnement.objects.using(projet.nomDB).all()
    return render(request, 'carto/environnements.html', locals())

@login_required
def EnvironnementsDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        environnement=Environnement.objects.using(projet.nomDB).get(id_environnement=int(id))

        list_gestionnaire=environnement.id_objet.lk_Intervenant
        list_desordre=Desordre.objects.using(projet.nomDB).filter(lk_DescriptionSystem=environnement.id_descriptionsystem)
        list_travaux=Travaux.objects.using(projet.nomDB).filter(lk_observation__lk_desordre__lk_DescriptionSystem=environnement.id_descriptionsystem)
        list_ressource=environnement.id_objet.lk_Ressource
        list_zoneGeo=environnement.id_objet.lk_ZoneGeo
        lineaire=False
        noeud = False
        if environnement.lk_lineaire:
            list_equipement=environnement.lk_lineaire
            lineaire=True
        elif environnement.lk_noeud:
            list_equipement=environnement.lk_noeud
            noeud = True

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]




        return render(request, 'carto/environnementsDetail.html', locals())
    except :
        return render(request, 'carto/environnements.html', locals())

@login_required
def Desordres(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    desordres=Desordre.objects.using(projet.nomDB).all()
    return render(request, 'carto/desordres.html', locals())

@login_required
def DesordresDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        desordre=Desordre.objects.using(projet.nomDB).get(id_desordre=int(id))

        list_gestionnaire=desordre.id_objet.lk_Intervenant
        list_ressource=desordre.id_objet.lk_Ressource
        list_zoneGeo=desordre.id_objet.lk_ZoneGeo
        list_elem_assoc=desordre.lk_DescriptionSystem

        list_equipements =[]
        list_noeuds=[]
        list_troncons=[]
        list_env=[]

        for equipement in Equipement.objects.using(projet.nomDB).all():
            if equipement.id_descriptionsystem == list_elem_assoc:
                list_equipements=list_equipements+[equipement]
        for environnement in Environnement.objects.using(projet.nomDB).all():
            if environnement.id_descriptionsystem == list_elem_assoc:
                list_env=list_env+[environnement]
        for troncon in Infralineaire.objects.using(projet.nomDB).all():
            if troncon.id_descriptionsystem == list_elem_assoc:
                list_troncons=list_troncons+[troncon]
        for noeud in Noeud.objects.using(projet.nomDB).all():
            if noeud.id_descriptionsystem == list_elem_assoc:
                list_noeuds=list_noeuds+[noeud]





        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/desordresDetail.html', locals())
    except :
        return render(request, 'carto/desordres.html', locals())

@login_required
def VueTravaux(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    travaux=Travaux.objects.using(projet.nomDB).all()
    interventionsTiers=Interventiontiers.objects.using(projet.nomDB).all()
    return render(request, 'carto/travaux.html', locals())

@login_required
def TravauxDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        travaux=Travaux.objects.using(projet.nomDB).get(id_travaux=int(id))
        travauxouinterventiontiers=True
        list_gestionnaire=travaux.id_objet.lk_Intervenant
        list_ressource=travaux.id_objet.lk_Ressource
        list_zoneGeo=travaux.id_objet.lk_ZoneGeo
        list_observations = travaux.lk_observation
        list_elem_assoc=travaux.lk_observation.lk_desordre.lk_DescriptionSystem
        list_etudes=travaux.lk_Etude.all()

        list_equipements =[]
        list_noeuds=[]
        list_troncons=[]
        list_env=[]

        for equipement in Equipement.objects.using(projet.nomDB).all():
            if equipement.id_descriptionsystem == list_elem_assoc:
                list_equipements=list_equipements+[equipement]
        for environnement in Environnement.objects.using(projet.nomDB).all():
            if environnement.id_descriptionsystem == list_elem_assoc:
                list_env=list_env+[environnement]
        for troncon in Infralineaire.objects.using(projet.nomDB).all():
            if troncon.id_descriptionsystem == list_elem_assoc:
                list_troncons=list_troncons+[troncon]
        for noeud in Noeud.objects.using(projet.nomDB).all():
            if noeud.id_descriptionsystem == list_elem_assoc:
                list_noeuds=list_noeuds+[noeud]


        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/travauxDetail.html', locals())
    except :
        return render(request, 'carto/travaux.html', locals())

@login_required
def InterventionTiersDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        travaux=Interventiontiers.objects.using(projet.nomDB).get(id_travaux=int(id))

        list_gestionnaire=travaux.id_objet.lk_Intervenant
        list_ressource=travaux.id_objet.lk_Ressource
        list_zoneGeo=travaux.id_objet.lk_ZoneGeo
        travauxouinterventiontiers=False


        """list_observations = travaux.lk_observation

        list_equipements =[]
        list_noeuds=[]
        list_troncons=[]
        list_env=[]

        for equipement in Equipement.objects.using(projet.nomDB).all():
            if equipement.id_descriptionsystem in list_elem_assoc:
                list_equipements=list_equipements+[equipement]
        for environnement in Environnement.objects.using(projet.nomDB).all():
            if environnement.id_descriptionsystem in list_elem_assoc:
                list_env=list_env+[environnement]
        for troncon in Infralineaire.objects.using(projet.nomDB).all():
            if troncon.id_descriptionsystem in list_elem_assoc:
                list_troncons=list_troncons+[troncon]
        for noeud in Noeud.objects.using(projet.nomDB).all():
            if noeud.id_descriptionsystem in list_elem_assoc:
                list_noeuds=list_noeuds+[noeud]"""


        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/travauxDetail.html', locals())
    except :
        return render(request, 'carto/travaux.html', locals())

@login_required
def VueObservations(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    observations=Observation.objects.using(projet.nomDB).all()
    return render(request, 'carto/observations.html', locals())

@login_required
def ObservationsDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        observation=Observation.objects.using(projet.nomDB).get(id_observation=int(id))

        list_gestionnaire=observation.id_objet.lk_Intervenant
        list_ressource=observation.id_objet.lk_Ressource
        list_zoneGeo=observation.id_objet.lk_ZoneGeo

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]

        return render(request, 'carto/observationsDetail.html', locals())
    except :
        return render(request, 'carto/observations.html', locals())

@login_required
def Etudes(request):
    user = request.user
    utilisateur = Utilisateur.objects.get(id_user=user.id)
    projet = utilisateur.lk_projet
    etudes=Etudestrategie.objects.using(projet.nomDB).all()
    return render(request, 'carto/etudes.html', locals())

@login_required
def EtudesDetail(request, id):
    try :
        user = request.user
        utilisateur = Utilisateur.objects.get(id_user=user.id)
        projet = utilisateur.lk_projet
        etude=Etudestrategie.objects.using(projet.nomDB).get(id_etudestrategie=int(id))

        list_gestionnaire=etude.id_objet.lk_Intervenant
        list_ressource=etude.id_objet.lk_Ressource
        list_zoneGeo=etude.id_objet.lk_ZoneGeo
        list_travaux = etude.lk_Travaux.all()

        list_photos_dispo=Photo.objects.using(projet.nomDB).all()
        list_photos=[]
        for photo in list_photos_dispo:
            if  photo.id_ressource in list_ressource.all() :
                list_photos=list_photos+[photo]


        return render(request, 'carto/etudesDetail.html', locals())
    except :
        return render(request, 'carto/etudes.html', locals())
