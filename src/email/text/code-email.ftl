<#assign ttlMinutes = (ttl / 60)?round>
<#assign brandName = realmName!realm.displayName!realm.name>
${msg("emailCodeBodyHello", username!"")}

${msg("emailCodeBodyIntro", brandName)}

${msg("emailCodeBodyHeader")}: ${code}

${msg("emailCodeBodyExpiresIn", ttlMinutes)}

${msg("emailCodeBodyIgnore")}

--
${msg("emailCodeBodyFooter")}
