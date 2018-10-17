Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:17703 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727128AbeJRAlK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 20:41:10 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <simon@horms.net>
Subject: RE: Delay between stop condition and start condition
Date: Wed, 17 Oct 2018 16:44:21 +0000
Message-ID: <TY1PR01MB17708DF036C99D83255A2A24C0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai> <20181017122141.GC3813@kunai>
 <TY1PR01MB177036EC6AEADEED8ECFA21FC0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017142347.GA5141@kunai>
In-Reply-To: <20181017142347.GA5141@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: Re: Delay between stop condition and start condition
>
>
> > The passthrough mode is not default, it gets activated by the driver so=
 that
> > drm_get_edid can then fetch the EDID. One other nasty thing is that to =
end the conversation
> > with the monitor you are supposed to write 0x00 to register 0x1a of the=
 HDMI transmitter,
> > which means the SoC puts address 0x39 on the bus, but the HDMI transmit=
ter lets that
> > through, the monitor NACKs the address (because its address is 0x50), a=
nd from that
> > moment on the control is back with the HDMI transmitter.
> > Unfortunately I don't have any other slave on the same bus, but I wonde=
r what happens
> > if someone else tries to use the same bus while the pass through mode i=
s operating...
>
> Wouldn't all this really speak for an i2c gate? Do all enablement stuff
> in select(), all disablement stuff in deselect(), and make sure
> deselect() is called after every transfer. That would mean the
> passthrough is only active when the EDID eeprom is accessed. Would that
> work? Given the above, it looks quite sane to do it like that in order
> to avoid side-effects of the open passthrough.

It sounds like an i2c gate could fit the purpose. I'll give it a shot!

Thank you All!

Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
