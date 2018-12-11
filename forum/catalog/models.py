from django.contrib import auth

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

from untitled1 import settings


class MyModelName(models.Model):
    """A typical class defining a model, derived from the Model class."""

    # Fields
    my_field_name = models.CharField(max_length=20, help_text='Enter field documentation')

    # Metadata


class Post(models.Model):
    author = models.ForeignKey('auth.user', db_column="user", on_delete=models.CASCADE, default=0, null=True)
    title = models.CharField(max_length=300, unique=True)
    text = models.TextField()
    target_date = models.DateField(default=timezone.now, null=False)
    created_date = models.DateTimeField(
        default=timezone.now
    )

    def publish(self):
        self.published_date = timezone.now
        self.save()

    def __str__(self):
        return self.title
#{% url 'post_view' post.target_date__month post.target_date__day %}