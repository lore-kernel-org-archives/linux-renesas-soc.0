Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5844E037;
	Tue, 31 Mar 2026 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988990; cv=none; b=HoUQWKKM7PfVoHiTR5R0YPVrvwAz3wz84KDRKmRCcnKcrZZTfPzOsZpgDDRSUTKhkSRyJ4om3GKOguujUIigHgonVp0Aiy5qSI4hmE9P+kG3hIZrc7GQ0WUqff4bffmUjwwh3xhFY+t9WPIrhd1xPY9HwsEJ7PpyioWZSvJinrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988990; c=relaxed/simple;
	bh=PHM6qilVc0iZwoOEphKJYaDvjoWJyY418p9srkYM3ck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LVD/IMn/JdVfi9q/uq4QvfFNbZJYb/FevG82U4XM7Hdec+yoKioCICH6NhRNojDf3iIgA8kvntX7h8sU0XsvR6ZFck9xx0wwGL/XxD5EIoR3rYXZzWibF6jwU7sqWgcnCYGa1j27gOWOMUVsyYIuRoG3QEDG+mUJeWrcDOU2238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAoYCzD6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAoYCzD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D1C19423;
	Tue, 31 Mar 2026 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774988989;
	bh=PHM6qilVc0iZwoOEphKJYaDvjoWJyY418p9srkYM3ck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rAoYCzD6XInsoLsMcT3NALHIYIUNmiEVm162x2zDoWPl0gHc+CdHOhU7zK6nuzPrs
	 RB8l4d1nT0UJwFiq/Hc5Xc+PcYuGgHLg+vI/mgyfZotgpQ5lX7/Ea6BvjHP/wU238a
	 MLeT+frN0bKipjStmAgW0FuIu/Ng3dQH1ab+K8JmYTwEyISaaYBD1BtCYokIR2EAM/
	 8rBfzhnpylt5Ucn53IUjY1+sV/v98ZOwnxy7YNJZm3slx0NhqqhZHnPn0Yid0Ds4vw
	 qqagA/K3+un98d1uydEEuwVmfqlubgS3vtJbTIIKoBn5GTpcPAGY3SYNMukkJHp89a
	 /Hnpnm4BZzJzQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
In-Reply-To: <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <87qzp07z5v.ffs@tglx>
 <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Date: Tue, 31 Mar 2026 22:29:46 +0200
Message-ID: <87o6k391z9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 31 2026 at 17:10, Biju Das wrote:
>> From: Thomas Gleixner <tglx@kernel.org>
> Will drop the lock as it is not RMW operation.

Huch?

> +static void rzg2l_clear_nmi_int(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
> +{
> +	u32 bit = BIT(hwirq);
> +	u32 reg;
> +
> +	reg = readl_relaxed(priv->base + NSCR);
> +	if (reg & bit) {
> +		writel_relaxed(reg & ~bit, priv->base + NSCR);
> +		/*
> +		 * Enforce that the posted write is flushed to prevent that the
> +		 * just handled interrupt is raised again.
> +		 */
> +		readl_relaxed(priv->base + NSCR);
> +	}
> +}

How is that not RMW?

I assume that you want to explain that it's not a RMW on a shared
register, right?

Thanks,

        tglx
