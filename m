Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35372 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752694AbcKQC2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 21:28:09 -0500
Received: by mail-ua0-f195.google.com with SMTP id 50so13402389uae.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2016 18:28:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <6140360.DygU3qqRMK@avalon>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CANqRtoRdvxgXvbLUGtUGZmeochHc2f7-MDT0Ft_X26jkSDM1Fw@mail.gmail.com>
 <1850959.FHUakZUkzN@avalon> <6140360.DygU3qqRMK@avalon>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 17 Nov 2016 11:28:07 +0900
Message-ID: <CANqRtoTN+=-u2GCYiOtPXo1UGu2J8qkV0OYRVPsULb6qEBUgCA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Nov 16, 2016 at 4:12 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hello Magnus,
>
> On Thursday 27 Oct 2016 18:40:31 Laurent Pinchart wrote:
>> On Thursday 27 Oct 2016 16:25:35 Magnus Damm wrote:
>> > On Thu, Oct 27, 2016 at 4:13 PM, Simon Horman wrote:
>> >> On Thu, Oct 27, 2016 at 03:52:44PM +0900, Magnus Damm wrote:
>> >>> On Thu, Oct 20, 2016 at 5:56 PM, Simon Horman wrote:
>> >>>> On Tue, Oct 18, 2016 at 12:19:26PM +0300, Laurent Pinchart wrote:
>> >>>>> On Tuesday 18 Oct 2016 11:05:32 Geert Uytterhoeven wrote:
>> >>>>>> On Mon, Oct 17, 2016 at 11:34 PM, Laurent Pinchart wrote:
>> >>>>>>> Add the DU device to r8a7796.dtsi in a disabled state.
>> >>>>>>>
>> >>>>>>> Signed-off-by: Laurent Pinchart
>> >>>>>>> <laurent.pinchart+renesas@ideasonboard.com>
>> >>>>>>
>> >>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >>>>>
>> >>>>> Could you please pick patches 1/4 to 3/4 from this series and apply
>> >>>>> them to your tree ? For convenience I've pushed them to
>> >>>>>
>> >>>>>       git://linuxtv.org/pinchartl/media.git drm/r8a7796/dt
>> >>>>>
>> >>>>> along with patch "arm64: dts: renesas: r8a7795: Remove FCP
>> >>>>> SoC-specific compatible strings" that has been acked too. If you pull
>> >>>>> from that branch please make sure you skip the top-most patch "arm64:
>> >>>>> dts: renesas: r8a7796-salvator-x: Enable DU" for now.
>> >>>>
>> >>>> Sure, done.
>> >>>
>> >>> I think we should hold off with the upstreaming of the DU and VSP
>> >>> integration code for now. Sorry for noticing this late, but I thought
>> >>> we had already discussed the integration order and that merge of
>> >>> non-64-bit capable devices need to be put on hold.
>> >>>
>> >>> In particular, not so much the DU device (this patch) but more the VSP
>> >>> instances. The reason for that is that VSP devices can only perform
>> >>> 32-bit bus mastering without IOMMU. I believe next step for all this
>> >>> would be to enable all on-board memory on r8a7796 Salvator-x, but I
>> >>> think Geert is working on that.
>> >>
>> >> So you would like to see the following patches dropped?
>> >>
>> >> ee73acb13978 arm64: dts: renesas: r8a7796: Add VSP instances
>> >> 0a6519d782fd arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
>> >
>> > Yes, that would be great. Sorry for not noticing earlier.
>>
>> I'm sorry, but I don't agree with that. First of all the FCP has no issue
>> with >4GB memory as it doesn't perform DMA itself. Then, while the IPMMU is
>>
>> required to operate the VSP with >4GB memory, enabling the VSP instances
>> won't break anything as unlike the DU the VSPs won't be used by standard
>> kernel or userspace components.
>
> Ping ?

Thanks for the ping.

First of all, we might have slightly different view of the hardware,
so this might need some further discussions. Also, this topic in my
mind is mainly about DT integration code merge ordering for r8a7796 to
enable >4GB memory access early on without introducing any potential
issues.

Regarding the hardware and FCP, VSP and DU, I think we for R-Car Gen3
can agree on that the DU does not perform any bus mastering itself,
but relies of VSP for this to happen. VSP however in my opinion also
relies on FCP for bus mastering on R-Car Gen3. So this is conflicting
with your statement that FCP does not perform DMA itself - maybe you
are referring to the kernel driver instead of the hardware? Our
potentially different view makes me confused! =)

About the integration patches for FCP, VSP and DU, what do you propose
merging? I think it is easy to draw a line in the sand and say that
since the DU is lacking support for IPMMU on R-Car Gen3 in upstream it
is too early to try to integrate any related components including VSP
and FCP (that are used with DU). I don't see the merit of
half-integrated support.

Once the DU driver code for r8a7796 (including support for using
IPMMU) is ready upstream merge it will be simple enough to enable in
DT, don't you think? If the code happens to be ready and available in
-next then I think DT changes can be merged in parallel as well.

Thanks,

/ magnus
