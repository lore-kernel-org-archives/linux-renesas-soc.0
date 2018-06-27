Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:30836 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932135AbeF0Jsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 05:48:40 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: RE: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Date: Wed, 27 Jun 2018 09:48:36 +0000
Message-ID: <OSBPR01MB229371E806C2D772B426C469D8480@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato>
 <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
 <20180627084421.zrtpsms5eyftqcfb@ninjato>
In-Reply-To: <20180627084421.zrtpsms5eyftqcfb@ninjato>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 27, 2018 5:44 PM
>=20
> Hi,
>=20
> thanks for the discussion on this topic!
>=20
> > > The hardware team said:
> > >  - In CPG point of view:
> > >    - such polling doesn't need (because the reset pulse is generated =
correctly).
> > >    - About the interval after deassert the reset, this is depend on e=
ach hardware module.
> > >      (In other words, if each hardware module has a special handling =
about after the deassert interval,
> > >       we should follow the special handling.)
> > >  - The I2C controller needs an interval of reading SRCR at least (thi=
s is a special handling).
> > >
> > > So, I think adding this code is not good fit in CPG point of view.
> >
> > Calling reset_control_status() from i2c-rcar is fine for me.
> >
< snip >
>=20
> Where is this special handling documented BTW, I can't find it.

Please refer to "57.5.4 Usage note for the transmission and reception proce=
dure" in the datasheet Rev. 1.00.
I agree waiting for maximum 1024ms=20


> The BSP waits for maximum 1024ms which seems excessive to me.

The BSP waits for maximum 1024us, not 1024ms.

Best regards,
Yoshihiro Shimoda
