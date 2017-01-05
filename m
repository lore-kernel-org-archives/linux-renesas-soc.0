Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_Cj19Agd5eCCBWYTkjpMRIw)"
Message-id: <586E1C0D.20102@samsung.com>
Date: Thu, 05 Jan 2017 19:12:29 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@free-electrons.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        arnd.bergmann@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@linux-mips.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Remove CONFIG_CPU_FREQ_STAT_DETAILS config option
In-reply-to: <d4299228a500a889c2b4b9e305674f3d1ea9ae06.1483604760.git.viresh.kumar@linaro.org>
References: <CGME20170105082939epcas4p4b494945ce55c949dc7a030ebf9dbdd4c@epcas4p4.samsung.com>
 <d4299228a500a889c2b4b9e305674f3d1ea9ae06.1483604760.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.

--Boundary_(ID_Cj19Agd5eCCBWYTkjpMRIw)
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8BIT

Hi Viresh,

On 2017년 01월 05일 17:27, Viresh Kumar wrote:
> This doesn't have any benefit apart from saving a small amount of memory
> when it is disabled. The ifdef hackery in the code makes it dirty
> unnecessarily.
> 
> Clean it up by removing the Kconfig option completely. Few defconfigs
> are also updated and CONFIG_CPU_FREQ_STAT_DETAILS is replaced with
> CONFIG_CPU_FREQ_STAT now in them, as users wanted stats to be enabled.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/configs/exynos_defconfig         |  2 +-
>  arch/arm/configs/multi_v5_defconfig       |  2 +-
>  arch/arm/configs/multi_v7_defconfig       |  2 +-
>  arch/arm/configs/mvebu_v5_defconfig       |  2 +-
>  arch/arm/configs/pxa_defconfig            |  2 +-
>  arch/arm/configs/shmobile_defconfig       |  2 +-
>  arch/mips/configs/lemote2f_defconfig      |  1 -
>  arch/powerpc/configs/ppc6xx_defconfig     |  1 -
>  arch/sh/configs/sh7785lcr_32bit_defconfig |  2 +-
>  drivers/cpufreq/Kconfig                   |  8 --------
>  drivers/cpufreq/cpufreq_stats.c           | 14 --------------
>  11 files changed, 7 insertions(+), 31 deletions(-)


I agree. Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

--Boundary_(ID_Cj19Agd5eCCBWYTkjpMRIw)
Content-type: text/x-vcard; CHARSET=EUC-KR; name=cw00_choi.vcf
Content-transfer-encoding: base64
Content-disposition: attachment; filename=cw00_choi.vcf

bnVsbA0K

--Boundary_(ID_Cj19Agd5eCCBWYTkjpMRIw)--
