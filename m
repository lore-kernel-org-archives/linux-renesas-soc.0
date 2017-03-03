Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35219 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751512AbdCCLxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 06:53:35 -0500
Received: by mail-io0-f193.google.com with SMTP id f103so6496347ioi.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Mar 2017 03:52:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170302143638.GS6301@verge.net.au>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481129067-21949-4-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdUGbb4CjpGzXapprrcuKAfKw3wkYc77JOn1EKNRsMm3VA@mail.gmail.com> <20170302143638.GS6301@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Mar 2017 10:54:01 +0100
Message-ID: <CAMuHMdXaEDn30U=LTp7szRQYwTp48SfR6MFCYQ+aTBWXF41tEQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: renesas: r8a7796: Enable SCIF DMA
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Mar 2, 2017 at 3:36 PM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Feb 21, 2017 at 03:27:25PM +0100, Geert Uytterhoeven wrote:
>> On Wed, Dec 7, 2016 at 5:44 PM, Ulrich Hecht
>> <ulrich.hecht+renesas@gmail.com> wrote:
>> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> > ---
>> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> > index c5f0df5..782063a 100644
>> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> > @@ -430,6 +430,9 @@
>> >                                  <&cpg CPG_CORE R8A7796_CLK_S3D1>,
>> >                                  <&scif_clk>;
>> >                         clock-names = "fck", "brg_int", "scif_clk";
>> > +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>,
>> > +                              <&dmac2 0x51>, <&dmac2 0x50>;
>> > +                       dma-names = "tx", "rx", "tx", "rx";
>> >                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>> >                         status = "disabled";
>>
>> Apparently the DMA properties were added to the HSCIF nodes instead
>> of the SCIF nodes while applying this patch?
>>
>> 3 lines of context is not sufficient to distinguish between the various SCIF
>> and HSCIF nodes :-(
>
> Thanks, I have updated renesas-devel accordingly.
>
> I notice in renesas-devel there seems to be one "tx", "rx" DMA per SCIF
> rather than two added in Ulrich's patch. Is there a reason for that?

You mean renesas-drivers?

Oops, looks like I cherry-picked an older version of the patch, and failed to
notice after reverting your wrong version
(perhaps the final version was never part of a pull request from Uli?).

BTW, your version  is wrong, too: the second pair of DMA channels
should point to dmac2, not dmac1, e.g.:

                  scif0: serial@e6e60000 {
                          compatible = "renesas,scif-r8a7796",
                                       "renesas,rcar-gen3-scif", "renesas,scif";
                          reg = <0 0xe6e60000 0 64>;
                          interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
                          clocks = <&cpg CPG_MOD 207>,
                                   <&cpg CPG_CORE R8A7796_CLK_S3D1>,
                                   <&scif_clk>;
                          clock-names = "fck", "brg_int", "scif_clk";
  +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>,
- +                              <&dmac1 0x51>, <&dmac1 0x50>;
+ +                              <&dmac2 0x51>, <&dmac2 0x50>;

  +                       dma-names = "tx", "rx", "tx", "rx";
                          power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
                          status = "disabled";
                  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
