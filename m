Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF62411671;
	Thu, 30 Jul 2026 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422856; cv=none; b=iLZ6yiIe496HXtn+eVIVLOTPdMydyM0+vMIZwghlPmcQn5eUPqvB1FiS34DRzzUtC5ojsQNCq6D3sAxT/fIhJAumKGMsvQt1SwLVZYKhi3i4JLB4he1eKFVY8QJelahIxdeGtlJeJL9NYLtfOMObkcjqGByFAvY8qmUkCEZN4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422856; c=relaxed/simple;
	bh=tF9syoPj01wxfV2dCZf+pDyRUqjGAAuFc/JEa9X/5+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px2vPw4knHOdbISzSQFNvVMR8WYc7M0N0caAgWJJIh4QcYVJZ5ihqhfDW5L8UFb5QurnHgLxdELtBKCnqXMZkr4zSUg6aUA75ZXeER7BHvG1l/hzCowMUk50LGhRqKEvoZIsrAdGjmcFQLE65FKDdPQG8To21X0kB9cUyN7mQYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jIqslaIn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jIqslaIn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B6841A1323;
	Thu, 30 Jul 2026 14:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E035602B8;
	Thu, 30 Jul 2026 14:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E22B11C15D1D;
	Thu, 30 Jul 2026 16:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=feo9Jm3yXHIvrDKdw9TVOwnY48iBlHT3LyvIl0cmFHs=;
	b=jIqslaInDWAKhi+AQIcTTOUrtzN3b7rVfdOvEHSerw9G1op2Myk24dQ15aIPy/5uv3s0ZA
	mqqDSB7IKincE+fTwIk9eC/9o7E6Jz2Gid8wz18VLbaoXsywjLGKDKQZNaTO/6lfjidKk1
	0i1dgdPjzv1GAcpzXKY4h3/FWHZQ3AiT8uhBt0F4YE8mID+PwBPhlgn/7lG3cvprb45Lsx
	k+lGrM/z3C6oCOPdXz5AKGOr8vIrQkpUvpmgKKzrIJ/amo7YOWEIRGU6rzD1x7o/uD8+6l
	915Za/OqryNNTeokikDUHUFA2kJ0YEU1nkgj94KmW7mcJeEGGSxkf9w9qVjMGQ==
Date: Thu, 30 Jul 2026 16:47:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	Frank.Li@nxp.com, Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2] i3c: renesas: Drop unused structure member 'resuming'
Message-ID: <178542283972.1795404.2499723599356198654.b4-ty@b4>
References: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721191618.1850795-1-claudiu.beznea+renesas@tuxon.dev>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 21 Jul 2026 22:16:18 +0300, Claudiu Beznea wrote:
> The struct renesas_i3c::resuming is a leftover from a rebase. It is not
> used anywhere within the driver. Drop it.

Applied, thanks!

[1/1] i3c: renesas: Drop unused structure member 'resuming'
      https://git.kernel.org/i3c/c/279a9de1bb1b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
