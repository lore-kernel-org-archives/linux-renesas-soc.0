Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH v2 16/29] drm: bridge: dw-hdmi: Detect PHY type at runtime
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jose Abreu
	<Jose.Abreu@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
 <20161220013400.28317-17-laurent.pinchart+renesas@ideasonboard.com>
 <57dd2817-88a9-70ef-745d-221cfed2d20c@synopsys.com>
 <1706424.IHm6bGF9sZ@avalon>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	<dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Fabio
 Estevam <fabio.estevam@freescale.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Russell King
	<rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	<linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <a9e7ad57-8a6a-05a9-4e74-f1e922ec6579@synopsys.com>
Date: Tue, 20 Dec 2016 15:01:52 +0000
MIME-Version: 1.0
In-Reply-To: <1706424.IHm6bGF9sZ@avalon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 20-12-2016 13:11, Laurent Pinchart wrote:
> Hi Jose,
>
> On Tuesday 20 Dec 2016 11:39:21 Jose Abreu wrote:
>> On 20-12-2016 01:33, Laurent Pinchart wrote:
>>> Detect the PHY type and use it to handle the PHY type-specific SVSRET
>>> signal.
>>>
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>
>>>  drivers/gpu/drm/bridge/dw-hdmi.c | 68 +++++++++++++++++++++++++++++++++--
>>>  include/drm/bridge/dw_hdmi.h     | 10 ++++++
>>>  2 files changed, 75 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
>>> b/drivers/gpu/drm/bridge/dw-hdmi.c index f4faa14213e5..ef4f2f96ed2c
>>> 100644
>>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c

[snip]

> I don't have access to the documentation so I can't comment on that :-) What  
> does the SVSRET signal control (and what does the name stand for) ?

SVSRET stands for SVSRET :) (no idea what it means) Its a low
power mode of consumption.

>
> By de-asserting PHY reset, do you mean
>
>         /* PHY reset */
>         hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_DEASSERT, HDMI_MC_PHYRSTZ);
>         hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_ASSERT, HDMI_MC_PHYRSTZ);
>
> ? HDMI_MC_PHYRSTZ_DEASSERT is defined as 0x01 and HDMI_MC_PHYRSTZ_ASSERT as 
> 0x00, which I believe leads to correct operation on Gen2 PHYs, but is 
> incorrect on Gen1 PHYs that have an active low reset signal. Could you confirm 
> that ? The DEASSERT and ASSERT macros should be renamed as they're obviously 
> incorrect.

Correct. Older phys require PHYRSTZ to be deasserted (i.e. low)
for a PHY-dependent time. Newer phys require PHYRSTZ to be
asserted (i.e. high) for, again, a PHY-dependent time.

This is the kind of things that made me suggest you to extract
all the phy configuration from dw-hdmi. I think that having a
bunch of if's because of all the phy's that we need to support
does not make much sense. The downside is, of course, having code
duplicated.

>
> I can move the SVSRET assertion before PHY reset and test it on RK3288 and R-
> Car H3.

Probably wont make much difference unless you have a way to
measure how much power the phy is consuming. But I think it is
the right thing to do according to docs.

[snip]

> The SoC datasheet mentions the SVSRET bit in the HDMI TX registers but doesn't 
> document it any further. If I don't set SVSRET the HDMI output stays dead, so 
> I assume I need to set it :-)
>

Hmm, ok. I still haven't figured out which phy you are using so
can't comment much further.

Best regards,
Jose Miguel Abreu
