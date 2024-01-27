
# Referencias importantes

https://www.kaggle.com/code/jonbown/feedback-prize-feature-engineering
*Este cuaderno efect ́ua ingenier ́ıa de características y es  ́util en el caso de querer ajustar
un modelo simple y en caso de querer interpretabilidad.
https://www.kaggle.com/code/jonbown/feedback-prize-candidate-model-exploration/
notebook.


Una exhaustiva exploraci ́on de m ́etodos de regresi ́on, desde regresi ́on lineal hasta m ́eto-
dos basados en  ́arboles como XGBoost.
https://www.kaggle.com/code/shreydan/deberta-v3-base-accelerate-finetuning
Implementaci ́on base de deBERTa v3 usando la librer ́ıa pytorch de python y aprove-
chando un acelerador por GPU.


https://github.com/rohitsingh02/kaggle-feedback-english-language-learning-1st-place-solution
Los que ganaron el conjunto y realizan un ensamble de cerca de 20 modelos. Proporcionan
m ́ultiples ideas que sirvieron para mejorar el desempe ̃no de la versi ́on base de deberta-V3-
Large.


https://www.kaggle.com/code/cdeotte/rapids-svr-cv-0-450-lb-0-44x/notebook
Este cuaderno muestra como lograr desempe ̃nos excelentes sin entrenar ning ́un par ́ametro
sino con los modelos preentrenados disponibles en hugging face para calcular distintos em-
beddings de los mismos textos y luego pegar esas variables para aplicar un SVR optimizado
para GPU. Fundamental para la estrategia final propuesta.




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
