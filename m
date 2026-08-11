Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88BB42CAEF;
	Tue, 11 Aug 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467809; cv=none; b=jYH8siKHjqWv7uHu2SvvcVFiiU+b1jNOq9VCw/TjM1lN42Ks/WdMoq4nmIoscQ15vRtVEn6wn3T988MsQ4MUmkc9W1YqQAZL+hvbHcCyEjjsnrIowoPbxqrxRzZPw/k54AKBqb0gmnv5NBBYuAmRXoMor2MCtXPmnK/tgtIdqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467809; c=relaxed/simple;
	bh=oVYdVHkanBAunjXTw3oUptBcWcXaoIyqwU3nrcUsC7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bkQk9nBdAD+6ViEzhreY+nPoq9OdHNoTbNZMeCR9lHXYqbO0zHPXlhy+Ldwg2x+nFL3HW/WjYLlrKfgS5bDGEJHquOXiFPkRNNhPuLJ/KU8jcT5k0BVIiMA+XK+CKgMh0p5EfU7weDY8VViY37R9mN48SLwUttAlYJSnnF/B+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MA9BVoM7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MA9BVoM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D9C1F000E9;
	Tue, 11 Aug 2026 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467808;
	bh=B5B+nywXoLAyizGyLTqjlYdjdl/5C/N0v2eS0w9gbkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MA9BVoM7SANZVIabB5nmLtRzOkrpEtAwM2fnSUMlbMaRU1Fsdn8w7bkDGIGsQ78Wh
	 77lbwX4VXJJe4KnqIHr0jWR6P5sFxGlxVgFJkrcw9+KELcJFdZrYztQxsCKgNojE+u
	 vVvFJeoq/BpMDpon10cWfqsU7Wx6H27AdnGDx1Vr220dmixLOSLDLYczRYw41dThix
	 jzcNGlI0D+BuG65S31Y2kaPXdE9j/KkhkQcePgOfBPP+n86quBKCaUYkNlGWO362nd
	 EszzaL+EZV0+VQbL9Cn9x6kN+togdJpXu2l6yAmOMAhtPzYUSXhR1sBokQZSSKUuPA
	 wlajl5y4GLjmA==
From: Vinod Koul <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS
 regulator
Message-Id: <178646780408.1081354.3801368626858811843.b4-ty@kernel.org>
Date: Tue, 11 Aug 2026 22:33:24 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 02 Jul 2026 13:58:55 +0100, Prabhakar wrote:
> Commit b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for
> OTG VBUS control") introduced support for controlling OTG VBUS through
> the regulator framework.
> 
> As part of this change, the driver started requesting an exclusive "vbus"
> regulator for OTG-capable PHYs with no_adp_ctrl set. The lookup failure
> was propagated unconditionally, causing probe to fail on platforms where
> no VBUS regulator is described.
> 
> [...]

Applied, thanks!

[1/1] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
      commit: 9ea8d49c6cc6e217f5f5818369f659dc25bf89bf

Best regards,
-- 
~Vinod


