Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4377C67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 09:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63A1D208E7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 09:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A1D208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbeLMJwm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:52:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42733 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbeLMJwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 04:52:42 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gXNfb-0002Eq-0j; Thu, 13 Dec 2018 10:52:39 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1gXNfa-00078k-6l; Thu, 13 Dec 2018 10:52:38 +0100
Date:   Thu, 13 Dec 2018 10:52:38 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 5/5] pwm: rcar: add workaround to output "pseudo" low
 level
Message-ID: <20181213095238.mys7qulfeow4zuu2@pengutronix.de>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544171373-29618-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207091337.mvrzzbgqa77adgbd@pengutronix.de>
 <OSAPR01MB22900C9E97E3B5AFACB99068D8A00@OSAPR01MB2290.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSAPR01MB22900C9E97E3B5AFACB99068D8A00@OSAPR01MB2290.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Thu, Dec 13, 2018 at 09:47:00AM +0000, Yoshihiro Shimoda wrote:
> > From: Uwe Kleine-Konig, Sent: Friday, December 7, 2018 6:14 PM
> > On Fri, Dec 07, 2018 at 05:29:33PM +0900, Yoshihiro Shimoda wrote:
> > > +static void rcar_pwm_workaround_output_low(struct rcar_pwm_chip *rp)
> > > +{
> > > +	/*
> > > +	 * This PWM Timer cannot output low because setting 0x000 is
> > > +	 * prohibited on PWMCNT.PH0 (High-Level Period) bitfields. So, avoiding
> > > +	 * the prohibited, this function changes the value from 0 to 1 as
> > > +	 * pseudo low level.
> > > +	 *
> > > +	 * TODO: Add GPIO handling to output low level.
> > > +	 */
> > > +	if ((rp->pwmcnt & RCAR_PWMCNT_PH0_MASK) == 0)
> > > +		rp->pwmcnt |= 1;
> > 
> > In my eyes this is too broken to do. Not sure I have the complete
> > picture, but given a small period (say 2) this 1 cycle might result in
> > 50 % duty cycle. Depending on how the hardware behaves if you disable
> > it, better do this instead.
> 
> My colleague suggests that this workaround code also changes the period
> as maximum (1023) to avoid 50 % duty cycle for such a case.

A negative side effect of that is that reenabling the pwm then takes
longer, right? For my mileage even a duty cycle of 1/1023 if 0 is
requested is rather unfortunate.

> What do you think that this idea is acceptable for upstream? Or, should
> I add gpio handling that Uwe suggested?

Given that it's impossible to implement a gpio handling that results in
well defined periods only I'm not a big fan of that either.

I let Thierry the joy of deciding here.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
