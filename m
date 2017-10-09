Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:47441 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753948AbdJIKHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 06:07:17 -0400
Subject: Re: [PATCH v3 2/4] phy: rcar-gen3-usb2: split the two meaning of
 "has_otg"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
CC: <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <b3cdc1b3-ad3e-4c85-9757-456f3da9c9f7@ti.com>
Date: Mon, 9 Oct 2017 15:36:46 +0530
MIME-Version: 1.0
In-Reply-To: <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Friday 01 September 2017 08:11 AM, Yoshihiro Shimoda wrote:
> The has_otg on previous code has the two meaning:
>  - The channel has dedicated otg pins (ID, VBUS).
>  - The channel can swap the role via sysfs.
> 
> However, some SoCs (e.g. R-Car D3) doesn't have such dedicated pins,
> but the SoCs can swap the role. So, this patch split the two meaning
> of has_otg as "has dedicated otg pins" and adds a new value
> "can_role_swap". For now, the behavior is the same as before.

Might not be directly related to $patch, but in general certain cleanups can be
done..
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 61 ++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index e00e99a..4ea9902 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -87,7 +87,8 @@ struct rcar_gen3_chan {
>  	struct regulator *vbus;
>  	struct work_struct work;
>  	bool extcon_host;
> -	bool has_otg;
> +	bool has_otg;	/* has dedicated pins (ID, VBUS) */
> +	bool can_role_swap;
>  };
>  
>  static void rcar_gen3_phy_usb2_work(struct work_struct *work)
> @@ -219,14 +220,10 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
>  	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
>  }
>  
> -static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> -			  const char *buf, size_t count)
> +static ssize_t rcar_gen3_otg_change_role(struct rcar_gen3_chan *ch,
> +					 bool new_mode_is_host)

replace new_mode_is_host with enum mode.
>  {
> -	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> -	bool is_b_device, is_host, new_mode_is_host;
> -
> -	if (!ch->has_otg || !ch->phy->init_count)
> -		return -EIO;
> +	bool is_b_device, is_host;
>  
>  	/*
>  	 * is_b_device: true is B-Device. false is A-Device.
> @@ -234,12 +231,6 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>  	 */
>  	is_b_device = rcar_gen3_check_id(ch);
>  	is_host = rcar_gen3_is_host(ch);
> -	if (!strncmp(buf, "host", strlen("host")))
> -		new_mode_is_host = true;
> -	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> -		new_mode_is_host = false;
> -	else
> -		return -EINVAL;
>  
>  	/* If current and new mode is the same, this returns the error */
>  	if (is_host == new_mode_is_host)
> @@ -257,6 +248,32 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>  			rcar_gen3_init_for_peri(ch);
>  	}
>  
> +	return 0;
> +}
> +
> +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +	bool new_mode_is_host;
> +	ssize_t ret = -EIO;
> +
> +	if (!ch->phy->init_count)
> +		return -EIO;
> +
> +	if (!strncmp(buf, "host", strlen("host")))
> +		new_mode_is_host = true;
> +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> +		new_mode_is_host = false;

set the enum mode here.
> +	else
> +		return -EINVAL;
> +
> +	if (ch->has_otg)
> +		ret = rcar_gen3_otg_change_role(ch, new_mode_is_host);

Aren't you using sysfs to change the role here?
> +
> +	if (ret < 0)
> +		return ret;
> +
>  	return count;
>  }
>  
> @@ -264,12 +281,17 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
>  	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +	bool is_host;
>  
> -	if (!ch->has_otg || !ch->phy->init_count)
> +	if (!ch->phy->init_count)
>  		return -EIO;
>  
> -	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
> -							    "peripheral");
> +	if (ch->has_otg)
> +		is_host = rcar_gen3_is_host(ch);
> +	else
> +		return -EIO;
> +
> +	return sprintf(buf, "%s\n", is_host ? "host" : "peripheral");
>  }
>  static DEVICE_ATTR_RW(role);
>  
> @@ -427,6 +449,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  		int ret;
>  
>  		channel->has_otg = true;
> +		channel->can_role_swap = true;

Can both has_otg and can_role_swap be true?

Thanks
Kishon
