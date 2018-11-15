
from __future__ import unicode_literals
import datetime
from django.contrib import admin
from django.db import models
from django.utils import timezone
from django.core.files import File
from django.forms import ModelForm
from django.contrib.auth.models import User
import datetime



class Data(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)

    class Meta:
        db_table = 'data'
        managed=False


class DataRessource(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255, blank=True)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    file = models.FileField()
    description = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')

    class Meta:
        db_table = 'data_ressource'
        managed=False


class DataSysteme(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    importancestrat = models.CharField(max_length=255, blank=True, null=True)
    etatfonct = models.CharField(max_length=255, blank=True, null=True)
    datederniereobs = models.DateField(blank=True, null=True)
    qualitegeoloc = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')

    class Meta:
        db_table = 'data_systeme'
        managed=False



class Descriptionsystem(models.Model):
    id_descriptionsystem = models.AutoField(primary_key=True)

    def __str__(self):
        return str(self.id_descriptionsystem)

    class Meta:
        db_table = 'descriptionsystem_django'


class Projet(models.Model):
    id_projet = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=255)
    datatype = models.CharField(max_length=255)
    version = models.DecimalField(max_digits=999, decimal_places=500)
    dateversion = models.DateField()
    referantartelia = models.CharField(max_length=255, blank=True, null=True)
    contactartelia = models.CharField(max_length=255, blank=True, null=True)
    client = models.CharField(max_length=255, blank=True, null=True)
    localisation = models.CharField(max_length=255, blank=True, null=True)
    contactclient = models.CharField(max_length=255, blank=True, null=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    nomDB = models.CharField(max_length=255)

    def __str__(self):
        return self.nom

    class Meta:
        db_table = 'projet'

admin.site.register(Projet)

class Ressource(models.Model):
    id_ressource = models.AutoField(primary_key=True)
    lk_objet = models.ManyToManyField('Objet', through='Tcobjetressource', blank=True, related_name="ressources_associees")


    def __str__(self):
        return str(self.id_ressource)

    class Meta:
        db_table = 'ressource_django'



class Siartelia(models.Model):
    id_siartelia = models.AutoField(primary_key=True)

    def __str__(self):
        return str(self.id_siartelia)

    class Meta:
        db_table = 'siartelia'

admin.site.register(Siartelia)


class Utilisateur(models.Model):
    id_utilisateur = models.AutoField(primary_key=True)
    id_user = models.ForeignKey(User, db_column='id')
    lk_projet = models.ForeignKey(Projet, db_column='lk_projet')

    def __str__(self):
        return self.id_user.username

    class Meta:
        db_table = 'utilisateur'

admin.site.register(Utilisateur)

class Objet(models.Model):
    id_objet = models.AutoField(primary_key=True)
    lk_ZoneGeo = models.ManyToManyField('zonegeo', through='Tcobjetzonegeo', blank=True, related_name="emprise")
    lk_Intervenant = models.ManyToManyField('Intervenant', through='Tcobjetintervenant', blank=True, related_name="intervenant_associe")
    lk_Ressource = models.ManyToManyField('Ressource', through='Tcobjetressource', blank=True, related_name="ressources_associees")

    class Meta:
        db_table = 'objet_django'



    def __str__(self):
        return str(self.id_objet)



class Marche(models.Model):
    id_marche = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)

    def __str__(self):
        return self.libelle

    class Meta:
        db_table = 'marche_django'


admin.site.register(Marche)
class Etudestrategie(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_etudestrategie = models.AutoField(primary_key=True)
    investissements = models.CharField(max_length=255)
    chronologie = models.CharField(max_length=255)
    note = models.CharField(max_length=255)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)
    lk_Travaux = models.ManyToManyField('Travaux', through='Tcetudetravaux', blank=True)

    class Meta:
        db_table = 'etudestrategie_django'

    def __str__(self):
        return self.libelle




class Evenement(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_evenement = models.AutoField(primary_key=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    gravite = models.IntegerField()
    ref = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')

    class Meta:
        db_table = 'evenement_django'

    def __str__(self):
        return self.libelle

admin.site.register(Evenement)


class Intervenant(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_intervenant = models.AutoField(primary_key=True)
    societe = models.CharField(max_length=255, blank=True, null=True)
    adresse = models.CharField(max_length=255, blank=True, null=True)
    fax = models.CharField(max_length=255, blank=True, null=True)
    tel = models.CharField(max_length=255, blank=True, null=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    lk_Objet = models.ManyToManyField('Objet', through='Tcobjetintervenant', blank=True, related_name="intervenant_associe")

    class Meta:
        db_table = 'intervenant_django'

    def __str__(self):
        return self.libelle


class Zonegeo(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_zonegeo = models.AutoField(primary_key=True)
    pays = models.CharField(max_length=255, blank=True, null=True)
    region = models.CharField(max_length=255, blank=True, null=True)
    commune = models.CharField(max_length=255, blank=True, null=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    populations = models.CharField(max_length=255, blank=True, null=True)
    contextesocioeco = models.CharField(max_length=255, blank=True, null=True)
    importancesociale = models.IntegerField()
    importanceindustrielle = models.IntegerField()
    geometry = models.BinaryField(db_column='geom')
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    lk_objet = models.ManyToManyField('objet', through='Tcobjetzonegeo', blank=True, related_name="emprise")

    class Meta:
        db_table = 'zonegeo_django'

    def __str__(self):
        return self.libelle




class Modele(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    file = models.FileField()
    description = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_modele = models.AutoField(primary_key=True)
    logiciel = models.CharField(max_length=255)
    scenario = models.CharField(max_length=255, blank=True, null=True)
    conclusions = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    id_ressource = models.ForeignKey('Ressource', db_column='id_ressource')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)

    class Meta:
        db_table = 'modele_django'

    def __str__(self):
        return self.libelle

admin.site.register(Modele)



class Photo(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    file = models.FileField()
    description = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_photo = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_ressource = models.ForeignKey('Ressource', db_column='id_ressource')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)

    class Meta:
        db_table = 'photo_django'

    def __str__(self):
        return self.libelle

admin.site.register(Photo)


class Desordre(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_desordre = models.AutoField(primary_key=True)
    impact = models.CharField(max_length=255, blank=True, null=True)
    gravite = models.IntegerField(blank=True)
    priorite = models.IntegerField(blank=True)
    risques = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    lk_DescriptionSystem = models.ForeignKey('Descriptionsystem', db_column='lk_descriptionsystem')
    cote = models.CharField(max_length=255, blank=True, null=True)
    position = models.CharField(max_length=255, blank=True, null=True)
    catdes = models.CharField(max_length=255, blank=True, null=True)
    typedes = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'desordre_django'

    def __str__(self):
        return self.libelle


class Observation(models.Model):
    id_observation = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)
    lk_desordre = models.ForeignKey(Desordre, db_column='lk_desordre', blank=True, null=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    commentaires = models.CharField(max_length=255, blank=True, null=True)
    evolution = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateField(default=datetime.datetime.now, blank=True, db_column='dateobservation')
    source = models.CharField(max_length=255, blank=True, null=True)
    nombre = models.IntegerField(blank=True, default=1)
    suite = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'observation_django'

    def __str__(self):
        return self.libelle

admin.site.register(Observation)


class Travaux(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    id_travaux = models.AutoField(primary_key=True)
    urgence = models.CharField(max_length=255, blank=True, null=True)
    phase = models.CharField(max_length=255, blank=True, null=True)
    estimationduree = models.CharField(max_length=255, blank=True, null=True)
    estimationcouts = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    estimationecheance = models.DateField(blank=True, null=True, db_column='dateestimationecheance')
    datedebut = models.DateField(blank=True, null=True)
    datefin = models.DateField(blank=True, null=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    lk_observation = models.ForeignKey(Observation, db_column='lk_observation')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)
    lk_Etude = models.ManyToManyField('Etudestrategie', through='Tcetudetravaux', blank=True)

    class Meta:
        db_table = 'travaux_django'

    def __str__(self):
        return self.libelle


class Interventiontiers(models.Model):
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_interventiontiers = models.AutoField(primary_key=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    urgence = models.CharField(max_length=255, blank=True, null=True)
    phase = models.CharField(max_length=255, blank=True, null=True)
    estimationduree = models.CharField(max_length=255, blank=True, null=True)
    estimationcouts = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    estimationecheance = models.DateField(blank=True, null=True, db_column='dateestimationecheance')
    datedebut = models.DateField(blank=True, null=True)
    datefin = models.DateField(blank=True, null=True)

    class Meta:
        db_table = 'interventiontiers_django'

    def __str__(self):
        return self.libelle

class Infralineaire(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    importancestrat = models.CharField(max_length=255, blank=True, null=True)
    etatfonct = models.CharField(max_length=255, blank=True, null=True)
    datederniereobs = models.DateField(blank=True, null=True)
    qualitegeoloc = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_infralineaire = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    id_descriptionsystem = models.ForeignKey(Descriptionsystem, db_column='id_descriptionsystem')
    lk_noeud1 = models.ForeignKey('Noeud', db_column='lk_noeud1', blank=True, null=True, related_name='lk_noeud1')
    lk_noeud2 = models.ForeignKey('Noeud', db_column='lk_noeud2', blank=True, null=True, related_name='lk_noeud2')

    class Meta:
        db_table = 'infralineaire_django'

    def __str__(self):
        return self.libelle

admin.site.register(Infralineaire)



class Noeud(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    importancestrat = models.CharField(max_length=255, blank=True, null=True)
    etatfonct = models.CharField(max_length=255, blank=True, null=True)
    datederniereobs = models.DateField(blank=True, null=True)
    qualitegeoloc = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_noeud = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    id_descriptionsystem = models.ForeignKey(Descriptionsystem, db_column='id_descriptionsystem')

    class Meta:
        db_table = 'noeud_django'

    def __str__(self):
        return self.libelle

admin.site.register(Noeud)



class Environnement(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    importancestrat = models.CharField(max_length=255, blank=True, null=True)
    etatfonct = models.CharField(max_length=255, blank=True, null=True)
    datederniereobs = models.DateField(blank=True, null=True)
    qualitegeoloc = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_environnement = models.AutoField(primary_key=True)
    #noeudoulineaire = models.BooleanField()
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    id_descriptionsystem = models.ForeignKey(Descriptionsystem, db_column='id_descriptionsystem')
    lk_noeud = models.ForeignKey('Noeud', db_column='lk_noeud', blank=True, null=True)
    lk_lineaire = models.ForeignKey('Infralineaire', db_column='lk_infralineaire', blank=True, null=True)

    class Meta:
        db_table = 'environnement_django'
        #managed = False

    def __str__(self):
        return self.libelle

admin.site.register(Environnement)


class Equipement(models.Model):
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    id_descriptionsystem = models.ForeignKey(Descriptionsystem, db_column='id_descriptionsystem')
    lk_noeud = models.ForeignKey('Noeud', db_column='lk_noeud', blank=True, null=True)
    lk_lineaire = models.ForeignKey('Infralineaire', db_column='lk_infralineaire', blank=True, null=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    importancestrat = models.CharField(max_length=255, blank=True, null=True)
    etatfonct = models.CharField(max_length=255, blank=True, null=True)
    datederniereobs = models.DateField(blank=True, null=True)
    qualitegeoloc = models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    parametres = models.CharField(max_length=255, blank=True, null=True)
    listeparametres = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    id_equipement = models.AutoField(primary_key=True)
    cote = models.CharField(max_length=255, blank=True, null=True)
    position = models.CharField(max_length=255, blank=True, null=True)
    categorie = models.CharField(max_length=255, blank=True, null=True)
    type_equipement = models.CharField(max_length=255, blank=True, null=True, db_column='typeequipement')
    implantation = models.CharField(max_length=255, blank=True, null=True)
    ecoulement = models.CharField(max_length=255, blank=True, null=True)
    utilisation = models.CharField(max_length=255, blank=True, null=True)
    dimverti = models.CharField(max_length=255, blank=True, null=True)
    dimhori = models.CharField(max_length=255, blank=True, null=True)
    securite = models.CharField(max_length=255, blank=True, null=True)
    #noeudoulineaire = models.BooleanField()


    class Meta:
        db_table = 'equipement_django'

    def __str__(self):
        return self.libelle

admin.site.register(Equipement)



class Messagetiers(models.Model):
    id_messagetiers = models.AutoField(primary_key=True)
    pub_date = models.DateTimeField('date published')
    objet = models.CharField(max_length=200, default="")
    sender =models.CharField(max_length=75, default ="")
    text = models.CharField(max_length=200, default="")
    destinataire = models.CharField(max_length=255, blank=True, null=True)
    lu = models.BooleanField(default=False)
    id_objet = models.ForeignKey('Objet', db_column='id_objet')

    class Meta:
        db_table = 'messagetiers'
    def __str__(self):
        return self.objet
    @classmethod
    def create(cls, sender, destinataire, text, objet, nomDB):
        newObjet=Objet()
        newObjet.save(using=nomDB)
        newMessage = cls(sender=sender, destinataire=destinataire, text=text, objet=objet, lu=False,id_objet=newObjet, pub_date=datetime.datetime.now())
        return newMessage


admin.site.register(Messagetiers)


class Layer(models.Model):
    name = models.CharField(max_length=200, default ="")
    ref = models.CharField(max_length=200, default ="")
    store = models.CharField(max_length=200, default ="")
    id_objet = models.ForeignKey('Objet', db_column='id_objet')
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255, blank=True)
    id_layer = models.AutoField(primary_key=True)
    datecreation = models.DateField(default=datetime.datetime.now)
    datedestruction = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.name    
    class Meta:
        db_table = 'carto_layer_django'

admin.site.register(Layer)




class Rapport(models.Model):
    id_rapport = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_ressource = models.ForeignKey('Ressource', db_column='id_ressource')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255, blank=True)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(blank=True, db_column='geom')
    file = models.FileField()

    def __str__(self):
        return self.libelle

    class Meta:
        db_table = 'rapport_django'


admin.site.register(Rapport)



class FileForm(ModelForm):
    class Meta:
        model = Rapport
        fields=['libelle', 'file']


class Topographie(models.Model):
    id_topographie = models.AutoField(primary_key=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255, blank=True)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    geometry = models.BinaryField(db_column='geom')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)

    def __str__(self):
        return self.libelle

    class Meta:
        db_table = 'topographie_django'


admin.site.register(Topographie)

class PointTopo(models.Model):
    id_pointTopo = models.AutoField(primary_key=True)
    x= models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    y= models.DecimalField(max_digits=999, decimal_places=500, blank=True, null=True)
    precision = models.CharField(max_length=255, blank=True, null=True)
    data_type = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_topogragphie = models.ForeignKey('Topographie', db_column='id_topographie')

    def __str__(self):
        return str(self.id_pointTopo)

    class Meta:
        db_table = 'point_topo'


admin.site.register(PointTopo)


class Rasters(models.Model):
    id_rasters= models.AutoField(primary_key=True)
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    datedestruction = models.DateField(blank=True)
    commentaire = models.CharField(max_length=255, blank=True)
    libelle = models.CharField(max_length=255)
    source = models.CharField(max_length=255, blank=True, null=True)
    contactadresse = models.CharField(max_length=255, blank=True, null=True)
    contactnom = models.CharField(max_length=255, blank=True, null=True)
    contactmail = models.CharField(max_length=255, blank=True, null=True)
    contacttel1 = models.CharField(max_length=255, blank=True, null=True)
    contacttel2 = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    geometry = models.BinaryField(db_column='geom')
    type = models.CharField(max_length=255, blank=True, null=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_ressource = models.ForeignKey('Ressource', db_column='id_ressource')
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)

    def __str__(self):
        return self.libelle

    class Meta:
        db_table = 'rasters_django'

admin.site.register(Rasters)



class bdd(models.Model):
    datecreation = models.DateField(default=datetime.datetime.now, blank=True)
    libelle = models.CharField(max_length=255, blank=True)
    source = models.CharField(max_length=255)
    id_bdd = models.AutoField(primary_key=True)
    id_objet = models.ForeignKey(Objet, db_column='id_objet')
    id_ressource = models.ForeignKey('Ressource', db_column='id_ressource')
    bdd = models.FileField()
    lk_marche = models.ForeignKey(Marche, db_column='lk_marche', blank=True, null=True)

    def __str__(self):
        return str(self.datecreation)

    class Meta:
        db_table = 'bdd_django'

admin.site.register(bdd)




admin.site.register(Desordre)




class Tcetudetravaux(models.Model):
    id_tcetudetravaux = models.AutoField(primary_key=True)
    id_etudestrategie = models.ForeignKey(Etudestrategie, db_column='id_tcetudestrategie')
    id_travaux = models.ForeignKey('Travaux', db_column='id_tctravaux')
    dateprogrammation = models.DateField()

    class Meta:
        db_table = 'tcetudetravaux'

class TcetudetravauxInline(admin.TabularInline):
    model = Tcetudetravaux

class EtudeAdmin(admin.ModelAdmin):
    inlines=(TcetudetravauxInline,)


admin.site.register(Etudestrategie, EtudeAdmin)



class TravauxAdmin(admin.ModelAdmin):
    inlines=(TcetudetravauxInline,)

admin.site.register(Travaux, TravauxAdmin)
admin.site.register(Descriptionsystem)




class Tcobjetintervenant(models.Model):
    id_tcobjetintervenant = models.AutoField(primary_key=True)
    id_tcintervenant = models.ForeignKey(Intervenant, db_column='id_tcintervenant')
    id_tcobjet = models.ForeignKey(Objet, db_column='id_tcobjet')
    gestionnaireouproprietaireouprestataire = models.CharField(max_length=255, default='0')

    class Meta:
        db_table = 'tcobjetintervenant'



class TcobjetintervenantInline(admin.TabularInline):
    model = Tcobjetintervenant



class IntervenantAdmin(admin.ModelAdmin):
    inlines=(TcobjetintervenantInline,)

admin.site.register(Intervenant, IntervenantAdmin)




class Tcobjetressource(models.Model):
    id_tcobjetressource = models.AutoField(primary_key=True)
    id_tcressource = models.ForeignKey(Ressource, db_column='id_tcressource')
    id_tcobjet = models.ForeignKey(Objet, db_column='id_tcobjet')

    class Meta:
        db_table = 'tcobjetressource'

class TcobjetressourceInline(admin.TabularInline):
    model = Tcobjetressource

class RessourceAdmin(admin.ModelAdmin):
    inlines=(TcobjetressourceInline,)

admin.site.register(Ressource, RessourceAdmin)





class Tcobjetzonegeo(models.Model):
    id_tcobjetzonegeo = models.AutoField(primary_key=True)
    id_tczonegeo = models.ForeignKey('Zonegeo', db_column='id_tczonegeo')
    id_tcobjet = models.ForeignKey(Objet, db_column='id_tcobjet')
    zoneTraverseeOuMenacee = models.CharField(max_length=255, default='0')

    class Meta:
        db_table = 'tcobjetzonegeo'



class TcobjetzonegeoInline(admin.TabularInline):
    model = Tcobjetzonegeo

class ObjetAdmin(admin.ModelAdmin):
    inlines=(TcobjetintervenantInline,TcobjetressourceInline,TcobjetzonegeoInline)

class ZonegeoAdmin(admin.ModelAdmin):
    inlines=(TcobjetzonegeoInline,)

admin.site.register(Zonegeo, ZonegeoAdmin)
admin.site.register(Objet, ObjetAdmin)
