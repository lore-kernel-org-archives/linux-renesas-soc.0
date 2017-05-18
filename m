Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 18 May 2017 18:33:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] of_mdio: Fix broken PHY IRQ in case of probe deferral
Message-ID: <20170518163328.GD707@lunn.ch>
References: <1495112345-24795-1-git-send-email-geert+renesas@glider.be>
 <20170518160943.GC707@lunn.ch>
 <CAMuHMdW_ZSn_nXSNRTHQwFioRD5UTotxKgm1eMqAP06n+cWv+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_ZSn_nXSNRTHQwFioRD5UTotxKgm1eMqAP06n+cWv+g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> >>               phy = get_phy_device(mdio, addr, is_c45);
> >>       if (IS_ERR(phy))
> >> -             return;
> >> +             return PTR_ERR(phy);
> >>
> >> -     rc = irq_of_parse_and_map(child, 0);
> >> +     rc = of_irq_get(child, 0);
> >> +     if (rc == -EPROBE_DEFER) {
> >> +             phy_device_free(phy);
> >> +             return rc;
> >> +     }
> >
> > Maybe this should be consistent. All other places there is an error,
> > you return it. Here however, you only return the error if it is
> > EPROBE_DEFER.
> 
> That's because of the "else" branch in the code below:
> 
>         if (rc > 0) {
>                 phy->irq = rc;
>                 mdio->irq[addr] = rc;
>         } else {
>                 phy->irq = mdio->irq[addr];
>         }
> 
> cfr. the marked part of the patch description.
> I didn't want to change that behavior, as it's not clear to me why it's handled
> that way.

So there seems to be 3 conditions that need handling:

1) of_irq_get() gives us an interrupt number.
2) of_irq_get() indicates there is no irq in the device tree.
3) of_irq_get() indicates a real error

1) We have.

2) We should fall back to using the mdio busses irq for the
device. There are a couple of mdio drivers which do this, e.g.
stmicro/stmmac/stmmac_mdio.c. mdiobus_alloc() ensures it is set to
PHY_POLL, so if the driver does not set it, we poll.

3) This is new. We have two choices. Ignore the error and poll. Or
return the error. Historically we have ignored the error. But should
we? I would probably return the error, now that we can. But...

Florian?

	Andrew
