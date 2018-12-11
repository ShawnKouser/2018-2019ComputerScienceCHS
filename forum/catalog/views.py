from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.db.models import Q

from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone

from catalog.forms import PostForm, NewPost
from catalog.models import Post
from django.views import generic


def index(request):
    # View function for home page of site

    # Generate counts of some of the main objects

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=None)


"""Post creation, start of forms"""


def home(request):
    posts = Post.objects.all()
    return render(request, 'home.html', {'posts': posts})


"""
class PostListView(generic.ListView):
    model = Post
    context_object_name = 'my_post_list'
    queryset = Post.objects.filter(title__startswith='First')

    def get_context_data(self, **kwargs):
        context = super(PostListView, self).get_context_data(**kwargs)

        context['some_data'] = 'This is just some data'
        return context
"""


def create_account(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=raw_password)
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                return redirect('login')


    else:
        form = UserCreationForm()
    return render(request, 'create_account.html', {'form': form})


def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'post_detail.html', {'post': post})


@login_required(login_url='../../accounts/login/')
def postNew(request, ):
    form = PostForm()
    return render(request, 'post_new.html', {'form': form})


def create_post(request):
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.created_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'post_edit.html', {'form': form})


@login_required(login_url='accounts/login/')
def postEdit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'post_edit.html', {'form': form})


def post_view(request, month, day):
    posts = Post.objects.all().filter(Q(target_date__day=day) & Q(target_date__month=month))
    return render(request, 'post_view.html', {'posts': posts})


def post_delete(request, pk):
    post = Post.objects.all().filter(pk=pk)
    post.delete()
    return redirect('home')

def personalized_view(request, user):
    posts = Post.objects.all().filter(author=request.user)
    return render(request, 'personalized_view.html', {'posts': posts})