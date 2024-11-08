from flask import Blueprint, render_template
from .models import Question

views_bp = Blueprint('views', __name__)

@views_bp.route('/')
def index():
    questions = Question.query.all()
    return render_template('index.html', questions=questions)

@views_bp.route('/questions/<int:question_id>')
def view_question(question_id):
    question = Question.query.get_or_404(question_id)
    return render_template('question.html', question=question)
