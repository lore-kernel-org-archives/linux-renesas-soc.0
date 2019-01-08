Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02208C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC6E92087E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfAHJTb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 04:19:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36277 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfAHJTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 04:19:31 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggnXj-0001ks-06; Tue, 08 Jan 2019 10:19:27 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggnXh-00022A-RN; Tue, 08 Jan 2019 10:19:25 +0100
Date:   Tue, 8 Jan 2019 10:19:25 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
Message-ID: <20190108091925.gcv6tqkvxr2ilj3w@pengutronix.de>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
 <CAMuHMdUdrfjUHzOZr25a4JsRNK34KL8kA1s1G+BrpRzZgtB-7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUdrfjUHzOZr25a4JsRNK34KL8kA1s1G+BrpRzZgtB-7w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

On Tue, Jan 08, 2019 at 09:56:28AM +0100, Geert Uytterhoeven wrote:
> On Tue, Jan 8, 2019 at 8:48 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > Orthogonal to this patch I wonder what the intended behaviour for a pwm
> > is on suspend. Should it stop oscilating unconditionally? Or should it
> > only stop if the consumer stops it as part of its own suspend callback?
> 
> I guess you mean system suspend, not runtime suspend, as the device is
> runtime-resumed when a PWM is requested?

I admit that suspend (both system and runtime) is a bit of a black box
for me. So please take that into account when judging my statements.
 
> Permitted behavior depends on the system: on R-Car Gen3 (arm64), PSCI system
> suspend will power down the SoC, so PWM output will stop for sure.
> 
> On R-Car Gen2 (or R-Car Gen3 with s2idle instead of s2ram), the PM Domain
> code will turn of the PWM module's clock. Hence it will stop oscillating, unless
> you take special countermeasures, like for modules that need to stay powered
> for wake-up handling.

Whatever "suspend" here means, I want to prevent that a stopping pwm is
a surprise for the consumer. So I think suspend should be inhibited if
the consumer might expect the pwm to continue running but the pwm is
about to stop. So if the suspend affects the consumer, too, it's the
consumer that should be responsible to stop the pwm in a controlled
manner.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
