Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9D2C21F4;
	Mon, 26 Jan 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443910; cv=none; b=i7EuCjR9pW+Mk/PlWjlDctz+J2Wm2hXEu+kB951ljy3A6FwzuRYXqOyMm9ev+2JlUzkMtkV3ewRrSLRBWlo+B+Ke6WktDKd8raBui1BrFd7vCXLPnNB6y1ugT/I78VCvqMqcFwJkjhmphgJhw8ZOPrMIjdZfzc8l+VE62Wrpplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443910; c=relaxed/simple;
	bh=RHMs4ZS8G8pDfDHfh828lm0ozpX5onf5sIv6mMarAO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q6F/sewAREbSp46f3caNH23nSkddWI7+AHJhgjxQ1Iz+TGupYi1X5p0hcSzdwlPBBd8HK/Zc0jQ+F5ihST2427rtlNAD4EYi6+ZDAMFKDQDgSN6LhKl386wRDCxqFZDKMuLpwYDDkQjFtY765DLgy8igbWxJLQjndQunnaAHIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3jmJpXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3jmJpXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299C9C116C6;
	Mon, 26 Jan 2026 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443910;
	bh=RHMs4ZS8G8pDfDHfh828lm0ozpX5onf5sIv6mMarAO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b3jmJpXamDXsxe/FbJOJvMTVjjKa311Hmjr7d4kSdLa4IPWpwCH4R7FSIaIdWXm62
	 kGG2+WYkB2pxJoqcD7dStMyRBCz1hWDKXD9/qQZFCbcrAyzzhFNbv68wwHK6aRCHXJ
	 nAO8klYdHD7ykyTu6cyH5GmE8D9g6NgnWS235Lit3G4IKg6khnCGpYSECTQsLBq/jz
	 z6QsmEBM9T021jvOZgGMh81VzBUWVd8ptCs+SSo+J7gTkEleHzuVqaNULNpd1jZT21
	 Tt1K2sDxcqR7t7m4lRK7rNTTFh3bHSiXlg/bkKIERmCV9+3SznkRkcla4WCMmGdMCd
	 YpA4cEv1+pZgg==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
In-Reply-To: <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 26 Jan 2026 17:11:47 +0100
Message-ID: <87a4y0cq0s.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Handle the RZ/V2H ICU error interrupt to help diagnose latched bus,
> ECC RAM, and CA55/IP error conditions during bring-up and debugging.

Why is that only relevant to bring-up and debugging? Those errors
can't happen in production, right?

Thanks,

        tglx
