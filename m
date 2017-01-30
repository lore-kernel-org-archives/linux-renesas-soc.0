Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:39062 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751822AbdA3MSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 07:18:07 -0500
Subject: Re: [PATCH/RFC] iommu/dma: Per-domain flag to control size-alignment
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <148549826507.23190.1460689571069015835.sendpatchset@little-apple>
 <464656f9-970e-1271-0d9e-b62a0673e1dd@arm.com>
 <HK2PR06MB05481A6F9E20CCAC13F9A336D84B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <584852f8-fb0c-3f29-dfe4-ac9aef918228@arm.com>
Date: Mon, 30 Jan 2017 12:07:00 +0000
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB05481A6F9E20CCAC13F9A336D84B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/01/17 07:20, Yoshihiro Shimoda wrote:
> Hi Robin, Magnus,
> 
>> -----Original Message-----
>> From: Robin Murphy
>> Sent: Saturday, January 28, 2017 2:38 AM
>>
>> Hi Magnus,
>>
>> On 27/01/17 06:24, Magnus Damm wrote:
>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>
>>> Introduce the flag "no_size_align" to allow disabling size-alignment
>>> on a per-domain basis. This follows the suggestion by the comment
>>> in the code, however a per-device control may be preferred?
>>>
>>> Needed to make virtual space contiguous for certain devices.
>>
>> That sounds very suspicious - a single allocation is contiguous with
>> itself by definition, and anyone relying on multiple allocations being
>> contiguous with one another is doing it wrong, because there's no way we
>> could ever guarantee that (with this allocator, at any rate). I'd be
>> very reticent to touch this without a specific example of what problem
>> it solves.
> 
> Thank you for the comment! This patch was from my request.
> But, I completely misunderstood this "size-alignment" behavior.
> And, my concern was already resolved by the following patch at last April:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu?id=809eac54cdd62c67afea1e17080e681dfa33dc09
> 
> So, no one needs this patch anymore.

Cool, thanks for the clarification :)

Robin.

> 
> Best regards,
> Yoshihiro Shimoda
> 
