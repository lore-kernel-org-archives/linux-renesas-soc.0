Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36188 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932256AbcKHJZS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 04:25:18 -0500
Date: Tue, 8 Nov 2016 17:25:17 +0800
From: Peter Chen <hzpeterchen@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, gregkh@linuxfoundation.org, balbi@kernel.org,
        Peter.Chen@nxp.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] phy: rcar-gen3-usb2: add sysfs for usb role swap
Message-ID: <20161108092516.GB12276@b29397-desktop>
References: <1478069232-20570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478069232-20570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 02, 2016 at 03:47:12PM +0900, Yoshihiro Shimoda wrote:
> This patch adds sysfs "role" for usb role swap. This parameter can be
> read and write. If you use this file as the following, you can swap
> the usb role.
> 
> For example:
>  1) Connect a usb cable using 2 Salvator-x boards
>  2) On A-Device (ID pin is low), you input the following command:
>    # echo peripheral > /sys/devices/platform/soc/ee080200.usb-phy/role
>  3) On B-Device (ID pin is high), you input the following command:
>    # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
> 
> Then, the A-device acts as a peripheral and the B-device acts as a host.
> Please note that A-Device must input the following command if you
> want the board to act as a host again. (even if you disconnect the usb
> cable, since id state may be the same, the A-Device keeps to act as
> peripheral.)
>  # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest linux-phy.git / next branch.
>  (commit id = 7809cd2ce6abd4f431e4b14e6b1276a7cc842ac4)
> 
>  Since this patch is related to usb, I added email addresses of Greg, Felipe,
>  Peter and USB ML as CC. (This patch doesn't use USB OTG FSM though.)
> 
>  Changes from v2:
>   - Modify the sysfs file name to "role", and the argument is "host" or
>     "peripheral". Peter suggested this. Thank you!
> 
>  Changes from v1:
>   - rebase the latest next branch.
> 
>  .../ABI/testing/sysfs-platform-phy-rcar-gen3-usb2  |  15 +++
>  drivers/phy/phy-rcar-gen3-usb2.c                   | 118 ++++++++++++++++++++-
>  2 files changed, 132 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2 b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> new file mode 100644
> index 0000000..6212697
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
> @@ -0,0 +1,15 @@
> +What:		/sys/devices/platform/<phy-name>/role
> +Date:		October 2016
> +KernelVersion:	4.10
> +Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +Description:
> +		This file can be read and write.
> +		The file can show/change the phy mode for role swap of usb.
> +
> +		Write the following strings to change the mode:
> +		 "host" - switching mode from peripheral to host.
> +		 "peripheral" - switching mode from host to peripheral.
> +
> +		Read the file, then it shows the following strings:
> +		 "host" - The mode is host now.
> +		 "peripheral" - The mode is peripheral now.
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
> index 3d97ead..cfc9956 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -70,6 +70,7 @@
>  #define USB2_LINECTRL1_DP_RPD		BIT(18)
>  #define USB2_LINECTRL1_DMRPD_EN		BIT(17)
>  #define USB2_LINECTRL1_DM_RPD		BIT(16)
> +#define USB2_LINECTRL1_OPMODE_NODRV	BIT(6)
>  
>  /* ADPCTRL */
>  #define USB2_ADPCTRL_OTGSESSVLD		BIT(20)
> @@ -161,6 +162,43 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
>  	schedule_work(&ch->work);
>  }
>  
> +static void rcar_gen3_init_for_b_host(struct rcar_gen3_chan *ch)
> +{
> +	void __iomem *usb2_base = ch->base;
> +	u32 val;
> +
> +	val = readl(usb2_base + USB2_LINECTRL1);
> +	writel(val | USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1);
> +
> +	rcar_gen3_set_linectrl(ch, 1, 1);
> +	rcar_gen3_set_host_mode(ch, 1);
> +	rcar_gen3_enable_vbus_ctrl(ch, 0);
> +
> +	val = readl(usb2_base + USB2_LINECTRL1);
> +	writel(val & ~USB2_LINECTRL1_OPMODE_NODRV, usb2_base + USB2_LINECTRL1);
> +}
> +
> +static void rcar_gen3_init_for_a_peri(struct rcar_gen3_chan *ch)
> +{
> +	rcar_gen3_set_linectrl(ch, 0, 1);
> +	rcar_gen3_set_host_mode(ch, 0);
> +	rcar_gen3_enable_vbus_ctrl(ch, 1);
> +}
> +
> +static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
> +{
> +	void __iomem *usb2_base = ch->base;
> +	u32 val;
> +
> +	val = readl(usb2_base + USB2_OBINTEN);
> +	writel(val & ~USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
> +
> +	rcar_gen3_enable_vbus_ctrl(ch, 0);
> +	rcar_gen3_init_for_host(ch);
> +
> +	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
> +}
> +
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
>  {
>  	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> @@ -174,6 +212,65 @@ static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
>  		rcar_gen3_init_for_peri(ch);
>  }
>  
> +static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
> +{
> +	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
> +}
> +
> +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
> +	bool is_b_device, is_host, new_mode_is_host;
> +
> +	if (!ch->has_otg || !ch->phy->init_count)
> +		return -EIO;
> +
> +	/*
> +	 * is_b_device: true is B-Device. false is A-Device.
> +	 * If {new_mode_}is_host: true is Host mode. false is Peripheral mode.
> +	 */
> +	is_b_device = rcar_gen3_check_id(ch);
> +	is_host = rcar_gen3_is_host(ch);
> +	if (!strncmp(buf, "host", strlen("host")))
> +		new_mode_is_host = true;
> +	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
> +		new_mode_is_host = false;
> +	else
> +		return -EINVAL;
> +
> +	/* If current and new mode is the same, this returns the error */
> +	if (is_host == new_mode_is_host)
> +		return -EINVAL;
> +
> +	if (new_mode_is_host) {
> +		if (!is_b_device && !is_host)	/* A-Peripheral */
> +			rcar_gen3_init_from_a_peri_to_a_host(ch);
> +		if (is_b_device && !is_host)	/* B-Peripheral */
> +			rcar_gen3_init_for_b_host(ch);

is_host must be false here

> +	} else {
> +		if (!is_b_device && is_host)	/* A-Host */
> +			rcar_gen3_init_for_a_peri(ch);
> +		if (is_b_device && is_host)	/* B-Host */
> +			rcar_gen3_init_for_peri(ch);

is_host must be true here
> +	}
> +
> +	return count;
> +}
> +

How can you handle the case which ID pin is incorrect, eg, ID is 0, but
it is peripheral mode at the initialization?

-- 

Best Regards,
Peter Chen
