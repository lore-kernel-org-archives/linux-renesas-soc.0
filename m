Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625790;
	b=ObRWqO2khD3Vu3bfA6+BkXIqobuLDZwTWBPpfIjf34KdHMHGM8PsdN0125fbReXZQ/nI
	 vQwMUEnZIS52xhVRQEIPY6eQI9w1vcym4Lr4kolu4B76B2vsfUXBs3pR1racyfrhRFTDT
	 Y3DU4sV8dlitKWJ3hZx9fw+tzFO683v5y3KvCbKPqS1HdYyHDKTr4J3OtFEME0Z/sWPw/
	 G4YPdHaLk90ITDCDbPdcKRnadMUQ7653BJwEDDNyLJ9HJfcTa1dLB39FRyHlsnexQjvb0
	 ntdW9qU0pe1/cucX/113pxo2OG27o3U0Amq3MC7bpECRwKK2KsoqsVe5RR2L6c+4Ydw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
	b=i6vbbQnoFWpRNIVMSHqh3mwXYiCUlhZV5PSsiQeZYqtyi1VeO0Oy+TSlnRNX42XMmVfl
	 c+prMFaAQBr9PsuPPnWwjAw2fDpyEjfIZ0zqD/OZ7GHWuCtsOVKrE0n56KQOrPVIHj8/o
	 5k0bLF9QsTz4bb+/+S5NnI3J/KQBjIMKIb9M8dw/UjLsE9+tzrP9xCuuT5Fq08PP8Ec+4
	 /PT4dAciZOvgpsvlXdTEMu5fjTUeY7DWHiwuEpG5glN1Dm/BWkYeNyxKBcd995FjuXaAN
	 bvtpPtyfYbBlFKStQYKmZE6U60RHMQJs4MafS++m3mk3oDGEwRsG4jIpljb/gZktnPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88760606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88760606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5495d549924so64628771cf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 08:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625789; x=1796230589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
        b=omGpnkZ3Za2kIwkrplbp66xvQDi67cKSOwZE6PYvCPWvj85ifXOFPQhIfAG4maX1J3
         4hu/C/WLwVk2qIhElrNYXSwGNAmceAVEyxzLxoVLytwy5rmD5r6WZk9GXVnOG+f3a1BL
         3q09ME9EDtH4SZEl1AmGxjd/RFarCii4Tr97K9U2/NR33Kxi+CRHggyBToIrMLTHktzO
         gF//V/dJ6quC5R4/3rRAxlG4zFrmkEKdKoz7529O3criWnC8ugYDv9EWR7o4Cd+qfs7b
         hp1dd7aOgHjkoBKl4mFDLQ3gk0DHo4C7KVwwRX6WqYrMoEVQe5KzMYiP2kNfkhfEg362
         gOlw==
X-Forwarded-Encrypted: i=1; AL+hErFlNCvV3ijp6zIsWCjZu1iVb8lwTPyjPYqBFZigRgt9FhKzsJhhLHwZbLUY551biL4kx1PvtHgovsbYcd6nwlcs5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9pTpJRpPIpDpaGiAAE/JbVvYl9aOZI3CEQsZKLy97ZuJEdJfdZ
	Rtx2ZdP5v1wlpXIizLD5K4aOcU16Djiwps0qQkjz08rNL14DpoFWItD8baQRh1+O
X-Gm-Gg: AZFdTZca/StWVs82X1AGHoBCPM9g3YQ1u1u43+lVLhAnSrLbytJdwmjMWuk34W2N/Um
	Vx8Iiyl86OeJxkxjBRm6AEjlrOK2zn1RxlyQBCd4rVkBqA7I4HQhjeD3R0kSm8/WUQ9lcDbTyX0
	Aom4pti/ZDP2zFNV9rKBBChKdy8L+bHVBGhu+XH4jlEpvFVwPegj+/mpVeiSMjwwFT4Ap2zI80R
	puLEawTiPVf1YKOBecCWX7ASpJc0cKzpOK/8vB/Jy6TovltwpFlL+nsJkNDmdDlxF5OTin9Eq8J
	2qK1U7c1ayBTQAgmk/JvffQKF+AlHsBUP6Mqc/0CUjajpTXd98mpYWk1dHXtTeKKM5blC6UHRYB
	28xi6csc2rhzjlaYqi/l0DtmK5ZsbAXf39xD1JTmknoOW8MNPHxqorDLuMtJhWVMqB7iILC9zFe
	wckplGLLlAuHqk1dAjdPG6U/up/6FUiUt6+GKq1fyT6KjqGXuTxrXdKkNJNjB9TXUf5Oc/Yi8hV
	/1fR+XpvMK2YLq5hCdOL77hn0Uo3bRih6apNb8DJBAqz4gAAliLOD9L+QGH3ZAztB9c+8Eqy2oV
	ZlqzVXRik2KChDIz9/r6jNJJ6roE7dq2uMvCQwPC8J2LBKxtPLS0eHXjK3ZhW3VQ7xE=
X-Received: by 2002:a05:622a:5595:b0:55d:74e6:294d with SMTP id d75a77b69052e-55d769e153dmr328699271cf.22.1795625789479;
        Wed, 25 Nov 2026 08:56:29 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dbeae112bsm8614191cf.8.2026.11.25.08.56.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:56:29 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso3474266137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHM1y5Rem6YDssRw2zCQVrxia8z6Zv5IRtq7F9c/qnIdyOLhZaumJm+VE2XuD2/ftHr2hVbXaAa1gdRJhL89+VQ+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:578a:b0:7cc:2f04:a078 with SMTP id
 ada2fe7eead31-7d7396c2b24mr10563851137.37.1795625787958; Wed, 25 Nov 2026
 08:56:27 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com> <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 17:56:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
X-Gm-Features: Aa3M54ojpcJtUnDseL85QBstdnKjfhN6BZ1wTiGKwa4bXu6gXK1ydb3RLzGiqBk
Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 20 Nov 2026 at 17:09, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
> +{

> +       edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
> +                              (!priv->ecc_enabled) ? "disabled" : "enabled");

Inverse logic is harder to read.  And we have a helper for that:

    str_enabled_disabled(priv->ecc_enabled)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
