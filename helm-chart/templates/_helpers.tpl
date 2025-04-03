{{- define "maven-hello-world.name" -}}
maven-hello-world
{{- end }}

{{- define "maven-hello-world.fullname" -}}
{{ include "maven-hello-world.name" . }}-{{ .Release.Name }}
{{- end }}
