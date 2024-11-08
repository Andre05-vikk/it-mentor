from flask import Blueprint, request, jsonify
from .extensions import db
from .models import Question, Answer
from .schemas import QuestionSchema, AnswerSchema

api_bp = Blueprint('api', __name__)
question_schema = QuestionSchema()
answer_schema = AnswerSchema()
questions_schema = QuestionSchema(many=True)
answers_schema = AnswerSchema(many=True)

@api_bp.route('/questions', methods=['POST'])
def add_question():
    content = request.json.get('content')
    question = Question(content=content)
    db.session.add(question)
    db.session.commit()
    return question_schema.jsonify(question), 201

@api_bp.route('/questions/<int:question_id>/answers', methods=['POST'])
def add_answer(question_id):
    content = request.json.get('content')
    answer = Answer(content=content, question_id=question_id)
    db.session.add(answer)
    db.session.commit()
    return answer_schema.jsonify(answer), 201
