Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34281 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753076AbeFGNYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 09:24:18 -0400
Received: by mail-wm0-f68.google.com with SMTP id q4-v6so3197261wmq.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 06:24:18 -0700 (PDT)
Date: Thu, 7 Jun 2018 14:24:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] mfd: da9063: Register RTC only on DA9063L
Message-ID: <20180607132414.GF22841@dell>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-8-marek.vasut+renesas@gmail.com>
 <20180605075321.GM21163@dell>
 <ac43842f-7d8a-1d6d-7077-9fb58ab852b7@gmail.com>
 <20180606061623.GT21163@dell>
 <69893894-899f-54cd-2610-96653ec246c0@gmail.com>
 <20180607050411.GB21163@dell>
 <feeb19cc-e7df-1859-86b9-da99059d8e32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feeb19cc-e7df-1859-86b9-da99059d8e32@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 07 Jun 2018, Marek Vasut wrote:

> On 06/07/2018 07:04 AM, Lee Jones wrote:
> > On Wed, 06 Jun 2018, Marek Vasut wrote:
> >> On 06/06/2018 08:16 AM, Lee Jones wrote:
> >>> On Tue, 05 Jun 2018, Marek Vasut wrote:
> >>
> >> [...]
> >>
> >>>>>> -static const struct mfd_cell da9063_devs[] = {
> >>>>>> +static const struct mfd_cell da9063_common_devs[] = {
> >>>>>>  	{
> >>>>>>  		.name		= DA9063_DRVNAME_REGULATORS,
> >>>>>
> >>>>> Appreciate that these are historical, but these device name defines
> >>>>> make me shudder.  They only serve to act as an obfuscation layer when
> >>>>> debugging at platform level.  Please consider getting rid of them.
> >>>>
> >>>> The macro can be shared between the core and the drivers, so the names
> >>>> never run out of sync.
> >>>
> >>> Platform driver name changes are vary rare.  Even if they are changed,
> >>> even light testing would uncover the fact that child drivers do not
> >>> .probe().
> >>
> >> Sure, while if the macro is used, this problem is avoided altogether.
> >>
> >>> Due to the current obfuscation, I currently have no idea
> >>> what this device's name is.
> >>
> >> I'm sure ctags or git grep can easily help.
> > 
> > I'm aware how to get around the 'issue', but it's an additional step
> > which is avoidable.  For me personally it comes from doing *a lot* of
> > platform level work and being irritated by the extra grepping.  Macros
> > for driver names does not sit right with me at all.  There are even
> > worse examples of people defining the MACROs *inside* the driver,
> > which doesn't even benefit from the small redeeming feature you
> > mention above.
> 
> If we follow this line of thinking, we could just run cpp and expand all
> macros. Then there's no need for grepping at all. That probably won't be
> the result anyone would like though.

Hmm ... yes, that's the same! :D

> > Anyway, I'm happy with you not wanting to change it.  Just leave them
> > as they are for now.
> >>>>>> +	{
> >>>>>> +		.name		= DA9063_DRVNAME_VIBRATION,
> >>>>>> +	},
> >>>>>
> >>>>> Place this on a single line please.
> >>>>
> >>>> This would only make the style inconsistent with the ie. LEDs entry.
> >>>>
> >>>>>         { .name	= DA9063_DRVNAME_VIBRATION },
> >>>
> >>> If that is a one line entry spaced over multiple lines, then that
> >>> should also be changed.
> >>>
> >>> Maybe I will go through and stylise this driver a bit after all (but
> >>> as time is short at the moment, maybe not!) :)
> >>
> >> You'd end up with two entries which look different then the rest, which
> >> triggers my OCD.
> > 
> > OCD or not, it's never okay to waste lines.  If ordering it not
> > important (which it should not be -- it's fragile to rely on device
> > ordering in MFD cells), the multi-line entries go at the top, followed
> > by the single line entries.  If done right, it looks the opposite of
> > bad/out of place.
> 
> My point is, the style should at least be consistent. But anyway.

It is consistent.

 - Multi-line entries go on multiple lines.
 - Single line entries go on single lines.

See drivers/mfd/max77620.c for how it should look.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
