Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13075 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752306AbdJKNbw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 09:31:52 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] clocksource/drivers/ostm: Use unique device name
 instead of ostm
Date: Wed, 11 Oct 2017 13:30:33 +0000
Message-ID: <SG2PR06MB11657F97DA41FCA032C472A58A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1507725113-18070-1-git-send-email-geert+renesas@glider.be>
 <1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1507727130-17641-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, October 11, 2017, Jacopo Mondi wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Currently all OSTM devices are called "ostm", also in kernel messages.
>=20
> As there can be multiple instances in an SoC, this can confuse the user.
> Hence construct a unique name from the DT node name, like is done for
> platform devices.
>=20
> On GR-Peach, the boot log changes like:
>=20
>     -clocksource: ostm: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 57352151442 ns
>     +clocksource: ostm /timer@fcfec000: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 57352151442 ns
>      sched_clock: 32 bits at 33MHz, resolution 30ns, wraps every
> 64440619504ns
>     -ostm: used for clocksource
>     -ostm: used for clock events
>     +ostm /timer@fcfec000: used for clocksource
>     +ostm /timer@fcfec400: used for clock events
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---


My results on the RZ/A1H RSK board:

$ dmesg | grep timer
[    0.000000] clocksource: ostm /timer@fcfec000: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 57352151442 ns
[    0.008267] ostm /timer@fcfec000: used for clocksource
[    0.014085] ostm /timer@fcfec400: used for clock events
[    0.452022] sh_mtu2 fcff0000.timer: ch0: used for clock events
[    0.475358] sh_mtu2 fcff0000.timer: PM domain cpg_clocks will not be pow=
ered off
[    0.486528] clocksource: Switched to clocksource ostm /timer@fcfec000


$ cat /proc/interrupts | grep timer
 17:      18721     GIC-0 135 Edge      ostm /timer@fcfec400
 40:          0     GIC-0 139 Level     fcff0000.timer


Chris
