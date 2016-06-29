Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] phy: rcar-gen3-usb2: fix mutex_lock calling in interrupt
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	<cw00.choi@samsung.com>
References: <1467009413-8076-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
CC: <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <5773D542.5090802@ti.com>
Date: Wed, 29 Jun 2016 19:33:46 +0530
MIME-Version: 1.0
In-Reply-To: <1467009413-8076-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

+Chanwoo

Hi,

On Monday 27 June 2016 12:06 PM, Yoshihiro Shimoda wrote:
> This patch fixes an issue that the extcon_set_cable_state_() is possible
> to cause "BUG: scheduling while atomic" because this driver calls
> extcon_set_cable_state_() in the interrupt handler and mutex_lock()

Doesn't extcon_set_cable_state_() use spin_lock?

Chanwoo, Can't extcon API's be called from interrupt handler?

Thanks
Kishon

> is possible to be called by like the following call trace.
> So, this patch adds a workqueue function to resolve this issue.
> 
> [    9.706504] BUG: scheduling while atomic: systemd-journal/25893/0x00010303
> [    9.714569] Modules linked in:
> [    9.717629] CPU: 0 PID: 25893 Comm: systemd-journal Not tainted 4.7.0-rc4+ #86
> [    9.724844] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
> [    9.731624] Call trace:
> [    9.734077] [<ffff0000080889f0>] dump_backtrace+0x0/0x1a8
> [    9.739470] [<ffff000008088bac>] show_stack+0x14/0x20
> [    9.744520] [<ffff000008348ab4>] dump_stack+0x94/0xb8
> [    9.749568] [<ffff0000080da18c>] __schedule_bug+0x44/0x58
> [    9.754966] [<ffff0000087c6394>] __schedule+0x4e4/0x598
> [    9.760185] [<ffff0000087c6484>] schedule+0x3c/0xa8
> [    9.765057] [<ffff0000087c6928>] schedule_preempt_disabled+0x20/0x38
> [    9.771408] [<ffff0000080f20dc>] mutex_optimistic_spin+0x18c/0x1d0
> [    9.777583] [<ffff0000087c7ef0>] __mutex_lock_slowpath+0x38/0x140
> [    9.783669] [<ffff0000087c803c>] mutex_lock+0x44/0x60
> [    9.788717] [<ffff00000834ca48>] kobject_uevent_env+0x250/0x500
> [    9.794634] [<ffff0000086ae8c0>] extcon_update_state+0x220/0x298
> [    9.800634] [<ffff0000086ae9d8>] extcon_set_cable_state_+0x78/0x88
> [    9.806812] [<ffff000008376004>] rcar_gen3_device_recognition+0x5c/0xe0
> [    9.813420] [<ffff0000083761bc>] rcar_gen3_phy_usb2_irq+0x3c/0x48
> [    9.819509] [<ffff0000080fae94>] handle_irq_event_percpu+0x94/0x140
> [    9.825769] [<ffff0000080faf88>] handle_irq_event+0x48/0x78
> [    9.831334] [<ffff0000080fe620>] handle_fasteoi_irq+0xb8/0x1b0
> [    9.837162] [<ffff0000080fa3c4>] generic_handle_irq+0x24/0x38
> [    9.842900] [<ffff0000080fa6fc>] __handle_domain_irq+0x5c/0xb8
> [    9.848727] [<ffff000008081520>] gic_handle_irq+0x58/0xb0
> 
> Reported-by: Simon Horman <horms@verge.net.au>
> Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/phy-rcar-gen3-usb2.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
> index 4be3f5d..31156c9 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -21,6 +21,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
>  
>  /******* USB2.0 Host registers (original offset is +0x200) *******/
>  #define USB2_INT_ENABLE		0x000
> @@ -81,9 +82,25 @@ struct rcar_gen3_chan {
>  	struct extcon_dev *extcon;
>  	struct phy *phy;
>  	struct regulator *vbus;
> +	struct work_struct work;
> +	bool extcon_host;
>  	bool has_otg;
>  };
>  
> +static void rcar_gen3_phy_usb2_work(struct work_struct *work)
> +{
> +	struct rcar_gen3_chan *ch = container_of(work, struct rcar_gen3_chan,
> +						 work);
> +
> +	if (ch->extcon_host) {
> +		extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, true);
> +		extcon_set_cable_state_(ch->extcon, EXTCON_USB, false);
> +	} else {
> +		extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, false);
> +		extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
> +	}
> +}
> +
>  static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
>  {
>  	void __iomem *usb2_base = ch->base;
> @@ -130,8 +147,8 @@ static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
>  	rcar_gen3_set_host_mode(ch, 1);
>  	rcar_gen3_enable_vbus_ctrl(ch, 1);
>  
> -	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, true);
> -	extcon_set_cable_state_(ch->extcon, EXTCON_USB, false);
> +	ch->extcon_host = true;
> +	schedule_work(&ch->work);
>  }
>  
>  static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
> @@ -140,8 +157,8 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
>  	rcar_gen3_set_host_mode(ch, 0);
>  	rcar_gen3_enable_vbus_ctrl(ch, 0);
>  
> -	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, false);
> -	extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
> +	ch->extcon_host = false;
> +	schedule_work(&ch->work);
>  }
>  
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
> @@ -301,6 +318,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	if (irq >= 0) {
>  		int ret;
>  
> +		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>  		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
>  				       IRQF_SHARED, dev_name(dev), channel);
>  		if (irq < 0)
> 
