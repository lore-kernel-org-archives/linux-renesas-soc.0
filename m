Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:39396 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbeFHGhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 02:37:21 -0400
Received: by mail-wr0-f195.google.com with SMTP id w7-v6so12139323wrn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 23:37:20 -0700 (PDT)
Date: Fri, 8 Jun 2018 07:37:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 01/14] mfd: da9063: Replace regmap_add_irq_chip with
 devm counterpart
Message-ID: <20180608063716.GA5278@dell>
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <019675f0-13ff-d381-87d1-891316cbfd83@gmail.com>
 <20180607124159.GD22841@dell>
 <d62db199-0255-fcde-1de0-5d335d596dc1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d62db199-0255-fcde-1de0-5d335d596dc1@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 07 Jun 2018, Marek Vasut wrote:

> On 06/07/2018 02:41 PM, Lee Jones wrote:
> > On Thu, 07 Jun 2018, Marek Vasut wrote:
> > 
> >> On 06/06/2018 11:59 AM, Marek Vasut wrote:
> >>> Use devm_regmap_add_irq_chip() instead of plain regmap_add_irq_chip(),
> >>> which removes the need for da9063_irq_exit() altogether and also
> >>> fixes a bug in da9063_device_init() where the da9063_irq_exit() was
> >>> not called in a failpath.
> >>>
> >>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Cc: Lee Jones <lee.jones@linaro.org>
> >>> Cc: Mark Brown <broonie@kernel.org>
> >>> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> >>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>> Cc: linux-renesas-soc@vger.kernel.org
> >>
> >> So it's just this one patch that's missing AB/RB and the series should
> >> be good?
> > 
> > Looks fine. Although we'll let it sit for a while in case anyone else
> > has any thoughts.
> 
> Fine by me.
> 
> > The merge window is currently open, so there is no rush to apply.
> 
> This is still 4.18 material ? Hum, OK.

You mean this could be added to v4.18?  If so, not a chance.  I
normally cut off accepting trivial patches at around -rc6(ish).  Large
sets like this require a longer soak in -next for all of the build
bots and testers to have their wicked way with them and for potential
merge conflicts to show.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
