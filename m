Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33961 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbdLMJJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 04:09:44 -0500
Received: by mail-lf0-f67.google.com with SMTP id x20so1798475lff.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2017 01:09:43 -0800 (PST)
Subject: Re: [PATCH 2/5] phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513146460-20326-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7e7953b2-e94d-ded8-2278-6259a1457881@cogentembedded.com>
Date: Wed, 13 Dec 2017 12:09:40 +0300
MIME-Version: 1.0
In-Reply-To: <1513146460-20326-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/13/2017 9:27 AM, Yoshihiro Shimoda wrote:

> This patch unifies the OBINTEN handling to clean-up the code.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index c22d65a..beeaa30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -147,6 +147,18 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
>   	writel(val, usb2_base + USB2_ADPCTRL);
>   }
>   
> +static void rcar_gen3_enable_otg_irq(struct rcar_gen3_chan *ch, int enable)

    If it both enables and disables, rcar_gen3_control_otg_irq() would seem a 
better name...

> +{
> +	void __iomem *usb2_base = ch->base;
> +	u32 val = readl(usb2_base + USB2_OBINTEN);
> +
> +	if (enable)
> +		val |= USB2_OBINT_BITS;
> +	else
> +		val &= ~USB2_OBINT_BITS;
> +	writel(val, usb2_base + USB2_OBINTEN);
> +}
> +
>   static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
>   {
>   	rcar_gen3_set_linectrl(ch, 1, 1);
[...]

MBR, Sergei
