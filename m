Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7B6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66ACC2086C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbeLPKEq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:04:46 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33907 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPKEq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:04:46 -0500
Received: by mail-vs1-f67.google.com with SMTP id y27so6015443vsi.1;
        Sun, 16 Dec 2018 02:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l25qEx1OPswhxmV6z4JBwL4i4TCerABKKA+QsTaygyA=;
        b=KKyHFAcmi/3d6rpzfVVwDuW9iWW5maZ7i/wsuVayzsUDKBZsSIOKfN2ZisJFotMuff
         51XN08B0IjDRR3p0fGf+1gMW3t6U/yTggwPzO+Z0H05AR1Ck/VIoiQGPPdcMgFKJp019
         Qq2o4mf0tE6G9wG/tegVt+ZrmRphFnRG24lzLzhvDjn6s/OyS5XfgMVPM37yZQk101cY
         8ySGfqNsog3he6O407Vtp11d7hqQhyuMPIu/89jKbywXzqgooCVFrxi8cS7WO2TN5aoI
         hgQCCNYgRvkfCm5GMzmXAD1Qb7ProPL0QjqIiT+r0ifrxE2Gnr+pFshcgKbk9DCGV5SP
         yGjA==
X-Gm-Message-State: AA+aEWZaEZcq60xYT5s/0ymC1apyJqswPt0CELTunVBsPLlpPxMHVrxm
        fneFgUTID1V25/BgJONPgYGvGhPbl5dsMM1Fp+o=
X-Google-Smtp-Source: AFSGD/XPNH2pf7oGBKvvRgolugX1bBgTwcVgl8czfbSphtmjT3b1dbKyIL50X6VQIdL33DY9cEaT6QNcP8pXVjvVyyU=
X-Received: by 2002:a67:d119:: with SMTP id u25mr4273328vsi.63.1544954684830;
 Sun, 16 Dec 2018 02:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com> <CACRpkdbpfxoSiXYskq7FS_Frb_q=TeZ2KNoiC5EPJDUB0tbegg@mail.gmail.com>
In-Reply-To: <CACRpkdbpfxoSiXYskq7FS_Frb_q=TeZ2KNoiC5EPJDUB0tbegg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Dec 2018 11:04:32 +0100
Message-ID: <CAMuHMdU45DoMpuR3_yazRhWWTyyQkDpB05RsG_U9+Bc70fx_zg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output states
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

On Sun, Dec 16, 2018 at 1:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Dec 10, 2018 at 3:22 PM Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
> > R-Car GPIO controller provides two interfaces to set GPIO line output
> > signal state, and for a particular GPIO line the selected interface is
> > determined by OUTDTSEL bit value.
> >
> > At the moment the driver supports only one of two interfaces, namely
> > OUTDT General Output Register is used to control the output signal.
> >
> > While this selection is the default one on reset, it is not explicitly
> > configured on probe, thus it might be possible that kernel and userspace
> > consumers of a GPIO won't be able to set the wanted GPIO output signal.
> >
> > Below is a simple test case to reproduce the described problem and
> > verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
> > configuration from a bootloader:
> >
> >   u-boot    > mw.l 0xe6055440 0x3000 1
> >   ...
> >   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
> >   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger
> >
> > Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
> > Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>
> Patch applied for devel as "non-urgent fix" as I can't see any
> immediate regressions.

Unfortunately the driver now writes unconditionally to a register that does
not exist on R-Car Gen1. Hence please revert the patch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
