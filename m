Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f52.google.com ([209.85.213.52]:34022 "EHLO
	mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423466AbcFHJMd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 05:12:33 -0400
MIME-Version: 1.0
In-Reply-To: <2464365.ZvRSQB46Pc@avalon>
References: <20160607033918.28687.98260.sendpatchset@little-apple>
 <10108662.fYf10pMtGa@avalon> <CAMuHMdUr6P=xiiw02wEeJdBw+K_q2ATE9jHgiQ0KCOangYv=tw@mail.gmail.com>
 <2464365.ZvRSQB46Pc@avalon>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 8 Jun 2016 18:12:31 +0900
Message-ID: <CANqRtoSfzZhMXwLpbwr2k22qgcA=GJ5pxV82FPLkB4FKOqsX4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	iommu@lists.linux-foundation.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Joerg Roedel <joro@8bytes.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Jun 8, 2016 at 5:48 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Geert,
>
> On Wednesday 08 Jun 2016 09:04:17 Geert Uytterhoeven wrote:
>> On Wed, Jun 8, 2016 at 2:18 AM, Laurent Pinchart wrote:
>> >> --- 0031/drivers/iommu/ipmmu-vmsa.c
>> >> +++ work/drivers/iommu/ipmmu-vmsa.c   2016-06-06 11:19:40.210607110 +0900
>> >> @@ -1074,7 +1074,7 @@ static const struct ipmmu_features ipmmu
>> >>       .twobit_imttbcr_sl0 = false,
>  >>  };
>> >>
>> >> -static const struct ipmmu_features ipmmu_features_r8a7795 = {
>> >> +static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
>> >>       .use_ns_alias_offset = false,
>> >>       .has_cache_leaf_nodes = true,
>> >>       .has_eight_ctx = true,
>> >> @@ -1088,7 +1088,10 @@ static const struct of_device_id ipmmu_o
>> >>               .data = &ipmmu_features_default,
>> >>       }, {
>> >>               .compatible = "renesas,ipmmu-r8a7795",
>> >> -             .data = &ipmmu_features_r8a7795,
>> >> +             .data = &ipmmu_features_rcar_gen3,
>> >> +     }, {
>> >> +             .compatible = "renesas,ipmmu-r8a7796",
>> >> +             .data = &ipmmu_features_rcar_gen3,
>> >>       }, {
>> >>               /* Terminator */
>> >>       },
>> >> @@ -1268,6 +1271,8 @@ IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "r
>> >>                ipmmu_vmsa_iommu_of_setup);
>> >>  IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795",
>> >>                ipmmu_vmsa_iommu_of_setup);
>> >> +IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796",
>> >> +              ipmmu_vmsa_iommu_of_setup);
>> >
>> > How about a Gen3 generic compatible string in addition to the SoC-specific
>> > ones ?
>>
>> Do we want to specify the number of utlbs here?
>> Does it differ between r8a7795, r8a7796, and future members?
>
> It differs between IPMMU instances on a given SoC, so if we want to specify it
> it should be a DT property.

Can you please point out which documentation that says it varies with
IPMMU instance?

Based on IMUCTRn register description "H3-ES1" has 0-31 range while
"Others" have 0-47.

Thanks,

/ magnus
