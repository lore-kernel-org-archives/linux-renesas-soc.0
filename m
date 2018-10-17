Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr20131.outbound.protection.outlook.com ([40.107.2.131]:22592
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727023AbeJQUun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 16:50:43 -0400
From: Peter Rosin <peda@axentia.se>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: Delay between stop condition and start condition
Date: Wed, 17 Oct 2018 12:55:05 +0000
Message-ID: <89a1bc12-60e8-b240-22fe-88b6ed5e6451@axentia.se>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai>
In-Reply-To: <20181017121607.GB3813@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DC4B1D9A30C7B54B9864CD4E1879CCEA@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-10-17 14:16, Wolfram Sang wrote:
>=20
>> Or, add an I2C gate driver (sort of like an I2C mux with only one child
>> bus) in the HDMI transmitter driver and implement the delay there. Then
>> move the monitor to this new gate/mux child bus.
>=20
> That would actually be my preferred solution. Because it describes the
> HW setup best. It is the passthrough creating the problem, so it should
> be fixed in its driver. It probably could be a generic driver, or?

Don't know about the possibility of a generic driver, but one thing to
look out for is that if the "gate" is left open at all times, *other*
xfers on the bus might not have the required delay between stop and
start, which might lead to the monitor (or other clients on the other
side of the HDMI transmitter) seeing potentially nasty things on the
distorted bus...

Cheers,
Peter
