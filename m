Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81DAC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 07:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65FB920851
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 07:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FB920851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbeLLHhg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 02:37:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33015 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbeLLHhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 02:37:36 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gWz5L-0002DZ-A6; Wed, 12 Dec 2018 08:37:35 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gWz5J-0004kc-Tl; Wed, 12 Dec 2018 08:37:33 +0100
Date:   Wed, 12 Dec 2018 08:37:33 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Message-ID: <20181212073733.th23v5cvaxfbhy53@pengutronix.de>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
 <OSBPR01MB229351E3EC1B66339E6C9635D8A50@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20181210081103.zxayrzpbxiuvv6hb@pengutronix.de>
 <OSBPR01MB2293BE0147A4A535136BDF82D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB2293BE0147A4A535136BDF82D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 03:19:40AM +0000, Yoshihiro Shimoda wrote:
> Hi Uwe,
> 
> > From: Uwe Kleine-Konig, Sent: Monday, December 10, 2018 5:11 PM
> > 
> > Hello,
> > 
> > On Mon, Dec 10, 2018 at 04:49:17AM +0000, Yoshihiro Shimoda wrote:
> > > > From: Uwe Kleine-Konig, Sent: Friday, December 7, 2018 6:14 PM
> > > >
> > > > On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> > > <snip>
> > > > > +static void rcar_pwm_workaround_output_low(struct rcar_pwm_chip *rp)
> > > > > +{
> > > > > +	/*
> > > > > +	 * This PWM Timer cannot output low because setting 0x000 is
> > > > > +	 * prohibited on PWMCNT.PH0 (High-Level Period) bitfields. So, avoiding
> > > > > +	 * the prohibited, this function changes the value from 0 to 1 as
> > > > > +	 * pseudo low level.
> > > > > +	 *
> > > > > +	 * TODO: Add GPIO handling to output low level.
> > > > > +	 */
> > > > > +	if ((rp->pwmcnt & RCAR_PWMCNT_PH0_MASK) == 0)
> > > > > +		rp->pwmcnt |= 1;
> > > >
> > > > In my eyes this is too broken to do. Not sure I have the complete
> > > > picture, but given a small period (say 2) this 1 cycle might result in
> > > > 50 % duty cycle. Depending on how the hardware behaves if you disable
> > > > it, better do this instead.
> > >
> > > You're right.
> > 
> > But in the meantime I learned that the pwm gets active on disable, so
> > this won't help.
> > 
> > > > Are you aware of the series adding such gpio support to the imx driver?
> > >
> > > I didn't know that.
> > >
> > > > @Thierry: So there are three drivers now that could benefit for a
> > > > generic approach.
> > >
> > > Should I wait for Thierry's opinion whether PWM subsystem will have
> > > a generic approach or not?
> > 
> > Not sure how to preceed here. The needed procedure would be:
> > 
> > 	set duty_cycle to 0%
> > 	delay long enough to be sure the duty cycle is active
> > 	switch to gpio
> > 	disable the hardware
> > 
> > The additional blocker for rcar is that it doesn't support duty_cycle
> > 0%.
> > 
> > So unless your hardware guys confirm that 0% works even though not
> > supported according to the hardware manual I have no good idea.
> > 
> > In the past I suggested to weaken the requirements after pwm_disable,
> > but Thierry didn't like it.
> 
> I read the following discussion once:
> https://patchwork.ozlabs.org/patch/959776/

Yeah, that's (part of) the discussion I meant. Thierry doesn't agree
though, so for now that's a dead end. My plan is to watch the pwm list
for a while to get a better picture about the different pwm
implementations because just one or two problematic cases are not
enough to justify a generic solution in the core in his eyes.
 
> I could not understand all this yet, but I think I should try to add a special gpio handling
> to the pwm-rcar.c driver instead of a generic approach because as you mentioned above,
> such special handling needs for the hardware.

Being able to set PHO to zero would be still better, so I hope you
follow up on the question to your hardware guys if this is really
forbidden. (If I had access to such hardware, I'd bluntly try what
happens.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
