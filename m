Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3543FC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34F0207FF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgLVKIy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Dec 2020 05:08:54 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:45693 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgLVKIy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:08:54 -0500
Received: by mail-oi1-f169.google.com with SMTP id f132so14173972oib.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6PknVp01lPKFWF9kChtkvvYCQ9LYZDIkcbgDvAe4bU=;
        b=fSfnCvya1+HcpbSaBRC70hy2MCs5VNqYFeRyYSxFuGhrVNJ2QXOndsFH0ifjtLtHqW
         2k1cue+tAImLp7g45tMMSWSxOnmSs5Ee95Nt9pQNDv+O4ljvReL4BOO1KFGdgyJs9QPQ
         7ENd8LYm6xXXJ+s74riLyZ1vQWUThVcavI6Ren8w6xR4N3J0WERyz78XSHaRx9S1xXlV
         m3BL9xezEoF7svcVqbE64jy4qRCRgF+/KlS6phBzoiK/qxEm2pRim863FzaAARHm5wb2
         ZlfzkTE8saEHtNKZmpqI8sdc1nvJYM2quG4zKfkPzYjljH5QNeqX2PfWTLMc+nWnppR+
         i8zQ==
X-Gm-Message-State: AOAM532bEuHUazFAf8Y65znip7ICc64+MOnkDJ+saQu7utO3QMQaKjbk
        6NcqrFbtElvcyRBcwvu9e/jz9jANCEYtvEAudRU=
X-Google-Smtp-Source: ABdhPJyardk9lu2syHisED8/FDzjDN5pyyHCkDGI7KiD/YcvqlODEQflGXQ4axadVosUpSfBYN8cs59ihe8gW6iBV7M=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr13756379oia.148.1608631693299;
 Tue, 22 Dec 2020 02:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20201221165541.27679-1-uli+renesas@fpond.eu> <20201221165541.27679-2-uli+renesas@fpond.eu>
In-Reply-To: <20201221165541.27679-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:08:02 +0100
Message-ID: <CAMuHMdUjmher0k5E8iqQ1V0wN78=fr4oAScGT-Ee=dBEFdgH_w@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] pinctrl: renesas: r8a779a0: Add I2C pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds I2C0-6 pins, groups and functions to the R8A779A0 (V3U)
> SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c

> +/* - I2C6 ------------------------------------------------------------------- */
> +static const unsigned int i2c6_pins[] = {
> +       /* SDA6, SCL6 */

Good to see you fixed the comment, too ;-)

> +       RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 14),
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
