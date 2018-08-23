Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbeHWVrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 17:47:21 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: r8a77965: Add CAN{0,1}
 placeholder nodes
To: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-5-erosca@de.adit-jv.com>
 <d4a8767c-8d98-859d-1dce-210e1f95fcec@ideasonboard.com>
 <CAMuHMdVz3q8PC+6hkQrn4aapGj3RqcwhOweOYYvs6Cw9ht3pKw@mail.gmail.com>
 <bd410bcb-bba9-a68e-f7bd-e67a94a52bae@cogentembedded.com>
 <CAMuHMdW41s4WXe0=w9xX98TBjskLkGXm+EA+2=UxNJk6cJwXMQ@mail.gmail.com>
 <20180823171425.GA7439@vmlxhi-102.adit-jv.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <6e6409f1-35a0-4bf0-f9d7-35581fd6ba59@ideasonboard.com>
Date: Thu, 23 Aug 2018 19:16:21 +0100
MIME-Version: 1.0
In-Reply-To: <20180823171425.GA7439@vmlxhi-102.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

On 23/08/18 18:14, Eugeniu Rosca wrote:
> Dear reviewers,
> 
> On Thu, Aug 23, 2018 at 11:01:46AM +0200, Geert Uytterhoeven wrote:
>> Hi Sergei,
>>
>> On Thu, Aug 23, 2018 at 10:56 AM Sergei Shtylyov
>> <sergei.shtylyov@cogentembedded.com> wrote:
>>> On 8/23/2018 11:52 AM, Geert Uytterhoeven wrote:
>>>>>> According to R-Car Gen3 HW manual rev1.00, R-Car M3-N has two CAN
>>>>>> interfaces, similar to H3, M3-W and other SoCs from the same family.
>>>>>>
>>>>>> Add CAN placeholder nodes to avoid below DTC errors:
>>>>>> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
>>>>>> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found
>>>>>>
>>>>>> These errors occur *after* the addition of r8a77965-m3nulcb-kf.dts.
>>>>>> Fix them beforehand.
>>>>>>
>>>>>> CAN support is inspired from below commits:
>>>>>>   - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
>>>>>>   - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
>>>>>>   - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
>>>>>>
>>>>>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>>
>>>>>> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>>>>>> @@ -656,6 +656,22 @@
>>>>>>                        status = "disabled";
>>>>>>                };
>>>>>>
>>>>>> +             can0: can@e6c30000 {
>>>>>> +                     compatible = "renesas,can-r8a77965",
>>>>>> +                                  "renesas,rcar-gen3-can";
>>>>>> +                     reg = <0 0xe6c30000 0 0x1000>;
>>>>>> +                     /* placeholder */
>>>>>> +                     status = "disabled";
>>>>>> +             };
>>>>>
>>>>> This is probably more detail than is needed for a placeholder, but it
>>>>> looks correct so I think this is fine.
>>>>
>>>> Indeed. Adding the "compatible" properties means they're no longer
>>>> placeholders, and will be probed by the driver, possibly leading to
>>>> undefined behavior.
>>>
>>>     I don't think the disabled device nodes are actually probed.
>>
>> They will be by ulcb-kf.dtsi, after the addition of
>> r8a77965-m3nulcb-kf.dts, cfr.
>> the errors and rationale documented in the commit message.
> 
> I took some time to examine the "52. Controller Area Network Interface
> (CAN interface)" chapter of HW SoC manual rev1.00 in detail and there is
> no difference mentioned between the SoCs (H3, M3-W, M3-N, D3, E3) which
> implement the two CAN (non-FD) interfaces. This is confirmed by the
> perfectly symmetrical can{0,1} configuration present in the H3,
> M3-W and D3 device tree sources:
> 
> $ git grep -l can0 -- arch/arm64/boot/dts/renesas/r8*dtsi
> arch/arm64/boot/dts/renesas/r8a7795.dtsi
> arch/arm64/boot/dts/renesas/r8a7796.dtsi
> arch/arm64/boot/dts/renesas/r8a77995.dtsi


The problem is, until it's tested - we don't actually know it works.
Even 'identical' chips can have different changes between the revisions.



> So, to be honest, in my opinion, besides consuming time arguing about
> what a placeholder DTS node is (btw, commits [1] and [2] do include a
> compatible string while adding a "placeholder" node),

[1] is a special case. It's not actually going to probe a driver.

sources/linux$ git grep secure-ram
arch/arm/boot/dts/dra7.dtsi:  compatible = "ti,secure-ram";

<there is no driver which will match on this compatible>


[2] is also a different case:

You can see in the patch that the 'placeholder' is used in the same
commit by sun9i-a80-cubieboard4.dts and sun9i-a80-optimus.dts



> we also force
> users to 'git blame' multiple times to reconstruct the history of CAN
> controller nodes on M3-N, while for H3, M3-W and D3 a single commit was
> enough to add the functionality.
> 
> That said, I don't see any dmesg differences on M3NULCB between having
> and not having the compatible string in the can{0,1} nodes.
> 
>> Hence please limit the placeholders to the absolute required minimum,
>> and thus drop the "compatible" and "status" properties.
> 
> My understanding is that the lack of status is equivalent with
> 'status = "okay"' (i.e. enable the node), so I don't really see why
> 'status = "disabled"' should hurt for a placeholder, especially seeing
> a high number of commits [3] using 'status = "disabled"' by default. 

It's not so much the 'status' field that hurts in this patch, but the
compatible matching.

The file r8a7795.dtsi is a SoC level description. It tries to describe
all the features provided by that SoC. But all of those features may not
be brought out on the "board", and so many are disabled by default.

 - Essentially 'status = "disabled";'
    is like saying - This node is good - but don't use it.


It's then up to the board file (Salvator-XS.dtb, ULCB.dtb
YourBoardHere.dtb ...) to enable the features that are available.

That's the case here in the KingFisher board.

The ulcb-kf.dtsi will override the CAN nodes and set 'status = Okay' to
enable the devices available on the KF board:

> &can0 {
>         pinctrl-0 = <&can0_pins>;
>         pinctrl-names = "default";
>         status = "okay";
> };


So - once that file is included (even though you have set 'status =
'disabled'), the DTB asserts that the can0 is connected, available, and
'okay' to be probed.


For an example of adding 'lots' of placeholders take a look at
df863d6f95f5 ("arm64: dts: renesas: initial R8A77965 SoC device tree")


and a patch which then populates a placeholder when it's ready:
2f2c71bfc8c5 ("arm64: dts: renesas: r8a77965: Populate the DU instance
placeholder")




Now we get political rather than technical ...

If you are adding the DTB node which implements this (by adding the full
node in r8a77965.dtsi), you should be able to assert that this is
functional. Either by testing it yourself, or by finding someone to
submit a Tested-by: <xxx@yyy.com> tag.

The alternative, is to provide a placeholder which is set as
non-functional - and will not probe. <which you've mostly done>

It's just that by providing the compatible strings in your placeholder,
the status = "okay" /will/ allow the driver framework to probe this device.

Then we are into undefined behaviour because we are saying that the
device is ready to probe - but without fully defining the required
properties.

> At
> least I ask for an explanation regarding this last part before
> incrementing the version of this patch. TIA.

I hope that's made something clearer in a murky world.

Welcome to open source :D ... I appreciate your frustration on
re-spinning patches that are not your intended target or goal. I've
faced similar blocking situations in my time.

It's all part of the goal of striving towards 'perfect-as-can-be'
upstream code I guess.

> [1] fae3a9f023b7 ("ARM: dts: dra7: Add ti,secure-ram node to ocmcram1 node")
> [2] 162669876bbe ("ARM: dts: sun9i: Switch to the AC100 RTC clock outputs for osc32k")
> [3] git blame arch/arm64/boot/dts/renesas/r8a7795.dtsi | grep disabled | awk '{print $1}' | sort -u | wc -l
>     22
> 
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
> 
> Thanks,
> Eugeniu.


--
Kieran
