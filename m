Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:65226 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751058AbeEUH5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 03:57:36 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list
 handling in printer_write()
Date: Mon, 21 May 2018 07:57:32 +0000
Message-ID: <OSBPR01MB2293D296A8A8F8249A6E6BFAD8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87r2m58pir.fsf@linux.intel.com>
In-Reply-To: <87r2m58pir.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Felipe Balbi, Sent: Monday, May 21, 2018 3:57 PM
>=20
> Hi,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > The usb_ep_queue() in printer_write() is possible to call req->complete=
().
> > In that case, since tx_complete() calls list_add(&req->list, &dev->tx_r=
eqs),
> > printer_write() should not call list_add(&req->list, &dev->tx_reqs_acti=
ve)
> > because the transfer has already finished. So, this patch checks
> > the condition of req->list before adding the list in printer_write().
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This issue can be caused by renesas_usbhs udc driver. I'm not sure
> >  this patch is acceptable or not. So, I marked RFC on this patch.
>=20
> can you explain this a little more? How do you trigger the problem?

Sure. If printer_write() called usb_ep_queue() with 63 bytes or less data,
the renesas_usbhs udc driver transfers data as PIO. In this case, the udc
driver calls usb_gadget_giveback_reuqest() in .queue ops (usbhsg_ep_queue()=
)
immediately. Then, printer_write() calls list_add(&req->list, &dev->tx_reqs=
_active); wrongly.
After that, if we do rmmod g_printer, WARN_ON(!list_empty(&dev->tx_reqs_act=
ive); happens in
printer_func_unbind() because the list entry is not removed.

< Reference: calltrace (very long though...) >
	usb_ep_queue(...);		at f_printer.c / printer_write()
	1-> usbhsg_ep_queue();		at renesas_usbhs/mod_gadget.c
	 2-> usbhsg_queue_push();
	  3-> usbhs_pkt_start();		at renesas_usbhs/fifo.c
	   4-> usbhsf_pkt_handler();
	    5-> func() =3D usbhsf_dma_prepare_push();
	     6-> goto usbhsf_pio_prepare_push; // Because len is 63
	      7-> usbhsf_pio_prepare_push();
	       8-> usbhsf_pio_try_push();
            5-> done() =3D usbhsg_queue_done();	at renesas_usbhs/mod_gadget=
.c
	     6-> __usbsg_queue_pop();
	      7-> usb_gadget_giveback_reuqest();
	       8-> tx_complete();		at f_printer.c
                9-> list_del_init(&req->list);
                9-> list_add(&req->list, &dev->tx_reqs);
	list_add(&req->list, &dev->tx_reqs_active);	// Even if the transaction alr=
eady finished, this driver is possible to add the list to "active".

Best regards,
Yoshihiro Shimoda

> --
> balbi
