Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:24717 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726936AbeJQTWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 15:22:49 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <simon@horms.net>
Subject: RE: Delay between stop condition and start condition
Date: Wed, 17 Oct 2018 11:27:23 +0000
Message-ID: <TY1PR01MB1770B9FD09815A344C330FB6C0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
In-Reply-To: <20181017103208.GA1589@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram,

Thank you so much for your feedback!

> Subject: Re: Delay between stop condition and start condition
>
> Hi Fabrizio, everyone,
>
> Thanks for bringing this up!
>
> > What's the best way to address this? I could pull in the HDMI
> > transmitter driver the code to read the EDID back from the monitor so
> > that I can fit device specific delays without impacting the generic
> > implementation of the EDID readback, but that would replicate some
> > code and the driver would not benefit from fixes made to the generic
> > implementation. I could change the RCar I2C driver in order to fit a
> > new DT parameter (i2c-delay-after-stop-us?), and the driver would put
> > in the desired delay after every stop condition, but isn't this
> > parameter something every I2C controller would benefit from (now that
> > we know we have a use case for it)? What are your thoughts and
> > recommendations?
>
> No need for a property. The I2C standard has a clearly defined value for
> that which is named 'tbuf' and is in general the same value as the
> minimal low period of the SCL signal. So, it must be handled at the I2C
> bus master level.
>
> Currently, we have no rule at what time drivers have to leave the
> master_xfer() callback. Some exit when STOP is still processed, some
> when STOP has been sent. I am not aware of a driver respecting tbuf. It
> seems worth recommending to respect tbuf.
>
> I think this needs to be completely handled in the bus master driver. We
> have USB-to-I2C bridges which we can control only high level and the
> firmware of those need to respect tbuf. I don't see how the I2C core
> could support individual drivers here.
>
> So, that's how I see this situation. Other comments? Other ideas?

My understanding is that when this HDMI transmitter is configured in pass
through mode then a bigger 'tbuf' is required.
The I2C spec (v2.1) says that in "standard mode" tbuf>=3D4.7us" and in
fast-mode "tbuf>=3D1.3us", in this particular case the 20us of bus free tim=
e
between the STOP and START conditions you find in the trace are not enough.
This device seems to require an out of spec solution (an hack..), what's th=
e
most acceptable solution from an upstreaming perspective? Other platforms
may want to use the same HDMI transmitter in their solutions and may
stumble across the same problem if the platform is quick enough.
I may just put this delay in the driver and call it a day by wrapping
writes/reads/modifies and stuff? What do you think?

Thanks,
Fab

>
> Thanks,
>
>    Wolfram



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
