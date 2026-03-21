Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51D316192
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774073366; cv=none; b=WydxfF9Pof3t1NQgNJRAsPjXBbyMOBtYC9wv7vQ0IDfWTU+X0MOhHDEDVInh3liPRh5d2qZS7dL/LN6gxkbdgOd1shxRcOYI3bN5BQZJugaW7lJvya3um0Amg/nG/dWoraoN/+RLL1n/3RZKvZVm7sCFp4DuNdMYWLYLwc4qTgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774073366; c=relaxed/simple;
	bh=pbTYppHZrautnSJvAY6/Xio2GoDuVyueigQEZWiKDKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBhZV27gRoZbNMJvB7H/V1+92xYybGWJH2rJFdYVhTTYtWZkCTMMwVlSQUr/rkkaO29sln8xG4Z2YNJQTLeXXe2l/1zXQ971TVuLZTkaDLICaXq9NXuYIMl13llyy+47Zc9gCyCji4JM5jYmo7S0ilaQebz6lefPKNMj4xTLnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg5WcoTw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg5WcoTw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358dd7f79so215816466b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774073364; x=1774678164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=Jg5WcoTwOoo5NOE32yZppbMlZN/289I9Xxe9BNAuZ7VeX5yad26YZiwnKdt8QRlWCj
         71hn7ftPC8AERk+hZRFQTxWWh8YD4c7KaOeRKtpgNKdyOSWmqZ7O3wxyo3ALdU46pNpR
         fVsZPeSEBeMDtCUtBF7sWM/TDaQIOs29DSU3QuRkmFfLoTQDPzm3Ls7zvay0iLdy+Am5
         +4FPFH+ZI7uygo+qeNBLhlRvvEEXumXkAQmXQxzt/TY9BfA8wiJd7nTcXFJ2trjOYPXr
         s7ElzbufrJnNxRzme2IBS8/oQKDsLhsohH43Sk46fecYndyGk/Tl7ShROv2uNeFqkqGl
         Lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774073364; x=1774678164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=dkN2iODBlfFeWNEpdNcUTX07UN6YdvsCM8uALVPZzdbRy2PiTIS5S6dxNcwhufWnO4
         8AA09QLLwAmGrogdGwfSnngUUHisSZ8H3XCP4ZNn4FRQ4pvR8kCJLYJFtQ9JRsl68fVV
         COkJYu7IxkbeUe5wlCSOHLm5tuzOLc7lcb1C+OsLot5ysK8kQqP1T3lGfQhibiGOQG8U
         HauPulFrmn8YsrtOCwaabi4iZmtaddHQYhNyMyvnPDMrJobIrNivJ7z5ZQDSldq202ve
         onyfd8441hyAACOcae3MzedZgrQTrQJorsIkcPjoCjFI+jHwKgV3uJl6LnpFDW5mEfL/
         j6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs2QjKhN3qAGkiDoTBfXmOflfF00PuNC28/gfYCWgNrssP8QR7mIrXOxv7QGGoGcvSnmxNLU/xOyi5lgl/W3r5qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztA32LYjsnCfpJ8HAXfX33kg/rqxWaAaYq1SU1mceBGY1tkp+V
	It5bax3dUpZybtwA3u8ZHVb7YGt30oinlHoO7SsGM4nJUWhk9SrrB6BM
X-Gm-Gg: ATEYQzwpP+oHQ93/nVZYJwMzOK/Pm3EWocNdpmdry+XonoVZ8fWi3m+027/xddLX4Ih
	LDb1RLEgrqPTy47cjZnfx51veX1+z4o0sT3sTuFQsKjmVVEAHQGFyjZO4RZg38DDCyHxAjtTVWE
	pYYFf3ccQn+DMZHGanmGgqFHMX+t8pTQzZM1I5mqBh3tyLl3R2KUxT3mGQodKb24STbCfBOYgA1
	oWL+1Uqo/vQqIrnLtlM/Jyq3BXfoWqqBKMHEk0ZFJKt5tFrgLfuPRWqG+fiT0V5YiWG8a3m7tnO
	z1ZrDpaRF0Ks68pWxVosf9dnlG5TRerGBFue/JSmKyF5fcihnski2pEm7zV8c14jtjWla18m6N5
	0/IqXaa8q/S8rmcKiu/5GaRtctI1uxUlG8M+gYazgKnYXht53NwByyodwU0g+d0FZRyaVCSZkP4
	2/rMf1qZbAfrl9Y02/KROCvuaJNOFYPNkfne4=
X-Received: by 2002:a17:907:394:b0:b97:7157:e1d8 with SMTP id a640c23a62f3a-b982f362ce4mr278337366b.31.1774073363501;
        Fri, 20 Mar 2026 23:09:23 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm241345266b.14.2026.03.20.23.09.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 23:09:22 -0700 (PDT)
Date: Sat, 21 Mar 2026 07:09:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <20260321070919.1687f991.michal.pecio@gmail.com>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Mar 2026 09:49:32 +0100, Neil Armstrong wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to
> start up.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..8b8be572c930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 supports up to two downstream ports, while UPD720201
> +  supports up to four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014

Hi,

AFAIK that's the ID of uPD720201, while uPD720202 is 0015.
At least that's the case with mine and what hwdata says.

Regards,
Michal
