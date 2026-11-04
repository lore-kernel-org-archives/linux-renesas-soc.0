Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781126;
	b=Q5u3D5G+gb5aAGob/wEqqUFhc2Uqp8ymoB0GxcKJiytPCkoPAST5ijEu3J4fvOn6XAFE
	 IHIiAmSVvGgjqMSlebpqDqCcGy4fvZLSkMYc0rEOvIejourtqsCvNelhfWewDbrl4bch2
	 o+EUFxCTnpTe6JPAEAdHmASaSPrp+gAvdp3syCkFRJ5F/6ALndeU4Goom4M9hWcau7FeL
	 sxdwvimq2LmGjrlQVapp2XBsQzp1ha/RcHPMOaOzfiBRG6g8j0CzO9FM2a9euLWLVajkw
	 /kAPwbzGaeUms5d/gqTY3uyeDc1wjW0zDXzecNF+MALOyfdtGRiEhXhcOoLIwQqgMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781126;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
	b=F39D/XduQKxO3kMkhPSNm+Dr8K4QMU8qqyMH2qnIuJg9rp3IiRH4ue4ysGW1gd+AD/IW
	 eqLzYLQWNO9fe/x6VGU1R77AIoCI9bgCs2b0aRILeoryb64cAhUTAinNDOBocGtNi7ms6
	 3OhAY8I8qddyr6e3aIFj/w92HJpiR5/26bI3oJubX3zsiPc/o6M4NdpJMWo7kkX/ZyQka
	 Qmt6WvccGILuVW8+qT5xUAtIcjWzhKTC+qNrCfSz4jULXu4xyopZrjZglfZE63su5MdCR
	 gOmPvsCoqh3hmWu2HI4VwA+yfwRQOPy1ANeckw/CqqwHH9TdxYt5MH1ZIwjdpXOiRrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFCF606A335
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 08:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFCF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1099559137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 00:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781125; x=1794385925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
        b=rINKXFVm5cXkOw4psVFpSdjnW1bhq1ddbDRMti7G41b93PyWtXhnW/jh7uwpMM8CJm
         HWVRAHM1AzFo+6uXIQoqyxg4KNEKJ6i28Na9NsgN4KL7frbMv4jL/AIBNmJWD3JScwK0
         FYHCqLbXrJ6h3eO+AaZ4GQ5+ZUI8P3vKUvajWY6XwNl256StXtg1V5WrQTVPSPAY+pB1
         MsDcUk4jVNew/qOUaw03zTCW4vlRf5DgHkctDpTJLuumnfkLlsZSKNARPGfqEjvkJZ8u
         94018dm85l25kiFSwy6OJDHHoFsA1iKO5nlI4WuI+jnejegRLlz4ZH0f6RnmtNpa31WT
         rPjg==
X-Forwarded-Encrypted: i=1; AKwUvBwH6IuBux/S5P6MT0UXu9PeESLwIdJpWTMVOOEvIIQXeNYKEcQgGi4T75Vt6bOFlCZKqINnDSJHNxxacwxdqPO+DQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1XOgNtjd4cU0b0NDKPqv7ekAk8UtN3qW8iJA0ftB/pyJNTPzm
	mS94XexIQsSakkCAI0/9ZZ3U+v/5jjKA8vwUSgEuugAqj338wa3EQu/qn58S6VQq
X-Gm-Gg: AYBFou3gbErupVt0rRTqC7HDZIU4cO5jRRTN2wFxPR0H5nPFnWKWYztKnFPzO1RmAQP
	dxY5CW4TB9e5acohTR791TIfebqXOvNjneXT+RI/E2bagARUy2npAU8iaKQuTONjVmFNpSNCmuG
	xA5ulQFLnomiqNvujzd1y+ahNZMfPCoXtiIv5c0uERXcSO9gJvIGnT4YlGIk3U9tUBOZGZcGZ31
	dyeoyg0IbYw9saoXAFAK5RtqaQZjsfKY9fH3D86nbl4i+F5EPuJpCPlNvJvcsIrgkGZVMWA3WFq
	/7mIAvn8sYhNochBdj+G5aG/jgIUBeIVSLKfReaP14F6L9k+5jgydQRoNL9Xe7WJrkSbvqjJ/qr
	L0bHY3gi9botGX1HpkSPp1WdhEDxD8mY07MNswxQPLtVuwfh8tWLQEHycMmYnROduWK0cYZhvUx
	Qiip4bvdMmdmxGtO0iaIadj0YxjBtBlPe9h1q/kRjIvyGu7uTMMPnRpypMP0tasEM9XRjZ5rWvh
	w72tI5eDWQYhhFgeR8GLLhKMvKCIb1uz3wg28UFn+3Sm6GxZZxOXZByxanwv0wQmc3BAfxb6/e/
	PYFM+uXgAmj8b7vv4rhVDFvHAWj9YBD6Bqs883BwEj1CMDnZL8Mi8tftAepEQypJqA==
X-Received: by 2002:a05:6102:441c:b0:7ba:7a64:5946 with SMTP id ada2fe7eead31-7d054341cb2mr5510020137.35.1793781124604;
        Wed, 04 Nov 2026 00:32:04 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm1323270241.6.2026.11.04.00.32.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:04 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9912c47367cso265013241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 00:32:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwjg9xwYbk8NW6iWWVv2u3qWxXoJCqqDJ8/x2O69vWtOqoJ4aDmJuA2DxLBXgAJD9FkPfdbDda7r3Y8t9GEySCN2g==@vger.kernel.org
X-Received: by 2002:a05:6102:c09:b0:7b2:becd:1179 with SMTP id
 ada2fe7eead31-7d0543be60emr5897841137.44.1793781122974; Wed, 04 Nov 2026
 00:32:02 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:31:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
X-Gm-Features: AclHuK-YthVrpSjlZVBQt5vi6FrwMySVDZUmcMVvViznIkVXiwSHbJqQx6qRLRM
Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Tue, 3 Nov 2026 at 15:52, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.

Now propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
