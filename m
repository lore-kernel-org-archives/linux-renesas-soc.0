Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:43175 "EHLO
	relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750824AbcFBExO convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 00:53:14 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] usb: host: xhci: rcar: fix the quirks setting of
 XHCI_NO_64BIT_SUPPORT
Date: Thu, 2 Jun 2016 04:53:09 +0000
Message-ID: <SG2PR06MB091969FD15294489988CE414D8580@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87bn3ll7ei.fsf@linux.intel.com>
 <SG2PR06MB09197E3B4C185C618230B608D8470@SG2PR06MB0919.apcprd06.prod.outlook.com>
 <8760ttl573.fsf@linux.intel.com> <574EC9FA.2090105@linux.intel.com>
In-Reply-To: <574EC9FA.2090105@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Mathias Nyman
> Sent: Wednesday, June 01, 2016 8:42 PM
> 
> >>> isn't the following enough?
> >>>
> >>> @@ -4886,7 +4886,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
> >>>   		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
> >>>   	xhci_print_registers(xhci);
> >>>
> >>> -	xhci->quirks = quirks;
> >>> +	xhci->quirks |= quirks;
> >>>
> >>>   	get_quirks(dev, xhci);
> >>
> >> Thank you for the comment!
> >> You're correct. This also can resolve the issue.
> >> Do you prefer such a simple patch?
> >> At least, I prefer such a simple patch :)
> >
> > I'll defer that to Mathias :-)
> >
> 
> I think that xhci->quirks |= quirks will do as a rc fix.

Thank you very much for the comment and submitting such a patch!

> looks like setting xhci->quirks need some generic cleanup for usb-next.
> Now in 4.7-rc1 we set xhci->quirks before xhci_gen_setup in xhci_priv_init_quirk(),
> and during xhci_gen_setup() when copying module parameters quirk, and when calling
> the get_quirk() callback.
> 
> There is nothing special happening between xhci_priv_init_quirk and when calling
> get_quirks() in xhci_gen_setup() that need quirks to be set in two stages.
> 
> xhci pci drivers only use the get_quirk callback, platform drivers use both.
> 
> Looks like the get_quirk() callback is a legacy thing from when the memory for
> the xhci struct was allocated in xhci_gen_setup, and xhci->quirks could only be
> set after that.
> 
> Now xhci struct is part of the usb_hcd, so we could probably get rid of the get_quirk
> callback alltogether by setting the pci quirks in xhci_pci_setup

I understood it.

Best regards,
Yoshihiro Shimoda

> -Mathias
