Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35540 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731832AbeGSSAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:00:23 -0400
Received: by mail-wm0-f66.google.com with SMTP id y22-v6so7212909wma.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:16:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180719125934.GA1432@bigcity.dyn.berto.se>
References: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
 <20180719125934.GA1432@bigcity.dyn.berto.se>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 02:16:13 +0900
Message-ID: <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI files
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Jul 19, 2018 at 9:59 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> Hi Magnus,
>
> Thanks for your patch.
>
> On 2018-07-19 20:19:50 +0900, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Browsing the DTS for all the R-Car SoCs with similar part numbers
>> makes my head hurt, so to improve the user friendliness of the
>> DTS code base include R-Car product name in each DTSI file.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> ---
>>
>>  Based on renesas-drivers-2018-07-17-v4.18-rc5
>>
>>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi     |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi     |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi    |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a77970.dtsi    |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi    |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a77990.dtsi    |    2 +-
>>  arch/arm64/boot/dts/renesas/r8a77995.dtsi    |    2 +-
>>  8 files changed, 8 insertions(+), 8 deletions(-)
>>
>> --- 0001/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
>> +++ work/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi 2018-07-19 20:04:1=
0.900607110 +0900
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> - * Device Tree Source for the r8a7795 ES1.x SoC
>> + * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
>
> I'm just curies why do you append a extra 0 to the part number here and
> for M3-W? Other then I think this change is good and will help me as
> well to map part number to product name :-)

Good question!

I should probably have mentioned in the patch description that the
names and part numbers come from the file
Documentation/devicetree/bindings/arm/shmobile.txt.

Thanks for the feedback!

Cheers,

/ magnus
