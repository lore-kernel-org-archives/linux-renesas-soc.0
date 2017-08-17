Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34758 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750755AbdHQH0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 03:26:12 -0400
Received: by mail-pg0-f68.google.com with SMTP id y192so8503488pgd.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Aug 2017 00:26:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1708162058410.2102@hadrien>
References: <alpine.DEB.2.20.1708162058410.2102@hadrien>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 09:26:11 +0200
Message-ID: <CAMuHMdVnqwosSQsOQA2rnSTdQ8pKTfUuFFQQETjbWkZWr+fBzg@mail.gmail.com>
Subject: Re: [renesas-drivers:clk-renesas-for-v4.14 10/11] drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17:
 duplicated argument to && or || (fwd)
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Julia,

On Wed, Aug 16, 2017 at 8:59 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> On line 149, it looks like one extal should instead be xtal.

Thank you, that is correct. Fixed.

------ Forwarded message ----------
> Date: Thu, 17 Aug 2017 02:43:28 +0800
> From: kbuild test robot <fengguang.wu@intel.com>
> To: kbuild@01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: [renesas-drivers:clk-renesas-for-v4.14 10/11]
>     drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17: duplicated argument to
>     && or ||
>
> CC: kbuild-all@01.org
> CC: linux-renesas-soc@vger.kernel.org
> TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> CC: Geert Uytterhoeven <geert+renesas@glider.be>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-for-v4.14
> head:   344fae7f354bdb869115212a56d39d5f2034466d
> commit: 0b2934329320899150286a7fdec9c7d143d0bdb9 [10/11] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY
> :::::: branch date: 11 hours ago
> :::::: commit date: 11 hours ago
>
>>> drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17: duplicated argument to && or ||
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=0b2934329320899150286a7fdec9c7d143d0bdb9
> git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> git remote update renesas-drivers
> git checkout 0b2934329320899150286a7fdec9c7d143d0bdb9
> vim +149 drivers/clk/renesas/rcar-usb2-clock-sel.c
>
> 0b293432 Yoshihiro Shimoda 2017-07-25  116
> 0b293432 Yoshihiro Shimoda 2017-07-25  117  static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
> 0b293432 Yoshihiro Shimoda 2017-07-25  118  {

> 0b293432 Yoshihiro Shimoda 2017-07-25 @149      if (!priv->extal && !priv->extal) {
> 0b293432 Yoshihiro Shimoda 2017-07-25  150              dev_err(dev, "This driver needs usb_extal or usb_xtal\n");
> 0b293432 Yoshihiro Shimoda 2017-07-25  151              return -ENOENT;
> 0b293432 Yoshihiro Shimoda 2017-07-25  152      }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
