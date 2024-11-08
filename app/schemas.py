from .extensions import ma
from .models import Question, Answer

class QuestionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Question

class AnswerSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Answer
