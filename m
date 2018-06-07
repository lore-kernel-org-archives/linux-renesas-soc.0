Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35885 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752585AbeFGHBs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 03:01:48 -0400
Received: by mail-wr0-f194.google.com with SMTP id f16-v6so8804269wrm.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 00:01:48 -0700 (PDT)
Date: Thu, 7 Jun 2018 08:01:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v5 04/14] mfd: da9063: Use REGMAP_IRQ_REG
Message-ID: <20180607070144.GE21163@dell>
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <20180606100003.17067-4-marek.vasut+renesas@gmail.com>
 <CAMuHMdXdoAaBbx+_G3+n=e+zki3z20t7ATXttDUnmYRu95HMVA@mail.gmail.com>
 <3317638e-8688-35ef-ab61-7281312f2c3f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3317638e-8688-35ef-ab61-7281312f2c3f@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 06 Jun 2018, Marek Vasut wrote:

> On 06/06/2018 01:31 PM, Geert Uytterhoeven wrote:
> > Hi Marek,
> > 
> > On Wed, Jun 6, 2018 at 11:59 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> >> Convert the regmap_irq table to use REGMAP_IRQ_REG().
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > 
> > Again:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Added.
> 
> And the obvious question is, what do you all use to collect these tags?
> Doing it manually sucks.

Manually for me.  Copy paste.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
