Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC538CFE4;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736382; cv=none; b=m90NsN832yo9d5RPg0YGdbaNJVZD02UiUW4yqfiTbjwhVdmhTBlvxF/2lozqvS/+Je55PWMSH3qk79ZJWrtMqeI0Y7gIE4d/s/Gy3gklCSpHf9mQaLbXjGinkZoxo2axSgyXSSLmCCkQSqlE89v54J2SymaY+ySAg5yf8ZJmmlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736382; c=relaxed/simple;
	bh=/8Mm9f4wVRAQRaL9ESTSosSt03cNCq/bqKwrcekeK7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyeQZBYa1qrMBEDu/WN9OmAhTRV3WD9+GQeLy4/S81r8bSs3RqaRWPhlb0dtf1oiu1kl3Bzi2LhOViV2ZJdqivaU2F0wD8p6peGkDifiIi8tfo05R6ZfsyD+lUAiGUlp55voAL1j7jEj+aOEGfYmS1NRRcujXf67vxsRbX9dKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+5SsNID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+5SsNID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAF4C4CEF7;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773736381;
	bh=/8Mm9f4wVRAQRaL9ESTSosSt03cNCq/bqKwrcekeK7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+5SsNIDLHqHiF4ok0mD4BeGa9VRdXLvQUqHUq5v+0V8GJX2SjWmumNJXhwGtceAw
	 ng3r8yxFs+8y3X2uJbtLhEqBSvJ4uarpXQk1nD0c6zPcd/CZM1DoogIc1SniF+L/nN
	 vEs5/3zHIQQWCj5G7FDyboHgXdBpAiqReuOIHe3tQph8jgp0YxOEjy9/zr0vSD8dx3
	 wGQBKkXnEziG2VWytHqYIoJSkLajMJDEM6cBkRRqcmwqCeaplvAhaQPQOubIssmNur
	 evryn3ngLbkLE9syOLic6E/ckc8El5JHZvmwWPR8uR6RXPgurTR0WEglUZ1A0Ogi3C
	 4W0speqf+Hevw==
Date: Tue, 17 Mar 2026 09:32:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Message-ID: <20260317-spirited-mahogany-swift-b1ac53@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>

On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> 	Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.1.
> 
> It consists of 4 parts:

I think pw-bot did not reply to any of these pulls, but I applied now
all of them.


Best regards,
Krzysztof

