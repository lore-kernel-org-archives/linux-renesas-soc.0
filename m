Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46441 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750944AbeEUIGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:06:32 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list handling in printer_write()
In-Reply-To: <OSBPR01MB2293D296A8A8F8249A6E6BFAD8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87r2m58pir.fsf@linux.intel.com> <OSBPR01MB2293D296A8A8F8249A6E6BFAD8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Date: Mon, 21 May 2018 11:04:45 +0300
Message-ID: <87603h8mea.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:

> Hi,
>
>> From: Felipe Balbi, Sent: Monday, May 21, 2018 3:57 PM
>>=20
>> Hi,
>>=20
>> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>> > The usb_ep_queue() in printer_write() is possible to call req->complet=
e().
>> > In that case, since tx_complete() calls list_add(&req->list, &dev->tx_=
reqs),
>> > printer_write() should not call list_add(&req->list, &dev->tx_reqs_act=
ive)
>> > because the transfer has already finished. So, this patch checks
>> > the condition of req->list before adding the list in printer_write().
>> >
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > ---
>> >  This issue can be caused by renesas_usbhs udc driver. I'm not sure
>> >  this patch is acceptable or not. So, I marked RFC on this patch.
>>=20
>> can you explain this a little more? How do you trigger the problem?
>
> Sure. If printer_write() called usb_ep_queue() with 63 bytes or less data,
> the renesas_usbhs udc driver transfers data as PIO. In this case, the udc
> driver calls usb_gadget_giveback_reuqest() in .queue ops (usbhsg_ep_queue=
())
> immediately. Then, printer_write() calls list_add(&req->list, &dev->tx_re=
qs_active); wrongly.
> After that, if we do rmmod g_printer, WARN_ON(!list_empty(&dev->tx_reqs_a=
ctive); happens in
> printer_func_unbind() because the list entry is not removed.
>
> < Reference: calltrace (very long though...) >
> 	usb_ep_queue(...);		at f_printer.c / printer_write()
> 	1-> usbhsg_ep_queue();		at renesas_usbhs/mod_gadget.c
> 	 2-> usbhsg_queue_push();
> 	  3-> usbhs_pkt_start();		at renesas_usbhs/fifo.c
> 	   4-> usbhsf_pkt_handler();
> 	    5-> func() =3D usbhsf_dma_prepare_push();
> 	     6-> goto usbhsf_pio_prepare_push; // Because len is 63
> 	      7-> usbhsf_pio_prepare_push();
> 	       8-> usbhsf_pio_try_push();
>             5-> done() =3D usbhsg_queue_done();	at renesas_usbhs/mod_gadg=
et.c
> 	     6-> __usbsg_queue_pop();
> 	      7-> usb_gadget_giveback_reuqest();
> 	       8-> tx_complete();		at f_printer.c
>                 9-> list_del_init(&req->list);
>                 9-> list_add(&req->list, &dev->tx_reqs);
> 	list_add(&req->list, &dev->tx_reqs_active);	// Even if the transaction a=
lready finished, this driver is possible to add the list to "active".

seems like it would be better to just move this like before
usb_ep_queue():

modified   drivers/usb/gadget/function/f_printer.c
@@ -631,19 +631,19 @@ printer_write(struct file *fd, const char __user *buf=
, size_t len, loff_t *ptr)
 			return -EAGAIN;
 		}
=20
+		list_add(&req->list, &dev->tx_reqs_active);
+
 		/* here, we unlock, and only unlock, to avoid deadlock. */
 		spin_unlock(&dev->lock);
 		value =3D usb_ep_queue(dev->in_ep, req, GFP_ATOMIC);
 		spin_lock(&dev->lock);
 		if (value) {
+			list_del(&req->list);
 			list_add(&req->list, &dev->tx_reqs);
 			spin_unlock_irqrestore(&dev->lock, flags);
 			mutex_unlock(&dev->lock_printer_io);
 			return -EAGAIN;
 		}
=2D
=2D		list_add(&req->list, &dev->tx_reqs_active);
=2D
 	}
=20
 	spin_unlock_irqrestore(&dev->lock, flags);

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlsCfZ0ACgkQzL64meEa
mQYXKg//frwLouy+TW0wSb7Xhu/t9GqT1Ss8CuLDnh1mlLn/PmhOa/iu9WnP4y1/
e7pJF/I3xjxEHDl8AUPz1fE5dh5lVJIgdAZpsgwmNVzYs7rIi8pwfoOcPwAGQMhV
aS+aWs9LAKgpHqEj+zel13i0nQmEmz+NjDrLlCnC8J0M3y5aIDUXtOob2MPiXfLl
7GArjnlGr/1JSY9E/IRMrc8QcEA9Kb6QwJW1AdR90co/vjLes+auWZvAd6oJEFvO
RpFyHkwD1XIwGVfr+wKGUk2pGYYAb3FdsqfYxf/+eIcYhxF2I0+DdCQHL7H6Pa9w
3pgpTnqeKqYHVIrk6jsCVrJQjoQPSA7N1UIlQO4FbE7Jgi2K3B1sLZjX1esn6998
hhXRfL4wCrKKF07/RVulpl3vbxnhkGomH9M9PD0fpr2IToEY38KMmGZX966rvB/N
pk93VVe01SW3C0WwiOwnokwzlojnFgQDqiSmVVfMw8/dmeevBxCecvTSMlCCaYBu
hS15ylmJYTPzqZbUzvyzjPxLn1nuxFOobaKMaNPlfijMK0SfPWAgIovjISBR3ecA
iU+vJ1j9jlFheI9rzU7fr2svRV+C9k67SHMZqrh35Fgf+8SGdLuuuSrdV+zxvPKU
3ZFLBIDi7Ja6ybGkloLCjK5aitC2SpFdjxKrPCwt9l/LDXTjcLg=
=s1bR
-----END PGP SIGNATURE-----
--=-=-=--
