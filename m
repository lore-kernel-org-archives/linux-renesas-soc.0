Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36415 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751826AbdJJJHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 05:07:16 -0400
MIME-Version: 1.0
In-Reply-To: <20171010084611.968735-1-arnd@arndb.de>
References: <20171010084611.968735-1-arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Oct 2017 11:07:14 +0200
Message-ID: <CAK8P3a0h0xGb3r=SdmyzNVGu5LmTG6GzvvxEsqmubBWJDFbG3A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a779x: add '#reset-cells' in cpg-mssr
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 10, 2017 at 10:45 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> With the latest dtc, we get many warnings about the missing
> '#reset-cells' property in these controllers, e.g.:
>
> arch/arm/boot/dts/r8a7790-lager.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /can@e6e80000:resets[0])
> arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/dma-controller@e6700000:resets[0])
> arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/ethernet@e6800000:resets[0])
> arch/arm/boot/dts/r8a7793-gose.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /gpio@e6050000:resets[0])
> arch/arm/boot/dts/r8a7794-alt.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /i2c@e6500000:resets[0])
> arch/arm/boot/dts/r8a7794-silk.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /interrupt-controller@e61c0000:resets[0])
>
> This adds it for the three r8a779x chips that were lacking it. The
> binding mandates this as <1>, so this is the value I use.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 1 +
>  arch/arm/boot/dts/r8a7792.dtsi | 1 +
>  arch/arm/boot/dts/r8a7794.dtsi | 1 +

It seems I missed the same problem in r8a7793. I'll do some more tests to
see if there is more of the same, and will send an updated patch once
I'm more confident I have the right version.

       Arnd
