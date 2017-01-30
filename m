Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34630 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752899AbdA3WRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 17:17:17 -0500
MIME-Version: 1.0
In-Reply-To: <20170127114724.GI27598@8bytes.org>
References: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
 <148517162908.13306.2467186615655446796.sendpatchset@little-apple> <20170127114724.GI27598@8bytes.org>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 31 Jan 2017 07:16:23 +0900
Message-ID: <CANqRtoQGtak34vEd=aAsPaHM2o=MkZwq0WLOjiHi7fmqFnxUQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Joerg,

On Fri, Jan 27, 2017 at 8:47 PM, Joerg Roedel <joro@8bytes.org> wrote:
> On Mon, Jan 23, 2017 at 08:40:29PM +0900, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Bump up the maximum numbers of micro-TLBS to 48.
>>
>> Each IPMMU device instance get micro-TLB assignment via
>> the "iommus" property in DT. Older SoCs tend to use a
>> maximum number of 32 micro-TLBs per IPMMU instance however
>> newer SoCs such as r8a7796 make use of up to 48 micro-TLBs.
>>
>> At this point no SoC specific handling is done to validate
>> the maximum number of micro-TLBs, and because of that the
>> DT information is assumed to be within correct range for
>> each particular SoC.
>>
>> If needed in the future SoC specific feature flags can be
>> added to handle the maximum number of micro-TLBs without
>> requiring DT changes, however at this point this does not
>> seem necessary.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> I get a conflict when applying this to v4.10-rc5. What is this based on,
> any patches I missed?

Thanks for giving it a go. The second patch in this series should apply as-is:
[PATCH v2 1/3] iommu/ipmmu-vmsa: Add r8a7796 DT binding

However for driver code there are two series in between:
 [PATCH v6 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V6
 [PATCH v2 00/11] iommu/ipmmu-vmsa: r8a7795 support V2

For more detailed dependency information please see the cover letter!

Regarding the driver code please wait for "IPMMU multi-arch update V7"
that takes comments from Laurent into consideration. Hopefully I
should be able to send it out some time this week.

As for "[PATCH v2 1/3] iommu/ipmmu-vmsa: Add r8a7796 DT binding",
would it be possible to fast track mainline merge of that particular
DT binding patch? Can you take it in your tree?

To give some background, we already have the IPMMU DT binding for
older devices and the sister device r8a7795 in mainline, so the
r8a7796 DT binding is just a small incremental step. To make sure we
don't go too wild with DT changes we tend to require that the DT
binding change should be queued up before starting to merge changes to
DTS files. So currently some DT changes are blocking on that r8a7796
DT binding and it would be nice to unblock those if possible..

Thanks!

/ magnus
