Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56270175A72
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127836; cv=none; b=U+DNmvWq115DmhBgP5yR58FIZXCtm7t5ettQ40TcshrGukpYbqdvzNyoyi9/nNh7GUA7v3GFI1sfR/5NTXPpYlGBXYZESgiAevSjrj2XpEod7F9+QNFootkX1QR7DiHwwlOL6CjA+iatNvxBn6csP9T76H/iX5+pB7Z1mtHfoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127836; c=relaxed/simple;
	bh=KbOH+YbHhiAqOPz09vFQBONBH7tEBUKxYJ9HhEqJqwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kc+JIYJlusXYc/GOh4QBi4CCB7bP82VKGvYtsjAbusDpPTQLOgstmTKJeigj53lv2RyvK/JtiPHMdyHqJHLQL78qVySqG4+IXNzSAhvX4Bm2Ci3qSAIt4eXYPneWjar7DqnlA+l3G8pbPJYfG8NylcqBXj6HOd1br/gYcvzNob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OJkhbBAF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OJkhbBAF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CBA2F1A07B7;
	Mon, 22 Jun 2026 11:30:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94AF0601BB;
	Mon, 22 Jun 2026 11:30:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81F81106C8983;
	Mon, 22 Jun 2026 13:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782127830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W3P5Ln/MO3wnNZa2MTIfoS3nlo80bvMZJcsuLPYyqhg=;
	b=OJkhbBAF6NTnDXf9iKWv5KkCKvzrPNVaWuuI0WqkD/5fWJurJ3efS76+0Rr36QA7H6TPgk
	yyUe5i/RJbbM0TGZmhMD1XcsJ0yfPPunsSIZTqvtKrurL3lMZZosA95AlbyQ1se8wrAHCh
	OuImNr9WluWpjLKyps2ZyBW3DLARPxANEHop35NjcSUmpwIBAE2L8Wzx9gG5XM7VTtmvgF
	7FmZXjD4A6Sl9krnHzcLQ3heDvENJqQiNrl3H1z+IVR0bNs6lgAsCztjua4by+rNM0c26O
	2lPcMqa8l+PmS8wVgGoqLl1DIVDsgaCgs1Gc3z2hi//gnIlXFtUgEliAF29M9w==
Date: Mon, 22 Jun 2026 13:30:27 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: renesas: r9a06g032: Describe SPI
 controllers
Message-ID: <20260622133027.03106308@bootlin.com>
In-Reply-To: <20260615125355.116027-2-wsa+renesas@sang-engineering.com>
References: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
	<20260615125355.116027-2-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Mon, 15 Jun 2026 14:53:53 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
> 4 can only be controllers, the latter 2 can only be targets. DMA nodes
> are not added yet because DMA needs some extra code in the drivers and
> cannot be tested yet. Basic FIFO mode works reliably, though.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * dropped spi-max-freq because it is a board property (Thanks, Geert!)
> * use 'spi-slave' and 'addr-cells' = 0 and dropped 'num-cs' for targets
>   (Thanks, Geert!)
> * moved 'status' to last position in the node
> 
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 

Tested ok on my custom RZ/N1 board.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
