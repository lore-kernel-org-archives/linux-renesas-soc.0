Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "kishon@ti.com" <kishon@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] phy: rcar-gen3-usb2: fix unexpected repeat interrupts of
 VBUS change
Date: Thu, 16 Jun 2016 09:04:52 +0000
Message-ID: <SG2PR06MB0919896B815C3A8A277D66C3D8560@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464698837-7556-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1464698837-7556-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kishon,

Would you review this patch?

Best regards,
Yoshihiro Shimoda

> -----Original Message-----
> From: Yoshihiro Shimoda
> Sent: Tuesday, May 31, 2016 9:47 PM
> To: kishon@ti.com
> Cc: linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; stable@vger.kernel.org; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH] phy: rcar-gen3-usb2: fix unexpected repeat interrupts of VBUS change
> 
> This patch fixes an issue that the driver is possible to cause
> unexpected repeat interrupts if a board condition is wrong
> (e.g. even if the ID pin is as function, a board supplies the VBUS.)
> 
> The reason why unexpected repeat interrupts happen is:
>  1) The driver changed the mode to function if it detected the ID pin
>     is high and the VBUS is high.
>  2) After the driver changed function mode, it disabled the "VBUS control"
>     feature. Then, the VBUS signal will be low.
>  3) Since the VBUS change interruption happened, the driver checked
>     the ID pin and VBUS.
>  4) Since VBUS was low, the driver changed the mode to host and enabled
>     the "VBUS control" feature. Then the VBUS signal will be high.
>  5) Since the VBUS change interruption happened, the driver did 1) above.
> 
> So, this patch modified the condition in rcar_gen3_device_recognition()
> to check the ID pin only.
> 
> Fixes: 1114e2d (phy: rcar-gen3-usb2: change the mode to OTG on the combined channel)
> Cc: <stable@vger.kernel.org> # v4.5+
> Reported-by: Simon Horman <horms@verge.net.au>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/phy-rcar-gen3-usb2.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
> index 76bb88f..4be3f5d 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -144,12 +144,6 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
>  	extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
>  }
> 
> -static bool rcar_gen3_check_vbus(struct rcar_gen3_chan *ch)
> -{
> -	return !!(readl(ch->base + USB2_ADPCTRL) &
> -		  USB2_ADPCTRL_OTGSESSVLD);
> -}
> -
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
>  {
>  	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> @@ -157,13 +151,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
> 
>  static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
>  {
> -	bool is_host = true;
> -
> -	/* B-device? */
> -	if (rcar_gen3_check_id(ch) && rcar_gen3_check_vbus(ch))
> -		is_host = false;
> -
> -	if (is_host)
> +	if (!rcar_gen3_check_id(ch))
>  		rcar_gen3_init_for_host(ch);
>  	else
>  		rcar_gen3_init_for_peri(ch);
> --
> 1.9.1
