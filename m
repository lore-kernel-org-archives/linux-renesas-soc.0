Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E13515D5;
	Sat,  8 Aug 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194786; cv=none; b=BfeVnT/QhHOpkVYSw2O3qUOxdMOe8+6ugjqsQ/zimOtLnRaDF/8TPRzKA1XvcZgG4r42N6m9rbDI7bLf28fCcatvHMwi4Zj/lL7CxU7evyKiziOlDcCjF80A+37b/PDnhAxN6OjzXFTgRCqxF9qNnKZIaJNGNDifHEATzcnxSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194786; c=relaxed/simple;
	bh=cMkYLyPA+n0iDj2f6Ul1ZZ3hq/3BHIBZ6bBrf/GJqYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXHMH+nsFPjM5rrb01cgJv/Wp+pyXqDm+IrJy+zUn6veTSVp4pFwwTI97LQ8MFjExrCvbEx8QB29RDL5gOF12mUkJWhevZEulK9HdBL374v+gj98ZJTwf0N53r7jjisNRxdY1bzP7s0xNvQ+98dvkXyoEgzAzgBKS2M1htJCVss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=awwd2arI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="awwd2arI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAFB04E4115A;
	Sat,  8 Aug 2026 13:13:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B237E6045E;
	Sat,  8 Aug 2026 13:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 736D911C484B3;
	Sat,  8 Aug 2026 15:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786194779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bfZAzk0HnJSBMWq+kezzbVkR28SVWwNouuhGImysDro=;
	b=awwd2arIp9NVMhEcIaC0Fqugq1bq/CPpTeuRiPhdsKTHIoXycx+gmgIt0dE1mibhNjfFXM
	OBM+6GekqTE6swwDXHOkl21P+w+vRse/2084OdEd0c5velW/+ymBUG6HT7jVeVhnReg4qf
	Y0mLSNJMUNyP1ade9cIQTLyAn4GxiNhtXGIDoXrhIraqjWroYuSPe1IZmkGsP1jwW+wCLO
	JucTilJGA7/1HrAMPIDy+dBjUggGBBQcRE7e/vX9UUtjXMdknEFDQ+uNBdhTjEPGjUvXz7
	H3EMaAJjxoSGGjwtAgof6Kof5DjOUzCNSWJgloCnEp1MFlvHQz0HxOPtrfDjBg==
Date: Sat, 8 Aug 2026 15:12:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tomm.merciai@gmail.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
Message-ID: <178619476971.3722554.9292570008305281170.b4-ty@b4>
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 31 Jul 2026 09:01:46 +0200, Tommaso Merciai wrote:
> renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> from cmd->rx_count, which the response ISR sets to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already means
> "every address was assigned", so a timed out transfer leaves that value
> in place and it gets used as a result.
> 
> On a bus with no target connected the ENTDAA times out and the driver
> registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> the core two seconds on a GETPID that can only time out:
> 
> [...]

Applied, thanks!

[1/1] i3c: renesas: Don't register devices when ENTDAA times out
      https://git.kernel.org/i3c/c/b6e56fd8c8a8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
