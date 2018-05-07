FROM jupyter/tensorflow-notebook:160eb5183ace

USER root

#ENV NB_USER jovyan
#ENV NB_UID 1000
#ENV HOME /home/${NB_USER}

#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

COPY . ${HOME}
#ADD requerements.txt $HOME
RUN chown -R $NB_USER:$NB_GID $HOME
RUN pip install -r $HOME/requirements.txt


USER $NB_USER
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]