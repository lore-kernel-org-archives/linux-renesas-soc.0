Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.47.9]:47739 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbdCBMWE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 07:22:04 -0500
Subject: Re: [PATCH v4 1/9] drm: bridge: dw-hdmi: Remove unused functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170301223915.29888-2-laurent.pinchart+renesas@ideasonboard.com>
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
Message-ID: <6cf8abbf-88cb-a8fc-8e51-656d76db017c@synopsys.com>
Date: Thu, 2 Mar 2017 12:19:57 +0000
MIME-Version: 1.0
In-Reply-To: <20170301223915.29888-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 01-03-2017 22:39, Laurent Pinchart wrote:
> Most of the hdmi_phy_test_*() functions are unused. Remove them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jose Abreu <joabreu@synopsys.com>

Best regards,
Jose Miguel Abreu

> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index 9a9ec27d9e28..ce7496399ccf 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -837,32 +837,6 @@ static inline void hdmi_phy_test_clear(struct dw_hdmi *hdmi,
>  		  HDMI_PHY_TST0_TSTCLR_MASK, HDMI_PHY_TST0);
>  }
>  
> -static inline void hdmi_phy_test_enable(struct dw_hdmi *hdmi,
> -					unsigned char bit)
> -{
> -	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTEN_OFFSET,
> -		  HDMI_PHY_TST0_TSTEN_MASK, HDMI_PHY_TST0);
> -}
> -
> -static inline void hdmi_phy_test_clock(struct dw_hdmi *hdmi,
> -				       unsigned char bit)
> -{
> -	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTCLK_OFFSET,
> -		  HDMI_PHY_TST0_TSTCLK_MASK, HDMI_PHY_TST0);
> -}
> -
> -static inline void hdmi_phy_test_din(struct dw_hdmi *hdmi,
> -				     unsigned char bit)
> -{
> -	hdmi_writeb(hdmi, bit, HDMI_PHY_TST1);
> -}
> -
> -static inline void hdmi_phy_test_dout(struct dw_hdmi *hdmi,
> -				      unsigned char bit)
> -{
> -	hdmi_writeb(hdmi, bit, HDMI_PHY_TST2);
> -}
> -
>  static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
>  {
>  	u32 val;
