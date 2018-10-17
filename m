Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:52574 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726727AbeJQV66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 17:58:58 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <simon@horms.net>
Subject: RE: Delay between stop condition and start condition
Date: Wed, 17 Oct 2018 14:03:02 +0000
Message-ID: <TY1PR01MB177036EC6AEADEED8ECFA21FC0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai> <20181017122141.GC3813@kunai>
In-Reply-To: <20181017122141.GC3813@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: Re: Delay between stop condition and start condition
>
>
> > be fixed in its driver. It probably could be a generic driver, or?
>
> Wishful thinking. Setting the passthrough mode is probably not default,
> so it is device specific.

The passthrough mode is not default, it gets activated by the driver so tha=
t
drm_get_edid can then fetch the EDID. One other nasty thing is that to end =
the conversation
with the monitor you are supposed to write 0x00 to register 0x1a of the HDM=
I transmitter,
which means the SoC puts address 0x39 on the bus, but the HDMI transmitter =
lets that
through, the monitor NACKs the address (because its address is 0x50), and f=
rom that
moment on the control is back with the HDMI transmitter.
Unfortunately I don't have any other slave on the same bus, but I wonder wh=
at happens
if someone else tries to use the same bus while the pass through mode is op=
erating...




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
