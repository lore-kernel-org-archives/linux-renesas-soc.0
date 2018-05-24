Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46917 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935319AbeEXCXO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 22:23:14 -0400
Received: by mail-wr0-f196.google.com with SMTP id x9-v6so113728wrl.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 May 2018 19:23:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180522131020.bogidnsugagerdou@verge.net.au>
References: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
 <152691390170.29667.18382622980928156135.sendpatchset@little-apple> <20180522131020.bogidnsugagerdou@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 24 May 2018 11:23:12 +0900
Message-ID: <CANqRtoT9hHrtiEBRvMrMortpGA4wP2eZKaUgJfnsGokigZuBmQ@mail.gmail.com>
Subject: Re: [PATCH 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 22, 2018 at 10:10 PM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, May 21, 2018 at 11:45:01PM +0900, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Add IPMMU device nodes for the R-Car V3H SoC aka r8a77980.
>>
>> The r8a77980 IPMMU is quite similar to r8a77970 however VC0
>> has been added. The IMSSTR bit assignment has also been
>> reworked. Power domains are also quite different however the
>> the documentation is rather unclear about this topic.
>>
>> Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> ---
>>
>>  Developed on top of renesas-devel-20180518-v4.17-rc5
>>
>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   49 +++++++++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> --- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi    2018-05-21 22:31:52.460607110 +0900
>> @@ -387,6 +387,55 @@
>>                       dma-channels = <16>;
>>               };
>>
>> +             ipmmu_ds1: mmu@e7740000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xe7740000 0 0x1000>;
>> +                     renesas,ipmmu-main = <&ipmmu_mm 0>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>> +             ipmmu_ir: mmu@ff8b0000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xff8b0000 0 0x1000>;
>> +                     renesas,ipmmu-main = <&ipmmu_mm 3>;
>> +                     power-domains = <&sysc R8A77980_PD_A3IR>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>> +             ipmmu_mm: mmu@e67b0000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xe67b0000 0 0x1000>;
>> +                     interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>> +             ipmmu_rt: mmu@ffc80000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xffc80000 0 0x1000>;
>> +                     renesas,ipmmu-main = <&ipmmu_mm 10>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>> +             ipmmu_vc0: mmu@fe6b0000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xfe6b0000 0 0x1000>;
>> +                     renesas,ipmmu-main = <&ipmmu_mm 12>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>> +             ipmmu_vi0: mmu@febd0000 {
>> +                     compatible = "renesas,ipmmu-r8a77980";
>> +                     reg = <0 0xfebd0000 0 0x1000>;
>> +                     renesas,ipmmu-main = <&ipmmu_mm 14>;
>> +                     power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>> +                     #iommu-cells = <1>;
>> +             };
>> +
>
> nit: I believe the IPMMU nodes should go above the AVB rather than the
> MMC node to preserve the current node sorting order of:
>
> 1) bus address
> 2) IP block
> 3) alphabetical

Will reposition the IPMMU nodes in next version. Will also add vip0
and vip1 IPMMU nodes as described in the 1.0 data sheet.

Thanks,

/ magnus
