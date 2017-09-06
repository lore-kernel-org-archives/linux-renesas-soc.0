Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm: dts: exynos: add exynos5420 cpu
 capacity-dmips-mhz information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Juri Lelli <juri.lelli@arm.com>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-3-dietmar.eggemann@arm.com>
 <20170830202650.mdlxy2c3uwuq5vde@kozik-lap>
 <94c1d6c6-655a-2a63-1f01-06ac45990388@arm.com>
 <20170903195614.iwe7v6g3xsg7p6nf@kozik-lap>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <247b2b4a-c57a-eed9-c16f-fc7f1ef9f64f@arm.com>
Date: Wed, 6 Sep 2017 12:47:21 +0100
MIME-Version: 1.0
In-Reply-To: <20170903195614.iwe7v6g3xsg7p6nf@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/09/17 20:56, Krzysztof Kozlowski wrote:
> On Thu, Aug 31, 2017 at 11:36:07AM +0100, Dietmar Eggemann wrote:
>> On 30/08/17 21:26, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 30, 2017 at 03:41:18PM +0100, Dietmar Eggemann wrote:

[...]

>>>> The patch has been tested on Samsung Chromebook 2 13" (peach-pi, Exynos
>>>> 5800).
>>>>
>>>> $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
>>>> 1024
>>>> 1024
>>>> 1024
>>>> 1024
>>>> 389
>>>> 389
>>>> 389
>>>> 389
>>>
>>> I am missing something... shouldn't this be 539? Or is it scaled with
>>> the clock-frequency (1 GHz) value?
>>
>> Yeah, the capacity-dmips-mhz dt value of 539 for the little cpus is
>> scaled by 1.3/1.8 (max cpu capacity/ system wide max cpu capacity):
>>
>> 539 * 1.3/1.8 = 389
>>
>> This max cpu capacity scaling is part of both solutions, the 'cpu
>> capacity-dmips-mhz' and the 'cpu_efficiency/clock-frequency dt property'
>> one.
>>
>> The (original*) cpu capacity on a heterogeneous platform expresses uArch
>> and max cpu frequency differences between the (logical) cpus of the
>> system.
>>
>> * not further reduced by rt and/or irq pressure.
>>
>> [...]
> 
> Thanks for explanation, looks fine for me. I'll take it after merge
> window.

Nice, since the 'cpu capacity-dmips-mhz' is already supported for arm
(and used by TC2 (vexpress-v2p-ca15_a7.dts)) this can be done
independently of the actual removal of the
'cpu_efficiency/clock-frequency dt property' solution in patch 1/4.

[..]
