Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:48508 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbeGQQHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 12:07:53 -0400
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Hanjun Guo <hanjun.guo@linaro.org>,
        ganapatrao.kulkarni@cavium.com, morten.rasmussen@arm.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] arm64: smp: remove cpu and numa topology
 information when hotplugging out CPU
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1530874968-5960-1-git-send-email-sudeep.holla@arm.com>
 <1530874968-5960-6-git-send-email-sudeep.holla@arm.com>
 <CAMuHMdXw9My+P1UCJ19Qdjq4O9gY_0QVFZaw6C5Ytmpyac59Vw@mail.gmail.com>
 <20180717140536.GA27323@e107155-lin>
 <CAMuHMdUnL=XyoSfRU+ebVUjsiP89V4vcoN=O4xc0VwHmLP72HA@mail.gmail.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <1c47b3fd-59ba-aba4-43b2-ed98e750887b@arm.com>
Date: Tue, 17 Jul 2018 16:34:28 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUnL=XyoSfRU+ebVUjsiP89V4vcoN=O4xc0VwHmLP72HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 17/07/18 16:06, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Tue, Jul 17, 2018 at 4:05 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>> On Tue, Jul 17, 2018 at 02:58:14PM +0200, Geert Uytterhoeven wrote:
>>> On Fri, Jul 6, 2018 at 1:04 PM Sudeep Holla <sudeep.holla@arm.com> wrote:

[...]

>>> All but CPU0 tested, as expected.
>>
>> OK, does the firmware on this system not allow CPU0 to be hotplugged out ?
> 
> Correct. But that's not the issue.
> 

Yes,  was just trying to understand the behavior.

[..]

>>> Woops, CPU5-7 are not tested.
>>
>> I don't understand what you mean by that. From the logs, it looks fine.
>> What do you mean by "CPU5-7 are not tested" ?
>> Sorry, but I am finding it hard to understand the issue from the log.
> 
> The above is not the log, but the diff between the log before and after the bad
> commit. So lines prefixed with "-" are no longer printed.
> Before, CPU4-7 were tested for hotplug in group 1.
> After, only CPU4 is tested for hotplug in group 1.
> 

Ah OK, I think I now understand what is the issue, will try to replicate
at my end and get back to you.

>> Also, it would be good to know your config. Is it defconfig - NUMA as before ?
> 
> arm64 defconfig + CONFIG_ARM_PSCI_CHECKER=y should do.
> 

OK thanks, that is simpler.

-- 
Regards,
Sudeep
