# Trabajo Final Maestría

Este repositorio se enfoca en la creación de varios métodos para la calificación automática de ensayos cortos en inglés. El objetivo principal es identificar las características relevantes presentes en el conjunto de ensayos, depurar su contenido y, al final, asignar calificaciones basadas en los indicadores evaluados, comparando estos resultados con las calificaciones otorgadas por humanos. Para lograr esto, se implementan una variedad de modelos, incluyendo modelos lineales, redes neuronales y transformers.

El conjunto de datos utilizado contiene ensayos argumentativos escritos por estudiantes estadounidenses que aprenden inglés en los grados 6-12, el corpus original se llama ELLIPSE ( English Language Learners Insight, Proficiency and Skills Evaluation). Fue obtenido como material
disponible (conjunto de entrenamiento) en un concurso llamado Feedback prize 3 publicado en 2022 en el sitio web de Kaggle postulado por Georgia State University. https://www.kaggle.com/competitions/feedback-prize-english-language-learning/. 

## Preprocesamiento
En este documento se realiza la exploración de los datos, la extracción de carpacteristicas y el preprocesamiento. Se genera una base de datos tanto de entrenamiento como de prueba que será implementada en los modelos.
Parte de la extracción de caracteristicas está basada en el trabajo realizado por Jonathan Bown que se encuentra en el repositorio: https://www.kaggle.com/code/jonbown/feedback-prize-feature-engineering

## Modelos Lineales
Este script presenta la normalización de las características extraidas, la vectorización de los textos y la predicción de las califiaciones mediante los métodos LBM, regresión lineal y XGBoost.
Parte de los modelos lineales implementados  se basan tambien en el trabajo realizado por Jonathan Bown que se encuentra en el repositorio: https://www.kaggle.com/code/jonbown/feedback-prize-candidate-model-exploration/notebook
## Super Vector Machine
