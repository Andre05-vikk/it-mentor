from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# Placeholder for saved questions
questions = []

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit_question', methods=['POST'])
def submit_question():
    question_text = request.json.get('question', '').strip()

    if question_text and len(question_text) <= 1000:
        questions.append(question_text)
        return jsonify({'success': True, 'message': 'Question added successfully!'})
    else:
        return jsonify({'success': False, 'message': 'Question is empty or exceeds 1000 characters.'}), 400

if __name__ == '__main__':
    app.run(debug=True)
