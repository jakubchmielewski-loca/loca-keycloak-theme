/* eslint-disable @typescript-eslint/no-unused-vars */
import { i18nBuilder } from "keycloakify/login";
import type { ThemeName } from "../kc.gen";

/** @see: https://docs.keycloakify.dev/features/i18n */
const { useI18n, ofTypeI18n } = i18nBuilder
    .withThemeName<ThemeName>()
    .withCustomTranslations({
        en: {
            doLogout: "Log out",
            logoutConfirmHeader: "Are you sure you want to log out?",
            logoutConfirmTitle: "Logging out",
            resendCode: "Resend code",
            emailOtpForm: "Please enter the {0}-digit code sent to your email."
        },
        pl: {
            doLogout: "Wyloguj się",
            logoutConfirmHeader: "Czy na pewno chcesz się wylogować?",
            logoutConfirmTitle: "Wylogowywanie",
            resendCode: "Wyślij kod ponownie",
            emailOtpForm: "Wpisz {0}-cyfrowy kod, który wysłaliśmy na Twój adres e-mail."
        }
    })
    .build();

type I18n = typeof ofTypeI18n;

export { useI18n, type I18n };
