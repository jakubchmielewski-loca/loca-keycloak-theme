<#-- Variables provided by keycloak-2fa-email-authenticator: username, code, ttl (seconds) -->
<#assign ttlMinutes = (ttl / 60)?round>
<#assign brandName = realmName!realm.displayName!realm.name>
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${msg("emailCodeSubject", brandName)}</title>
</head>
<body style="margin:0;padding:0;background-color:#f1f5f9;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#242321;">
    <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#f1f5f9;padding:32px 16px;">
        <tr>
            <td align="center">
                <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:520px;background-color:#ffffff;border-radius:16px;overflow:hidden;box-shadow:0 6px 20px rgba(8,33,61,0.08);">
                    <tr>
                        <td style="background:linear-gradient(130deg,#00D4E3,#00A0E3 60%);padding:32px 32px 28px;text-align:center;">
                            <div style="font-size:22px;font-weight:700;color:#ffffff;letter-spacing:0.5px;">${brandName}</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:32px;">
                            <h1 style="margin:0 0 16px;font-size:24px;font-weight:600;color:#0f172a;">${msg("emailCodeBodyHeader")}</h1>
                            <p style="margin:0 0 8px;font-size:15px;line-height:1.5;color:#475569;">${msg("emailCodeBodyHello", username!"")}</p>
                            <p style="margin:0 0 24px;font-size:15px;line-height:1.5;color:#475569;">${msg("emailCodeBodyIntro", brandName)}</p>
                            <div style="margin:0 0 24px;padding:20px 24px;background-color:#f8fafc;border:1px solid #e2e8f0;border-radius:12px;text-align:center;">
                                <div style="font-size:36px;font-weight:700;letter-spacing:0.4em;color:#01a0e2;font-family:'Courier New',monospace;">${code}</div>
                            </div>
                            <p style="margin:0 0 8px;font-size:14px;line-height:1.5;color:#475569;">${msg("emailCodeBodyExpiresIn", ttlMinutes)}</p>
                            <p style="margin:0;font-size:14px;line-height:1.5;color:#94a3b8;">${msg("emailCodeBodyIgnore")}</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:16px 32px 24px;border-top:1px solid #e2e8f0;background-color:#f8fafc;text-align:center;">
                            <p style="margin:0;font-size:12px;color:#94a3b8;">${msg("emailCodeBodyFooter")}</p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
