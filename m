Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875713E9C05;
	Thu,  1 Oct 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851227; cv=none; b=jn9la0ZY+OXzke6c+7DE2+h0XM1I7M3gDni6XG+7JHkBJqr82Joeban1NunpTAODhzrhat+MMPiaBd94MIpJ9jBzGAEt6AvsSQpZKr5GTH1vOhxbOBdCqZJBRe79SN3XREzZVH+TtAmib0rZi4TOdoA3TvzHM5K7vXLN4uDl9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851227; c=relaxed/simple;
	bh=L4646pQ+4q/5njjsjHYYgregcsQKAS9YGlFAr+w+rJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvbe8V99uiNjwaBJE2Vpa+gizetihaJFMCe/AML/zLaxigUb1+9BgrrEMsYKEN+5Us9h5ofQLExGoTvb8HcwwyY6YVEm31HTEyTCpThyKKeJ3vSGsbtOrz4TgE/4Ds18s3sfr3Sd/m0kptEvPaZU8hWTx91bX2ThBsFduHYLhVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otNyyg1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otNyyg1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63C81F00898;
	Thu,  1 Oct 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851203;
	bh=bQJeP082wYG6p7Gsy0czusgedL1PZIxQOaV5p7SEutQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otNyyg1vD1bAXKm6gl11ZqG6KTat58jFzWfwU3F9MT95Xqs/5pPmE+LL+iLNe5IF3
	 ERRBXTrpj9+c2f94JwOkWPe7L5dQA4MsKzPEeQbdPPezQd5eNtPybshzsdufszyEJW
	 nS2E/y/CVgKLXbU++TXWXpm6a6lQxsZTefm0IiA04myEubsU0LtVpiBiGzJ3GKRMDP
	 0dTxHjxlQkUveZyXVVGg3eMMzaJPSbZqno1iIZHLjIfGYQSE0xOCTj3HkHjei/X1mH
	 J0Q5ckG50hMAXnta07I26ajptBLMlV22UX1iC7p/AbXch8gxtOThJme12nNd8Yqkpn
	 CcFwOiRPncwUQ==
Date: Thu, 1 Oct 2026 12:39:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/3] Renesas ARM defconfig updates for v7.4
Message-ID: <20261001-wondrous-vehement-coot-a8cbe3@quoll>
References: <cover.1789722868.git.geert+renesas@glider.be>
 <cover.1789722870.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1789722870.git.geert+renesas@glider.be>

On Fri, Sep 18, 2026 at 11:37:03AM +0200, Geert Uytterhoeven wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 

Thanks, applied

Best regards,
Krzysztof

