Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497293;
	b=IR1iyNzKcCjloF1Iy2XLuBStb61g5ajTNccVqxwe8ZGyAThq0iN5hzMQ57/c6KZ6t92b
	 RVTVv8uLkwsA5EvYIUbFlbZPXKG9wdZl7iFCuk/4jOBv2sWXA2Yb/r7o5sxEngUyvOrlm
	 jWFtNTA55INF7daBDRRIkeAcgLFe2Zpyk+x3YBmu+DpK3CkBSHSl+awlolsoxgGXCK9PM
	 VAwAMy12YqRTcaQ1yvOHIUVBbkDv9LnPEIWwrWV+pMxxXnRwGJ8a8DNI4wK8AyM8A+C2Z
	 /cg8eNHuo3n3fJ6msC5iZn/hyyV0eMaS+Ho6QM+PEVjYSXfgBb8BZbh/eptwbebM5bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497293;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
	b=jjurjgMDb2JPLNgGfmWlXnHc9eEMOX1hNJdemrQ+kH85ICLBbGTLEOUEfEmKWU8q3K+a
	 K/86eQiJmBeTiLhxp2f+gIuT2Y+EwfPrOnAfzzdI7b/GmRjb9TBK/MiNnh0D93YmZBOkM
	 EFbkd4Fr29KtjA1Djzae09HcIbP++OcfN9jgAx9VPTS1+WQAqUyiETvm2G2ezaK5E1l3o
	 YyE3PXurhbObX7ar1yZ8lUyVCvRRSCcFQUeDu0kmoglxqr4s4DWTJqiiJVrl93MosESTR
	 igK7eaaMAU/buLvmj0OkQKof+tbHk0qPa6TjbOxAf255vBLdjzETN1wPSfT3mTqhclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6D606A31A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 11:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1617583a91.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 04:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497292; x=1793102092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
        b=Rg+u+B8t/uM1jwH27C2qrzLonIkD7ZVDGO+CFqEa1wB0p7yM/Utv9mlCEQVuYTEIzm
         IDX+gSMuD9HSKCQXZUA/JbzwwT0MRykVzsTIbuadwV2uYXdpYuerK9lkq2MajtVrM/JE
         qInAbfTU2is6LDBJOK0loFOGwW376LmCyUHMa+PQvMH2ffIEOJRPH9ngxKiUBkQlgNyd
         c1b6tySrjChUSNgDrIDB/AUwuzuC5kobdbvhuhBe6Lu1DzL4vkm4Hi3lu+Vu8afKZ6pK
         IHFukg0NSYW/A4SMLvO+Te+bF7zeXxXkoN/XkdG/boG4PcY1d/dskH9gXCfYtOUTyNkZ
         rDKA==
X-Forwarded-Encrypted: i=1; AKwUvBzpOn1qKbvxFTVAbc2Lg//zm+mofhln0kd1EWnm79yaujD0P0hh2roETkwv5o9JrrYfdROAjUoQcwNA57SjB2vzFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Y2j2WSk25msVSKJmdPC+oHc+S4ju8at8ASMq4HztnaHGnWVN
	U/XxuilFyaasYSOEzkjaNeOFl4tSr/XQEmL4yg8Sm+MDWNeKok+OdQgBIbNMhw==
X-Gm-Gg: AYBFou1mDfkyLHGz/1eMOStvQpsn18DJTpA2SLA6PKMJpZS2QT8drbcAK/xtvvJliBA
	SynCR8/5/zCozKa6rDHtkkVxoLbztCJ8hOIpZF2BNaxsbhssR6Aml9PXdBPkPjDdUdd/yp4YWH9
	5KJ2/5dm0KeqFuFEOHC4dz0TkW9Rr9BE/X/XXH/qE04qKv6Ql1n7jmbp89wOZ04xcfiKV7Ot/Sc
	v6ZOqqadDaLFmRlQkf7tM07hlyV/fS3Z8NRj6wqsAeGGfGv5HuZ7BkEhjFhrVUQAJjz4xjR7cfI
	UQ2UYDvrvXcEFOgItniv92qAKTFSUvi/3ZSohZCGKErbJNlpYEfdyq3htyy+0LbtbuZbR42MPn7
	9cGmqRMONpiL1qEToPUGnq6p6GzfPMUCevHnprObZsfn6sgXXNIN/BmNF4/fqd008zQzRVqHqIt
	Mqyt9f8B2qD/FOwTLO2sGvJ/bqFVoISxa4fEOMdLpA/bc+bHTzQsyx63l8lrug5cjcbcORI8q9c
	cahN2+9C3ZKzcxeSH+5S7h0F4Gubapli+B8k5E=
X-Received: by 2002:a17:90a:2cc7:b0:3ad:3715:d21 with SMTP id 98e67ed59e1d1-3ad37150e98mr3035184a91.49.1792497291765;
        Tue, 20 Oct 2026 04:54:51 -0700 (PDT)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm4464762a12.14.2026.10.20.04.54.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:54:50 -0700 (PDT)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36681e85e87so487896eec.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 04:54:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzcHe/XIT513II6Mq3Bn3xNnmz6v1qfyiXrn2F7AS/fhe7sitslXqf+iCGW8cK75xZYMCGW21dvk8FhHDK8kHB5Q==@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7cc36a1fdd5mr2439750137.19.1792496853877; Tue, 20 Oct 2026
 04:47:33 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-11-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-11-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 13:47:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
X-Gm-Features: AclHuK-oSwXELoK3ftCuQEMht83trZrqGJxwnNQHzvwYJozTnmt64-x3G5ZnW4o
Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/17] PCI: dwc: Free the MSI domain after the host
 .deinit() callback
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
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

Hi Den-san,

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> dw_pcie_host_deinit() frees the iMSI-RX domain before calling the host
> .deinit() callback. For a core-owned parent interrupt,
> dw_pcie_free_msi() removes the chained handler right before the domain.
> A glue driver that owns the parent interrupt and demultiplexes the MSIs
> itself through dw_handle_msi_irq() can only stop its handler in
> .deinit(), after the domain is gone, so a late interrupt can still
> dispatch into the freed domain.
>
> Remove the domain after .deinit(), in dw_pcie_host_deinit() and in the
> dw_pcie_host_init() unwind. Keep removing the chained handlers of
> core-owned interrupts before .deinit(), which powers the controller
> down. Clear pp->irq_domain when the domain is removed so the unwind can

FTR, this is now pp->msi_irq_domain since commit 8f0b8cc3a655f56b
("PCI: dwc: Rename pp->irq_domain to pp->msi_irq_domain") in pci/next.

> tell whether it exists.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
