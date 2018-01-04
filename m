Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:23448 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753488AbeADQGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 11:06:24 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] clocksource/drivers/ostm: Use unique device name
 instead of ostm
Date: Thu, 4 Jan 2018 16:06:18 +0000
Message-ID: <SG2PR06MB11656093841B4813142D8AFC8A1F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1507725113-18070-1-git-send-email-geert+renesas@glider.be>
 <1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB11657F97DA41FCA032C472A58A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB11657F97DA41FCA032C472A58A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, October 11, 2017, Chris Brandt wrote:
> On Wednesday, October 11, 2017, Jacopo Mondi wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Currently all OSTM devices are called "ostm", also in kernel messages.
> >
> > As there can be multiple instances in an SoC, this can confuse the user=
.
> > Hence construct a unique name from the DT node name, like is done for
> > platform devices.
> >
> > On GR-Peach, the boot log changes like:
> >
> >     -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff,
> > max_idle_ns: 57352151442 ns
> >     +clocksource: ostm /timer@fcfec000: mask: 0xffffffff max_cycles:
> > 0xffffffff, max_idle_ns: 57352151442 ns
> >      sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every
> > 64440619504ns
> >     -ostm: used for clocksource
> >     -ostm: used for clock events
> >     +ostm /timer@fcfec000: used for clocksource
> >     +ostm /timer@fcfec400: used for clock events
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
>=20
>=20
> My results on the RZ/A1H RSK board:
>=20
> $ dmesg | grep timer
> [    0.000000] clocksource: ostm /timer@fcfec000: mask: 0xffffffff
> max_cycles: 0xffffffff, max_idle_ns: 57352151442 ns
> [    0.008267] ostm /timer@fcfec000: used for clocksource
> [    0.014085] ostm /timer@fcfec400: used for clock events
> [    0.452022] sh_mtu2 fcff0000.timer: ch0: used for clock events
> [    0.475358] sh_mtu2 fcff0000.timer: PM domain cpg_clocks will not be
> powered off
> [    0.486528] clocksource: Switched to clocksource ostm /timer@fcfec000
>=20
>=20
> $ cat /proc/interrupts | grep timer
>  17:      18721     GIC-0 135 Edge      ostm /timer@fcfec400
>  40:          0     GIC-0 139 Level     fcff0000.timer
>=20
>=20
> Chris


Out of curiosity, what ever happened to this patch???


Chris
