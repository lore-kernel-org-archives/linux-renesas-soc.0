Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36429 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166158AbdDXHZN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 03:25:13 -0400
MIME-Version: 1.0
In-Reply-To: <1492779321-23939-1-git-send-email-geert+renesas@glider.be>
References: <1492779321-23939-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2017 09:25:10 +0200
Message-ID: <CAMuHMdXWptBgSxy44zLJU+=c3ycbMJ9jkc6UzDqkbSMznJqeUQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/5] arm64: dts: renesas: Break out common board support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 21, 2017 at 2:55 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Geert Uytterhoeven (5):
>   arm64: renesas: r8a7796: Add external audio clocks
>   arm64: renesas: r8a7796: Add external PCIe bus clock

Oops, the above should have had the proper "arm64: dts:" prefix.

>   [RFC] arm64: dts: r8a7796: Add placeholders for various devices
>   [RFC] arm64: dts: renesas: Extract common Salvator-X board support
>   [RFC] arm64: dts: renesas: Extract common ULCB board support

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
