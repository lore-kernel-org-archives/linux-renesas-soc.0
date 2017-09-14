Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:34309 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdINP7P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 11:59:15 -0400
Date: Thu, 14 Sep 2017 17:59:11 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm: dts: gr-peach: Add ETHER pin group
Message-ID: <20170914155911.GI3358@w540>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
 <1503564523-31899-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUoMU=qN3Qjoqmf6uxcS3j5hqthhuBDMPZzA+wSD_BH5A@mail.gmail.com>
 <20170824114656.GA3905@w540>
 <CAMuHMdU5Vep+m7XtjcbSvyXUzD_Pn2crcQ68VRmS4bgY44ut0w@mail.gmail.com>
 <20170824125359.GB3905@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170824125359.GB3905@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert and Renesas-SoC list
 - devicetree
 - arm-linux

On Thu, Aug 24, 2017 at 02:53:59PM +0200, jmondi wrote:
> Thanks Geert,
>
> On Thu, Aug 24, 2017 at 01:56:16PM +0200, Geert Uytterhoeven wrote:
> > Hi Jacopo,
> >
>
> [snip]
>
> > > I haven't find any mention in device tree bindings documentation of a
> > > "reset-gpio" property for sh_eth, in the code examples I've seen in
> > > u-boot and mbed, the interface is reset before any actual
> > > configuration is performed. I feel like that should be the place where
> > > that gpio is requested and cycled...
> >
> > Documentation/devicetree/bindings/net/mdio.txt says
> >
> > These are generic properties that can apply to any MDIO bus.
> >
>
> I have now used mdio defined generic properties
>
> &ether {
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&ether_pins>;
>
> 	status = "okay";
>
> 	reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
> 	reset-delay-us = <5>;
>
> 	renesas,no-ether-link;
> 	phy-handle = <&phy0>;
> 	phy0: ethernet-phy@0 {
>                reg = <0>;
> 	};
> };
>
> I see the gpio being cycled, but same results as before: device gets
> probed, address set, but I cannot ping, device gets probed, address
> gets set, but I cannot ping
>

I'm back on this with a few days of more hacking, and I'm here to ask
you a suggestion on how to proceed on this.

I'm still in a situation where I'm not able to send any frame on the
interface (I can receive them though), and several traces show me that
the sh_eth_start_xmit() function never gets called, probably because
of the interface being put in QDISC_STATE_DEACTIVATE by some upper
layers state machine.

Compared to my initial submission, I have now made sure the
correct PHY is identified, as the gr-peach uses a LAN8710a
transceiver.

I have the PHY correctly identified during phy initialization

SMSC LAN8710/LAN8720 e8203000.ethernet-ffffffff:00: attached PHY driver [SMSC LAN8710/LAN8720] (mii_bus:phy_addr=e8203000.ethernet-ffffffff:00, irq=-1)

And I'm not worried by the "irq=-1" as Genmai has the same but Ethernet
works there...

This particular PHY has a nINTSEL pin that determinates if pin #18
has to be used as TxD4/TxERR of as interrupt signal nINT [1].
Compared to Genmai (and maybe other RZ devices) there is no interrupt
pin that goes from the PHY to the LSI, so I do now assume the only
option is to use TxD4 for this purpose (see P1_15 in Genmai schematics
[2])

gr-peach has a pull-up wired to nINTSEL pin [3] which makes me think
again that TxD4 pin is intended to be used as interrupt to the ETHER
interface (nINTSEL == Vdd -> use pin #18 as nINT signal).

Before going any further with this, I would like to better understand
if:

1) is an interrupt signal from PHY to ETHER mandatory? There is no
mention of in the ETHER pin description list of an interrupt pin, and
my understanding was the E-DMAC does not need any.
2) where is that interrupt pin described in dts for genmai and other
RZ devices?

Links to gr-peach schematics and LAN8710a datasheet (both publicly
available but uploaded here as I cannot retrieve links easily)
gr-peach: http://jmondi.org/owncloud/index.php/s/RbCvWCv9EWhtO9H
lan8710a: http://jmondi.org/owncloud/index.php/s/Its3RxdhfJtxc2n

Thanks
   j

[1] http://jmondi.org/owncloud/index.php/s/IH2vuCsGmoaqUL7
[2] http://jmondi.org/owncloud/index.php/s/qz6UZXUHPhQyMVm
[3] http://jmondi.org/owncloud/index.php/s/GAphEgxBXzbM2NI
