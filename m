Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7E3E5A2F;
	Wed, 24 Jun 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335769; cv=none; b=mX89uENkCPwkkyP3NQnoDcvp1W+ySrDPzOrOvlx3khN2suLbZC0ZHVU6CEt1qIMfN37H0Odrvb1TEoN4SkQYbsun8dDz4/gkk0EJitTfUPvQ+zb2EQ0iXVlegSVLRXuD+oRcffEoBZgOorH7/mp5fg7sBcfZbIC0jUWBKopWmUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335769; c=relaxed/simple;
	bh=CpDh3jVLvozEA5RyGrt3ugXB1cZs3JKi/bYsPDELKFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0gvrT3IGtJ2VhYW7K7pLlBpemuJ1RgY+MgvhStqKiXipKuEjvbZ474TdjoJyd1F+3u/ya8hVQXIDlfxa6pxnXfx+Eu1G1S1mqwAcvjF2JNroC8mETQFyzUC1fc5r/qNNKocjuVJeQuI9oojOguQTG2ktG5hPltdT6OWZbHZPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ogqr69aO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ogqr69aO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AA7EC6B3BA;
	Wed, 24 Jun 2026 21:16:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51535601C5;
	Wed, 24 Jun 2026 21:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E992106C8468;
	Wed, 24 Jun 2026 23:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wraPUdLmVqtTkNdtQ5IedrZ/juHLC6UWUxYbYgjV4pU=;
	b=ogqr69aOM+wZnVAD1MhmYkQ3DfOusUIHQ9PER7dBpnYQcO4OO42El0q0HhN06W4rFTx9Wr
	sNHetlqkNnT6Sr7zglMEciDZho+UamjMtMde34hQgQ+rGrSWZR0ofs7w6K39L7cIrCImv7
	JFWSt4rysOaXnxGp84JLrFF8rsOMf9fygsJXgDfkuyBhj2+XHR90stg/bfzKbKsdNV6QvX
	RcJOWRFObE6mZzTKumxwOUBPn8r97fS/ntgHJ2m0BlEiHUAKwWZNItmGe7vdA9Onx2KapL
	Yifw6k7Xd8Cgt3YQSfYuwLHoPdxfQoTZEkwn4mIvBxzoAcIdg6zeIIp/lM/6xA==
Date: Wed, 24 Jun 2026 23:16:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/5] rtc: renesas-rtca3: Various fixes and improvements
Message-ID: <178233558788.1517260.4788362549360273691.b4-ty@b4>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Jun 2026 20:25:54 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series includes various fixes and improvements for the
> Renesas RTCA-3 RTC driver, including:
> - Fixing the polling condition when clearing the PIE bit during alarm
>   setup error handling.
> - Checking the result of the RADJ polling during initial setup and
>   propagating errors.
> - Correcting an error message related to reset control.
> - Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
> - Refactoring year decoding logic into a helper function for better
>   readability.
> 
> [...]

Applied, thanks!

[1/5] rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
      https://git.kernel.org/abelloni/c/7e342d87aa8e
[2/5] rtc: renesas-rtca3: Check RADJ poll result during initial setup
      https://git.kernel.org/abelloni/c/fafb016d0812
[3/5] rtc: renesas-rtca3: Fix incorrect error message for reset assert
      https://git.kernel.org/abelloni/c/09939630aad9
[4/5] rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
      https://git.kernel.org/abelloni/c/9fb12656a7a5
[5/5] rtc: renesas-rtca3: Factor out year decoding helper
      https://git.kernel.org/abelloni/c/2098bb8ac5f5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
