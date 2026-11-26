<#--
  Shared eduALERT email chrome (ported from edualert mail-layout.ts).
  Standard Keycloak templates import this and call emailLayout.
-->
<#macro emailLayout>
<#assign fontStack = "'Golos Text', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif">
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'pl'}">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="color-scheme" content="dark" />
  <meta name="supported-color-schemes" content="dark" />
  <title>eduALERT</title>
  <!--[if mso]>
  <style type="text/css">
    table { border-collapse: collapse; }
    .email-card { width: 560px !important; }
  </style>
  <![endif]-->
</head>
<body style="margin:0;padding:0;background-color:#04131f;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#04131f;width:100%;">
    <tr>
      <td align="center" style="padding:40px 16px;">
        <!--[if mso]>
        <table role="presentation" width="560" cellpadding="0" cellspacing="0" border="0" align="center"><tr><td>
        <![endif]-->
        <table role="presentation" class="email-card" width="560" cellpadding="0" cellspacing="0" border="0" align="center" style="width:100%;max-width:560px;table-layout:fixed;margin:0 auto;">
          <tr>
            <td align="center" style="padding:0 0 28px;">
              <img src="${url.resourcesUrl}/logo.png" width="166" height="32" alt="eduALERT by LOCA" style="display:block;border:0;outline:none;text-decoration:none;height:32px;width:166px;margin:0 auto;" />
            </td>
          </tr>
          <tr>
            <td style="background-color:#051927;border-radius:12px;overflow:hidden;border:1px solid #1a4663;">
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%;table-layout:fixed;">
                <tr>
                  <td style="height:3px;line-height:3px;font-size:0;background-color:#F5A623;">&nbsp;</td>
                </tr>
              </table>
              <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%;table-layout:fixed;">
                <tr>
                  <td style="padding:32px 32px 36px;font-family:${fontStack};font-size:15px;line-height:1.6;color:#A9BCCA;word-break:break-word;overflow-wrap:anywhere;">
                    <#nested>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td align="center" style="padding:28px 8px 0;font-family:${fontStack};font-size:12px;line-height:1.5;color:#A9BCCA;">
              System obsługi <span style="color:#F5A623;font-weight:600;">ALERTÓW</span> dla oświaty<br />
              <span style="color:#1a4663;">—</span><br />
              eduALERT by LOCA
            </td>
          </tr>
        </table>
        <!--[if mso]>
        </td></tr></table>
        <![endif]-->
      </td>
    </tr>
  </table>
</body>
</html>
</#macro>
