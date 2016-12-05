Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:59175 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751576AbcLEMmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 07:42:35 -0500
Subject: Re: [PATCH 13/22] drm: bridge: dw-hdmi: Replace device type with
 platform quirks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <4921806.T6YjZHsEAd@avalon>
 <b7ea84bb-4130-8936-ca94-256cf4a36548@synopsys.com>
 <1576280.tBdiYM6mm0@avalon>
CC: Fabio Estevam <fabio.estevam@freescale.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        <dri-devel@lists.freedesktop.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <b937dab1-da56-1d48-4b2e-b39f6b0f630e@synopsys.com>
Date: Mon, 5 Dec 2016 12:31:30 +0000
MIME-Version: 1.0
In-Reply-To: <1576280.tBdiYM6mm0@avalon>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 05-12-2016 11:32, Laurent Pinchart wrote:
> Hi Jose,
>
> On Monday 05 Dec 2016 10:50:19 Jose Abreu wrote:
>> On 02-12-2016 15:43, Laurent Pinchart wrote:
>>> On Friday 02 Dec 2016 14:24:01 Russell King - ARM Linux wrote:
>>>> On Fri, Dec 02, 2016 at 01:43:28AM +0200, Laurent Pinchart wrote:
>>>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>>
>>>>> The dw-hdmi driver declares a dev_type to distinguish platform specific
>>>>> changes. Replace this with a quirk field, so that the platform can
>>>>> specify the required quirks for the driver, rather than the driver
>>>>> becoming conditional on multiple platforms.
>>>>>
>>>>> As part of this, we rename the dw-hdmi 'spare' which is defined as the
>>>>> SVSRET bit in later documentation.
>>>> I'd really prefer that we did not go down the broken route of adding
>>>> a set of "quirk" flags - look at what a mess SDHCI has become through
>>>> allowing that kind of practice.
>>>>
>>>> I'd much rather we find a saner structure to this - and we know that
>>>> the hardware has ID registers in it which can be used (so far) to
>>>> identify the buggy hardware.
>>> I'd much prefer something that would allow runtime identification of the
>>> device and the corresponding actions to be taken. However, the amount of
>>> documentation we have on the DWC HDMI TX IP core (and the associated PHY)
>>> is pretty limited, given that Synopsys doesn't make the documentation
>>> available publicly. Changes made to the IP core by integrators could
>>> complicate this further. I'm trying to gather as much information as
>>> possible to make clean the code up, for instance by trying to identify
>>> the PHYs used on the various platforms we support. Progress is slow on
>>> that front, there isn't enough leaked information available online :-) I
>>> haven't given up though, but I'll need more time.
>>>
>>> I don't like quirks much either. They are however already used today, even
>>> if we trigger them through dev_type instead of quirk flags. This patch
>>> came from a previous version found in a BSP that simply sprinkled several
>>> if (hdmi-> dev_type == RCAR_HDMI) through the code. For instance,
>>>
>>> -	if (hdmi->dev_type == RK3288_HDMI)
>>> +	if (hdmi->dev_type == RK3288_HDMI || hdmi->dev_type == RCAR_HDMI)
>>> 		dw_hdmi_phy_enable_spare(hdmi, 1);
>>>
>>> which I think is worse than flags as it would quickly degenerate to
>>> spaghetti code.
>>>
>>> For this specific case, we've managed to identify that on Renesas
>>> platforms the bit set by this function is called SVSRET. Its usage isn't
>>> clear yet, but I suspect it to control one of the PHY input control
>>> signals, like the other bits in the same register. I'm trying to get more
>>> information to clean the implementation further, hopefully with a way to
>>> determine whether the signal is used based on PHY identification.
>> SVSRET is a low power mode consumption and is a PHY input signal
>> as you suggested.
> Thank you for the confirmation. Would you happen to know what SVSRET stands 
> for ?

Have no info about that. Sorry.

>
>> Most of the configurable input signals of the PHY are available by the
>> controller regbank. I don't think it is possible to detect this at runtime,
>> I think you have at least to hardcode which version of the PHY you are
>> using.
>>
>> I would suggest that maybe all the PHY logic should be extracted and then
>> use callbacks to glue controller and phy. Then, depending on the PHY you
>> could use empty stubs if, for example, a given PHY did not support SVSRET.
>> Still, I don't know if this is the best option. What I do know is that there
>> are a large number of PHY's with different flavors that can use the same
>> controller. The controller has different versions also, and each version can
>> have quirks but I think it would be easier to manage this driver if we had a
>> clear distinction between PHY and controller.
> Agreed, I'd like to go in that direction. What makes it quite difficult is the 
> lack of documentation about the PHYs :-) I've found six different PHY types 
> that can be identified by the CONFIG2_ID register:
>
> Bits    | Field         	| Description
> ------------------------------------------------------------------------------
> 7-0     | phytype       	| PHY interface
>         |               	| 0x00: Legacy PHY (HDMI TX PHY)
>         |               	| 0xb2: MHL PHY + HEAC PHY
>         |               	| 0xc2: MHL PHY
>         |               	| 0xe2: HDMI 3D TX PHY + HEAC PHY
>         |               	| 0xf2: HDMI 3D TX PHY
>         |               	| 0xf3: HDMI2 TX PHY
>
> I'm sure there's more than that. In particular I wonder how external vendor 
> PHYs are identified.

0xFE.

>
> I'm also wondering whether there's a need to keep support for the legacy PHY 
> signals (ENTMDS and PDZ in the PHY_CONF0 register). As far as I understand 
> they're not used by the Gen2 PHYs (including the external vendor PHYs), but I 
> can't confirm that without more documentation (although I could test that on 
> the platforms I have access to).

You are correct. Not available on Gen2 and on external phys.

>>> This is all work in progress, and if anyone has access to any
>>> documentation and can provide additional information I'll be grateful.
>>>
>>>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>> Signed-off-by: Laurent Pinchart
>>>>> <laurent.pinchart+renesas@ideasonboard.com>
>>>>> ---
>>>>>
>>>>>  drivers/gpu/drm/bridge/dw-hdmi.c            | 14 ++++++--------
>>>>>  drivers/gpu/drm/bridge/dw-hdmi.h            |  4 ++--
>>>>>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  3 +--
>>>>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
>>>>>  include/drm/bridge/dw_hdmi.h                | 12 +++++-------
>>>>>  5 files changed, 15 insertions(+), 20 deletions(-)

Best regards,
Jose Miguel Abreu
