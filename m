Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:6458 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751626AbeEOHts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 03:49:48 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 6/6] usb: gadget: udc: renesas_usb3: disable the
 controller's irqs for reconnecting
Date: Tue, 15 May 2018 07:49:44 +0000
Message-ID: <OSBPR01MB229375D0F2348975A27AFCD1D8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523338734-20474-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180515073516.dohlnvtahelsw4tw@verge.net.au>
In-Reply-To: <20180515073516.dohlnvtahelsw4tw@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

Thank you for your review!

> From: Simon Horman, Sent: Tuesday, May 15, 2018 4:35 PM
>=20
> On Tue, Apr 10, 2018 at 02:38:54PM +0900, Yoshihiro Shimoda wrote:
> > This patch fixes an issue that reconnection is possible to fail
> > because unexpected state handling happens by the irqs. To fix the issue=
,
> > the driver disables the controller's irqs when disconnected.
> >
> > Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesa=
s USB3.0 peripheral controller")
> > Cc: <stable@vger.kernel.org> # v4.5+
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >
> > Remarks:
> >  - A new file in v2
> >
> >  drivers/usb/gadget/udc/renesas_usb3.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index 0e70163..5caf78b 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -623,6 +623,13 @@ static void usb3_disconnect(struct renesas_usb3 *u=
sb3)
> >  	usb3_usb2_pullup(usb3, 0);
> >  	usb3_clear_bit(usb3, USB30_CON_B3_CONNECT, USB3_USB30_CON);
> >  	usb3_reset_epc(usb3);
> > +	usb3_disable_irq_1(usb3, USB_INT_1_B2_RSUM | USB_INT_1_B3_PLLWKUP |
> > +			   USB_INT_1_B3_LUPSUCS | USB_INT_1_B3_DISABLE |
> > +			   USB_INT_1_SPEED | USB_INT_1_B3_WRMRST |
> > +			   USB_INT_1_B3_HOTRST | USB_INT_1_B2_SPND |
> > +			   USB_INT_1_B2_L1SPND | USB_INT_1_B2_USBRST);
>=20
> Hi Shimoda-san,
>=20
> is it intentional that USB_INT_1_VBUS_CNG is not disabled above?

Yes, because the USB_INT_1_VBUS_CNG is enabled in usb3_init_epc_registers()=
 below.

> > +	usb3_clear_bit(usb3, USB_COM_CON_SPD_MODE, USB3_USB_COM_CON);
> > +	usb3_init_epc_registers(usb3);

Best regards,
Yoshihiro Shimoda

> >  	if (usb3->driver)
> >  		usb3->driver->disconnect(&usb3->gadget);
> > --
> > 1.9.1
> >
