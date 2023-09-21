{{- define "test.labels" -}}
app: nginx-{{ randNumeric 4}}
{{- end }}

{{- define "test.container1" -}}
{{- with .Values.mycontainer1 }}
  - name: {{ .name }}
    image: {{ .image }}
    ports:
      containerPort:
    {{- range .containerPort }}
      - {{ . }}
    {{- end }} 
{{- end -}}
{{- end }}

{{- define "test.container2" -}}
{{- with .Values.mycontainer2 }}
  - name: {{ .name }}
    image: {{ .image }}
    ports:
      containerPort:
    {{- range .containerPort }}
      - {{ . }}
    {{- end }} 
{{- end -}}
{{- end }}