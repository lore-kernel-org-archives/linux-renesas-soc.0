Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:29871 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751765AbcHVHFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 03:05:24 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH/RFC 0/4] usb: gadget: add a new quirk to avoid skb_reserve
 in u_ether.c
Date: Mon, 22 Aug 2016 07:05:20 +0000
Message-ID: <HK2PR06MB0548CE86F525A516B6922B45D8E80@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87a8ga5y48.fsf@linux.intel.com>
In-Reply-To: <87a8ga5y48.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe-san,

> From: Felipe Balbi
> Sent: Thursday, August 18, 2016 4:35 PM
>=20
> Yoshihiro-san,
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> > This patch set is based on the latest Felipe's usb.git / testing/next b=
ranch.
> > (commit id =3D 15e4292a2d21e9997fdb2b8c014cc461b3f268f0)
> >
> > This patch set also needs an additional patch (like the end of this ema=
il)
> > to fix the renesas_usbhs driver for R-Car Gen3.
> > (I will submit this patch after v4.8-rc1 was released.)
> >
> > I'm not sure this is a correct way or not. So, I added "RFC" in this pa=
tch set.
> > About the detail of this patch set, please refer to the commit log of
> > first patch ("usb: gadget: add a new quirk to avoid skb_reserve in u_et=
her.c").
> >
> > Yoshihiro Shimoda (4):
> >   usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
> >   usb: gadget: u_ether: add a flag to avoid skb_reserve() calling
> >   usb: gadget: f_ncm: add support for no_skb_reserve
> >   usb: renesas_usbhs: set quirk_avoids_skb_reserve if USB-DMAC is used
> >
> >  drivers/usb/gadget/function/f_ncm.c    |  2 ++
> >  drivers/usb/gadget/function/u_ether.c  |  5 ++++-
> >  drivers/usb/gadget/function/u_ether.h  |  1 +
> >  drivers/usb/renesas_usbhs/mod_gadget.c |  2 ++
> >  include/linux/usb/gadget.h             | 13 +++++++++++++
> >  5 files changed, 22 insertions(+), 1 deletion(-)
>=20
> It has been over a month since you sent this series and nobody said
> anything. Can you resend without RFC so I can apply?

Sure! I will resend this patch set without RFC today (or tomorrow).

Best regards,
Yoshihiro Shimoda

> Thank you
>=20
> --
> balbi
