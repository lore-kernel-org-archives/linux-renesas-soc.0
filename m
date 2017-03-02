Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.47.9]:47843 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752230AbdCBM3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 07:29:17 -0500
Subject: Re: [PATCH v4 4/9] drm: bridge: dw-hdmi: Fix the PHY power down
 sequence
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170301223915.29888-5-laurent.pinchart+renesas@ideasonboard.com>
CC: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <413d8d80-b4b6-6027-8b3f-5149f7f0c778@synopsys.com>
Date: Thu, 2 Mar 2017 12:27:15 +0000
MIME-Version: 1.0
In-Reply-To: <20170301223915.29888-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 01-03-2017 22:39, Laurent Pinchart wrote:
> The PHY requires us to wait for the PHY to switch to low power mode
> after deasserting TXPWRON and before asserting PDDQ in the power down
> sequence, otherwise power down will fail.
>
> The PHY power down can be monitored though the TX_READY bit, available
> through I2C in the PHY registers, or the TX_PHY_LOCK bit, available
> through the HDMI TX registers. As the two are equivalent, let's pick the
> easier solution of polling the TX_PHY_LOCK bit.
>
> The power down code is currently duplicated in multiple places. To avoid
> spreading multiple calls to a TX_PHY_LOCK poll function, we have to
> refactor the power down code and group it all in a single function.
>
> Tests showed that one poll iteration was enough for TX_PHY_LOCK to
> become low, without requiring any additional delay. Retrying the read
> five times with a 1ms to 2ms delay between each attempt should thus be
> more than enough.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jose Abreu <joabreu@synopsys.com>

Best regards,
Jose Miguel Abreu

> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 52 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index d863b3393aee..85348ba6bb1c 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -116,6 +116,7 @@ struct dw_hdmi_i2c {
>  struct dw_hdmi_phy_data {
>  	enum dw_hdmi_phy_type type;
>  	const char *name;
> +	unsigned int gen;
>  	bool has_svsret;
>  };
>  
> @@ -914,6 +915,40 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
>  			 HDMI_PHY_CONF0_SELDIPIF_MASK);
>  }
>  
> +static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
> +{
> +	const struct dw_hdmi_phy_data *phy = hdmi->phy.data;
> +	unsigned int i;
> +	u16 val;
> +
> +	if (phy->gen == 1) {
> +		dw_hdmi_phy_enable_tmds(hdmi, 0);
> +		dw_hdmi_phy_enable_powerdown(hdmi, true);
> +		return;
> +	}
> +
> +	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> +
> +	/*
> +	 * Wait for TX_PHY_LOCK to be deasserted to indicate that the PHY went
> +	 * to low power mode.
> +	 */
> +	for (i = 0; i < 5; ++i) {
> +		val = hdmi_readb(hdmi, HDMI_PHY_STAT0);
> +		if (!(val & HDMI_PHY_TX_PHY_LOCK))
> +			break;
> +
> +		usleep_range(1000, 2000);
> +	}
> +
> +	if (val & HDMI_PHY_TX_PHY_LOCK)
> +		dev_warn(hdmi->dev, "PHY failed to power down\n");
> +	else
> +		dev_dbg(hdmi->dev, "PHY powered down in %u iterations\n", i);
> +
> +	dw_hdmi_phy_gen2_pddq(hdmi, 1);
> +}
> +
>  static int hdmi_phy_configure(struct dw_hdmi *hdmi)
>  {
>  	u8 val, msec;
> @@ -946,11 +981,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
>  		return -EINVAL;
>  	}
>  
> -	/* gen2 tx power off */
> -	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> -
> -	/* gen2 pddq */
> -	dw_hdmi_phy_gen2_pddq(hdmi, 1);
> +	dw_hdmi_phy_power_off(hdmi);
>  
>  	/* Leave low power consumption mode by asserting SVSRET. */
>  	if (hdmi->phy->has_svsret)
> @@ -1025,8 +1056,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
>  	for (i = 0; i < 2; i++) {
>  		dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
>  		dw_hdmi_phy_sel_interface_control(hdmi, 0);
> -		dw_hdmi_phy_enable_tmds(hdmi, 0);
> -		dw_hdmi_phy_enable_powerdown(hdmi, true);
>  
>  		ret = hdmi_phy_configure(hdmi);
>  		if (ret)
> @@ -1256,8 +1285,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
>  	if (!hdmi->phy_enabled)
>  		return;
>  
> -	dw_hdmi_phy_enable_tmds(hdmi, 0);
> -	dw_hdmi_phy_enable_powerdown(hdmi, true);
> +	dw_hdmi_phy_power_off(hdmi);
>  
>  	hdmi->phy_enabled = false;
>  }
> @@ -1827,23 +1855,29 @@ static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
>  	{
>  		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
>  		.name = "DWC HDMI TX PHY",
> +		.gen = 1,
>  	}, {
>  		.type = DW_HDMI_PHY_DWC_MHL_PHY_HEAC,
>  		.name = "DWC MHL PHY + HEAC PHY",
> +		.gen = 2,
>  		.has_svsret = true,
>  	}, {
>  		.type = DW_HDMI_PHY_DWC_MHL_PHY,
>  		.name = "DWC MHL PHY",
> +		.gen = 2,
>  		.has_svsret = true,
>  	}, {
>  		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY_HEAC,
>  		.name = "DWC HDMI 3D TX PHY + HEAC PHY",
> +		.gen = 2,
>  	}, {
>  		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY,
>  		.name = "DWC HDMI 3D TX PHY",
> +		.gen = 2,
>  	}, {
>  		.type = DW_HDMI_PHY_DWC_HDMI20_TX_PHY,
>  		.name = "DWC HDMI 2.0 TX PHY",
> +		.gen = 2,
>  		.has_svsret = true,
>  	}
>  };
