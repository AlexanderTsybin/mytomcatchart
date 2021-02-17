{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mytomcat.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mytomcat.python.name" -}}
{{- default .Chart.Name .Values.python.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mytomcat.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "mytomcat.python.fullname" -}}
{{- if .Values.python.fullnameOverride -}}
{{- .Values.python.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.python.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mytomcat.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mytomcat.labels" -}}
name: {{ include "mytomcat.name" . }}
{{- end -}}

{{- define "mytomcat.python.labels" -}}
name: {{ include "mytomcat.python.name" . }}
{{- end -}}

{{/*
Labels to use on {deploy|sts}.spec.selector.matchLabels and svc.spec.selector
*/}}
{{- define "mytomcat.matchLabels" -}}
name: {{ include "mytomcat.name" . }}
{{- end -}}

{{- define "mytomcat.python.matchLabels" -}}
name: {{ include "mytomcat.python.name" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "mytomcat.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "mytomcat.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
