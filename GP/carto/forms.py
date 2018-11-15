from django import forms
from .models import Layer, Messagetiers, Projet
from django.forms import ModelForm, ModelChoiceField
from django.utils.translation import ugettext_lazy as _

class UploadFileForm(forms.Form):
    name = forms.CharField(label='Nom du fichier', max_length=100)
    file = forms.FileField()

class LayerForm(forms.Form):
    def __init__(self,layers, *args, **kwargs):
        super(LayerForm, self).__init__(*args, **kwargs)
        self.fields['Layers'] = forms.MultipleChoiceField(choices=[ (o.id_layer, o) for o in layers], widget=forms.CheckboxSelectMultiple)

class ConnexionForm(forms.Form):
    username = forms.CharField(label="Nom d'utilisateur", max_length=30)
    password = forms.CharField(label="Mot de passe", widget=forms.PasswordInput)


class demandeModifPWForm(forms.Form):
    username = forms.CharField(label="Nom d'utilisateur", max_length=30)

class modifPWForm(forms.Form):
    password1 = forms.CharField(label="Nouveau mot de passe", widget=forms.PasswordInput)
    password2 = forms.CharField(label="Répétez votre nouveau mot de passe", widget=forms.PasswordInput)



class MessageForm(ModelForm):

	class Meta:
		model = Messagetiers
		fields = ['objet', 'sender', 'text', 'destinataire']
		labels = {'objet': _('Objet :'),'sender': _('Expéditeur :'), 'text': _('Message :'), 'destinataire': _('Projet concerné :')}