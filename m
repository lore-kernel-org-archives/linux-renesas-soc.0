Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:33413 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726959AbeHaHWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 03:22:49 -0400
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
Subject: RE: [PATCH 2/3] usb: renesas_usbhs: enable DVSE interrupt
Date: Fri, 31 Aug 2018 03:17:26 +0000
Message-ID: <OSBPR01MB22932584BDAE2C7DFD781B8CD80F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180830105403.17964-1-erosca@de.adit-jv.com>
 <20180830105403.17964-2-erosca@de.adit-jv.com>
In-Reply-To: <20180830105403.17964-2-erosca@de.adit-jv.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

> From: Eugeniu Rosca, Sent: Thursday, August 30, 2018 7:54 PM
>=20
> Commit [1] enabled the possibility of checking the DVST (Device State
> Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> the irq_dev_state() handler if the DVST bit is set. But neither
> commit [1] nor commit [2] actually enabled the DVSE (Device State
> Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> Register 0). As a consequence, irq_dev_state() handler is getting
> called as a side effect of other (non-DVSE) interrupts being fired,
> which definitely can't be relied upon, if DVST notifications are of
> any value.
>=20
> Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> doesn't do much except of a dev_dbg(). Once more work is added to
> the handler (e.g. detecting device "Suspended" state and notifying
> other USB gadget components about it), enabling DVSE becomes a hard
> requirement. Do it in a standalone commit for better visibility and
> clear explanation.
>=20
> [1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> [2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
>=20
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
