Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:43160 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753136AbdJUKIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Oct 2017 06:08:43 -0400
MIME-Version: 1.0
In-Reply-To: <44bc181e-6fd2-4868-3c8d-64e66d9c8d6b@cogentembedded.com>
References: <1508487261-18524-1-git-send-email-geert+renesas@glider.be>
 <1508487261-18524-2-git-send-email-geert+renesas@glider.be>
 <2dacbfaf-ce5e-f113-9ae8-641441d99bbc@gmail.com> <44bc181e-6fd2-4868-3c8d-64e66d9c8d6b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Oct 2017 12:08:41 +0200
Message-ID: <CAMuHMdVsbc_+YEuZGXR6UTuwPuBLZRwcKRCmkABpQiJ6vgPkRQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] phylib: Add device reset GPIO support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Oct 21, 2017 at 12:03 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/20/2017 9:11 PM, Florian Fainelli wrote:
>>> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>> --- a/drivers/of/of_mdio.c
>>> +++ b/drivers/of/of_mdio.c
>
> [...]
>>>
>>> @@ -55,10 +56,22 @@ static int of_mdiobus_register_phy(struct mii_bus
>>> *mdio,
>>>         is_c45 = of_device_is_compatible(child,
>>>                                          "ethernet-phy-ieee802.3-c45");
>>>   +     /* Deassert the optional reset signal */
>>> +       gpiod = fwnode_get_named_gpiod(&child->fwnode, "reset-gpios", 0,
>>> +                                      GPIOD_OUT_LOW, "PHY reset");
>>> +       if (PTR_ERR(gpiod) == -ENOENT)
>>> +               gpiod = NULL;
>>> +       else if (IS_ERR(gpiod))
>>> +               return PTR_ERR(gpiod);
>>> +
>>>         if (!is_c45 && !of_get_phy_id(child, &phy_id))
>>>                 phy = phy_device_create(mdio, addr, phy_id, 0, NULL);
>>>         else
>>>                 phy = get_phy_device(mdio, addr, is_c45);
>>> +
>>> +       /* Assert the reset signal again */
>>> +       gpiod_set_value(gpiod, 1);
>>
>> You have a phy_device reference now, so why not call phy_device_reset()
>> directly here?
>
>    Symmetry, perhaps? (There was a gpiod_set_value(gpiod, 0) call above
> it...

Not only because of symmetry: the validity of the phy object hasn't been
checked yet (that's done immediately below), and phy->mdio.reset hasn't been
filled in yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
