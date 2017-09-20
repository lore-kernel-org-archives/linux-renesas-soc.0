Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38360 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751192AbdITN2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 09:28:38 -0400
MIME-Version: 1.0
In-Reply-To: <1505398774-4852-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1505398774-4852-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 15:28:37 +0200
Message-ID: <CAMuHMdVxVzhKnO=JXQpyCipfqgtrWA+rOA3jGAaC7OVpTVGyrQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9548 I2C switch on I2C2 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
