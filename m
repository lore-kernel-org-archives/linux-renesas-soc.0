Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 04/15] irqchip/gic: WARN if setting the interrupt type
 fails
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1458224359-32665-1-git-send-email-jonathanh@nvidia.com>
 <1458224359-32665-5-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1603171550200.3978@nanos> <56EAC761.1040801@nvidia.com>
 <20160317151800.GH1184@io.lakedaemon.net> <56EAD93B.7040105@nvidia.com>
 <CAMuHMdU8PDUVZ8=S04fkahez1dh7JHjpj2-3w+Vfz05X=ZFMUQ@mail.gmail.com>
CC: Jason Cooper <jason@lakedaemon.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <marc.zyngier@arm.com>,
	=?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	"Kumar Gala" <galak@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"Thierry Reding" <thierry.reding@gmail.com>,
	Kevin Hilman <khilman@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	<linux-tegra@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <56EBD061.6030502@nvidia.com>
Date: Fri, 18 Mar 2016 09:54:41 +0000
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU8PDUVZ8=S04fkahez1dh7JHjpj2-3w+Vfz05X=ZFMUQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


On 18/03/16 09:20, Geert Uytterhoeven wrote:
> On Thu, Mar 17, 2016 at 5:20 PM, Jon Hunter <jonathanh@nvidia.com> wrote:
>> On 17/03/16 15:18, Jason Cooper wrote:
>>> On Thu, Mar 17, 2016 at 03:04:01PM +0000, Jon Hunter wrote:
>>>> On 17/03/16 14:51, Thomas Gleixner wrote:
>>>>> On Thu, 17 Mar 2016, Jon Hunter wrote:
>>>>>> Setting the interrupt type for private peripheral interrupts (PPIs) may
>>>>>> not be supported by a given GIC because it is IMPLEMENTATION DEFINED
>>>>>> whether this is allowed. There is no way to know if setting the type is
>>>>>> supported for a given GIC and so the value written is read back to
>>>>>> verify it matches the desired configuration. If it does not match then
>>>>>> an error is return.
>>>>>>
>>>>>> There are cases where the interrupt configuration read from firmware
>>>>>> (such as a device-tree blob), has been incorrect and hence
>>>>>> gic_configure_irq() has returned an error. This error has gone
>>>>>> undetected because the error code returned was ignored but the interrupt
>>>>>> still worked fine because the configuration for the interrupt could not
>>>>>> be overwritten.
>>>>>>
>>>>>> Given that this has done undetected and we should only fail to set the
>>>>>> type for PPIs whose configuration cannot be changed anyway, don't return
>>>>>> an error and simply WARN if this fails. This will allows us to fix up any
>>>>>> places in the kernel where we should be checking the return status and
>>>>>> maintain back compatibility with firmware images that may have incorrect
>>>>>> interrupt configurations.
>>>>>
>>>>> Though silently returning 0 is really the wrong thing to do. You can add the
>>>>> warn, but why do you want to return success?
>>>>
>>>> Yes that would be the correct thing to do I agree. However, the problem
>>>> is that if we do this, then after the patch "irqdomain: Don't set type
>>>> when mapping an IRQ" is applied, we may break interrupts for some
>>>> existing device-tree binaries that have bad configuration (such as omap4
>>>> and tegra20/30 ... see patches 1 and 2) that have gone unnoticed. So it
>>>> is a back compatibility issue.
> 
> Indeed (also for sh73a0 and r8a7779).

Thanks. I was wondering if there are others. Do you know what the
correct setting should be? Ie. should it be IRQ_TYPE_EDGE_RISING as
well? I can then include this with OMAP and Tegra.

>>> This sounds like a textbook case for adding a boolean dt property.  If
>>> "can-set-ppi-type" is absent (old DT blobs and new blobs without the
>>> ability), warn and return zero.  If it's present, the driver can set the
>>> type, returning errors as encountered.
>>
>> True. However, if we did have this "can-set-ppi-type" property set for a
>> device, it really should never fail (unless someone specified it
>> incorrectly). So I am trying to understand the value in adding a new DT
>> property.
> 
> Do we really want to add properties that basically indicate that a description
> in DT is correct?
> 
> Alternatively, it can be fixed in the kernel in a DT quirk (if SoC == xxx then
> fix TWD).

I am not sure I fully understand your proposal, but please note that it
may not be just limited to the TWD (although this does appear to be the
one client that is wrong for a lot of SoCs). PPIs are also used for the
armv7/8 timers as well.

The problem is that we have a lot of SoCs with twd-timers and I have no
way to test all of these to know which could be a problem. So I thought
that warning would be a good first step to fixing them.

However, I am still trying to see the real value in returning an error
in this case. May be I am the only one with that perspective?

Cheers
Jon
