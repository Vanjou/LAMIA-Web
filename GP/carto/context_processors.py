from .models import Messagetiers, Utilisateur
from django.contrib.auth import authenticate, login, logout

def NotifContext(request):
	context_data = dict()
	if request.user.is_authenticated():
		user = request.user
		utilisateur = Utilisateur.objects.get(id_user=user.id)
		projet=utilisateur.lk_projet
		liste_messages=Messagetiers.objects.using(projet.nomDB).filter(destinataire = projet)
		context_data['notification_count'] = 0
		context_data['notification_exist'] = False
		for message in liste_messages :
			if not message.lu:
				context_data['notification_count'] = context_data['notification_count']+1
				context_data['notification_exist'] = True
	return context_data