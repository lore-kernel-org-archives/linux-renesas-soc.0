Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36072 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbeJQS1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 14:27:14 -0400
Date: Wed, 17 Oct 2018 12:32:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: Delay between stop condition and start condition
Message-ID: <20181017103208.GA1589@kunai>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio, everyone,

Thanks for bringing this up!

> What's the best way to address this? I could pull in the HDMI
> transmitter driver the code to read the EDID back from the monitor so
> that I can fit device specific delays without impacting the generic
> implementation of the EDID readback, but that would replicate some
> code and the driver would not benefit from fixes made to the generic
> implementation. I could change the RCar I2C driver in order to fit a
> new DT parameter (i2c-delay-after-stop-us?), and the driver would put
> in the desired delay after every stop condition, but isn't this
> parameter something every I2C controller would benefit from (now that
> we know we have a use case for it)? What are your thoughts and
> recommendations?

No need for a property. The I2C standard has a clearly defined value for
that which is named 'tbuf' and is in general the same value as the
minimal low period of the SCL signal. So, it must be handled at the I2C
bus master level.

Currently, we have no rule at what time drivers have to leave the
master_xfer() callback. Some exit when STOP is still processed, some
when STOP has been sent. I am not aware of a driver respecting tbuf. It
seems worth recommending to respect tbuf.

I think this needs to be completely handled in the bus master driver. We
have USB-to-I2C bridges which we can control only high level and the
firmware of those need to respect tbuf. I don't see how the I2C core
could support individual drivers here.

So, that's how I see this situation. Other comments? Other ideas?

Thanks,

   Wolfram
