Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227252;
	b=ufSpVcb9EVYyYeUDGpFubBgBpeuzu5jWQFmIY/ncuuKadTQm8E6EZItC2a0zPzJlilqm
	 eIaXcbHjjpvpMYdP+WzwIaVJDckKYYQ+Zd+zEuesbTkHgesiylBv1R4cSZFQNL0fNo8GJ
	 tNL8yqKSbyBdfg/WztPdPVrb3lzz66ZC+3HmaqpeGGntg82ls6MOwFn4WqM+Plccbb/4j
	 W2jC5Ky9NQb3+JOwkXQ0DEzn2x8DSqwpZqdhQI1lxywHtUXKaxY9Q4m5P3TqEBGl29Gg0
	 Ih6Gx+92NUejEvUXWhtiFCwWGLqEzel6MuuXZuutEvIw/7kWsTQoUUSmcO0Krgo1TAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
	b=ue7Us6UZHTGdhlJiP+EFSbvM85jqIiQFgxPxzDJaIgv+MB+Yh7j0a1oifeuOeA2xGww6
	 /+cE76xKgCqDNLwsz1xXm5YG0E0n6f+bo2eYe3bF7emrtrS/+YFvTZE9N5DdvehdBL9ZB
	 cwVRIxoMXh3eaoU++9JD515Wys3v8G/Sh5Zs2T6QA1sGNajGqonZX1q+EeYIWusXTsqPX
	 G61SRyX8ABbSkhiwCfZkHBAeztx8SzGLDnTAOHYJGBcjgLaYfKZ/cPP3nbPd7t/PK2IG/
	 I8YKoGpBYedJzUfjsl/SQ32aOriTIBTbda8kOhK6MSTNPrjPqEmLG+CQB/3HOZgchOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD0606A325
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 12:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FD0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so879040a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 04:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794227250; cv=none;
        d=google.com; s=arc-20260327;
        b=lmxsbVvIL2EiI+9eSD/csvwJ1rrH/i7OQIFOxgZ1gHjhc70/etG9SvoLcDYhIfUw9S
         ESVRCO6BMyI5vnMFnXq7w/BZQ+Gz6PzH0ValpM3YRQJXtLrn0S+ckwZowzx7uHv20WeH
         DdfoZSnM6AUwMNxl24RYR672oyWkjqb7ARwV2kUPkmLYEOenIYr+dBIzRUA/RQbfIHjk
         mZhEHY6cSN98yneR3QXxBOR9YiAJevZcSY8emiLDHa9KLVZekjKAWtQB6JEJCS5pq6mZ
         TIc54Q8ZNXuIVqChxPlhXvlousi38D//mUcCXhAYFUVHTybLXDT95jTDMdfQ7JqOMQ3I
         V1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        fh=sQhMBWhWmaWY5p2LC1Qd2bHM+ZEOd+lih/B60jTuuL4=;
        b=B4I4vv3rVG2uiwTO+jvd0dkCvrwihPZRk8G9IXiRrsQF+DEZUwVN16VAtHgYOsrVFL
         JlS93CJa/YKgzVaY2bjo/BhDh2sRCU/johKzqVaqIWOLmhfZH5siEYUavWsfkWSJ503P
         v5X8poe5bb2LKRjJMuLirsiqW0DGaIIgdvkIkq3cF5rP4I1bHtxNX67sT/SjsW+fwpjy
         uCo5EfotY3QHrTkhrzJ3luEtVYv27VaE2hrpBd2nIe2z27Vrb14K4PzwcfFdMA8l3nDr
         Y6PcTLOZGSzpoq9Tr6W6Suk7sFUjc2fYG+hbxEHRDZ0DhB5vxnHxeimh5dKLJ7XXrpQR
         wLtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227250; x=1794832050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=QOgyhbeqOwd2Z8XLJx9wuh00POYRhyJMgoyTP2JMbJJZZwVnt12qxlUpcwNXgfG+pp
         JaMwEbHHzfXgzSVYNUUjUGAHM4w5gIiWjKVMo79/N4Kp7/QNLp74fZlfCscaySJbfldb
         xQdArFs3VDfGTOs1UtGkxdrVHUOFJ8um8haAtZ9RIzulS0FS+QUM0zZPsQpT63l+ktjO
         SVICn62kPn36QNCk9ALNSp6FdvD79vNG4ObZxi9TgEboX/0B+2bu/ByYWc9nxsh+fkt6
         CmD2fpaF5ijY1Cz96O8VMTE4HMTAPlOe0mt1ogz/3/yMi9wqTDx+W9cVvmqfelt/BCIs
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227250; x=1794832050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=lhNbRls+f+6d4BtTPI8D+pMexb+1QKN22XKwkhTXOagY7nYEkkSLK17MbzyV6Bx1QJ
         uTPOADh04Np01LbxvyE+BCVGBm/6vO1bui3tLI66ivbXshAaFSRJb2yld+dls83nuQUM
         8QHNKmbgsIRzU0G4OkbAT89JLg92U4wF9CM4VWGYC1jIe1KUsyccCdi51sLFiNoEFnfV
         BgCy/orXPwEtrado0Zm6RkLYH/faFPqIzONxj9kAOqeXxjXxBMvVSNWSI14drUtbbhN3
         /0q3SzzkudEpoqzJATfwsN3zKRZDz9Dug317J12pRWROR6CUQzlwBzu6W7imsMHfCXy/
         lYrg==
X-Forwarded-Encrypted: i=1; AL+hErEOCIHWtqI5/80/VH9/BSmsCJxmYXGNPz4VbxYmyuEa5G5Cy28kqhwyV46ud9dHhbv7Zx+W5cHLLzH2OFv4j6H40g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+DD+3UZpYnWtObg7NtpgpPw3yRso7CvhaNL2cUT+4PbpKTrQS8
	ZNQApemN5VGbYFCp4IcQ+RIg/b7Ub8y/b9vVplhAK08eLNnWnO8NZUq0XaGsECpi+u6BIeOA/9j
	I7QJQpS9nLLbsM4jko3uqGPAdZIb/GsA=
X-Gm-Gg: AYBFou3s6Aym53YatsOd3X0BKkLvDlyiUyw9T7t9zz4dy93ESpmCHzHkVuWd2FSCSPJ
	HvNshuU6knNkbNspGqX7n1BoSZ/zr0ku1Ruq70xb14p0uHyV5X/uNELA+C72fe+UCeVsznmjzXe
	yGWj6QmpnJVVwd/uOca2X1glwrZ+26PpzemRyZl/gmgIO7R9X4iBqxaVPGbcLaaVQ1/pBOlEtSn
	ypQMRCxMDTn5F7ehc2TBuqxuVihkL04TBMxMNcXyBfEF25y/g26ezdmhb/JPqyAXr+3eH6piobW
	a1l7o66lkEaxhQGbBuIF4TZ6lx/7XLG7Ffdvywu30EXsVAo0XCjbDhRUPJkp8ztWtIs6eo0rzs0
	QYG7bLNDKPe+haf/kIP73826WvHU7ypESgQEeUpnNBRPH5tif86XhuAnQZO8AriUUkNbmh+P3TK
	KoH/7RLaBHhMw5lVAGJb5MA6HOn/hdlt/tqGWf41XxCbv/LNx0Hb9B7fXU3Hs=
X-Received: by 2002:a05:6402:3895:b0:6b7:8b1:aa79 with SMTP id
 4fb4d7f45d1cf-6b7223c1832mr2314095a12.5.1794227249763; Mon, 09 Nov 2026
 04:27:29 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 12:27:03 +0000
X-Gm-Features: AclHuK_ZRUUlCMH4HvENtZrOvYlrEIYJCdD6Zdsj2qnZgU93aq494AwRB7CTooo
Message-ID: <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> which the CPG driver registers SYSC regmap. WDT driver now uses this
> syscon to access the WDTDCR register.
>
> These patches were part of two seprate series [0] and [1], out of which
> certain patches have been queued separately, so I have included rest of
> the patches into this single series.
>
> Merge strategy, as the WDT driver now includes renesas.h header file,
> the driver patches can go via renesas-soc.
>
> Note, patches have been rebased on top of next-20260930.
>
> v7->v8:
> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
>   restart handler" addressing Sashiko's comments
>
> v6->v7:
> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
> - Added new patch to drop pm_runtime_resume_and_get() &
>   pm_runtime_put_sync() calls while accessing the WDTDCR register.
> - Dropped propagating WDTDCR access errors.
> - Dropped converting WDTDCR handling to regmap as this would require
>   resource address comparison to get WDT index to call
>   rzt2h_cpg_wdtdcr_count_start().
> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> - Added if regmap is available, use it for WDTDCR access
> - Updated commit message
>
> v5->v6:
> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> - rebased on top of next-20260922
>
> v4->v5:
> - patch #1 is new addressing Sashiko's comments to avoid potential deadlo=
ck
> - patch #4 is new addressing Sashiko's comments
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> - Handled the regmap locking in the driver and introduced nolock
>   version to be used in the restart path.
> - Added review-by tag.
>
> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Add helper to start WDTDCR counter
>   watchdog: rzv2h: Use pm_runtime_put_sync()
>   watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
>   watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
>   watchdog: rzv2h_wdt: Add syscon based WDTDCR access
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
Gentle ping.

Cheers,
Prabhakar

>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++---
>  arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++---
>  drivers/clk/renesas/r9a09g077-cpg.c        | 35 +++++++--
>  drivers/watchdog/rzv2h_wdt.c               | 85 ++++++++++++++++++----
>  include/linux/clk/renesas.h                |  6 ++
>  5 files changed, 129 insertions(+), 45 deletions(-)
>
> --
> 2.55.0
>
