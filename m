Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:39731 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933608AbeAKQAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 11:00:04 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVH4TJM=eZcEe7d-G_ykQPjAMajOgtvSOPKRtUTP1CjRA@mail.gmail.com>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180111.104835.381039264896352436.davem@davemloft.net> <20180111155316.GV17719@n2100.armlinux.org.uk>
 <CAMuHMdVH4TJM=eZcEe7d-G_ykQPjAMajOgtvSOPKRtUTP1CjRA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jan 2018 17:00:03 +0100
Message-ID: <CAMuHMdVyU5EWM5W3rO2o5uQkEdCWLH+xaAJCEN=0iYLj6xy+vg@mail.gmail.com>
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: David Miller <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 11, 2018 at 4:54 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jan 11, 2018 at 4:53 PM, Russell King - ARM Linux
> <linux@armlinux.org.uk> wrote:
>> On Thu, Jan 11, 2018 at 10:48:35AM -0500, David Miller wrote:
>>> From: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Date: Tue,  9 Jan 2018 12:11:21 +0100
>>>
>>> > In case of success, the return values of (__)phy_write() and
>>> > (__)phy_modify() are not compatible: (__)phy_write() returns 0, while
>>> > (__)phy_modify() returns the old PHY register value.
>>> >
>>> > Apparently this change was catered for in drivers/net/phy/marvell.c, but
>>> > not in other source files.
>>> >
>>> > Hence genphy_restart_aneg() now returns 4416 instead zero, which is
>>> > considered an error:
>>> >
>>> >     ravb e6800000.ethernet eth0: failed to connect PHY
>>> >     IP-Config: Failed to open eth0
>>> >     IP-Config: No network devices available
>>> >
>>> > Fix this by converting positive values to zero in all callers of
>>> > phy_modify().
>>> >
>>> > Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
>>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> > ---
>>> > Alternatively, __phy_modify() could be changed to follow __phy_write()
>>> > semantics?
>>>
>>> I really want a resolution to this quickly, this broke lots of stuff
>>> for people.
>>>
>>> __phy_modify() wants to return multiple values, so it should be coded
>>> up to do so explicitly rather than trying to encode two values from
>>> overlapping value spaces in one return value.
>>>
>>> That means the original value should be returned by-reference.  And
>>> this will make the error/no-error return value unambiguous.
>>>
>>> int __phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set,
>>>                u16 *orig_val);
>>
>> I'm sorry I have no time to work on this right now due to the meltdown
>> and spectre stuff that hit last week.  If you need to do something,
>> please revert both the mvneta series and the series containing this
>> patch.
>
> I'll have a look into it...

Sorry, the phy_restore_page() semantics are driving me crazy.
Let's revert.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
