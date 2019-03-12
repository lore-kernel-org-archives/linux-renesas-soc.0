Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890A7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D2632147C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfCLJuM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 05:50:12 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40011 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfCLJuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 05:50:11 -0400
Received: by mail-ua1-f68.google.com with SMTP id t7so562748uap.7;
        Tue, 12 Mar 2019 02:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bjDSxQahRLHh8obHPyv9Wm/+wmFEKI9I6nhj70bjmbA=;
        b=AkiS0GlSd4+D8H+vYBJDchhxzXH/7ewZmw4LAFkei/8io1EqIeqte2mEOsdaAhvrpa
         3Nz/OzircXfzLNaATrVOPTyVrewroGfvWGY5V41pBVVNqAnnUo61hdybvJ6LFyCvig0b
         q1Gn7gobNL1EQ4t+ESStXu56Kcp8sdr/KfytIkaNenlmgztL51BqFjqRapI5mUN1aG4F
         8K9H9iZclIa/YXR4S/T0wXxGZozJ1G36Q3oRHPZYDVPdGv97l2WRxcR9c6mbBPkQxtw5
         MvAnRuZfpBr5FKklOz4405n7UxcX8LufjAr6g5NpFI0EcHl5krpTe+YEhrpHZohyUAvz
         PQFg==
X-Gm-Message-State: APjAAAVK6DVv5V79SzcCo/sFw1zpq7IfTJz8INhgFFv/B20fXZSMjNdS
        HAvgX5KxTHpqTBQ3D32JD1PVezxSUOneIFmNt5w=
X-Google-Smtp-Source: APXvYqw8Y6X88XuFnp2JqDRglFTOiIB/V/so3CHpIOKJVcFUeiAXnqmnN0utF9i0Gfs1KIMuqJIrsviRaVrp4SeDsNY=
X-Received: by 2002:ab0:28d6:: with SMTP id g22mr1823319uaq.75.1552384210745;
 Tue, 12 Mar 2019 02:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190312092302.2x6zf4imlfsevmkr@pengutronix.de>
In-Reply-To: <20190312092302.2x6zf4imlfsevmkr@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Mar 2019 10:49:59 +0100
Message-ID: <CAMuHMdUYqk6nFAd2TQ_xM9q3bHskpd8vZXJ8DiF3tFwJQLc=tg@mail.gmail.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

On Tue, Mar 12, 2019 at 10:23 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 1581f6a..2fdd6611 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c

> > @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
> >
> >       free_pwms(chip);
> >
> > -     pwmchip_sysfs_unexport(chip);
> > -
> >  out:
> >       mutex_unlock(&pwm_lock);
> > +
> > +     if (!ret)
> > +             pwmchip_sysfs_unexport(chip);
> > +
>
> I wonder if this needs to be done before free_pwms is called. Otherwise
> the pwmchip is already gone and then something is requested via sysfs.

The chip itself is not freed, only the pwms array inside, which is not needed
for matching in pwmchip_sysfs_unexport(), right?

> Also a comment about why it is important not to unexport while holding
> the lock would be great.

Thanks, good idea!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
