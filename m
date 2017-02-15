Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34267 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750806AbdBOKBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 05:01:49 -0500
Date: Wed, 15 Feb 2017 18:01:36 +0800
From: Peter Chen <hzpeterchen@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to get related device pointer via DT?
Message-ID: <20170215100136.GB26227@b29397-desktop>
References: <HK2PR06MB054824526D2975ADE8EA0405D85B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK2PR06MB054824526D2975ADE8EA0405D85B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 15, 2017 at 02:21:55AM +0000, Yoshihiro Shimoda wrote:
> Hi,
> 
> I would like to get a related device pointer on usb EHCI drivers (or USB framework)
> because related device (e.g. OHCI or UHCI, called "companion controllers") has to
> finish resuming. I discussed this topic with Alan:
> http://marc.info/?t=148653514200001&r=1&w=2
> 
> In PCI bus, USB framework already has such a feature in drivers/usb/core/hcd-pci.c.
> However, in platform devices, we don't have it for now. So, I would like to add it.
> 
> Then, I have 2 ideas to get the related device pointer:
> 
> A) We add a new property "companion" as usb-generic.txt and EHCI node(s) have
>    such a property to bind a companion controller.
> B) We assume EHCI controller binds a companion controller if some resources
>    (irq or clock) are the same and it has a compatible strings as "generic-[uo]hci"
>    for instance.
> 
> My environment is R-Car H3, and it has 3 EHCI and 3 OHCI controllers.
> For example (I only wrote channel 0 of EHCI and OHCI):
> 		ehci0: usb@ee080100 {
> 			compatible = "generic-ehci";
> 			reg = <0 0xee080100 0 0x100>;
> 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> 			clocks = <&cpg CPG_MOD 703>;
> 			phys = <&usb2_phy0>;
> 			phy-names = "usb";
> 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> 			status = "disabled";
> 		};
> 
> 		ohci0: usb@ee080000 {
> 			compatible = "generic-ohci";
> 			reg = <0 0xee080000 0 0x100>;
> 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> 			clocks = <&cpg CPG_MOD 703>;
> 			phys = <&usb2_phy0>;
> 			phy-names = "usb";
> 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> 			status = "disabled";
> 		};
> 
> If my idea A), ehci0 will have companion = <&ohci>;
> If my idea B), no need to add any property.
> 
> What do you think?
> Anyway, I will start to study DT programming :)
> 

>From my point, idea A is better. It seems you have similar idea when you
tried Dual-role framework before. [1]

[1] https://patchwork.kernel.org/patch/9169745/

-- 

Best Regards,
Peter Chen
