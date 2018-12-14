Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDBDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 19:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B705206C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 19:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbeLNTGu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 14:06:50 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46175 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730410AbeLNTGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 14:06:50 -0500
Received: by mail-vs1-f65.google.com with SMTP id n10so3994989vso.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Dec 2018 11:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=foO/zGMrDk2UO0DeBwcFHLIDCFUSc09oWr0770Gpi40=;
        b=mcPrqK4tfp0rTWe2h8Ke76VJrF5StPiXOLTosGd0sFADFV0P2VBbuks2NEKZ87kKzE
         foW+wEgwSn85fT3oo1UFfpk7Bprm1cNgkluiQw7/NRONtxx4z+Nv2kSdU4en1OFg9u98
         cXa6vIuJiLaf9XkoFmi/gjyo/qlKl/eM62d2mGqHirjIihqmc39EgqHt4K/Nycv45jy/
         7B+ckt1mDxeVVzNo0BgtoyL0zaBnuKLoGxCK9aAbDGV478Aw1Pkbc8XgBFaDr0rBU9MX
         bmkd2nB0jmlBxOsorAL4NSgSboRJfetB7/yxRLdHoZkVnM3naCE3+IDBRbN2ZXnWGiUc
         qylw==
X-Gm-Message-State: AA+aEWaN0fevWAM4I4Pj6yD8mo7kHZta4QnXRsd/DoJkqjQQ2qi38WG9
        kcBAI5s+Vb1X5jBpZKc5gpSTou45MgS+Oqi+0qAA/g==
X-Google-Smtp-Source: AFSGD/WQAYgByFTYRbL3/XU5g9640GwXPCoW218qS+rAKyRqOwsgxGcRc1ysqGUcqI2sKW2rxat5pAPSB6QXiLb6bLw=
X-Received: by 2002:a67:f43:: with SMTP id 64mr1976703vsp.166.1544814409138;
 Fri, 14 Dec 2018 11:06:49 -0800 (PST)
MIME-Version: 1.0
References: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1544772318-17408-1-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Dec 2018 20:06:37 +0100
Message-ID: <CAMuHMdV6UZDtXqj0-bm7OnAtfSa2r8ZRreEJgjJZ6cZb8jThpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Add Standby Mode support
To:     Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan,

On Fri, Dec 14, 2018 at 8:25 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Add function support for Module Standby Mode
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -651,6 +651,32 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>         rcar_du_group_start_stop(rcrtc->group, false);
>  }
>
> +int rcar_du_crtc_standby(struct rcar_du_crtc *rcrtc)
> +{
> +       u32 val_reg;
> +       unsigned int i = 0;
> +
> +       /* Enter Standby mode */
> +       rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN, 0);
> +
> +       for(i = 100; i > 0; i--)
> +       {
> +               val_reg = rcar_du_crtc_read(rcrtc, DSSR);
> +               if(!(val_reg & DSSR_VBK))
> +                       break;
> +               udelay(10);
> +       }
> +
> +       if(!(i > 0))
> +               return -ETIMEDOUT;
> +
> +       /* Stop clock */
> +       clk_set_rate(rcrtc->extclock, 0);
> +       clk_set_rate(rcrtc->clock, 0);

That's not the API to stop a clock.
Why do you set the clock rates to 0?

> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
