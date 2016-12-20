Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:32824 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751967AbcLTLqS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 06:46:18 -0500
Date: Tue, 20 Dec 2016 11:45:53 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power
 handling
Message-ID: <20161220114553.GS14217@n2100.armlinux.org.uk>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
 <20161220013400.28317-18-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161220013400.28317-18-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 20, 2016 at 03:33:48AM +0200, Laurent Pinchart wrote:
> Instead of spreading version-dependent PHY power handling code around,
> group it in two functions to power the PHY on and off and use them
> through the driver.
> 
> Powering off the PHY at the beginning of the setup phase is currently
> split in two locations for first and second generation PHYs, group all
> the operations in the dw_hdmi_phy_init() function.

This changes the behaviour of the driver.

> +static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
> +{
> +	if (hdmi->phy->gen == 1) {
> +		dw_hdmi_phy_enable_tmds(hdmi, 0);
> +		dw_hdmi_phy_enable_powerdown(hdmi, true);
> +	} else {
> +		dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> +		dw_hdmi_phy_gen2_pddq(hdmi, 1);
> +	}
> +}

> @@ -1290,9 +1302,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
>  	if (!hdmi->phy_enabled)
>  		return;
>  
> -	dw_hdmi_phy_enable_tmds(hdmi, 0);
> -	dw_hdmi_phy_enable_powerdown(hdmi, true);
> -
> +	dw_hdmi_phy_power_off(hdmi);

This makes dw_hdmi_phy_disable() power down a gen2 phy.

The iMX6 has a DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY phy, which you list as a
gen2 phy.  I've been carrying this change for a while, which I've had
to revert (and finally expunge), as it causes problems on iMX6:

@@ -1112,6 +1112,14 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
        if (!hdmi->phy_enabled)
                return;

+       /* Actually set the phy into low power mode */
+       dw_hdmi_phy_gen2_txpwron(hdmi, 0);
+
+       /* FIXME: We should wait for TX_READY to be deasserted */
+
+       dw_hdmi_phy_gen2_pddq(hdmi, 1);
+
+       /* This appears to have no effect on iMX6 */
        dw_hdmi_phy_enable_tmds(hdmi, 0);
        dw_hdmi_phy_enable_powerdown(hdmi, true);

So, I think your change here will cause problems for iMX6.

>From what I remember, it seems that iMX6 has issues with RXSENSE/HPD
bouncing when the PHY is powered down.  I can't promise when I'll be
able to check for that again.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
