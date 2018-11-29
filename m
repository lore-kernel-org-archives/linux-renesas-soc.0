Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45496 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbeK3EYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 23:24:11 -0500
Received: by mail-lf1-f65.google.com with SMTP id b20so2011970lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Nov 2018 09:18:04 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 29 Nov 2018 18:18:01 +0100
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD
 clock
Message-ID: <20181129171801.GD26216@bigcity.dyn.berto.se>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
 <20181129165429.GA1660@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181129165429.GA1660@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-11-29 17:54:34 +0100, Wolfram Sang wrote:
> Hi Niklas,
> 
> thanks for the patches!
> 
> On Thu, Nov 29, 2018 at 01:39:49AM +0100, Niklas S�derlund wrote:
> > On H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1) the clock setting for HS400
> > needs a quirk to function properly. The reason for the quirk is that
> > there are two settings which produces same divider value for the SDn
> > clock. On the effected boards the one currently selected results in
> > HS400 not working.
> > 
> > This change uses the same method as the Gen2 CPG driver and simply
> > ignores the first clock setting as this is the offending one when
> > selecting the settings. Which of the two possible settings is used have
> > no effect for SDR104.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > ---
> > * Changes since v1
> > - Fixed spelling in commit message, thanks Sergei and Geert!
> > - Reworked the whole patch per Geerts suggestion. Instead of only
> >   skipping the first row on the effected boards when setting the clock
> >   rete totally ignore it. This is made possible by another change to the
> 
> "rete"? I don't get this sentence and I think it is important to
> understand when reviewing these patches :)

That should have been rate :-) To elaborate a bit more:

The patch is different from v1 as a different approach to solve the 
issue have been found. Instead of only ignoring the first row of the 
list of possible settings when selecting which divider to use also 
ignore it when examining which state the hardware is in. That is the 
driver is no longer aware the first row exists with this patch.

This was in v1 not possible as the first row might be a state the 
bootloader left the hardware in and then the clock failed to register as 
it would need to update its own state to match the hardware.

As the driver needed to know about the state the hardware was in when 
probing but not use it when selecting a divider the more complex v1 was 
needed. When selecting a divider we wish for it to select the second 
option for the divider value '4' when running on a SoC which needs the 
quirk.

With v2 which depends on [1] this is not needed as the clock driver now 
sets a know state when registering the clock so this patch can be made 
much simpler by simply 'removing' the first row from all operations.

> 
> >   clock driver posted separately from this series and which this patch
> >   now depends on [1].
> 
> Hmm, why didn't you add it to the series then?

Since it is unrelated to this series I thought it best to post it as a 
separate patch as I think it has value to create a known starting state 
disregarding where this series ends up :-)

> 
> Still, all in all, seems we are on a nice track for having HS400 in the
> next release \o/ Now, if that doesn't justify the 5.0 jump... ;D

I sure hope so!

-- 
Regards,
Niklas S�derlund
