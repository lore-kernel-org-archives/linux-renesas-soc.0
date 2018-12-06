Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:50758 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbeLFQwE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 11:52:04 -0500
Date: Thu, 6 Dec 2018 17:52:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
Message-ID: <20181206165202.GC8952@piout.net>
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
 <1544086559-47141-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVv262dM8JGWN4w3h2kq4Y4ftRczn8TF-kM_fecF4GXnw@mail.gmail.com>
 <OSBPR01MB21039D89E5E8852574A18893B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdWRz-iutKD54vtmJxnLsb3vtm1juYDw-k1+RFCNUVsjkg@mail.gmail.com>
 <OSBPR01MB2103A13E75634AD81CFD1628B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103A13E75634AD81CFD1628B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/12/2018 15:49:57+0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
> >
> > Hi Biju,
> >
> > On Thu, Dec 6, 2018 at 4:24 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP
> > > > pcf85263 rtc CC nvmem maintainer
> > > >
> > > > On Thu, Dec 6, 2018 at 10:04 AM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > > > Add support for NXP pcf85263 real-time clock. pcf85263 rtc is
> > > > > compatible with pcf85363,except that pcf85363 has additional 64
> > > > > bytes of
> > > > RAM.
> >
> > > > > --- a/drivers/rtc/rtc-pcf85363.c
> > > > > +++ b/drivers/rtc/rtc-pcf85363.c
> > > > > @@ -120,6 +120,11 @@ struct pcf85363 {
> > > > >         struct regmap           *regmap;
> > > > >  };
> > > > >
> > > > > +struct pcf85x63_config {
> > > > > +       struct regmap_config regmap;
> > > > > +       unsigned int num_nvram;
> > > > > +};
> > > > > +
> > > > >  static int pcf85363_rtc_read_time(struct device *dev, struct
> > > > > rtc_time
> > > > > *tm)  {
> > > > >         struct pcf85363 *pcf85363 = dev_get_drvdata(dev); @@
> > > > > -311,25
> > > > > +316,68 @@ static int pcf85363_nvram_write(void *priv, unsigned
> > > > > +int
> > > > offset, void *val,
> > > > >                                  val, bytes);  }
> > > > >
> > > > > -static const struct regmap_config regmap_config = {
> > > > > -       .reg_bits = 8,
> > > > > -       .val_bits = 8,
> > > > > -       .max_register = 0x7f,
> > > > > +static int pcf85x63_nvram_read(void *priv, unsigned int offset, void
> > *val,
> > > > > +                              size_t bytes)
> > > >
> > > > Given bytes should be 1, val should be a pointer to a single byte...
> > > > What if bytes == 0?
> > >
> > > I doubt we get "bytes==0" because of the checks in "
> > drivers/nvmem/core.c"
> > > Function " bin_attr_nvmem_read/ bin_attr_nvmem_write".
> >
> > Depends. There are other functions calling nvmem_reg_{read,write}(), e.g.
> > nvmem_device_{read,write}().
> 
> OK. In that case, I will return (-EINVAL)  for "bytes !=1"
> 

I think it is probably better to ensure the nvmem core never passes an
invalid number of bytes. All the ther RTC drivers make that assumption.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
