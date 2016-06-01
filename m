Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:54508 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752036AbcFAHry convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:47:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Felipe Balbi <felipe.balbi@linux.intel.com>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] usb: host: xhci: rcar: fix the quirks setting of
 XHCI_NO_64BIT_SUPPORT
Date: Wed, 1 Jun 2016 07:47:49 +0000
Message-ID: <SG2PR06MB09197E3B4C185C618230B608D8470@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87bn3ll7ei.fsf@linux.intel.com>
In-Reply-To: <87bn3ll7ei.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe,

> From: Felipe Balbi
> Sent: Wednesday, June 01, 2016 4:01 PM
> 
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> 
> > I'm afraid but I found a regression of xhci-rcar in v4.7-rc1.
> > This regression is caused by the following commit:
> >
> > commit b1c127ae990bccf0187d741c1695a61e54de1943
> > Author: Felipe Balbi <felipe.balbi@linux.intel.com>
> > Date:   Fri Apr 22 13:17:16 2016 +0300
> >
> >     usb: host: xhci: plat: make use of new methods in xhci_plat_priv
> >
> >     Now that the code has been refactored enough,
> >     switching over to using ->plat_start() and
> >     ->init_quirk() becomes a very simple patch.
> >
> >     After this patch, there are no further uses for
> >     xhci_plat_type_is() which will be removed in a
> >     follow-up patch.
> >
> >     Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> >     Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > < Overview >
> > The regression is the quirks flag "XHCI_NO_64BIT_SUPPORT" will be overwritten
> > by xhci_gen_setup(). Then, the driver will not work correctly.
> >
> > < Detail >
> > Since the previous code will do the following, the quirks flag can be set:
> >
> > xhci_plat_setup()
> >  -> xhci_gen_setup(hcd, xhci_plat_quirks);
> >   -> xhci->quirks = quirks;
> >    -> get_quirks() [This is xhci_plat_quirks]
> >     -> xhci->quirks |= XHCI_NO_64BIT_SUPPORT
> >
> > However, after we applied the patch above, the quirks will disappear:
> >
> > xhci_plat_setup()
> >  -> xhci_priv_init_quirk();
> >   -> xhci_rcar_init_quirk();
> >    -> xhci->quirks |= XHCI_NO_64BIT_SUPPORT
> >   -> xhci_gen_setup(hcd, xhci_plat_quirks);
> >    -> xhci->quirks = quirks; <----------------- here
> >     -> get_quirks() [This is xhci_plat_quirks]
> >
> > So, I submitted incremental patches to resolve this issue like the followings:
> >
> > xhci_plat_setup()
> >  -> xhci_priv_init_quirk();
> >   -> xhci_rcar_init_quirk();
> >   -> xhci_gen_setup(hcd, xhci_plat_quirks);
> >    -> xhci->quirks = quirks;
> >     -> get_quirks() [This is xhci_plat_quirks]
> >      -> xhci->quirks |= priv->quirks (XHCI_NO_64BIT_SUPPORT)
> 
> isn't the following enough?
> 
> @@ -4886,7 +4886,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
>  	xhci_print_registers(xhci);
> 
> -	xhci->quirks = quirks;
> +	xhci->quirks |= quirks;
> 
>  	get_quirks(dev, xhci);

Thank you for the comment!
You're correct. This also can resolve the issue.
Do you prefer such a simple patch?
At least, I prefer such a simple patch :)
Why I wrote this patch set is I thought I should implement similar flow before regression.

Best regards,
Yoshihiro Shimoda
