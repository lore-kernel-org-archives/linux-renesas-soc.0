Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191522;
	b=ewBWeHFyYkN+LI8nCKyFi0EinH6EqKjcMn2xfYzCVDlYHC5X/etNsr7gJAS3i5AMMAaO
	 QMBBa7uknhrCS0+Zsjk34gqGrgeXrCdWyTDlyaltsKOGSDxJPAymOleWQjU+fWsPn89TH
	 1JurM98NjybEsHd3hE2nKLiTTChZrhxEqiDK3oMOt5zchpKbMlHEAa/v1lJcgUUWcaWl/
	 INIiVGNKLv3vO/lpSaYhk3f55NY5OCQzQsXXzEGJyABpL0jnIplfbGfIXYZfWMECRKxul
	 hWpmF5KxsqG+KhdBSmuKziult97rlsThpBw1LX2qUCwZf56acS0O67AMseBRK0stR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
	b=DiZHLPRQlREr8F7ZcVPQkGt+VobjfA/F3RW628bpPzWB/JKEGZ3PuRvBqqEpy9ClkFYy
	 1c1CcJdpwgukerbNHNtTFHjQi5hk7F/BdV34rZYH5xPz0dxRefMWLy+TllzyH2ZHeY8DN
	 fwCFZ3svbhBfwnm8WYG1BjzTNz2B5mhrG6eZ7hkJfbiX1UqiX/UIcuXhVoRHlwwnss8q4
	 AwTrump2fs6D/GjY2pdyal3fDZT6iqC2cDEzch9jprhYT8zvgYc9Tb4J/aPVyEo6UCPAw
	 79kWJfw6XUi5qcwCxNLR0Tb0ABPhTbTiNyiZbhDi4JJukZSf//IyJ+sKZ0xElOUR3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9466D606A325
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 12:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9466D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9996375e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793191520; x=1793796320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=kSmYo2IApQsaZVeoI/lHS65DndOvyRY8lt50GRCZmz/jWWH8qe4s7wo/zr2/zMpq25
         +sjQr/YIemSHfu6uSz39sV8QOjFvoudUeuFCrPfNICLHczUoyPJM2MMP2ZzljZ7g4y9C
         e2zu+Bti1OHmJlatzf5eQK5sXxZ3i0qUYaH+sDqEm4IIQ4Nk+kHHbcDLgsKMAjNiyB+/
         XHCS25+GfCpZiPYLwRPoWKFHsIs3BMbU1i6dviNOqXSCye9VVbinYsSDEBX24Qp54NKy
         2ZE+Gf+jUmLFXKEj1XKHO4ETJGGRqh51DtS3Fk31LWhkvIQvA1aIATIPsXPkaoqVeUIU
         2+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191520; x=1793796320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqTI4OK/fhuaR1GlqOO94iKxdKzeyM0Y5bQN/d17mzE=;
        b=xQyWMpsXibMXeACxylUngQ90i3su85kuaylCIjkNy8SQROPAOpg3RgORDn4f1YDsER
         JReQ4ovbP5EjY4MBrbl9CvnUAMvSlfe84SfL4A2KlmL0cTijptmZ5elUji29zBQxRdiH
         y5pRtJHcburEl/bZ3jReu4PcjmzV9i2+k6nqSuTHk4WwuTZm3Hl8sFhwLsorVppV24Yf
         8PPzsXv65BqmvwlnPu7sFiJyoakBQADn5FgTenJDDPea1nbSn0pFZcMxiSt1sSVc1CDw
         xKWSaBzDM4mZtk9s0SIceMH7rgzVOTGBYOwB6MbdP3LYQCidj63i62WFVT++7jTBtcD+
         8L8w==
X-Forwarded-Encrypted: i=1; AKwUvBwz8td6QVUXi7lLhfeOjqtVu0PUDdV+quoRVVNc3rMPHBh3ueHscUQ3DWFtKkXZ7DOgkoCWrm5BT/DFG+Kq8/Rfsg==@vger.kernel.org
X-Gm-Message-State: AFq9FYINO5tHZsjBYllEBNmeElTQK4P/SGt769gChxh9DPiwHu8FXhe0
	w6f0wRtH71vuTXMGK09Qt8s4B5XLin12DIRvkq5mi0lAHf/lFV0S2GgIv2ahpn+6nVs=
X-Gm-Gg: AYBFou2mvoXy5ZWMfp66GJeCiSZQB1idMNzLgTRrywtzKinPxijteakd38lNJsbnGPr
	vUVjnIZSHi/r6DVc8zXOiSsNDNa2gke7iXRol+o9nZ9BHnpy2xcFX10Cp1SyTKXdcCsxxojGpQu
	3DUWkf4GvueSZg2YoH7W+kCJwMH4SWIi/uLs1fsEhg9Ks4NYALdU3xgrTkLGp9ZJ0lE5HkDb+RK
	gHxRhC74L0HnokDynC0aix7/GuczGfqUgehpC2lF0oMQ0o4rsUlp/1JmE8krgHI+TSUR/kUt4te
	EO7x7NUc78BWgTk7/JfmytNDtNOij+Ngb9USeHcsuA2Ty9BAgdHHACkB2CY3iA0EohpTYDvKVUC
	ED0pdk/IrwZVlMGapuZC1Jlfseep9+V7ywKPm69Zt5l+VwfpEgXwh6vFSPIBol0Wj4srf3bZfcJ
	ptTPi39YsTarsUTIxKjYB4u4arLDmX+Jtwe+7rpbPcMZwR0ugfXRSy8pTqyk5OVYMlTxwiGAd5y
	Syj8Cxqgz9V44dZLmYVrlR1jAdV50AfJ0/J0bL71Aw1g+yMyCGZud/9sFFe+y6KPBvpPdacIJ+k
	xokCnWw0SnPuv9vuHaHqyxXeRIXBfmOgzaApfg==
X-Received: by 2002:a05:600c:3510:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a96667dd75mr44218195e9.11.1793191519063;
        Wed, 28 Oct 2026 05:45:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm29772912f8f.28.2026.10.28.05.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <0602847f-4fef-49b6-a1eb-3240d7c1ecbc@tuxon.dev>
Date: Wed, 28 Oct 2026 14:45:15 +0200
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain
 in the restart handler
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
 <20241015164732.4085249-5-claudiu.beznea.uj@bp.renesas.com>
 <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <auC7FueGYTiLOpcX@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/26 16:54, Andy Shevchenko wrote:
> On Tue, Oct 15, 2024 at 07:47:32PM +0300, Claudiu wrote:
>>
>> On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
>> this case, the watchdog device need to be powered on in
>> struct watchdog_ops::restart API. This can be done though
>> pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
>> device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
>> with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
>> watchdog device though pm_runtime_irq_safe().
>>
>> Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") pm_runtime_get_sync() was used in watchdog restart handler
>> (which is similar to pm_runtime_resume_and_get() except the later one
>> handles the runtime resume errors).
>>
>> Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
>> context'") dropped the pm_runtime_get_sync() and replaced it with
>> clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
>> in genpd_runtime_resume() being called from atomic context. But
>> clk_prepare_enable() doesn't fit for this either (as reported by
>> Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
>> wait context warning as it is not written for this).
> 
>> Because the watchdog device is marked now as IRQ safe (though this patch)
> 
> ...which is complete hack and has to be avoided.
> 
> Can it be solved differently?

Can't tell ATM. This solution was suggested by Ulf.

> (Note, OMAP, for example, got patches in the past
> and become pm_runtime_irq_safe()-free.)

I'll look through it.

Thank you,
Claudiu

> 
>> the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
>> 1 for devices not registering an IRQ safe PM domain for watchdog (as the
>> watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
>> always-on), this being the case for RZ/G3S with old device trees and
>> the rest of the SoCs that use this driver, we can now drop also the
>> clk_prepare_enable() calls in restart handler and rely on
>> pm_runtime_resume_and_get().
> 
>> Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
>> watchdog restart handler.
> 

