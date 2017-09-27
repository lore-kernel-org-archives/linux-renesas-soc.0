Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:64005 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752311AbdI0IkQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 04:40:16 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: fix usbhsf_fifo_clear() behavior
Date: Wed, 27 Sep 2017 08:40:12 +0000
Message-ID: <TY1PR06MB09922530F46716588B066A2DD8780@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1506499445-14826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170927083648.GA20317@kroah.com>
In-Reply-To: <20170927083648.GA20317@kroah.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Greg,

> -----Original Message-----
> From: Greg KH
> Sent: Wednesday, September 27, 2017 5:37 PM
>=20
> On Wed, Sep 27, 2017 at 05:04:05PM +0900, Yoshihiro Shimoda wrote:
> > This patch fixes two issues:
> >  - the usbhsf_fifo_clear() is possible to cause 10 msec delay if
> >    the pipe is RX direction and empty because the FRDY bit will never
> >    be set to 1 in such case.
> >  - sets the BCLR of {C,Dn}FIFOCTR to 1 even when it's non-DCP pipe and
> >    the FRDY bit sets to 0.
>=20
> Should this be two different patches because of this?

I got it. I will make two patches from this patch.

Best regards,
Yoshihiro Shimoda

> thanks,
>=20
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
