Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817348;
	b=cNEaswR4mj5cLNzvdu9E1tXsNrFxfEQAcVi0VU8N93WSC9/6ShVtwEylpcxNCjAwh1te
	 SZcrahOS2eBUozZqYv2bJu5yT5zXHay1T4i8Yx8qK/n5nGDS0Utpu3nvGpIX+LqJzKiFI
	 Tmm/qd13K/3LMc2jSTA0mGG+yeBlCVrgCKjxxPAgU3MNrC7laE6Qi/r6wNMLZ0HJcA0GM
	 GxTdhCrnNceZIaWz7xXVT9hELysnQr7chCXZSCv7foeIQXWggoWvyHolRJ6Wnb/b2IQpm
	 rEdo+B1h39wxLOk9FNTAYd4Qq4+Ofqc4xG6YGTgwSFjvURuykHImDfO7dfAoRMDjZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817348;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6zLq5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=;
	b=cp6Qb8dsyxwcujVhTEsI/2eJpZ4Y6mPw/n4WIMbNr/+YOX9X4og5o9pYmvXa+XTsBokX
	 bmlE1Q0AKH+OHaGMmj2nb4JK63NbwYZRTImhkq7QcRGLbGi82EiSWqV4deGzSiwVWNY+s
	 V90ptuWOYVzey4BoAh7J3adNjvH4wfOx9gZVOx5OIseiibqcVLS3jRvG8EYPEGxxDvtlN
	 QsAKCqXNzxGCCFAN8ieh8WSxLl9i108h0QRe3TUrQlkfbuQHWNVihLtpiVEf3wDIJXJxN
	 0kjpcNTElESveGyKLcNZgb08ZnsaCFQRxk2xyRHQkhEes7xJDPVSzfMrt4Jy02jKIyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="kY/1Xfsr";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02478606A331
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02478606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kY/1Xfsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6zLq
	5fm3OmZRvOt3lyD6r9AW3NWjUqASxeSxrYrs2BI=; b=kY/1XfsrFQOr3WDOyqw+
	BL+DpZczzezRMyxqyf9OH83LcdouDCP1xAlUsADWy3VQQ05SwrYUo1ADp/Go6AFA
	VBgRXaVE+2xBIrpsXOwRn3GGMn86wHIhKSV1f8JpfsgoZX0tDqpUkQSjDaktOYPd
	IfqOVQLe4VSglZ27RfzoTwI/fu8lnfxcRBEPDC3RXAm0ZhD1vG60GDjUdPy5sSxb
	S1uDmBwnEUWdtvDPNUH+JpM5NLAc+3T9T/GDLGmDfcYJe2QntA1c++ddmIV49kbd
	LqYdLHiHnoldnzqrQrLTFjBYRspF54oVVay4gUsDPExcbnXW+qh7uFHZmiIUBobE
	uQ==
Received: (qmail 1194710 invoked from network); 16 Nov 2026 09:22:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:22:24 +0100
X-UD-Smtp-Session: l3s3148p1@jrU8emBg4qoujnv5
Date: Mon, 16 Nov 2026 09:22:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/8] reset: Extract __reset_control_get_from_provider()
Message-ID: <avq9QEAGR-C0EZuR@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>

On Fri, Oct 16, 2026 at 05:55:42PM +0200, Geert Uytterhoeven wrote:
> Extract the code to create a reset_control structure from a given
> provider into its own function, so it can be reused later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

