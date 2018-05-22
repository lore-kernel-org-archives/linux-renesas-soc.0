Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:47042 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbeEVMAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:00:32 -0400
Received: by mail-ua0-f196.google.com with SMTP id e8-v6so12082196uam.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 May 2018 05:00:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3087943.gJsCFVCJnt@avalon>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com> <3087943.gJsCFVCJnt@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 May 2018 14:00:30 +0200
Message-ID: <CAMuHMdUYNpPuujL=Uq3ho5Ogu0Vs-orWS4p3ZedujnRWER5kgw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77995: Add LVDS support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sun, May 20, 2018 at 10:50 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 15 May 2018 15:20:38 EEST Ulrich Hecht wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> [uli: moved lvds* into the soc node, added PM domains, resets]
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 ++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index ba98865..8e78110d 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> @@ -757,12 +757,68 @@
>>                               port@1 {
>>                                       reg = <1>;
>>                                       du_out_lvds0: endpoint {
>> +                                             remote-endpoint = <&lvds0_in>;
>>                                       };
>>                               };
>>
>>                               port@2 {
>>                                       reg = <2>;
>>                                       du_out_lvds1: endpoint {
>> +                                             remote-endpoint = <&lvds1_in>;
>> +                                     };
>> +                             };
>> +                     };
>> +             };
>> +
>> +             lvds0: lvds-encoder@feb90000 {
>> +                     compatible = "renesas,r8a77995-lvds";
>> +                     reg = <0 0xfeb90000 0 0x20>;
>> +                     clocks = <&cpg CPG_MOD 727>;
>> +                     power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
>> +                     resets = <&cpg 727>;
>> +                     status = "disabled";
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             port@0 {
>> +                                     reg = <0>;
>> +                                     lvds0_in: endpoint {
>> +                                             remote-endpoint = <&du_out_lvds0>;
>> +                                     };
>> +                             };
>> +
>> +                             port@1 {
>> +                                     reg = <1>;
>> +                                     lvds0_out: endpoint {
>> +                                     };
>> +                             };
>> +                     };
>> +             };
>> +
>> +             lvds1: lvds-encoder@feb90100 {
>> +                     compatible = "renesas,r8a77995-lvds";
>> +                     reg = <0 0xfeb90100 0 0x20>;
>> +                     clocks = <&cpg CPG_MOD 727>;
>> +                     power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
>> +                     resets = <&cpg 727>;
>
> While there seems to be a single clock for both LVDS encoders, it appears that
> two separate reset lines are used.

Nice catch!

So you can reset the individual LVDS instances, but not the individual DU
instances. Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
