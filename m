Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:26550
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725998AbeLGJeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 04:34:18 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: RE: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
Date: Fri, 7 Dec 2018 09:34:11 +0000
Message-ID: <OSBPR01MB2103D626F5A58D86D726E721B8AA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
 <1544086559-47141-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVv262dM8JGWN4w3h2kq4Y4ftRczn8TF-kM_fecF4GXnw@mail.gmail.com>
 <OSBPR01MB21039D89E5E8852574A18893B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdWRz-iutKD54vtmJxnLsb3vtm1juYDw-k1+RFCNUVsjkg@mail.gmail.com>
 <OSBPR01MB2103A13E75634AD81CFD1628B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20181206165202.GC8952@piout.net>
In-Reply-To: <20181206165202.GC8952@piout.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alexandre,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 r=
tc
>
> On 06/12/2018 15:49:57+0000, Biju Das wrote:
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP
> > > pcf85263 rtc
> > >
> > > Hi Biju,
> > >
> > > On Thu, Dec 6, 2018 at 4:24 PM Biju Das <biju.das@bp.renesas.com>
> wrote:
> > > > > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP
> > > > > pcf85263 rtc CC nvmem maintainer
> > > > >
> > > > > On Thu, Dec 6, 2018 at 10:04 AM Biju Das
> > > > > <biju.das@bp.renesas.com>
> > > wrote:
> > > > > > Add support for NXP pcf85263 real-time clock. pcf85263 rtc is
> > > > > > compatible with pcf85363,except that pcf85363 has additional
> > > > > > 64 bytes of
> > > > > RAM.
> > >
> > > > > > --- a/drivers/rtc/rtc-pcf85363.c
> > > > > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > > > > @@ -120,6 +120,11 @@ struct pcf85363 {
> > > > > >         struct regmap           *regmap;
> > > > > >  };
> > > > > >
> > > > > > +struct pcf85x63_config {
> > > > > > +       struct regmap_config regmap;
> > > > > > +       unsigned int num_nvram; };
> > > > > > +
> > > > > >  static int pcf85363_rtc_read_time(struct device *dev, struct
> > > > > > rtc_time
> > > > > > *tm)  {
> > > > > >         struct pcf85363 *pcf85363 =3D dev_get_drvdata(dev); @@
> > > > > > -311,25
> > > > > > +316,68 @@ static int pcf85363_nvram_write(void *priv,
> > > > > > +unsigned int
> > > > > offset, void *val,
> > > > > >                                  val, bytes);  }
> > > > > >
> > > > > > -static const struct regmap_config regmap_config =3D {
> > > > > > -       .reg_bits =3D 8,
> > > > > > -       .val_bits =3D 8,
> > > > > > -       .max_register =3D 0x7f,
> > > > > > +static int pcf85x63_nvram_read(void *priv, unsigned int
> > > > > > +offset, void
> > > *val,
> > > > > > +                              size_t bytes)
> > > > >
> > > > > Given bytes should be 1, val should be a pointer to a single byte=
...
> > > > > What if bytes =3D=3D 0?
> > > >
> > > > I doubt we get "bytes=3D=3D0" because of the checks in "
> > > drivers/nvmem/core.c"
> > > > Function " bin_attr_nvmem_read/ bin_attr_nvmem_write".
> > >
> > > Depends. There are other functions calling nvmem_reg_{read,write}(),
> e.g.
> > > nvmem_device_{read,write}().
> >
> > OK. In that case, I will return (-EINVAL)  for "bytes !=3D1"
> >
>
> I think it is probably better to ensure the nvmem core never passes an in=
valid
> number of bytes. All the ther RTC drivers make that assumption.

In that case, I will do following checks in nvmem_device_{read,write}() bef=
ore calling nvmem_reg_{read,write}(),

nvmem_device_read

/* Stop the user from reading */
if (offset  >=3D nvmem->size)
return 0;

if (bytes =3D=3D 0)
return -EINVAL;

if (offset + bytes > nvmem->size)
bytes =3D nvmem->size - offset;

nvmem_device_write

/* Stop the user from writing */
if (offset  >=3D nvmem->size)
return -EFBIG;

if (bytes =3D=3D 0)
return -EINVAL;

if (offset + bytes > nvmem->size)
bytes =3D nvmem->size - offset;

regards,
Biju





[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
