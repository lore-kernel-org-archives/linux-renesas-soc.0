Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54188 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764AbcESFC6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 19 May 2016 01:02:58 -0400
Subject: Re: [PATCH] arm64: dts: r8a7795: Increase the size of GIC-400 mapped
 registers
To: Simon Horman <horms@verge.net.au>
References: <1461047395-6532-1-git-send-email-dirk.behme@de.bosch.com>
 <20160427233028.GA5155@verge.net.au> <5721A2A5.9010908@de.bosch.com>
 <20160428234345.GD18128@verge.net.au> <20160429113515.333c42ef@arm.com>
 <5728E470.7050408@gmail.com> <20160516081257.GC4955@verge.net.au>
 <c22b4495-bae3-d4b9-08d1-2ce2c25a5bf8@de.bosch.com>
 <20160519021652.GC22969@verge.net.au>
CC: <geert+renesas@glider.be>, <linux-renesas-soc@vger.kernel.org>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <e31e38ce-8f86-5c8e-f6fa-84dee8e3d86a@de.bosch.com>
Date: Thu, 19 May 2016 07:02:49 +0200
MIME-Version: 1.0
In-Reply-To: <20160519021652.GC22969@verge.net.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19.05.2016 04:16, Simon Horman wrote:
> On Wed, May 18, 2016 at 10:00:52AM +0200, Dirk Behme wrote:
>> Hi Geert and Simon,
>>
>> On 16.05.2016 10:12, Simon Horman wrote:
>>> Hi Dirk,
>>>
>>> On Tue, May 03, 2016 at 07:48:32PM +0200, Dirk Behme wrote:
>>>> Hi Simon,
>>>>
>>>> On 29.04.2016 12:35, Marc Zyngier wrote:
>>>>> On Fri, 29 Apr 2016 09:43:45 +1000
>>>>> Simon Horman <horms@verge.net.au> wrote:
>>>>>
>>>>>> [Cc Mark Zyngier, linux-arm-kernel]
>>>>>>
>>>>>> Hi Dirk,
>>>>>>
>>>>>> On Thu, Apr 28, 2016 at 07:41:57AM +0200, Dirk Behme wrote:
>>>>>>> Hi Simon,
>>>>>>>
>>>>>>> On 28.04.2016 01:30, Simon Horman wrote:
>>>>>>>> Hi Dirk,
>>>>>>>>
>>>>>>>> I understand that there is an issue here but I'm not yet able
>>>>>>>> to convince myself that this is the correct solution.
>>>>>>>>
>>>>>>>> In revision r0p1 of the CoreLink GIC-400 Generic Interrupt Controller
>>>>>>>> Technical Reference Manual[1] I see in Section 3.2. "GIC-400 register map"
>>>>>>>> that the size of both the CPU interfaces and Virtual CPU interfaces are
>>>>>>>> 0x2000 bytes. And assuming that the hardware follows the specification it
>>>>>>>> appears that DT is correctly describing the hardware.
>>>>>>>
>>>>>>>
>>>>>>> I think you are missing the details described by ARM in
>>>>>>>
>>>>>>> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=21550029f709072aacf3b9
>>>>>>>
>>>>>>>
>>>>>>> Maybe Julien could help if you have some more doubts?
>>>>>>
>>>>>> I guess I am confused.
>>>>>>
>>>>>> I see that there is now handling of the case where the region size is
>>>>>> 128Kbytes. But I'm still not seeing the bit which describes that the
>>>>>> GIC-400  has a region size of 128Kbytes. Perhaps the later is somehow
>>>>>> implied by the former. Or perhaps I need to check with the hw team.
>>>>>
>>>>> Please have a look at the SBSA document, and in particular the
>>>>> Appendix-F (registration and selling your soul required - only kidding):
>>>>>
>>>>> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0029/index.html
>>>>>
>>>>> This requires that, in order for the two halves of GICV to be trappable
>>>>> *separately* by a hypervisor using 64kB pages at Stage-2, the two 4kB
>>>>> pages that describe that region are aliased as such:
>>>>> - the first 4kB page is aliased 16 times over a 64kB region
>>>>> - the second 4kB page is aliased 16 times over another contiguous 64kB
>>>>>  region
>>>>>
>>>>> This means that your GIC is indeed covering a 128kB region, with the
>>>>> mapping corresponding to the GICv2 memory map located at offset 0xf000
>>>> >from the base of that 128kB region. Also, this GICV requirement also
>>>>> applies to GICC (most likely because the two regions use the same
>>>>> decoding logic).
>>>>>
>>>>> The OS must of course be aware of this (see gic_check_eoimode in the
>>>>> GIC driver). Of course, almost nobody got that right (I only know of
>>>>> the APM Xgene-1 so far). If you actually did, great!
>>>>>
>>>>> Also, the ACPI spec fails to recognize this by not providing the length
>>>>> of the region, meaning that those who got it right with DT are likely
>>>>> to get it wrong with ACPI, and vice-versa.
>>>>>
>>>>> It's a wonderful world.
>>>>
>>>>
>>>> Could this patch be applied, then?
>>>
>>> Yes I have now done so :)
>>
>>
>> In parallel, a r8a7796.dtsi was added where this change is missing, now:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a7796.dtsi?h=topic/gen3-latest
>>
>> Do you need a new patch to add this to the r8a7796.dtsi, too? Or could you
>> apply
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/arch/arm64/boot/dts/renesas?h=topic/gen3-latest&id=f7c7e97097915643a86051fe557b41a87c837172
>>
>> to the r8a7796.dtsi, too?
>
> Hi Dirk,
>
> The copy of r8a7796.dtsi in that tree is from a topic branch and
> it is not targeted at upstream in that form.
>
> I am working on patches to add r8a7796.dtsi amongst other things
> and will include this change there.


Great, many thanks for your support!

Best regards

Dirk
