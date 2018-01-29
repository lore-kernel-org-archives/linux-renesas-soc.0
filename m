Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:43692 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751072AbeA2RSx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jan 2018 12:18:53 -0500
Date: Mon, 29 Jan 2018 11:18:51 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 11/16] mmc: tmio: deprecate
 "toshiba,mmc-wrprotect-disable" DT property
Message-ID: <20180129171851.rlraudj2bq7irmdw@rob-hp-laptop>
References: <1516206496-16612-1-git-send-email-yamada.masahiro@socionext.com>
 <1516206496-16612-12-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQUJw-fjuJO68Kvskn8BRYW3rZj4YMtbo-Oxfv7c=6Ggg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQUJw-fjuJO68Kvskn8BRYW3rZj4YMtbo-Oxfv7c=6Ggg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 18, 2018 at 10:58:36AM +0900, Masahiro Yamada wrote:
> 2018-01-18 1:28 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > This property is equivalent to "disable-wp" defined in
> > Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> 
> This is mistake.
> 
> "disable-wp" is defined in
> 
> Documentation/devicetree/bindings/mmc/mmc.txt
> 
> 
> 
> 
> > The TMIO MMC core calls mmc_of_parse(), and it sets
> > MMC_CAP2_NO_WRITE_PROTECT if "disable-wp" property is present.
> >
> > We do not need a vendor-specific property to do the same thing.
> >
> > Let's remove the description from the dt-binding to prevent new boards
> > from using it.
> >
> > I am keeping the driver code for existing DT files, but added
> > comments that this is deprecated.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > Changes in v3:
> >   - newly added
> >
> > Changes in v2: None
> >
> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 -

Other than the above,

Acked-by: Rob Herring <robh@kernel.org>

> >  drivers/mmc/host/tmio_mmc_core.c                   | 5 +++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
