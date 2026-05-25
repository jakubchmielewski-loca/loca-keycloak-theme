import { useEffect, useState } from "react";
import type { PageProps } from "keycloakify/login/pages/PageProps";
import { kcSanitize } from "keycloakify/lib/kcSanitize";
import { getKcClsx } from "keycloakify/login/lib/kcClsx";
import type { KcContext } from "../KcContext";
import type { I18n } from "../i18n";

export default function EmailCodePage(
    props: PageProps<Extract<KcContext, { pageId: "email-code-form.ftl" }>, I18n>
) {
    const { kcContext, i18n, doUseDefaultCss, Template, classes } = props;

    const { kcClsx } = getKcClsx({ doUseDefaultCss, classes });

    const { url, messagesPerField } = kcContext;
    const { msg, msgStr } = i18n;

    const codeLength = kcContext.codeLength ?? 6;
    const initialResendIn = kcContext.resendAvailableInSeconds ?? 0;
    const maxAttemptsReached = kcContext.maxAttemptsReached === true;

    const [resendIn, setResendIn] = useState(initialResendIn);

    useEffect(() => {
        if (resendIn <= 0) return;
        const id = setInterval(() => {
            setResendIn(s => (s <= 1 ? 0 : s - 1));
        }, 1000);
        return () => clearInterval(id);
    }, [resendIn]);

    const canResend = resendIn === 0 && !maxAttemptsReached;

    return (
        <Template
            kcContext={kcContext}
            i18n={i18n}
            doUseDefaultCss={doUseDefaultCss}
            classes={classes}
            displayMessage={!messagesPerField.existsError("emailCode")}
            headerNode={msg("doLogIn")}
        >
            <form id="kc-otp-login-form" className={kcClsx("kcFormClass")} action={url.loginAction} method="post">
                <div className={kcClsx("kcFormGroupClass")}>
                    <label htmlFor="emailCode" className={kcClsx("kcLabelClass")}>
                        {msgStr("emailOtpForm", String(codeLength))}
                    </label>
                    <input
                        id="emailCode"
                        name="emailCode"
                        type="text"
                        className={kcClsx("kcInputClass")}
                        autoFocus
                        autoComplete="one-time-code"
                        inputMode="numeric"
                        maxLength={codeLength}
                        disabled={maxAttemptsReached}
                        aria-invalid={messagesPerField.existsError("emailCode")}
                    />
                    {messagesPerField.existsError("emailCode") && (
                        <span
                            id="input-error-otp-code"
                            className={kcClsx("kcInputErrorMessageClass")}
                            aria-live="polite"
                            dangerouslySetInnerHTML={{
                                __html: kcSanitize(messagesPerField.get("emailCode"))
                            }}
                        />
                    )}
                </div>

                <div id="kc-form-buttons" className={kcClsx("kcFormGroupClass")}>
                    {!maxAttemptsReached && (
                        <button
                            className={kcClsx(
                                "kcButtonClass",
                                "kcButtonPrimaryClass",
                                "kcButtonBlockClass",
                                "kcButtonLargeClass"
                            )}
                            name="login"
                            type="submit"
                        >
                            {msgStr("doLogIn")}
                        </button>
                    )}

                    <button
                        className={`${kcClsx(
                            "kcButtonClass",
                            "kcButtonBlockClass",
                            "kcButtonLargeClass"
                        )} kc-button-outline`}
                        name="resend"
                        type="submit"
                        disabled={!canResend}
                    >
                        {canResend
                            ? msgStr("resendCode")
                            : `${msgStr("resendCode")} (${resendIn}s)`}
                    </button>

                    <button
                        className={`${kcClsx(
                            "kcButtonClass",
                            "kcButtonBlockClass",
                            "kcButtonLargeClass"
                        )} kc-button-ghost`}
                        name="cancel"
                        type="submit"
                    >
                        {msgStr("doCancel")}
                    </button>
                </div>
            </form>
        </Template>
    );
}
