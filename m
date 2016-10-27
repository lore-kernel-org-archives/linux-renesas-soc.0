Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33884 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933466AbcJ0Gws (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 02:52:48 -0400
Received: by mail-lf0-f65.google.com with SMTP id i187so722475lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2016 23:52:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161020085602.GJ4612@verge.net.au>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476740091-7011-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUUeVRwM06+VA8QsqkaT5D4t4xiJML3mgQN9-CPcf4mzQ@mail.gmail.com>
 <2511719.0AnPiuYGPa@avalon> <20161020085602.GJ4612@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 27 Oct 2016 15:52:44 +0900
Message-ID: <CANqRtoRvvkr-HPTz9qGgxg6SK=FNZbO1gdxCDuxeUeGBzAhQ1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, everyone,

On Thu, Oct 20, 2016 at 5:56 PM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Oct 18, 2016 at 12:19:26PM +0300, Laurent Pinchart wrote:
>> Hi Simon,
>>
>> On Tuesday 18 Oct 2016 11:05:32 Geert Uytterhoeven wrote:
>> > On Mon, Oct 17, 2016 at 11:34 PM, Laurent Pinchart wrote:
>> > > Add the DU device to r8a7796.dtsi in a disabled state.
>> > >
>> > > Signed-off-by: Laurent Pinchart
>> > > <laurent.pinchart+renesas@ideasonboard.com>
>> >
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Could you please pick patches 1/4 to 3/4 from this series and apply them to
>> your tree ? For convenience I've pushed them to
>>
>>       git://linuxtv.org/pinchartl/media.git drm/r8a7796/dt
>>
>> along with patch "arm64: dts: renesas: r8a7795: Remove FCP SoC-specific
>> compatible strings" that has been acked too. If you pull from that branch
>> please make sure you skip the top-most patch "arm64: dts: renesas: r8a7796-
>> salvator-x: Enable DU" for now.
>
> Sure, done.

I think we should hold off with the upstreaming of the DU and VSP
integration code for now. Sorry for noticing this late, but I thought
we had already discussed the integration order and that merge of
non-64-bit capable devices need to be put on hold.

In particular, not so much the DU device (this patch) but more the VSP
instances. The reason for that is that VSP devices can only perform
32-bit bus mastering without IOMMU. I believe next step for all this
would be to enable all on-board memory on r8a7796 Salvator-x, but I
think Geert is working on that.

Regarding IOMMU support, more effort is needed to get the IPMMU driver
with r8a7796 (and r8a7795) support upstream. Some stuff for r8a7795
exists in renesas-drivers and experimental r8a7796 support as well.

One issue is that the DU driver itself is not ready to be used with
IOMMU yet (below patches not upstream yet), and more work is needed as
well - please see my reply (and prototype patch that fixes the issue
locally):
[PATCH 0/6] R-Car DU: Fix IOMMU operation when connected to VSP
http://www.spinics.net/lists/dri-devel/msg117494.html

Also, the r8a7796 DU driver code is not yet merged upstream and the
binding is also not yet documented. So either way you look at it it
seems a tad early for upstream merge.

Thanks,

/ magnus
