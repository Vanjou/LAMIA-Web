from django.conf.urls import include, url
from django.contrib.auth import views as auth_views
from . import views

app_name = 'carto'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^index/$', views.index, name='index'),
    url(r'^cartes/$', views.AccesCartes, name='cartes'),
    url(r'^outils/$', views.DescriptionOutil, name='outils'),
    url(r'^rapports/$', views.Rapports, name='rapports'),
    url(r'^rapports/(?P<id>\w+)$', views.telecharger, name='telecharger'),
    url(r'^bdd/(?P<id>\w+)$', views.telechargerbdd, name='telechargerbdd'),
    url(r'^calendrier/(?P<month>[+-]?\w+)$', views.CalendrierMonth, name='calendrier'),
    url(r'^calendrier/(?P<month>[+-]?\w+)/(?P<day>[+-]?\w+)$', views.CalendrierJour, name='jour'),
    url(r'^calendrier/$', views.Calendrier, name='calendrier'),
    url(r'^forum/$', views.Forum, name='forum'),
    url(r'^forum/(?P<id>\w+)$', views.Message, name='message'),
    url(r'^forum/delete/(?P<id>\w+)$', views.deleteMessage, name='message'),
    url(r'^connexion/$', views.connexion, name='connexion'),
    url(r'^deconnexion/$', views.deconnexion, name='deconnexion'),
    url(r'^modifPW/(?P<id>\w+)$', views.modifPW, name='modifPW'),
    url(r'^successModifPW/$', views.successModifPW, name='successModifPW'),
    url(r'^mailModifMDP/$', views.mailModifMDP, name='mailModifMDP'),
    url(r'^successMailModifMDP/$', views.successMailModifMDP, name='successMailModifMDP'),
    url(r'^TableauDeBord/$', views.TableauDeBord, name='TableauDeBord'),
    url(r'^troncons/$', views.Troncons, name='Troncons'),
    url(r'^troncons/(?P<id>\w+)$', views.TronconsDetail, name='TronconsDetail'),
    url(r'^noeuds/$', views.Noeuds, name='Noeuds'),
    url(r'^noeuds/(?P<id>\w+)$', views.NoeudsDetail, name='NoeudsDetail'),
    url(r'^equipements/$', views.Equipements, name='Equipements'),
    url(r'^equipements/(?P<id>\w+)$', views.EquipementsDetail, name='EquipementsDetail'),
    url(r'^environnements/$', views.Environnements, name='Environnements'),
    url(r'^environnements/(?P<id>\w+)$', views.EnvironnementsDetail, name='EnvironnementsDetail'),
    url(r'^desordres/$', views.Desordres, name='Desordres'),
    url(r'^desordres/(?P<id>\w+)$', views.DesordresDetail, name='DesordresDetail'),
    url(r'^travaux/$', views.VueTravaux, name='VueTravaux'),
    url(r'^travaux/(?P<id>\w+)$', views.TravauxDetail, name='TravauxDetail'),
    url(r'^interventionTiers/(?P<id>\w+)$', views.InterventionTiersDetail, name='InterventionTiersDetails'),
    url(r'^observations/$', views.VueObservations, name='VueObservations'),
    url(r'^observations/(?P<id>\w+)$', views.ObservationsDetail, name='ObservationsDetail'),
    url(r'^etudes/$', views.Etudes, name='Etudes'),
    url(r'^etudes/(?P<id>\w+)$', views.EtudesDetail, name='EtudesDetail'),
    url(r'^photos/(?P<path>\w+\/\w+\.(gif|png|jpg|jpeg|JPEG|PNG|GIF|JPG))$', views.RenderPhotosName, name='RenderPhotosName'),
]

