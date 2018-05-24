Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:45596 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965044AbeEXHZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 03:25:19 -0400
Received: by mail-vk0-f65.google.com with SMTP id n134-v6so368799vke.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 May 2018 00:25:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoT9hHrtiEBRvMrMortpGA4wP2eZKaUgJfnsGokigZuBmQ@mail.gmail.com>
References: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
 <152691390170.29667.18382622980928156135.sendpatchset@little-apple>
 <20180522131020.bogidnsugagerdou@verge.net.au> <CANqRtoT9hHrtiEBRvMrMortpGA4wP2eZKaUgJfnsGokigZuBmQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 May 2018 09:25:17 +0200
Message-ID: <CAMuHMdVAXsaN_fhD8vhMNvwBCOqn78xCQ7jC5Dce6LQk--XDzA@mail.gmail.com>
Subject: Re: [PATCH 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, May 24, 2018 at 4:23 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, May 22, 2018 at 10:10 PM, Simon Horman <horms@verge.net.au> wrote:
>> On Mon, May 21, 2018 at 11:45:01PM +0900, Magnus Damm wrote:
>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>
>>> Add IPMMU device nodes for the R-Car V3H SoC aka r8a77980.
>>>
>>> The r8a77980 IPMMU is quite similar to r8a77970 however VC0
>>> has been added. The IMSSTR bit assignment has also been
>>> reworked. Power domains are also quite different however the
>>> the documentation is rather unclear about this topic.
>>>
>>> Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.
>>>
>>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>>> ---
>>>
>>>  Developed on top of renesas-devel-20180518-v4.17-rc5
>>>
>>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   49 +++++++++++++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> --- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>>> +++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi    2018-05-21 22:31:52.460607110 +0900
>>> @@ -387,6 +387,55 @@
>>>                       dma-channels = <16>;
>>>               };
>>>
>>> +             ipmmu_ds1: mmu@e7740000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xe7740000 0 0x1000>;
>>> +                     renesas,ipmmu-main = <&ipmmu_mm 0>;
>>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             ipmmu_ir: mmu@ff8b0000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xff8b0000 0 0x1000>;
>>> +                     renesas,ipmmu-main = <&ipmmu_mm 3>;
>>> +                     power-domains = <&sysc R8A77980_PD_A3IR>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             ipmmu_mm: mmu@e67b0000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xe67b0000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
>>> +                                  <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             ipmmu_rt: mmu@ffc80000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xffc80000 0 0x1000>;
>>> +                     renesas,ipmmu-main = <&ipmmu_mm 10>;
>>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             ipmmu_vc0: mmu@fe6b0000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xfe6b0000 0 0x1000>;
>>> +                     renesas,ipmmu-main = <&ipmmu_mm 12>;
>>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             ipmmu_vi0: mmu@febd0000 {
>>> +                     compatible = "renesas,ipmmu-r8a77980";
>>> +                     reg = <0 0xfebd0000 0 0x1000>;
>>> +                     renesas,ipmmu-main = <&ipmmu_mm 14>;
>>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>
>> nit: I believe the IPMMU nodes should go above the AVB rather than the
>> MMC node to preserve the current node sorting order of:
>>
>> 1) bus address
>> 2) IP block
>> 3) alphabetical
>
> Will reposition the IPMMU nodes in next version. Will also add vip0
> and vip1 IPMMU nodes as described in the 1.0 data sheet.

Note that the BSP has patches to move the ipmmu_mm nodes first, to
work around probe order issues.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
