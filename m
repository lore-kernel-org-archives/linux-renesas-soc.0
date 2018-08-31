Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:55429 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726959AbeHaHV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 03:21:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: RE: [PATCH 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Date: Fri, 31 Aug 2018 03:16:03 +0000
Message-ID: <OSBPR01MB22935B0AE0B261E717F8BCF5D80F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180830105403.17964-1-erosca@de.adit-jv.com>
 <20180830105403.17964-3-erosca@de.adit-jv.com>
In-Reply-To: <20180830105403.17964-3-erosca@de.adit-jv.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

Thank you very much for the patches!

> From: Eugeniu Rosca, Sent: Thursday, August 30, 2018 7:54 PM
>=20
> From: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
>=20
> When RCAR3 is in Gadget mode, if host is detached an interrupt
> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect host detach, extend the DVSQ_MASK to cover the
> Suspended bit of the DVSQ[2:0] bitfield from the Interrupt Status
> Register 0 (INTSTS0) register and perform appropriate action in the
> DVST interrupt handler (usbhsg_irq_dev_state).
>=20
> Without this commit, disconnection of the phone from R-Car-H3 ES2.0
> Salvator-X CN9 port is not recognized and reverse role switch does
> not not happen. If phone is connected again it does not enumerate.

I think s/not not/not/.

> With this commit, disconnection will be recognized and reverse role
> switch will happen. If phone is connected again it will enumerate

IIUC, reverse role switch will happen by a user space application.
Is it correct?

> properly and will become visible in the output of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  drivers/usb/renesas_usbhs/common.h     |  3 ++-
>  drivers/usb/renesas_usbhs/mod_gadget.c | 13 ++++++++++---
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usb=
hs/common.h
> index 6e02aa3e287f..9eb69d2a4640 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -163,11 +163,12 @@ struct usbhs_priv;
>  #define VBSTS	(1 << 7)	/* VBUS_0 and VBUSIN_0 Input Status */
>  #define VALID	(1 << 3)	/* USB Request Receive */
>=20
> -#define DVSQ_MASK		(0x3 << 4)	/* Device State */
> +#define DVSQ_MASK		(0x7 << 4)	/* Device State */
>  #define  POWER_STATE		(0 << 4)
>  #define  DEFAULT_STATE		(1 << 4)
>  #define  ADDRESS_STATE		(2 << 4)
>  #define  CONFIGURATION_STATE	(3 << 4)
> +#define  SUSPENDED_STATE	(4 << 4)
>=20
>  #define CTSQ_MASK		(0x7)	/* Control Transfer Stage */
>  #define  IDLE_SETUP_STAGE	0	/* Idle stage or setup stage */
> diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas=
_usbhs/mod_gadget.c
> index c068b673420b..1af8034d17c5 100644
> --- a/drivers/usb/renesas_usbhs/mod_gadget.c
> +++ b/drivers/usb/renesas_usbhs/mod_gadget.c
> @@ -465,12 +465,19 @@ static int usbhsg_irq_dev_state(struct usbhs_priv *=
priv,
>  {
>  	struct usbhsg_gpriv *gpriv =3D usbhsg_priv_to_gpriv(priv);
>  	struct device *dev =3D usbhsg_gpriv_to_dev(gpriv);
> +	int state =3D usbhs_status_get_device_state(irq_state);
>=20
>  	gpriv->gadget.speed =3D usbhs_bus_get_speed(priv);
>=20
> -	dev_dbg(dev, "state =3D %x : speed : %d\n",
> -		usbhs_status_get_device_state(irq_state),
> -		gpriv->gadget.speed);
> +	dev_dbg(dev, "state =3D %x : speed : %d\n", state, gpriv->gadget.speed)=
;
> +
> +	if (gpriv->driver &&
> +	    gpriv->driver->suspend &&
> +	    gpriv->gadget.speed !=3D USB_SPEED_UNKNOWN &&
> +	    (state & SUSPENDED_STATE)) {
> +		gpriv->driver->suspend(&gpriv->gadget);
> +		usb_gadget_set_state(&gpriv->gadget, USB_STATE_SUSPENDED);
> +	}

I think we also call gpriv->driver->resume() somehow. Otherwise,
/sys/devices/platform/soc/e6590000.usb/gadget/suspended value on R-Car H3
keeps 1 forever after the driver detects suspend state.

If we call the ->resume(), I think we also call usb_gadget_set_state() with
other USB_STATE_* value. So, I'm thinking if usbhs_status_get_device_state(=
) returns
enum usb_device_state value, it's useful.

What do you think?

Best regards,
Yoshihiro Shimoda

>  	return 0;
>  }
> --
> 2.18.0
