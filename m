Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0343D503;
	Mon, 20 Jul 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566703; cv=none; b=NKpLjjK4EkTtNhdhXg9pouUzH/UnoRPBDEMJYVIKtxN5ebGHIvhO0l+JxupU4YAfyeqRhv+kFeKoLoFy3rMcK+t/3+XgML3Z1ma+/lQrlbKDl1CjblsrmdLKhUDaKxXNIYRL0HfzKpE2swhmypyogcGQazd0BFgk9r38K+IQe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566703; c=relaxed/simple;
	bh=DdmxZ66xIzy74nsGGNFeaM4uX8yKF4msxlcR4aCn9rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQjg09T8V6lVg/5eTbcs8A1r7iUdqK2jlo6HjU3sEqfS/m/+GqpbV5YZ+FnGZQBviXE912DU0dNyM4GSG/p7KgL/nP3w/SQvaBG0BwNUABbgC0IH1BTLUl7/gWQBrP9RUmDQMBRwv2MD0PrhfelH5W5sGFvB76jXw+u4VIsRYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tjIUQFfV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tjIUQFfV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38B784E40E81;
	Mon, 20 Jul 2026 16:58:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E94CF60360;
	Mon, 20 Jul 2026 16:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ECFA11BD0382;
	Mon, 20 Jul 2026 18:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784566698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sM+P+g2RTd8f5vSNfAYp/vj7YrmNsi1RTFZr1XYHay8=;
	b=tjIUQFfVlf1XM2KB/X8YEK3dkAQcDmVLD/Lo4EWqOC4cAit5gx10whyi58KvI4lL5B2E6S
	8jSSPLrfvF0Oo5aTQyLcswoJxjckaIy8QlIBPvL0RXYqglUmTWeNOijqB8Des9CImEj6oR
	Dq9Gq9pI1NaTACOHjC+DcGcNvdxzcADRhmqneZpHmF5mYdt6t9svl5jDprS27osp2SpFsI
	vqpTgLlck1bkRh5kTtH1ykDHTbvXRjey+XtQYw3gBkHJIiYA0Pc50TPJmtnChAvS2ehFlX
	9lAki/Bh3LnqjosHrijDZRNBZUdyrGxJT1/oiHtrQccZuJiCdHn7dS7CwCB4Cg==
Date: Mon, 20 Jul 2026 18:58:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	Frank.Li@nxp.com, p.zabel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/17] i3c: renesas: Suspend to RAM with power loss
 and runtime PM
Message-ID: <178456664247.96603.6566796474828485543.b4-ty@b4>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 13 Jul 2026 16:05:28 +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adjusts the suspend to RAM code to handle cases where power
> to the connected devices is lost during suspend to RAM. The fixes
> included in this series are required for that support.
> 
> [...]

Applied, thanks!

[01/17] i3c: renesas: Check that the transfer is valid before accessing it
        https://git.kernel.org/i3c/c/1035bddb16e4
[02/17] i3c: renesas: Restore STDBR and EXTBR registers on resume
        https://git.kernel.org/i3c/c/c348fb87708e
[03/17] i3c: renesas: Follow the reset deassert order used in probe
        https://git.kernel.org/i3c/c/dfc95b9e78bc
[04/17] i3c: renesas: Reconfigure the DATBAS register on re-attach
        https://git.kernel.org/i3c/c/55316fb0ea3b
[05/17] i3c: renesas: Reset the controller on resume
        https://git.kernel.org/i3c/c/49ed0b2a3c63
[06/17] i3c: renesas: Perform Dynamic Address Assignment on resume
        https://git.kernel.org/i3c/c/afe7fbb3f652
[07/17] i3c: renesas: Clean DATBAS register on detach
        https://git.kernel.org/i3c/c/86f65337c636
[08/17] i3c: renesas: Fix out-of-bounds access for newdevs mask
        https://git.kernel.org/i3c/c/f7d9e0bee840
[09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
        https://git.kernel.org/i3c/c/12306f6710ae
[10/17] i3c: renesas: Return immediately if there is no transfer
        https://git.kernel.org/i3c/c/3b3a1f1778e8
[11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
        https://git.kernel.org/i3c/c/436c6afd8d5d
[12/17] i3c: renesas: Drop the explicit memset() call
        https://git.kernel.org/i3c/c/84dc0f87a62c
[13/17] i3c: renesas: Update HW registers after SW computations are done
        https://git.kernel.org/i3c/c/1a22e87cf3b9
[14/17] i3c: renesas: Organize structures to avoid unnecessary padding
        https://git.kernel.org/i3c/c/a0957ae127f6
[15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
        https://git.kernel.org/i3c/c/9d1730ad7888
[16/17] i3c: renesas: Drop unnecessary tab
        https://git.kernel.org/i3c/c/070d0ef61c08
[17/17] i3c: renesas: Add runtime PM support
        https://git.kernel.org/i3c/c/4995ae05e8e1

Best regards,
