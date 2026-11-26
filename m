Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698645;
	b=m76oZwnkTgxGnL/nTMthhwm4fiTRuz27B5QrR/LRBbOQJG7gl3wS6K6P0sgGhgI3K4DS
	 9METqLkqUP0Xk6S+nFxw1Z0E399YYfO6U8TEnuwxHDmuFfbadPINPh9Rfh6DiQNKfUP6L
	 D8Y2/k0S7zQ8pjyhTf90/58CJxogjGHSeXZV8OzcDp7cHoyrk5XVa0O2rw0NB9pLLq6Xn
	 bEqxRJGiwzOW0dV3ZZYQ79zaMjJzq85yE/q1gknL75pMQCsRbeqjfqQ2FaP4Q+8+qG4hl
	 NRXe9VHTK9gdPrgxjHwJXEiBBodJ+zD57GFcS0ruIMXRsZj7NSKO10e2yfICElp2L3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698645;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
	b=iqMjMv9I9/28JRVP5pcR71ZbCJkVc5F7p/Vcu7BkGlt9dSt9ej036f4Foup5fpA/FGg2
	 MTtgxD2asjgWV1S4r3ywgh7ViQERuSe5GBiT3gK1Ho/pGwdR4F5O4XPRCdnvgX9qSJVck
	 ILPZIZQrLKF7tWLreqIVIKUS+hnvlpjKip4lhv+HIY0OdU784sePWF68f1rX0JAbSE0j2
	 pLM+k7s/d2SS0zCwUgTsF83bpGFdHk4pOA0OSx3xCQJAfHQr1TzBTkD472sfADcGI1dc/
	 jeM6LRbes8BXsNwFmd0t4Tkse1RtPyNZK01RGjG9zAXdPhaIuOx4n0CABXSv239ym7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C270606A31C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C270606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so2238885137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698644; x=1796303444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
        b=sfYtF3CUSxwUuMZYwbx/NrItF77iSkcBUlj6xUiR0+t80988aXMgZYqQbcgi16MWbp
         3w3vrRPXWnO1NBaFmr058yUf6Xz0Vjjcul1FeCiRM+AeIOdN3VQL9VHNl3JvwA3Mszx2
         AkjKvAi0rPcx3EuS6sVpNwiIXK2BXmn2WMhmOd4dTcDzsJreODd97nKT11M2AJfNf5Ne
         vUrB8I7EqyVytTnO9WKOhL/V/Cyx5SVYLf3KhVtEnBEoxeOta7aHFvR5d8D0SyLTbBsS
         dUQE+fcN4UW4Pvi2U5cS0DpEJUcbSvPZHjT/ofzda5v4YIWvdN1sCtqlm+SkoPebJR1p
         vGKA==
X-Forwarded-Encrypted: i=1; AL+hErGcIoxCWDQlrCINnkxKPDDS6NDmTarDZ03S5hLvbet32yQ5gFS4rMmr1CMfIEenjt9zKra9h6LoUHGasXsZMRPFCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gE9ncFVYQlmmUb4BAi3D0mzOjqdrayKksW5QWIEFSyA8G8/Jr
	ikdUZpb6z3C0Zn7yXIs1uVrPpwE+0b8M/ReaZ0JZ1CkLkrpAlALyMsOwm0ucGVh9
X-Gm-Gg: AZFdTZeMbssCqwiH2e9VRF2OOI1+l4TuikC8mtw/WS42l0ew1CGNckkiebNUgQKSv4H
	CQXMuQoGmbZ2TbvjgU0LWgg4MDMfqLUaECtzKin906kkJir/rUbmdQkau/Uki25Kj/L8cPokxKu
	ivnITemGKoFYPFYSynudcslS+A7Aould5g0TMCyfxAAjwL5YoebZlDc7GYtgLyheH7AZKuniUyB
	xtPUBpy70OHjbRfbhiWGrg2/6psCs+Tc0Qhi/OJChNxVG44m5T7ZVY3eLmtdnCFiAL0sAB+nLHY
	Uf3WbYkk7BJlx1Yiz9J8Hgv/lnluQGZfjaMiKncQbqoRKs3yiB+7hPwQjiNHacS++BJHSBCyh8C
	G2vzqr5zwf25e0bFf9nHznPyJSctIXFwqG7F8PZ8Ow7L6mj36w+8jLn1u1vshDp6KHxVIBMzWEi
	8ifof+nsX9QZGY77OxQR/Dg3F/CFOwGnHzT1ebKqlTzsN9ri2xHxcRlWA4FZ9H+l6Alg4O652UL
	9rm+zB5zOspvaq+asvIDMymWtTXvCkBVJ308FazL+J+tJDws4zX5UJGpeV1OVTeTkrgKyK6taOT
	fWiqzjRepf7+Uy2aAEZkB1/+/IAj+zYa2txUq99Bp3zW5JcLyMuhTua0+ydOvyXdr3vQtGA=
X-Received: by 2002:a05:6102:84c8:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d7396a6e4dmr7553774137.33.1795698644368;
        Thu, 26 Nov 2026 05:10:44 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm21640745137.2.2026.11.26.05.10.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:10:44 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso2530863e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:10:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFYEmrJKpB2i2sHbGB2imG7+nd690Wj+Zo3RnQRgQ8wds61wh5329ConRzOdN6HEgJWUYheUqewMgxDV3//VtTaKg==@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id
 71dfb90a1353d-5ee8af79c4emr10201505e0c.23.1795698643771; Thu, 26 Nov 2026
 05:10:43 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-18-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-18-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
X-Gm-Features: Aa3M54pKW-6JgYTYZWdXwvcVTMAw8E4E5W6RppZyD7aVJ1bsffJTTTgDbIyWkEQ
Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] arm64: dts: renesas: r8a779h0: Describe the PCIe
 AER interrupt
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controller reports Root Port AER notifications through SPI 454,
> separately from the integrated MSI receiver interrupt. Describe this
> interrupt with the "aer" name so the controller driver can use it for
> Root Port error reporting.
>
> Append the new interrupt to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
