Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:41644 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932312AbeFFJ1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 05:27:40 -0400
Date: Wed, 6 Jun 2018 10:27:25 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand
        <mylene.josserand@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: Build secure_cntvoff.S unconditionally to fix
 shmobile !SMP build
Message-ID: <20180606092725.GX17671@n2100.armlinux.org.uk>
References: <1528275154-5164-1-git-send-email-geert+renesas@glider.be>
 <20180606090953.GW17671@n2100.armlinux.org.uk>
 <CAMuHMdVq0Mwui6jrnX4sd2=L+p3Ta4qM2PxQ2HLQ0btajTV6hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVq0Mwui6jrnX4sd2=L+p3Ta4qM2PxQ2HLQ0btajTV6hw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 06, 2018 at 11:22:41AM +0200, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Wed, Jun 6, 2018 at 11:09 AM, Russell King - ARM Linux
> <linux@armlinux.org.uk> wrote:
> >> Fixes: cad160ed0a94927e ("ARM: shmobile: Convert file to use cntvoff")
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This doesn't look right to me, but I don't have secure_cntvoff in any
> > tree here that I can look at to check.  What if secure_cntvoff contains
> > instructions only available on ARMv7 CPUs, and not ARMv4?
> 
> Compiled != called.

That makes little difference when the assembler validates that the
instructions are possible on the target architecture and errors out
if not.

That's why I qualified my reply by saying that I didn't have the
contents of secure_cntvoff to reference - there's no clue whether
it's a .c or .S file from just this patch, and there's no visibility
what it contains.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
