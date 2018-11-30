Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:51452 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbeK3XlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 18:41:25 -0500
Date: Fri, 30 Nov 2018 13:32:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
Message-ID: <20181130123213.GM8952@piout.net>
References: <1543510486-29532-1-git-send-email-biju.das@bp.renesas.com>
 <1543510486-29532-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXmS6cCZhX_b+oszDjt+t8zgAkCGApweOX-k0Uq05=AEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXmS6cCZhX_b+oszDjt+t8zgAkCGApweOX-k0Uq05=AEg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/11/2018 12:05:16+0100, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Thu, Nov 29, 2018 at 6:03 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add support for NXP pcf85263 real-time clock. pcf85263 rtc is compatible
> > with pcf85363,except that pcf85363 has additional 64 bytes of RAM.
> >
> > 1 byte of nvmem is supported and exposed in sysfs (# is the instance
> > number,starting with 0): /sys/bus/nvmem/devices/pcf85x63-#/nvmem
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V1-->V2 Incorporated Alexandre and Geert's review comment.
> 
> Thanks for the update!
> 
> > --- a/drivers/rtc/rtc-pcf85363.c
> > +++ b/drivers/rtc/rtc-pcf85363.c
> 
> > @@ -321,15 +344,25 @@ static int pcf85363_probe(struct i2c_client *client,
> >                           const struct i2c_device_id *id)
> >  {
> >         struct pcf85363 *pcf85363;
> > -       struct nvmem_config nvmem_cfg = {
> > -               .name = "pcf85363-",
> > -               .word_size = 1,
> > -               .stride = 1,
> > -               .size = NVRAM_SIZE,
> > -               .reg_read = pcf85363_nvram_read,
> > -               .reg_write = pcf85363_nvram_write,
> > +       const struct regmap_config *regmap_config = &pcf_85363_regmap_config;
> > +       struct nvmem_config nvmem_cfg[] = {
> 
> static?
> 
> Although the nvmem_config is copied, and thus static is not needed, I
> guess using static will decrease kernel size.
> 

Hum, I don't think, this is on the stack anyway.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
