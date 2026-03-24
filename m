Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571635C1A1;
	Tue, 24 Mar 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343842; cv=none; b=LLVf7HJ5c7LXO/M9yvkf5D/gQL2wLxffNrUGQ5A1xi73g2WuL7E1Fhaqv+73E0P8svHWJowPJta99R9tWBcUObc0Er1xYls2pX0b/U5bUurQIwL7xqlwMnUE0rDMbvZzySZx7lcpPr4eA9melwGJhpkNQuTf3uhFEBm3agD9lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343842; c=relaxed/simple;
	bh=cV7PXfmrxmLcVjKof3XYRFXjW8AtEWzy6Da9eHYlAaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hn7TnaKfE1BLN6cPH2UAeZQqgCXLDFhoQr2jBuzKGtWx89URetXXVKmXIEQJ24Wa43RlBcRkFT2Fh6GfZkRAcJL7f6OfhPqcldi5R+tkssTMaZHxJVv9F3Gu4VRwz26Ao/bAAkz/8UbX+Ebn5MmCfhSSoHFU6gpwCqEjSiBuIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DpaZp5q0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DpaZp5q0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08F4A1A2FBD;
	Tue, 24 Mar 2026 09:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEC076011D;
	Tue, 24 Mar 2026 09:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD50910451116;
	Tue, 24 Mar 2026 10:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774343832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BHr9PdVOTllydeZaE1ifeiHaaJ9aVptu2pB5+NjGvtI=;
	b=DpaZp5q02KyO9ERHly+i7WQ/zatgPecrFTcY4+CDACZgRlEsPCgy2FR4oRdUg2rnqDGi7E
	4WTni88R8PcYKSGgqR1sg3l3q7SvMA0GmWt2OXrhrHLwLdigxjrtAlnBjyHsZtL4pOdzvc
	GfbFIeADpRMCrUliPbnbBZd25fFN+llKcVfigpR54M0xIpNyepyPcLBIMfXbgV+NkjAylJ
	82AIFDGQKDtlA6IkRmacJ6qcGgRzcJVv/fbGcHRpnC0eFAWGkVrJAtn7YdKYR54IA6YC6f
	A08NeQNGO8csqcdFpz223aawrkHDiNve4Nk/PuzvFykr+yR0GjtGS3Pzi6WmVA==
Date: Tue, 24 Mar 2026 10:17:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <20260324101707.7d1011cf@bootlin.com>
In-Reply-To: <abEotS0ZbGwqEmO5@ninjato>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
	<abEotS0ZbGwqEmO5@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Wed, 11 Mar 2026 09:32:53 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric) wrote:
> > When checking dts involving the r9a06g032.dtsi file, the following kind
> > of warnings are reported:
> >    Missing property '#address-cells' in node xxx, using 0 as fallback
> > 
> > Indeed, #address-cells is not present in the GIC interrupt controller
> > node.
> > 
> > Fix it adding the missing property.
> > 
> > No functional change.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I like Krzysztof's explanation "Value '0' is correct because GIC
> interrupt controller does not have children." Maybe it can be added to
> the commit message?
> 

I will update the commit log on the v2 iteration.

Should I keep your reviewed-by tag for this v2. Indeed, you don't have seen
yet the new commit log :)

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
