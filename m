Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57365 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751114AbdJDKoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 06:44:12 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 05/14] pinctrl: sh-pfc: r8a7795-es1: Use generic bias register description
Date: Wed, 04 Oct 2017 13:44:12 +0300
Message-ID: <2599940.LmqJT7CgZ2@avalon>
In-Reply-To: <1744705.qyxHaYEude@avalon>
References: <1507108033-8606-1-git-send-email-geert+renesas@glider.be> <1507108033-8606-6-git-send-email-geert+renesas@glider.be> <1744705.qyxHaYEude@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday, 4 October 2017 13:40:13 EEST Laurent Pinchart wrote:
> On Wednesday, 4 October 2017 12:07:04 EEST Geert Uytterhoeven wrote:
> > Move R-Car H3 ES1.x bias support over to the generic way to describe
> > bias registers, which will be needed for suspend/resume support.
> > 
> > As the new description is more compact, this decreases kernel size by
> > ca. 304 bytes.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

One additional comment, please see below.

> > ---
> > 
> >  drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 499 ++++++++++++-------------
> >  1 file changed, 258 insertions(+), 241 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> > b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c index
> > 246d0de915feaffe..229192cf8e7430af 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c

[snip]

> > +static const struct pinmux_bias_reg pinmux_bias_regs[] = {

[snip]

> > +	{ },

I would write it as { /* Sentinel */ } to make it more explicit that a last 
zero entry is required.

> >  };

[snip]

-- 
Regards,

Laurent Pinchart
