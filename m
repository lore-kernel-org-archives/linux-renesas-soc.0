Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7736C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F65A2147C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfCLJyh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 05:54:37 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45873 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfCLJyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 05:54:36 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1h3e7G-0006vU-G8; Tue, 12 Mar 2019 10:54:34 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1h3e7F-0007xm-Kf; Tue, 12 Mar 2019 10:54:33 +0100
Date:   Tue, 12 Mar 2019 10:54:33 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Message-ID: <20190312095433.fl2nbbj3jsqxhcny@pengutronix.de>
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190312092302.2x6zf4imlfsevmkr@pengutronix.de>
 <CAMuHMdUYqk6nFAd2TQ_xM9q3bHskpd8vZXJ8DiF3tFwJQLc=tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUYqk6nFAd2TQ_xM9q3bHskpd8vZXJ8DiF3tFwJQLc=tg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 12, 2019 at 10:49:59AM +0100, Geert Uytterhoeven wrote:
> Hi Uwe,
> 
> On Tue, Mar 12, 2019 at 10:23 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
> > > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > > index 1581f6a..2fdd6611 100644
> > > --- a/drivers/pwm/core.c
> > > +++ b/drivers/pwm/core.c
> 
> > > @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
> > >
> > >       free_pwms(chip);
> > >
> > > -     pwmchip_sysfs_unexport(chip);
> > > -
> > >  out:
> > >       mutex_unlock(&pwm_lock);
> > > +
> > > +     if (!ret)
> > > +             pwmchip_sysfs_unexport(chip);
> > > +
> >
> > I wonder if this needs to be done before free_pwms is called. Otherwise
> > the pwmchip is already gone and then something is requested via sysfs.
> 
> The chip itself is not freed, only the pwms array inside, which is not needed
> for matching in pwmchip_sysfs_unexport(), right?

OK, then make this:

I wonder if pwmchip_sysfs_unexport needs to be done before free_pwms is
called. Otherwise the PWMs's representation is already gone and then
something might be requested via sysfs.
 
Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
