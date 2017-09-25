Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35662 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935944AbdIYTPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 15:15:55 -0400
MIME-Version: 1.0
In-Reply-To: <20170925184545.5k4nke27rgud3uwp@sirena.org.uk>
References: <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20170925161637.D7471440058@finisterre.ee.mobilebroadband>
 <CAMuHMdVsRwW+10ERyTJAa8XhhkPMn4ruymUwPKot+kmczBwbcA@mail.gmail.com> <20170925184545.5k4nke27rgud3uwp@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2017 21:15:53 +0200
Message-ID: <CAMuHMdUv-5COUuzJOWx=BTb5oJ7tFOi1BpocuJ7+VuCZ3fEuPg@mail.gmail.com>
Subject: Re: Applied "spi: sh-msiof: Add compatible strings for r8a774[35]" to
 the spi tree
To: Mark Brown <broonie@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Mon, Sep 25, 2017 at 8:45 PM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Sep 25, 2017 at 07:48:44PM +0200, Geert Uytterhoeven wrote:
>> Please drop this patch, as there's no need to add explicit matching for these
>> compatible values. The family-specific compatible values (which the driver
>> already matches against) are sufficient.
>
> While the patch is not needed if people list the fallback property it
> also does no harm and provides a marginal documentation benefit in
> saying that someone has considered if any special handling is useful and
> decided that it isn't.

All true.

My rebuttal is threefold:
  1. Listing the fallback property is mandatory for new SoCs. We only keep
     the per-SoC compatible values in the driver for older SoCs that predate
     the introduction of fallback properties.
  2. Some harm is involved, in the form of increased kernel image size.
  3. When updating DT bindings for new SoCs, we usually add "No driver
     update is needed" to the patch description to clarify. Unfortunately
     that was missed here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
