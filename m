Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36298 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751152AbcJ0HJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:09:31 -0400
Received: by mail-lf0-f67.google.com with SMTP id b75so1410923lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 00:09:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX=pS0NuZTow2=kZAq5jBbXwdPeySSZGbccpruN3mSpKg@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476740091-7011-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUUeVRwM06+VA8QsqkaT5D4t4xiJML3mgQN9-CPcf4mzQ@mail.gmail.com>
 <2511719.0AnPiuYGPa@avalon> <20161020085602.GJ4612@verge.net.au>
 <CANqRtoRvvkr-HPTz9qGgxg6SK=FNZbO1gdxCDuxeUeGBzAhQ1g@mail.gmail.com> <CAMuHMdX=pS0NuZTow2=kZAq5jBbXwdPeySSZGbccpruN3mSpKg@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 27 Oct 2016 16:09:28 +0900
Message-ID: <CANqRtoQMgQ_mfvrOp6r29AEJ1hTf3ETyKE-Mon5fOb=waw=BOA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Oct 27, 2016 at 4:04 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Oct 27, 2016 at 8:52 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> In particular, not so much the DU device (this patch) but more the VSP
>> instances. The reason for that is that VSP devices can only perform
>> 32-bit bus mastering without IOMMU. I believe next step for all this
>> would be to enable all on-board memory on r8a7796 Salvator-x, but I
>> think Geert is working on that.
>
> Actually 64-bit memory is already enabled on r8a7796/salvator-x, as U-Boot
> (all firmware versions I've seen) silently adds the missing memory chunks
> to the DTB.
>
> The same is true on r8a7795/salvator-x with recent firmware (e.g. v2.12.0).

Ok, so we should figure out a reasonable policy how to handle this in
a good way.

Shall we describe all the memory in the DTS file for consistency? Or
no memory at all? Describing some memory seems a bit like a strange
middle ground in my opinion.

Cheers,

/ magnus
