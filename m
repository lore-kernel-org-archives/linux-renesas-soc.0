Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FE283FC8;
	Mon, 26 Jan 2026 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443434; cv=none; b=hNi30N8OSoAg7/+URw69ZDz6s7gbgGCQXVmknjv8rC+iCZXcpcRBer3RbbUl9khBbodx9GPV87p6Icwpw2qV0fJjUf8lX5AxvRuSdPuhazkA3GdPmDVPnW3D/R5nk5VUh8U1l3q3HgxYDOihLvJeH5o0NHsCI0mowDVGXIu0I38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443434; c=relaxed/simple;
	bh=FpkYSUlhwypA+1UQimPBHuxwZJXwE1bM1io97K0VklU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FFkH9efmD2AvQpTdO72rBK6Lsinbz0l18JKkjCM5V/awSlFsST7StcSZS67BlKroT7xYOYhh67ugEYxES9nsxSVAaHY63mFjQktMHWei9rUY3F1cczB+hGsE3IjHLR1a3B3sxGFcGJ5BVNcJF1fL8GQUiMEpitmB+Wg0irvmHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWBD1KSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWBD1KSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E8EC116C6;
	Mon, 26 Jan 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443433;
	bh=FpkYSUlhwypA+1UQimPBHuxwZJXwE1bM1io97K0VklU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tWBD1KSIFhrD9ELKNPZPt5poIYIEL9CBNObQiGya81XhQf3ea9LDLEIOk2VnPx45M
	 vLgdRFEDbC/ZMA3cU5l/o9xuSN2CgYv8aShcZZhkaQL/MwdJtamuw8S1cdxoiV9rTh
	 JzADJ2UN3DCt06N34bLLKPwCEkJatoaYYjyVaTvwgh6vAYVEtfqa5UXdpZSc5xe2jc
	 LelokymI0Yp3LpR2j7wLBYhMT8axZeynO3UL1ZiwbQ0EFGb7ApjaEW926V4AYPIKT5
	 //5nzVXJgp0NV02X8sIPrcGxUdSN3iSgkszjH0VppFpS/hiAOieph8BiPQ2JyUy25y
	 WPCy6QWVtt+BQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt
 support
In-Reply-To: <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 26 Jan 2026 17:03:49 +0100
Message-ID: <87cy2wcqe2.ffs@tglx>
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
> The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)
> that allows software to explicitly assert interrupts toward individual
> CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> interrupt.
>
> Introduce a debug mechanism to trigger software interrupts on individual
> Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> explicitly enabled.

Can't you reuse/extend the existing mechanism provided by
CONFIG_GENERIC_IRQ_INJECTION (irq_inject_interrupt(), irq_debug_write())
instead of implementing yet another ad hoc debugfs magic?

Thanks,

        tglx
       
