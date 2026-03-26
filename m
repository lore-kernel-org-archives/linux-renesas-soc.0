Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679F371061;
	Thu, 26 Mar 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536189; cv=none; b=p9qy14lCh1HOopHdJA9IBXvCcjTu0IKr+UduMPNHYrSipDOSj5BBf/10VjCFGV2TTAdm1LgwAvkZnQQHmTXL5XMJBMZsH+qqKorDn+PFRWpE7l/FexTdMQZNxvzZuA4ebnqoavHStQpccYkYZmNUjflrY/KG7doIjkdO4Wns3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536189; c=relaxed/simple;
	bh=EFCCbeGV7alvkb3enGO4Ab2gph89x/AJS3Ycwvghqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eKV9DX/avXZBOkPEDuK9rv5oL2voh0SzLwotoqGFa7LL1nUrsO5+GrUjB+IhkdBsstxzfxRvt1r3cO0nSh6Q3AuUeo5vlz+HOR2NKyBNZbAOK1o74W7NjMDvQ+U3WNvorBUUPhPr03uHqVma1QWb2aAXbCi01QTsAJYf015kqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBDe3Axd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBDe3Axd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF43CC116C6;
	Thu, 26 Mar 2026 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536189;
	bh=EFCCbeGV7alvkb3enGO4Ab2gph89x/AJS3Ycwvghqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XBDe3AxdecDsWSkEMpG014Xhv12UG9vzJU1vmpHAGY9AMk2zVtVRJzsXoHeQdP8AB
	 MTCDsniYnt34MANY65sKAQFkDdZsAYSMtDApYcefTtib1oe1dnCtqZfgVoOSwNRDku
	 vlxNw8WwksSqTI+EbI60fHUdYYcQJlQM8aL28C7T6ZGRE1GwMck6DPiT5oemFCk10h
	 KMWEdEgNc2FEYWB9H6zDO00eaJX0UDjoT+Zm5jsQSVADpaNkwZ3NhiqFv64bKzbXyT
	 Eota1a9KTe15tPmZkaEWv2QFkniUhALVkdCLn6x3cVqufvJgB/dYv7ka7b4C5us6eN
	 gPQo7CdYtLBDA==
From: Thomas Gleixner <tglx@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
In-Reply-To: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
References: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
Date: Thu, 26 Mar 2026 15:43:01 +0100
Message-ID: <87wlyyd53e.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Mar 06 2026 at 13:13, Geert Uytterhoeven wrote:
> gic_irq_domain_translate() does not check if an interrupt number lies
> within the valid range of the specified interrupt type.  Add these
> checks, and print a warning if the interrupt number is out of range.
>
> This can help flagging incorrectly described Extended SPI and PPI
> interrupts in DT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Marc, any objections or comments?

