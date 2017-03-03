Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.136]:39156 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751637AbdCCGwM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 01:52:12 -0500
Subject: Re: [PATCH v4 1/9] drm: bridge: dw-hdmi: Remove unused functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170301223915.29888-2-laurent.pinchart+renesas@ideasonboard.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
From: "Nickey.Yang" <nickey.yang@rock-chips.com>
Message-ID: <00d9aadc-8701-2dc4-bc53-d26682fc2f96@rock-chips.com>
Date: Fri, 3 Mar 2017 14:30:07 +0800
MIME-Version: 1.0
In-Reply-To: <20170301223915.29888-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


�� 2017��03��02�� 06:39, Laurent Pinchart д��:
> Most of the hdmi_phy_test_*() functions are unused. Remove them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Tested-by: Nickey Yang <nickey.yang@rock-chips.com>

Best regards,
Nickey Yang
> ---
>   drivers/gpu/drm/bridge/dw-hdmi.c | 26 --------------------------
>   1 file changed, 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index 9a9ec27d9e28..ce7496399ccf 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -837,32 +837,6 @@ static inline void hdmi_phy_test_clear(struct dw_hdmi *hdmi,
>   		  HDMI_PHY_TST0_TSTCLR_MASK, HDMI_PHY_TST0);
>   }
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
>   static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
>   {
>   	u32 val;
