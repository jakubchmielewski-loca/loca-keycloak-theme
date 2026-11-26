<#-- Variables provided by keycloak-2fa-email-authenticator: username, code, ttl (seconds) -->
<#assign ttlMinutes = (ttl / 60)?round>
<#assign brandName = realmName!realm.displayName!realm.name>
<#import "template.ftl" as layout>
<@layout.emailLayout>
  <div style="padding:0 0 20px;font-family:'Golos Text','Segoe UI',Roboto,Helvetica,Arial,sans-serif;font-size:22px;font-weight:700;line-height:1.3;color:#EFF8FF;">
    ${msg("emailCodeBodyHeader")}
  </div>
  <p style="margin:0 0 16px;">${msg("emailCodeBodyHello", username!"")}</p>
  <p style="margin:0 0 16px;">${msg("emailCodeBodyIntro", brandName)}</p>
  <div style="margin:0 0 24px;padding:20px 24px;background-color:#04131f;border:1px solid #1a4663;border-radius:8px;text-align:center;">
    <div style="font-size:36px;font-weight:700;letter-spacing:0.35em;color:#EFF8FF;font-family:'Courier New',Courier,monospace;">${code}</div>
  </div>
  <p style="margin:0 0 16px;font-size:14px;">${msg("emailCodeBodyExpiresIn", ttlMinutes)}</p>
  <p style="margin:0;font-size:14px;color:#A9BCCA;">${msg("emailCodeBodyIgnore")}</p>
</@layout.emailLayout>
