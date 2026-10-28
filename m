Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179690;
	b=icv54ZLwyvLjn24SNlFP6RSuE6ON3ie89qa3Dt0TtjKvyM1lsR6zMzJRgUaVuLYxBjA3
	 sRaQ0qw7FR/MyDIg7QXGs7aCqyfVbC7VPJsd1em2gDW4nCAvwUyVQKUfpszi/zV0jf3NE
	 5PuY/qqApgn5XN6PaxAwhtcRLuf9mfRa6ADJweybiNtUtZJJI/R0nrCsXebC64jrvGIbG
	 xA4jgbdO0I3i/c3OvV748+zN4+hREYbAIq1ADIP+q+RPcIVgX0eWHCFKpEi2Hhy6gM/mB
	 PcTpadEk0JAiuILq7lF/2Dqdisp0xubGdxjICg2H84jLrwI6crOnebS8TNFe195HNpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179690;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=heJQBjdNMVHY8jFC21zH/dY31roNirLhq7s7e8zFv2c=;
	b=SZZd+dhGgYRLq7Fyiww8aTXsK6Ab0b5ftBDtM2ApSxYiRzEn991RiS40vra4dglN5gJ+
	 SP9s2exI7uBuYeO0NTCJcGNSPDi5Ixe3blgcru00U2K0OWE+E8iNd2VVp3i5QjHxF+JDo
	 ZlizwJg/5AlYl2CFXliq3olLW7sCskdkJdYylxdBsvrw34I3JkKrmlnOFVq5Nxpo1NHcy
	 6yIJp/Z0OM18sJTSS0aDRL/UH5w8V0k9cm0Nz8BL+ioqGTwqCoiapzJGJibWhfYVH0hjk
	 N3beHKbC5Y9bH7RDY4A5PPghxTucb13F5nmc4TmJTnsLqclzAaz8gCxYzO90XhairQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ArPOUS4k;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AB606A31A;
	Wed, 28 Oct 2026 09:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ArPOUS4k
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD6704F1;
	Wed, 28 Oct 2026 10:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793179554;
	bh=OFRwpIQtIHI4KvTV61PRrFHEkZMPuSbgjsNLrjj6a34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArPOUS4kjM8uqCg5nhm4R3iUJoSn22aW2vfrzmYwZq+zNC1Uoz+xOul9hATF+Q425
	 HbnMSt7vb4Vo8sc8tn+nz4ddRB87STWGrObomqDm2zUsssS7g/aYzDfk30qKCpqQle
	 snV/4G8Kezgrywl/IYeYtaWkhzysJ/C6WWlWUpVA=
Date: Wed, 28 Oct 2026 10:28:04 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Message-ID: <auG_dr3VFeWaBxKw@zed>
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed>
 <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed>
 <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
 <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>

On Wed, Oct 28, 2026 at 09:38:05AM +0100, Linus Walleij wrote:
> On Tue, Oct 27, 2026 at 7:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > The driver uses Runtime PM, but I see no calls to
> > pm_runtime_resume_and_get()?
>
> It gets grabbed in *params.c and *stats.c:
>

pm_runtime_resume_and_get() is called in the .start_streaming handler
for all video nodes (capture, params and stats)

> linux/drivers/media/platform/arm/mali-c55$ git grep pm_runtime*
> mali-c55-capture.c:#include <linux/pm_runtime.h>
> mali-c55-capture.c:     ret = pm_runtime_resume_and_get(mali_c55->dev);
> mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
> mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
> mali-c55-core.c:#include <linux/pm_runtime.h>
> mali-c55-core.c:        SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> mali-c55-core.c:                                pm_runtime_force_resume)
> mali-c55-core.c:        pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> mali-c55-core.c:        pm_runtime_use_autosuspend(&pdev->dev);
> mali-c55-core.c:        pm_runtime_set_active(&pdev->dev);
> mali-c55-core.c:        pm_runtime_enable(&pdev->dev);
> mali-c55-core.c:                goto err_pm_runtime_disable;
> mali-c55-core.c:        pm_runtime_idle(&pdev->dev);
> mali-c55-core.c:err_pm_runtime_disable:
> mali-c55-core.c:        pm_runtime_set_suspended(&pdev->dev);
> mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
> mali-c55-core.c:        if (!pm_runtime_suspended(&pdev->dev)) {
> mali-c55-core.c:                pm_runtime_set_suspended(&pdev->dev);
> mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
> mali-c55-params.c:#include <linux/pm_runtime.h>
> mali-c55-params.c:      ret = pm_runtime_resume_and_get(mali_c55->dev);
> mali-c55-params.c:      pm_runtime_put_autosuspend(mali_c55->dev);
> mali-c55-params.c:      pm_runtime_put_autosuspend(params->mali_c55->dev);
> mali-c55-stats.c:#include <linux/pm_runtime.h>
> mali-c55-stats.c:       ret = pm_runtime_resume_and_get(mali_c55->dev);
> mali-c55-stats.c:       pm_runtime_put_autosuspend(mali_c55->dev);
> mali-c55-stats.c:       pm_runtime_put_autosuspend(stats->mali_c55->dev);
> mali-c55-tpg.c:#include <linux/pm_runtime.h>
> mali-c55-tpg.c: if (!pm_runtime_get_if_in_use(mali_c55->dev))
> mali-c55-tpg.c: pm_runtime_put_autosuspend(mali_c55->dev);
>
> So are you saying these runpaths are not necessarily getting exercised,

They are when you start streaming on those video devices, if I got
what you mean here.


> so the reference doesn't go up on normal use cases?
>
> Yours,
> Linus Walleij
>
