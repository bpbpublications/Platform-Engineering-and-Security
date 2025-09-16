# security/policy.rego
package kubernetes.admission

deny[msg] {
  input.request.kind.kind == "Pod"
  not input.request.object.spec.securityContext.runAsNonRoot
  msg := "Pods must run as non-root users"
}

deny[msg] {
  input.request.kind.kind == "Pod"
  input.request.object.spec.containers[_].securityContext.privileged
  msg := "Privileged containers are not allowed"
}

