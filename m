Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36151 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbeLGJpw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 04:45:52 -0500
MIME-Version: 1.0
References: <1544086559-47141-1-git-send-email-biju.das@bp.renesas.com>
 <1544086559-47141-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVv262dM8JGWN4w3h2kq4Y4ftRczn8TF-kM_fecF4GXnw@mail.gmail.com>
 <OSBPR01MB21039D89E5E8852574A18893B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdWRz-iutKD54vtmJxnLsb3vtm1juYDw-k1+RFCNUVsjkg@mail.gmail.com>
 <OSBPR01MB2103A13E75634AD81CFD1628B8A90@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20181206165202.GC8952@piout.net> <OSBPR01MB2103D626F5A58D86D726E721B8AA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103D626F5A58D86D726E721B8AA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Dec 2018 10:45:38 +0100
Message-ID: <CAMuHMdUXPPEqKiXC6reGkEUUAMUEK5Ku+zbDv0BS7KMVUYQGhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-rtc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Dec 7, 2018 at 10:34 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
> >
> > On 06/12/2018 15:49:57+0000, Biju Das wrote:

> > > > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP
> > > > pcf85263 rtc

> > > > On Thu, Dec 6, 2018 at 4:24 PM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > > > > Subject: Re: [PATCH v3 2/4] rtc: pcf85363: Add support for NXP
> > > > > > pcf85263 rtc CC nvmem maintainer
> > > > > > Given bytes should be 1, val should be a pointer to a single byte...
> > > > > > What if bytes == 0?
> > > > >
> > > > > I doubt we get "bytes==0" because of the checks in "
> > > > drivers/nvmem/core.c"
> > > > > Function " bin_attr_nvmem_read/ bin_attr_nvmem_write".
> > > >
> > > > Depends. There are other functions calling nvmem_reg_{read,write}(),
> > e.g.
> > > > nvmem_device_{read,write}().
> > >
> > > OK. In that case, I will return (-EINVAL)  for "bytes !=1"
> >
> > I think it is probably better to ensure the nvmem core never passes an invalid
> > number of bytes. All the ther RTC drivers make that assumption.
>
> In that case, I will do following checks in nvmem_device_{read,write}() before calling nvmem_reg_{read,write}(),
>
> nvmem_device_read
>
> /* Stop the user from reading */
> if (offset  >= nvmem->size)
> return 0;
>
> if (bytes == 0)
> return -EINVAL;

Why not 0?

>
> if (offset + bytes > nvmem->size)

This might overflow, please use check_add_overflow().

> bytes = nvmem->size - offset;
>
> nvmem_device_write
>
> /* Stop the user from writing */
> if (offset  >= nvmem->size)
> return -EFBIG;

ENOSPC?

+ same comments as for read.

Oh, and offset is unsigned int instead of loff_t.
Nobody's envisioning nvmem devices larger than 4 GiB?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
