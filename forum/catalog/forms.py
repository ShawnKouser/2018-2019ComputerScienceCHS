from django import forms
from .models import Post


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ('title', 'text', 'target_date')


class NewPost(forms.Form):
    title = forms.CharField(label='Title', max_length=50)
    text = forms.CharField(widget=forms.Textarea, label='Content', max_length=280)
