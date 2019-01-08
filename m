Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E40C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 036142070B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfAHI4k convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 03:56:40 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33091 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfAHI4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 03:56:40 -0500
Received: by mail-ua1-f67.google.com with SMTP id t8so1033738uap.0;
        Tue, 08 Jan 2019 00:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XoCP2Qfisl0ncZQehJWz2vrRE6NONyGvq9BD7g7hIAQ=;
        b=AVmncSD2EEfvKNdeaqD+6y1y3zBFD2Zm65pZfqoDQyvDP60kY3x8pVLR1U1oua2+QA
         H19LvDBxE8R3ybGiCxp/a/K2NssGXykPPz5IKziP3/pbSyCyEbLwIcK3KGpXd9hg9dLh
         jXYwU15sL6vacqovvMETqJ6nqXPSmqFU8BNOzH8GcurlTxFX4X3mBWAbtLCU+ebQKiH6
         +iNYggVoOCsCCzpsQEE4sdQsaFn5XQwxiyGZOPeGWqVDD/d2gV43DiwxvrI5vseiljSi
         Dkz4NtGD7eVt+MvmuxDENMdz6hQ2TPHe/mkcZZ5Uc1RodouDDUPnq4SgW1egG0Aa7EAC
         cerg==
X-Gm-Message-State: AJcUukc8TkiyHYLe14a2fw1r5+Yk4aYYMl1XkmE0lXdSRnqd0pNOT1I5
        C5Hc8QueoVRywc8dOkuO5H496lE/GgSe/90Mcf8=
X-Google-Smtp-Source: ALg8bN4HMJCikKjIQAD2PlJ7ZJ2tkqMB4XiEurv4SS5xwV6lXVT71wfNxtsiQvltvoJRkp72wMiZLfY8iEA+Z1Nw84A=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr281906uad.78.1546937799610;
 Tue, 08 Jan 2019 00:56:39 -0800 (PST)
MIME-Version: 1.0
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
In-Reply-To: <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jan 2019 09:56:28 +0100
Message-ID: <CAMuHMdUdrfjUHzOZr25a4JsRNK34KL8kA1s1G+BrpRzZgtB-7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

On Tue, Jan 8, 2019 at 8:48 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> Orthogonal to this patch I wonder what the intended behaviour for a pwm
> is on suspend. Should it stop oscilating unconditionally? Or should it
> only stop if the consumer stops it as part of its own suspend callback?

I guess you mean system suspend, not runtime suspend, as the device is
runtime-resumed when a PWM is requested?

Permitted behavior depends on the system: on R-Car Gen3 (arm64), PSCI system
suspend will power down the SoC, so PWM output will stop for sure.

On R-Car Gen2 (or R-Car Gen3 with s2idle instead of s2ram), the PM Domain
code will turn of the PWM module's clock. Hence it will stop oscillating, unless
you take special countermeasures, like for modules that need to stay powered
for wake-up handling.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
