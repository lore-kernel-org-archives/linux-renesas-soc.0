Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:52301 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750945AbeEUI5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:57:15 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list
 handling in printer_write()
Date: Mon, 21 May 2018 08:57:12 +0000
Message-ID: <OSBPR01MB22935EE44B856F9612DFB8C8D8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87r2m58pir.fsf@linux.intel.com>
 <OSBPR01MB2293D296A8A8F8249A6E6BFAD8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <87603h8mea.fsf@linux.intel.com>
In-Reply-To: <87603h8mea.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Felipe Balbi, Sent: Monday, May 21, 2018 5:05 PM
<snip>
> seems like it would be better to just move this like before
> usb_ep_queue():
>=20
> modified   drivers/usb/gadget/function/f_printer.c
> @@ -631,19 +631,19 @@ printer_write(struct file *fd, const char __user *b=
uf, size_t len, loff_t *ptr)
>  			return -EAGAIN;
>  		}
>=20
> +		list_add(&req->list, &dev->tx_reqs_active);
> +
>  		/* here, we unlock, and only unlock, to avoid deadlock. */
>  		spin_unlock(&dev->lock);
>  		value =3D usb_ep_queue(dev->in_ep, req, GFP_ATOMIC);
>  		spin_lock(&dev->lock);
>  		if (value) {
> +			list_del(&req->list);
>  			list_add(&req->list, &dev->tx_reqs);
>  			spin_unlock_irqrestore(&dev->lock, flags);
>  			mutex_unlock(&dev->lock_printer_io);
>  			return -EAGAIN;
>  		}
> -
> -		list_add(&req->list, &dev->tx_reqs_active);
> -
>  	}
>=20
>  	spin_unlock_irqrestore(&dev->lock, flags);
>=20
> --

Thank you very much for your patch! This could resolve the issue.
So, should I submit this your patch as your author?

Best regards,
Yoshihiro Shimoda

> balbi
