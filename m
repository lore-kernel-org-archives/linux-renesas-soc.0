Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:44475 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755868AbcLTMRa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 07:17:30 -0500
Subject: Re: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power
 handling
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
 <20161220013400.28317-18-laurent.pinchart+renesas@ideasonboard.com>
 <20161220114553.GS14217@n2100.armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <a58b04ae-db24-afbd-a309-140dc9350dcc@synopsys.com>
Date: Tue, 20 Dec 2016 12:17:23 +0000
MIME-Version: 1.0
In-Reply-To: <20161220114553.GS14217@n2100.armlinux.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,


On 20-12-2016 11:45, Russell King - ARM Linux wrote:
> On Tue, Dec 20, 2016 at 03:33:48AM +0200, Laurent Pinchart wrote:
>> Instead of spreading version-dependent PHY power handling code around,
>> group it in two functions to power the PHY on and off and use them
>> through the driver.
>>
>> Powering off the PHY at the beginning of the setup phase is currently
>> split in two locations for first and second generation PHYs, group all
>> the operations in the dw_hdmi_phy_init() function.
> This changes the behaviour of the driver.
>
>> +static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
>> +{
>> +	if (hdmi->phy->gen == 1) {
>> +		dw_hdmi_phy_enable_tmds(hdmi, 0);
>> +		dw_hdmi_phy_enable_powerdown(hdmi, true);
>> +	} else {
>> +		dw_hdmi_phy_gen2_txpwron(hdmi, 0);
>> +		dw_hdmi_phy_gen2_pddq(hdmi, 1);
>> +	}
>> +}
>> @@ -1290,9 +1302,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
>>  	if (!hdmi->phy_enabled)
>>  		return;
>>  
>> -	dw_hdmi_phy_enable_tmds(hdmi, 0);
>> -	dw_hdmi_phy_enable_powerdown(hdmi, true);
>> -
>> +	dw_hdmi_phy_power_off(hdmi);
> This makes dw_hdmi_phy_disable() power down a gen2 phy.
>
> The iMX6 has a DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY phy, which you list as a
> gen2 phy.  I've been carrying this change for a while, which I've had
> to revert (and finally expunge), as it causes problems on iMX6:
>
> @@ -1112,6 +1112,14 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
>         if (!hdmi->phy_enabled)
>                 return;
>
> +       /* Actually set the phy into low power mode */
> +       dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> +
> +       /* FIXME: We should wait for TX_READY to be deasserted */
> +
> +       dw_hdmi_phy_gen2_pddq(hdmi, 1);
> +
> +       /* This appears to have no effect on iMX6 */
>         dw_hdmi_phy_enable_tmds(hdmi, 0);
>         dw_hdmi_phy_enable_powerdown(hdmi, true);
>
> So, I think your change here will cause problems for iMX6.
>
> From what I remember, it seems that iMX6 has issues with RXSENSE/HPD
> bouncing when the PHY is powered down.  I can't promise when I'll be
> able to check for that again.
>

Indeed TX_READY must be low before asserting pddq. HPD and
RXSENSE should work in power down mode by enabling enhpdrxsense
bit in phy_conf0 BUT to enter power down you must disable
TX_PWRON, enhpdrxsense and enable PDDQ and PHY _RESET. Only after
doing this (and consequently entering power down mode) you can
enable again enhpdrxsense.

Best regards,
Jose Miguel Abreu
