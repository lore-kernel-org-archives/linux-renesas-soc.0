Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772672BFC8F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329980; cv=none; b=ui8OsIPbRLFxtiJ1xnozOOuFGWXCpZ9dDtWjzIP8HRrxJm1EIZITBpkYTS3QmNeoA+Zz3nHS+XCrBYcIy9m/LOxpTBLWpDBB2lnnceCmmwPU1yJlLRMqUlmrvvn3dwB/0p5OxB2bcia4lbKzyAMa91HpY7DqiJ2pwIYeC0pUY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329980; c=relaxed/simple;
	bh=r2qQGBpS4eUQWthHp6CjtZnM+zqd0YLLqfu8XZkqlWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp101jpPm0HYuAWGvncR4/WJtlAXsS1MhrirQ5XELplkkO/QvSoEo0A2bGI8xASMPy6D4D/77sQJRntxuZuZ7p7OrtcRFx3Nl5WIJkrCJ5JVm3honH/5R32ionliFcBJJGdNwJWrCCN63I1s6DPxm/bwtt05q53TCXQg7APIJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EHYuhi30; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EHYuhi30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kS/1
	40q1KYIt9nS75TO3Zn/k6H05m95K0Z3RWECza+U=; b=EHYuhi30bul1KP9zXjp4
	GDnp5GGNa1psLSTEmTfucGVCKjbBv3durzxCKcSG1suyZm4q5BSOQopiW0nOOonS
	4kmQjce0jdUS8dMxly0Uc+c0geap/4IrCvul/r5DuSEahdofmXoh4XaKb3/bpJ1n
	R+3nQC94OB/LZLa8r9qfxzPtMzcuaiY6NjPeXgliPko5Lwoqf9B8c9wSNBNC57kC
	CsORTnYVMT3tSe3KCEiq/xhUVQhC94YeqSRA+clyr28ewbaxIIb/97yDP6wlPnMV
	q2Xxy6KDt/1XhMBlkhxOoE7LdvhFpeBGn7DUjL1IMOzIApEok0v1IxXBIESi77wT
	1w==
Received: (qmail 2553433 invoked from network); 1 Jun 2026 18:06:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jun 2026 18:06:09 +0200
X-UD-Smtp-Session: l3s3148p1@ZhpjXzNTSoYujnub
Date: Mon, 1 Jun 2026 18:06:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
Message-ID: <ah2t8FPZpJCF6CL7@shikoro>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>

Hi Geert,

On Mon, Jun 01, 2026 at 03:18:17PM +0200, Geert Uytterhoeven wrote:
> 	Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v7.2.
> 
> It consists of 2 parts:
> 
>   [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
> 
>     - Identify the R-Car M3Le SoC,
>     - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

The bindings patch for this V4H update...

> 
>   [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
> 
>     - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
>       SoCs and their EVK boards,
>     - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
>     - Add support for the R-Car M3Le SoC and the Geist development board,
>     - Specify ethernet PHY reset timings on various R-Car boards,
>     - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
>     - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
>       R-Car X5H SoC and Ironhide development board,

... depends on the initial X5H binding addition in this pull request.

>     - Add serial DMA support for the RZ/G2L SoC,
>     - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
>       SMARC SoM and EVK boards,
>     - Miscellaneous fixes and improvements.

I am confused, does this really work?

Thanks for your work,

   Wolfram

