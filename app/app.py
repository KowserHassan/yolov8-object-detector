from flask import Flask, request, render_template, send_file
from ultralytics import YOLO
import os

app = Flask(__name__)
model = YOLO("yolov8n.pt")  # lightweight object detection model

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        file = request.files['image']
        input_path = 'static/input.jpg'
        output_path = 'static/output.jpg'
        file.save(input_path)

        # Run YOLOv8 inference
        results = model(input_path)
        results[0].save(filename=output_path)
        print(results[0].boxes)

        return render_template('index.html', image_url=output_path)

    return render_template('index.html', image_url=None)

@app.route('/output')
def output():
    return send_file('static/output.jpg', mimetype='image/jpeg')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)


# from flask import Flask, request, render_template, send_file
# from ultralytics import YOLO
# import os

# app = Flask(__name__)
# model = YOLO("yolov8n.pt")

# @app.route('/', methods=['GET', 'POST'])
# def index():
#     detections = []
#     image_url = None

#     if request.method == 'POST':
#         file = request.files['image']
#         input_path = 'static/input.jpg'
#         output_path = 'static/output.jpg'
#         file.save(input_path)

#         results = model(input_path, conf=0.25)
#         results[0].save(filename=output_path)

#         image_url = output_path

#         # Extract detection data (class & confidence)
#         for box in results[0].boxes:
#             cls_id = int(box.cls[0])
#             conf = float(box.conf[0])
#             class_name = model.names[cls_id]
#             detections.append({"class": class_name, "confidence": round(conf, 2)})

#     return render_template("index.html", image_url=image_url, detections=detections)

# @app.route('/output')
# def output():
#     return send_file('static/output.jpg', mimetype='image/jpeg')

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=8080)