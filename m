Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238124;
	b=CcHzvKwFP/OUJDVOivIPfK9GUAphbctFbocQNz0JzQYdQ+umWV2HMaP7OFtK0tN91iO+
	 y8ro+qTZbCH022/0xiepRBWBriThfGREe7YlFThvTpbk/Hu9C6QiGzyDFV/rsaoA6F0cQ
	 BqRRTCQzcIN3CvsijFWD3mngjo45bNXKcXMWKakAbkstUh/Y5neypbeQ/po8KzTk+gTJJ
	 JVcOyashmZ9WKbAKFT1IYiBCfItoOi88HKPpRRLznGMSz/Sjn4BlPPVpYrDuxIol5Bn6u
	 n4dd+ATeS3vuamuv6e8k3lfUbDljzEybYhYxDRlLAUpf1xWh0qlIZ/EUh99yOFpIw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238124;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=B2vyEo5b1bt5v4hJpNTxZdeyGVePDC7Pmfk5vt9hzUc=;
	b=IYC7Fi9Hprv6KE/Zq3pcdVoWa+zqmL0QuyOxkWQuGeG8YDbnBnyVPXNtbLXn/RlFNcoV
	 cEf/BWYUTK6dT72D7Z6qyozJEdkFRAu8sTB9uxX9OJr8jSzmUYwxKi+WQpk6Z5Y1Fuaci
	 Lzxf1vSE+lkiIj/KXvEfgsCNi90uImk+DJAuCe6dhGcn9dzxvcq2Uc7QI4RoXH1tFcvLk
	 9MmCQizRbAuaskd0YZen1Pq79qbhH9Us3pR0+LVxio4TLOy26UdV/p9/AXMZLUZ8ilyHg
	 WJoRTvh2m9agk6WH9TsOdqcd4YiXs6SomATty42RuT9Rgh+FOnqAhILx1KrKNsquBsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lTMRzCL8;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FB606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 15:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lTMRzCL8
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id QOPjxoDyA4vCDQRIYx85Nh; Mon, 09 Nov 2026 15:28:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRIYxcOPcSgq1QRIYxSTMf; Mon, 09 Nov 2026 15:28:42 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af1e6aa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=yC-0_ovQAAAA:8 a=pGLkceISAAAA:8 a=Bc9-fzvMU0tklgv-buwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=B2vyEo5b1bt5v4hJpNTxZdeyGVePDC7Pmfk5vt9hzUc=; b=lTMRzCL8hvXA
	tMU+zRBnUqs/tk41gqWTSKzucfsY75DpJsHANPHGLVyEY8oOXvNPX41AkGoY1ZphnfhKFbVP2fmy2
	7b61mJxbw56xGtARUS5/qekOtYHqpyWgSDDG5AV2neyFeeySu1RXP52CLysgIilx/DDBgZLbKrg9m
	9aJJ04pLr8iTfD+g02+qou5HHkWgEuWBsi0PJm0J3rz3ubfunsJ6vwZJhuCqBeD+TqB4WWFzKidZ4
	+8yd5Rmu0/86bW9hWZsiaI2IegnMf+QIU6nGI7c5rNa5Fk52kEiT5OCHMvHH3EituXuiBuKQJag3M
	HZjP62eL6WzloiutpaJ+6A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58606)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRIX-00000001ESL-1tvc;
	Mon, 09 Nov 2026 20:58:41 +0530
Message-ID: <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
Date: Mon, 9 Nov 2026 07:28:39 -0800
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
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Brian Masney <bmasney+clk@redhat.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRIX-00000001ESL-1tvc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:58606
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJN9Mn01Po0jfmNa/jlKVhgGWWQJHkfBTbHwXfNMgpdPRQINKGsF0phRuVfo96Hpjc8a6OUiEPoXYMka/gsqrqPg4fzVXVS5yzzprK3Nhn5+rkng7ka1
 djB50st9hVBuVtS9IFvuPVWnAfPIsJ6Pdf6ll+1wkHH9PmWpiEU0OiOZvE3jwXIVCx4Z+GpQfUOLbutDXfMzpcdQ9DD7N9wwlO9hj7sAi8txHyRl8YVHKgtB

On 11/9/26 04:27, Lad, Prabhakar wrote:
> Hi all,
> 
> On Thu, Oct 1, 2026 at 5:52 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Hi all,
>>
>> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
>> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
>> which the CPG driver registers SYSC regmap. WDT driver now uses this
>> syscon to access the WDTDCR register.
>>
>> These patches were part of two seprate series [0] and [1], out of which
>> certain patches have been queued separately, so I have included rest of
>> the patches into this single series.
>>
>> Merge strategy, as the WDT driver now includes renesas.h header file,
>> the driver patches can go via renesas-soc.
>>
>> Note, patches have been rebased on top of next-20260930.
>>
>> v7->v8:
>> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
>>    restart handler" addressing Sashiko's comments
>>
>> v6->v7:
>> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
>> - Added new patch to drop pm_runtime_resume_and_get() &
>>    pm_runtime_put_sync() calls while accessing the WDTDCR register.
>> - Dropped propagating WDTDCR access errors.
>> - Dropped converting WDTDCR handling to regmap as this would require
>>    resource address comparison to get WDT index to call
>>    rzt2h_cpg_wdtdcr_count_start().
>> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
>> - Added if regmap is available, use it for WDTDCR access
>> - Updated commit message
>>
>> v5->v6:
>> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
>> - rebased on top of next-20260922
>>
>> v4->v5:
>> - patch #1 is new addressing Sashiko's comments to avoid potential deadlock
>> - patch #4 is new addressing Sashiko's comments
>> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>>    restart path.
>> - Handled the regmap locking in the driver and introduced nolock
>>    version to be used in the restart path.
>> - Added review-by tag.
>>
>> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>>
>> Cheers,
>> Prabhakar
>>
>> Lad Prabhakar (7):
>>    clk: renesas: r9a09g077: Add helper to start WDTDCR counter
>>    watchdog: rzv2h: Use pm_runtime_put_sync()
>>    watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
>>    watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
>>    watchdog: rzv2h_wdt: Add syscon based WDTDCR access
>>    arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>>    arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>>
> Gentle ping.
> 

No feedback on the first patch of the series. If you let me know which patches
don't depend on it, I'll be happy to apply them. AFAICS that would be patches
2-4 ?

Thanks,
Guenter

