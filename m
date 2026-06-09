Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF793F9F25;
	Tue,  9 Jun 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002329; cv=none; b=pmk59znrkvh8KdhCmVpIYxYAy9tVGKNWWS1Fj+yFZp8QR6wfmVMBdV1uXT/al15HqXzWi5Fa55htp+QPWzVpaiyGOd5KFmxH6cJg3UYHk9SGowvxq+T5ytAZtN1pON59d9NSW0J/3OgzsLDZ7dXLxubFsn8D51QNmLwJ+ttp43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002329; c=relaxed/simple;
	bh=dE4xAq8sNgkbtWL9VNwvPbkawX+T7DOKObtpFJBLIQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ+GU/3j4xePCBdrpPAuN3qraP+ep9j+09XyB0QE8CWP211+UnVRzva/VPJuPSc6WqvHCS94/TMDlKn9hpIy1oSFgW8mrVvZ97O3Fo5G2mSrM55Zglqt8WnD5pB1xqLxYCWUv4MQiGwLmXmvY+zBkUhZyFp6IXSXRFPDKEqW77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBZPwZKC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBZPwZKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056CB1F00893;
	Tue,  9 Jun 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002328;
	bh=2qegDi/hsOr+MbKGrGj0VLa5k6U4wNh2QseMOKrEEok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kBZPwZKCPIQogZ5CJ+78xF+mpvgrUvQvRLXt046dsbHfnimm637Gz1tOrBhmRAm1j
	 eekLPSwfZEajD9Q/yGRxVUs8anN6cbJdRoCJ/78/WKFW7WxpiN5gyYHijzwEG+D67y
	 dwGrmUaT+aEjvRZiJdZPIByzahinDo/K8aLLhQ/AVRwBnhHlZIjMWD+mS1sckDDeVU
	 q4tK9X70Q21vp/p2JIN+E8Wse8z0ULTsThPF+cWCu5lt431cGzDy9M1kDs4uFo0tTH
	 o6ZTHzfbhGpr+2iHY5XDRBbRpRpmr2nigWjAJTqmpSoRhQkU4CPortHIpfFTkkZizS
	 4cqCrV75/RF1w==
Date: Tue, 9 Jun 2026 12:52:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
Message-ID: <20260609-cordial-eagle-of-prestige-ca6c99@quoll>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
 <cover.1780319120.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1780319120.git.geert+renesas@glider.be>

On Mon, Jun 01, 2026 at 03:18:18PM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:
> 
>   soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag2
> 
> for you to fetch changes up to b4d41ffa750fc3403a4076d17090589d000f13ff:
> 
>   soc: renesas: rcar-mfis: Add R-Car V4H/V4M support (2026-05-29 14:42:29 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

