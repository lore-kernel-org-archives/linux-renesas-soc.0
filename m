Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36361 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbdIUJMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 05:12:14 -0400
MIME-Version: 1.0
In-Reply-To: <20170921085803.GQ15749@verge.net.au>
References: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505385043-1554-5-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20170921085803.GQ15749@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2017 11:12:12 +0200
Message-ID: <CAMuHMdUxerxm0BUzXjmQniDsgE2gxEEScCF=rBMdEVcET3EmFg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: enable USB2.0
 Host (EHCI/OHCI)
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 21, 2017 at 10:58 AM, Simon Horman <horms@verge.net.au> wrote:
> [CC Geert]
>
> On Thu, Sep 14, 2017 at 07:30:43PM +0900, Yoshihiro Shimoda wrote:
>> This patch enables USB2.0 Host (EHCI/OHCI) for r8a77995.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Hi Geert,
>
> thanks for reviewing patches 1-3 of this series.
> I think you missed this one.

Oops, this time with Reply-to-all:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
