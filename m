Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:28385 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751037AbcFALeh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 07:34:37 -0400
Message-ID: <574EC9FA.2090105@linux.intel.com>
Date: Wed, 01 Jun 2016 14:41:46 +0300
From: Mathias Nyman <mathias.nyman@linux.intel.com>
MIME-Version: 1.0
To: Felipe Balbi <felipe.balbi@linux.intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] usb: host: xhci: rcar: fix the quirks setting
 of XHCI_NO_64BIT_SUPPORT
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87bn3ll7ei.fsf@linux.intel.com> <SG2PR06MB09197E3B4C185C618230B608D8470@SG2PR06MB0919.apcprd06.prod.outlook.com> <8760ttl573.fsf@linux.intel.com>
In-Reply-To: <8760ttl573.fsf@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>>> isn't the following enough?
>>>
>>> @@ -4886,7 +4886,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>>>   		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
>>>   	xhci_print_registers(xhci);
>>>
>>> -	xhci->quirks = quirks;
>>> +	xhci->quirks |= quirks;
>>>
>>>   	get_quirks(dev, xhci);
>>
>> Thank you for the comment!
>> You're correct. This also can resolve the issue.
>> Do you prefer such a simple patch?
>> At least, I prefer such a simple patch :)
>
> I'll defer that to Mathias :-)
>

I think that xhci->quirks |= quirks will do as a rc fix.

looks like setting xhci->quirks need some generic cleanup for usb-next.
Now in 4.7-rc1 we set xhci->quirks before xhci_gen_setup in xhci_priv_init_quirk(),
and during xhci_gen_setup() when copying module parameters quirk, and when calling
the get_quirk() callback.

There is nothing special happening between xhci_priv_init_quirk and when calling
get_quirks() in xhci_gen_setup() that need quirks to be set in two stages.

xhci pci drivers only use the get_quirk callback, platform drivers use both.

Looks like the get_quirk() callback is a legacy thing from when the memory for
the xhci struct was allocated in xhci_gen_setup, and xhci->quirks could only be
set after that.

Now xhci struct is part of the usb_hcd, so we could probably get rid of the get_quirk
callback alltogether by setting the pci quirks in xhci_pci_setup

-Mathias  
