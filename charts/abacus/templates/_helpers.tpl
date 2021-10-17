{{/*
Abacus
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "abacus.name" -}}
{{- default .Chart.Name .Values.abacus.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "abacus.fullname" -}}
{{- if .Values.abacus.fullnameOverride }}
{{- .Values.abacus.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{/*- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" */}}
{{- $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "abacus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "abacus.labels" -}}
helm.sh/chart: {{ include "abacus.chart" . }}
{{ include "abacus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "abacus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "abacus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "abacus.serviceAccountName" -}}
{{- if .Values.abacus.serviceAccount.create }}
{{- default (include "abacus.fullname" .) .Values.abacus.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.abacus.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
AbacusConfig
*/}}
{{/*
Expand the name of the chart.
*/}}
{{- define "abacusConfig.name" -}}
{{- default "abacusconfig" .Values.abacusConfig.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "abacusConfig.fullname" -}}
{{- if .Values.abacusConfig.fullnameOverride }}
{{- .Values.abacusConfig.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "abacusconfig" .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "abacusConfig.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "abacusConfig.labels" -}}
helm.sh/chart: {{ include "abacusConfig.chart" . }}
{{ include "abacusConfig.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "abacusConfig.selectorLabels" -}}
app.kubernetes.io/name: {{ include "abacusConfig.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "abacusConfig.serviceAccountName" -}}
{{- if .Values.abacusConfig.serviceAccount.create }}
{{- default (include "abacusConfig.fullname" .) .Values.abacusConfig.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.abacusConfig.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
AbacusPortal
*/}}
{{/*
Expand the name of the chart.
*/}}
{{- define "abacusPortal.name" -}}
{{- default "abacusportal" .Values.abacusPortal.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "abacusPortal.fullname" -}}
{{- if .Values.abacusPortal.fullnameOverride }}
{{- .Values.abacusPortal.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "abacusportal" .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "abacusPortal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "abacusPortal.labels" -}}
helm.sh/chart: {{ include "abacusPortal.chart" . }}
{{ include "abacusPortal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "abacusPortal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "abacusPortal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "abacusPortal.serviceAccountName" -}}
{{- if .Values.abacusPortal.serviceAccount.create }}
{{- default (include "abacusPortal.fullname" .) .Values.abacusPortal.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.abacusPortal.serviceAccount.name }}
{{- end }}
{{- end }}
