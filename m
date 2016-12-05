Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 13/22] drm: bridge: dw-hdmi: Replace device type with
 platform quirks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Russell King - ARM
 Linux" <linux@armlinux.org.uk>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480635817-1258-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161202142401.GD14217@n2100.armlinux.org.uk> <4921806.T6YjZHsEAd@avalon>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	<dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Archit
 Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao
	<mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Ulrich
 Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy
	<vladimir_zapolskiy@mentor.com>, <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <b7ea84bb-4130-8936-ca94-256cf4a36548@synopsys.com>
Date: Mon, 5 Dec 2016 10:50:19 +0000
MIME-Version: 1.0
In-Reply-To: <4921806.T6YjZHsEAd@avalon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 02-12-2016 15:43, Laurent Pinchart wrote:
> Hi Russell,
>
> On Friday 02 Dec 2016 14:24:01 Russell King - ARM Linux wrote:
>> On Fri, Dec 02, 2016 at 01:43:28AM +0200, Laurent Pinchart wrote:
>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> The dw-hdmi driver declares a dev_type to distinguish platform specific
>>> changes. Replace this with a quirk field, so that the platform can
>>> specify the required quirks for the driver, rather than the driver
>>> becoming conditional on multiple platforms.
>>>
>>> As part of this, we rename the dw-hdmi 'spare' which is defined as the
>>> SVSRET bit in later documentation.
>> I'd really prefer that we did not go down the broken route of adding
>> a set of "quirk" flags - look at what a mess SDHCI has become through
>> allowing that kind of practice.
>>
>> I'd much rather we find a saner structure to this - and we know that
>> the hardware has ID registers in it which can be used (so far) to
>> identify the buggy hardware.
> I'd much prefer something that would allow runtime identification of the 
> device and the corresponding actions to be taken. However, the amount of 
> documentation we have on the DWC HDMI TX IP core (and the associated PHY) is 
> pretty limited, given that Synopsys doesn't make the documentation available 
> publicly. Changes made to the IP core by integrators could complicate this 
> further. I'm trying to gather as much information as possible to make clean 
> the code up, for instance by trying to identify the PHYs used on the various 
> platforms we support. Progress is slow on that front, there isn't enough 
> leaked information available online :-) I haven't given up though, but I'll 
> need more time.
>
> I don't like quirks much either. They are however already used today, even if 
> we trigger them through dev_type instead of quirk flags. This patch came from 
> a previous version found in a BSP that simply sprinkled several if (hdmi-
>> dev_type == RCAR_HDMI) through the code. For instance,
> -	if (hdmi->dev_type == RK3288_HDMI)
> +	if (hdmi->dev_type == RK3288_HDMI || hdmi->dev_type == RCAR_HDMI)
> 		dw_hdmi_phy_enable_spare(hdmi, 1);
>
> which I think is worse than flags as it would quickly degenerate to spaghetti 
> code.
>
> For this specific case, we've managed to identify that on Renesas platforms 
> the bit set by this function is called SVSRET. Its usage isn't clear yet, but 
> I suspect it to control one of the PHY input control signals, like the other 
> bits in the same register. I'm trying to get more information to clean the 
> implementation further, hopefully with a way to determine whether the signal 
> is used based on PHY identification.

SVSRET is a low power mode consumption and is a PHY input signal
as you suggested. Most of the configurable input signals of the
PHY are available by the controller regbank. I don't think it is
possible to detect this at runtime, I think you have at least to
hardcode which version of the PHY you are using.

I would suggest that maybe all the PHY logic should be extracted
and then use callbacks to glue controller and phy. Then,
depending on the PHY you could use empty stubs if, for example, a
given PHY did not support SVSRET. Still, I don't know if this is
the best option. What I do know is that there are a large number
of PHY's with different flavors that can use the same controller.
The controller has different versions also, and each version can
have quirks but I think it would be easier to manage this driver
if we had a clear distinction between PHY and controller.


>
> This is all work in progress, and if anyone has access to any documentation 
> and can provide additional information I'll be grateful.
>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>
>>>  drivers/gpu/drm/bridge/dw-hdmi.c            | 14 ++++++--------
>>>  drivers/gpu/drm/bridge/dw-hdmi.h            |  4 ++--
>>>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  3 +--
>>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
>>>  include/drm/bridge/dw_hdmi.h                | 12 +++++-------
>>>  5 files changed, 15 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
>>> b/drivers/gpu/drm/bridge/dw-hdmi.c index 06a44a2cdf3b..26607185722f
>>> 100644
>>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
>>> @@ -118,7 +118,6 @@ struct dw_hdmi {
>>>  	struct drm_bridge bridge;
>>>  	struct platform_device *audio;
>>>
>>> -	enum dw_hdmi_devtype dev_type;
>>>  	struct device *dev;
>>>  	struct clk *isfr_clk;
>>>  	struct clk *iahb_clk;
>>> @@ -896,11 +895,11 @@ static void dw_hdmi_phy_enable_tmds(struct dw_hdmi
>>> *hdmi, u8 enable)
>>>  			 HDMI_PHY_CONF0_ENTMDS_MASK);
>>>  }
>>>
>>> -static void dw_hdmi_phy_enable_spare(struct dw_hdmi *hdmi, u8 enable)
>>> +static void dw_hdmi_phy_enable_svsret(struct dw_hdmi *hdmi, u8 enable)
>>>  {
>>>  	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
>>> -			 HDMI_PHY_CONF0_SPARECTRL_OFFSET,
>>> -			 HDMI_PHY_CONF0_SPARECTRL_MASK);
>>> +			 HDMI_PHY_CONF0_SVSRET_OFFSET,
>>> +			 HDMI_PHY_CONF0_SVSRET_MASK);
>>>  }
>>>  
>>>  static void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
>>> @@ -1031,8 +1030,8 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
>>>  	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
>>>  	dw_hdmi_phy_gen2_pddq(hdmi, 0);
>>>
>>> -	if (hdmi->dev_type == RK3288_HDMI)
>>> -		dw_hdmi_phy_enable_spare(hdmi, 1);
>>> +	if (pdata->quirks & DW_HDMI_QUIRK_PHY_SVSRET)
>>> +		dw_hdmi_phy_enable_svsret(hdmi, 1);
>> If we get a proper split between the encoder and the PHY, this should be
>> dealt with at the PHY side of the driver.
> That's possible, and some other PHY-related setup code might be better placed 
> in the PHY side as well. My problem, as explained above, is that I don't have 
> enough information yet to design a perfect API. I think this patch is a good 
> step forward, but it should not be the last one. I wish I could spend more 
> time writing clean code instead of trying to reverse engineer the behaviour of 
> the PHY :-)
>
>>>  	/*Wait for PHY PLL lock */
>>>  	msec = 5;
>>>
>>> @@ -1348,7 +1347,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi
>>> *hdmi)
>>>  	hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ, HDMI_MC_SWRSTZ);
>>>  	
>>>  	val = hdmi_readb(hdmi, HDMI_FC_INVIDCONF);
>>> -	if (hdmi->dev_type == IMX6DL_HDMI) {
>>> +	if (hdmi->plat_data->quirks & DW_HDMI_QUIRK_FC_INVIDCONF) {
>>>  		hdmi_writeb(hdmi, val, HDMI_FC_INVIDCONF);
>>>  		return;
>>>  	}
>> This is a bug found on iMX6DL versions of the IP - I don't have a 6DL
>> board powered up at the moment to grab its revision information, but
>> it would be nice to make that conditional on the revision.  From what
>> I gather, it's a workaround issued by Synopsis rather than specific
>> to the (ex)FSL implementation.
> DW_HDMI_QUIRK_FC_INVIDCONF is indeed a bad name, I'll fix that.
>
> Do you know why this function needs to write to the HDMI_FC_INVIDCONF register 
> four times in the normal case, and once only for IMX6DL ?
>

Best regards,
Jose Miguel Abreu
