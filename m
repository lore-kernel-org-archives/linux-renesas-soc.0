Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DA3B3BE1;
	Thu,  1 Oct 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851394; cv=none; b=NVkkZtc68FDF5HsKl/HJgEg875eVtFmOsXcPRTRR+Se0t0i3u7s8HkMI0omt4cfRzTUHjNq5tllUuyryITkyoojQax+GL4zFqXI+amCgLUwRlsg9RNOCfMgP0urkl02eN4f2TM2K1hb9jZDD4+C3ZDaNT0K8YRAGxhhkdMwkbLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851394; c=relaxed/simple;
	bh=OiNayijRT7KoyOYARno+kkiK6X0Oo94nDNU95tVMDVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEMfchgeSfJSPXYqvjtOHuizdIP/kM13RxqgcduLUF9cuPzFYj8CRgpNcfmVfyQrJuglF4Pv+MPCynVf8PCfuEUHdUZypVmBtF8oQZHikHWRU/GOtpj7jDYh/mcAqNLghThMA4tOnOKc9ZamabB0PYAS+Z5BSlvhfVrT5Mu5pUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWAVjI8Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWAVjI8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693A41F00898;
	Thu,  1 Oct 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851392;
	bh=F7McbWVv24hbVXXWdY7e/Mz3sweQWrmbU/20janHkOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWAVjI8ZtQTE9fpxT8l9TrbHTRD752W6t9b99PGB5bWzCiNRxC6ddJKm7nKEM38b0
	 x86U2VjnL0roddtgg/xHKsrQobjN2n9tyHzDwF/DFxSU89KA95KGt633uQjc2ZTsnU
	 cPTlBTN/d06dDqfUqktPeIENTFqqIdgJtqSHq2kWzNmOrI0mGqvaG1tbJAIx4WSBuj
	 q2YeHdSTmJyQ9E/iccCclzSjvCwGY6/JEkjd3S/Ow4WYV3xwT2TCUQvCg5xelAfzv1
	 RvFifjUDfQYsD87lfnJKjNN6AfBf6SOsRhK9/QhL5WCPtlzN4ORu7VcyMmfei+hcDX
	 hmzN9AE+94akg==
Date: Thu, 1 Oct 2026 12:43:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas driver updates for v7.4
Message-ID: <20261001-responsible-acoustic-capuchin-23bfbf@quoll>
References: <cover.1789722868.git.geert+renesas@glider.be>
 <cover.1789722872.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1789722872.git.geert+renesas@glider.be>

On Fri, Sep 18, 2026 at 11:37:04AM +0200, Geert Uytterhoeven wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag1
> 
> for you to fetch changes up to 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:
> 
>   soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)
> 
> ----------------------------------------------------------------
> Renesas driver updates for v7.4
> 
>   - Register the SYSC power sequencer on RZ/G2L,
>   - Add hwspinlock support for R-Car V4H, V4M, and X5H,
>   - Add initial support for RZ/G2M v3.0,
>   - Miscellaneous fixes and improvements.
> 
> Thanks for pulling!

Thanks, applied

Best regards,
Krzysztof

