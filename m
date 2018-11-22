Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:64419
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387840AbeKVUSw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 15:18:52 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
Date: Thu, 22 Nov 2018 09:40:03 +0000
Message-ID: <OSBPR01MB21034F65FE94BD81EC8C954EB8DB0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
 <1542626108-61344-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVpaB0mJq9LmBoHgBY9MNAXYAKN=h8hCX+iph+D_5pY=Q@mail.gmail.com>
 <20181121103517.GJ8367@piout.net>
In-Reply-To: <20181121103517.GJ8367@piout.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert and Alexandre,

Thanks for the feedback.

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: 21 November 2018 10:35
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Biju Das <biju.das@bp.renesas.com>; Alessandro Zummo
> <a.zummo@towertech.it>; linux-rtc@vger.kernel.org; Simon Horman
> <horms@verge.net.au>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; Linux-Renesas <linux-renesas-
> soc@vger.kernel.org>
> Subject: Re: [PATCH 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
>
> On 21/11/2018 11:23:08+0100, Geert Uytterhoeven wrote:
> > Hi Biju,
> >
> > On Mon, Nov 19, 2018 at 12:23 PM Biju Das <biju.das@bp.renesas.com>
> wrote:
> > > Add support for NXP pcf85263 real-time clock. pcf85263 rtc is
> > > compatible with pcf85363,except that pcf85363 has additional 64 bytes=
 of
> RAM.
> > >
> > > 1 byte of nvmem is supported and exposed in sysfs (# is the instance
> > > number,starting with 0): /sys/bus/nvmem/devices/pcf85263-#/nvmem
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/rtc/rtc-pcf85363.c
> > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > @@ -311,7 +311,30 @@ static int pcf85363_nvram_write(void *priv,
> unsigned int offset, void *val,
> > >                                  val, bytes);  }
> > >
> > > -static const struct regmap_config regmap_config =3D {
> > > +static int pcf85263_nvram_read(void *priv, unsigned int offset, void
> *val,
> > > +                              size_t bytes) {
> > > +       struct pcf85363 *pcf85363 =3D priv;
> > > +
> > > +       return regmap_read(pcf85363->regmap, CTRL_RAMBYTE, val); }
> >
> > AFAIU without reading the datasheet, the pcf85363 also has this
> > RAMBYTE register. Would it make sense to expose the contents on both
> parts?

>
> Yes it has. This series allows calling rtc_nvmem_register() multiple time=
s from
> the same driver:
>
> http://patchwork.ozlabs.org/project/rtc-linux/list/?series=3D75212

Will check and send v2,

1) For pcf85363, calling rtc_nvmem_register  twice (1 with 64 bytes and ano=
ther with 1 byte)

2) For pcf85263, calling rtc_nvmem_register   ( with 1 byte)

Regards,
Biju





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
