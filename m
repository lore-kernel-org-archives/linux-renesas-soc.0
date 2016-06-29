Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:56454 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbcF2H6j (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 03:58:39 -0400
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
To: Magnus Damm <magnus.damm@gmail.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
 <c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
 <CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
 <eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
 <CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	TOSHIAKI KOMATSU <toshiaki.komatsu.ud@renesas.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <834f6a64-7c7b-c4d9-d577-2614b39eeb08@de.bosch.com>
Date: Wed, 29 Jun 2016 09:58:36 +0200
MIME-Version: 1.0
In-Reply-To: <CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On 01.06.2016 07:19, Magnus Damm wrote:
> Hi Dirk,
>
> On Fri, May 27, 2016 at 4:56 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 27.05.2016 05:13, Magnus Damm wrote:
>>> I don't think anyone disagrees that it makes sense to be able to
>>> determine ES version during runtime. The questions in my mind are how
>>> to do it
>>
>>
>>
>> I've made a proposal ;) And I'm happy to discuss technically about it.
>
> Thanks! It would be interesting to know the reason behind your
> interest in these things.


Regarding the general removal of hard coded registers:

This breaks virtualization. If you use a virtualization solution, e.g. 
Xen, which does the memory access rights based on the device tree, each 
peripheral memory access done by the Linux kernel is trapped by the 
hypervisor, then. Because it doesn't know anything about the memory 
range accessed.


Regarding the PRODUCTREG specifically, we already see that it's used for 
engineering sample (ES) detection in some drivers. So not having a 
(device tree) based solution for this, does block all driver development 
(upstreaming) where some ES detection might be needed.


>>> and the urgency.
>>
>>
>>
>> Regarding the urgency: Someone has accepted the hard coded PRODUCT register
>> (and MODEMR) being in renesas-drivers, now:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest#n177
>>
>> This does really hurts us.
>>
>> Therefore, I try to get this removed as soon as possible to hopefully get a
>> Renesas BSP without this, the next time.
>>
>> If anybody finds an other way to remove that, that would be fine, too.
>
> Please share the underlying issue so we can fix that.


See above.


>>> So far we have decided to use the compatible string since it is a
>>> common driver model abstraction already used by device drivers and
>>> hardware description in DT. Using DT compat string matching we can
>>> have logic in the drivers to handle ES differences if needed. As for
>>> how to enable the workaround, my opinion is that the missing piece
>>> consists of ES workaround code that appends ES suffix information to
>>> the DT compat strings automatically during boot.
>>
>> Technically this sounds slightly too complicated to me. As I have to
>> advocate my proposal (inspired from an other mainline SoC family) I'd think
>> that my proposal is easier.
>
> It may indeed be easier in the short term, but I feel we need to
> consider how to support a wide range of SoCs in a consistent way.
>
>>> I suppose the workaround is not yet implemented because no one has
>>> deemed this topic as particularly urgent. Until it becomes urgent or a
>>> new ES version appears the affected users can simply adjust the DT
>>> binding themselves. This is what happened to the "sata-r8a7790-es1"
>>> case above.
>
> Can you see any technical reason why using DT compat strings wouldn't
> solve your case?


It most probably will work technically, but I see a lot overhead 
regarding boot time and maintenance in the proposed DT compat strings 
solution.

That solution would mean that for each ESx "workaround" we have to do in 
a driver

a) the generic detection code has to be extended to create the driver 
specific *and* ESx specific compatible node

b) the driver has to be extended to contain the new runtime compatible node

c) the driver has to be extended to handle the ESx specific "workaround"

d) the device tree documentation has to be extended for the new compatible

These are the implementation / maintenance steps. Additionally, 
regarding the runtime (boot time does matter!) this does mean that at 
kernel's boot time the ESx information from the hardware register is 
"translated" into a device tree compatible, this is added to the device 
tree at runtime, the device driver has to check the device tree and then 
apply the specific ESx handling.

With my solution, from above list only (c) has to be done. That means 
that you don't have to touch any generic code. And the driver has just 
to call one function.

If you like, compare the mainline i.MX6 way of doing this.


Best regards

Dirk
