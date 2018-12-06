Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44865 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbeLFPh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 10:37:27 -0500
MIME-Version: 1.0
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
 <1544086559-47141-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVv262dM8JGWN4w3h2kq4Y4ftRczn8TF-kM_fecF4GXnw@mail.gmail.com> <OSBPR01MB21039D89E5E8852574A18893B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21039D89E5E8852574A18893B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Dec 2018 16:37:13 +0100
Message-ID: <CAMuHMdWRz-iutKD54vtmJxnLsb3vtm1juYDw-k1+RFCNUVsjkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Thu, Dec 6, 2018 at 4:24 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
> > CC nvmem maintainer
> >
> > On Thu, Dec 6, 2018 at 10:04 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Add support for NXP pcf85263 real-time clock. pcf85263 rtc is
> > > compatible with pcf85363,except that pcf85363 has additional 64 bytes of
> > RAM.

> > > --- a/drivers/rtc/rtc-pcf85363.c
> > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > @@ -120,6 +120,11 @@ struct pcf85363 {
> > >         struct regmap           *regmap;
> > >  };
> > >
> > > +struct pcf85x63_config {
> > > +       struct regmap_config regmap;
> > > +       unsigned int num_nvram;
> > > +};
> > > +
> > >  static int pcf85363_rtc_read_time(struct device *dev, struct rtc_time
> > > *tm)  {
> > >         struct pcf85363 *pcf85363 = dev_get_drvdata(dev); @@ -311,25
> > > +316,68 @@ static int pcf85363_nvram_write(void *priv, unsigned int
> > offset, void *val,
> > >                                  val, bytes);  }
> > >
> > > -static const struct regmap_config regmap_config = {
> > > -       .reg_bits = 8,
> > > -       .val_bits = 8,
> > > -       .max_register = 0x7f,
> > > +static int pcf85x63_nvram_read(void *priv, unsigned int offset, void *val,
> > > +                              size_t bytes)
> >
> > Given bytes should be 1, val should be a pointer to a single byte...
> > What if bytes == 0?
>
> I doubt we get "bytes==0" because of the checks in " drivers/nvmem/core.c"
> Function " bin_attr_nvmem_read/ bin_attr_nvmem_write".

Depends. There are other functions calling nvmem_reg_{read,write}(),
e.g. nvmem_device_{read,write}().

>
> > > +{> +       struct pcf85363 *pcf85363 = priv;
> > > +
> > > +       return regmap_read(pcf85363->regmap, CTRL_RAMBYTE, val);
> >
> > However, regmap_read() has an unsigned int output parameter!
> > So it's writing too many bytes, and only writing the actual data byte to the
> > correct address on little-endian systems.
> > Hence you need to use an intermediate variable to convert from unsigned int
> > to byte.
>
> OK. Will use an intermediate integer variable.
>
> > > +}
> > > +
> > > +static int pcf85x63_nvram_write(void *priv, unsigned int offset, void *val,
> > > +                               size_t bytes) {
> > > +       struct pcf85363 *pcf85363 = priv;
> > > +
> > > +       return regmap_write(pcf85363->regmap, CTRL_RAMBYTE,
> > > +                               *((unsigned int *)val));
> >
> > Likewise for writing.
> >
> > > +}
> >
> > BTW, while the nvmem_device_{read,write}() public API is documented, the
> > nvmem_device.reg_{read,write}() driver API isn't.
> > And the behavior might be confusing.
> >
> > E.g.
> >  * Return: length of successful bytes read on success and negative
> >  * error code on error.
> >
> > The public API seems to assume the driver API returns zero on success, and
> > replaces the zero by the number of bytes requested.
> > If the requested number of bytes is too large, a zero success would be
> > converted to a value that's larger than the actual number of bytes
> > transferred!
> > However, the driver API can return a smaller (positive) number, which
> > matches "standard" read/write() APIs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
