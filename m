Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:33462 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1946499AbdDYMVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2017 08:21:48 -0400
Received: by mail-wr0-f172.google.com with SMTP id w50so84501644wrc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2017 05:21:48 -0700 (PDT)
Date: Tue, 25 Apr 2017 13:21:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Message-ID: <20170425122144.lxeuxohwg2rnw3zn@dell>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
 <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
 <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
 <ae65d889-baf4-e24b-d72d-05f29bba4f87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae65d889-baf4-e24b-d72d-05f29bba4f87@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 25 Apr 2017, Marek Vasut wrote:

> On 04/25/2017 11:32 AM, Linus Walleij wrote:
> > On Mon, Apr 24, 2017 at 5:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > 
> >> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> >> This block is pretty trivial and supports setting GPIO direction
> >> as Input/Output and in case of Output, supports setting value.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: linux-gpio@vger.kernel.org
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> V2: Use linux/gpio/driver.h instead of linux/gpio.h
> > 
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Are you merging this through MFD?
> 
> I thought that was a question for Lee initially , IMO it'd make sense if
> this went through one tree.

Because your mailer is broken, I know have no idea which thread this
mail belongs to.  Please fix your mailer to reply 'threaded'.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
