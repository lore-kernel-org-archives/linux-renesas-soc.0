Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781041;
	b=uAUTBdxu2Daxgk/R5XPdpPgSTfiX+hkPqKjTkzNj7NmlHhtgxqW8nABNUCj4Ix674DEi
	 IjCGnS/r6ydyrI7PYLP7HtJ176DrXO8VJcF4kkVzO2yDndlmZ8kVSUHE9NiXRKT82yvZd
	 tkhZ74QvMa80796vB8BNS/fmGGurf6+F8UWJ9WuNEfXN95YtEy+Bf+YjRZz94uXxH91yn
	 htVpIguDoBYocjidUrduNOYh3loAyKhX2y7X2c/QENNoLZVFDfGX8fjhJ0IXmNSf5wXDk
	 Ni3XEZbWycvWy7VyS0lSYkiS7kfwA+LTDv/DXvWBts/In7HfziNNjFk1XoenTcmKwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781041;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
	b=QI8lTRpKOTCclC8IrEC5g31L9YY+fXyjTJFl1GJA4Lns+Dz+/LX1OTZRf5ZHOqW2GovG
	 yZuftGLm6u2C094pA9FgOKhzXRAFcnq9cf90V4pG4aqsBN+7DM+i/ch40dBjIgby9gsJN
	 n2F6GH6MjG4WoMij/hYm+5UShz+zsRU8P80JXXKAvcblc45pKuqrKqTOH3xFD0gyoUVpl
	 A23CKHg8GP6gpJ4JUfSC/y6L3qhrbxdDjJg2jlxlQQHwnx9esAxKLU6qwDYjtWAk/ILeM
	 Btg8dGZkAhOCpfcIPOnUCEp3JMAwKSHhCm9NasNShLxvKifSE9e3b+NF9k8dII/A7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C27F606A31B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 08:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C27F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-998569550adso278539241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 00:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781040; x=1794385840;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
        b=glPYMXUlNuKRuc/VPZhqPVMmbQDaiOrBNMLUVZkf1NjziXGVnIj5mXSr3En0ducm4V
         OmXCh5CtrHUNtI0ZoremmFwbltXmeoR/O+RnLrVTHrIqhHcrQ3bKW0vBiaAeOnlP9S53
         NVJT0BmFEtuBIBSoOPp7zmCJisyDWi0DLVzHw4mTJdIK7iTpT1+FgARLfC5JhoyG/BQa
         0zzeAvcCuJY1xGq45X6Ga/3wIlroYbAnTN5P8PYqQQV75yEffrQlMcfBXlnwrLaazPli
         ok2s1001f9j/sUHKYf0V3YVm85TFXFhD2zkZhXxs2/50jsaZa8cZU65mJaPQ9YhSIQpc
         KksQ==
X-Forwarded-Encrypted: i=1; AKwUvBw60U/EOsdB4Fk7pDBB11cHutiqia3a41Vc3fX4RpwKJY8Ra8MZuLI9YwMtSPVmQJbRpfdGAIz0df3ftA7pZM7f8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hYzJVE9zggGaqel7BdcskoB/FUeILJqFjTSBeJyiSXZotd3tV
	rvU+WzvGiyefb50NADodEhKN/+AY26yA71xKbsQypC4BgcyOtb+Eplc308DzL0vN
X-Gm-Gg: AYBFou0cpf84w4YUVqo+A3kVm1Kxuz8BeEY2Kgu6t+CpRZLCfKxyLX7GWzo9yisiiGB
	f2mb7Ia4vvH84VUhizzL0Vpa+vVZ2iz9Lmu4N/C4+JVTbscPa8AYlOagd1s858MAwS91rmTrHb0
	it79S0iTTM1Gj9GhbxraKDPmcKcpf2quJ8YaOAXn42JQ3rvos1FIyyrEcRuQgcL2c6yMpocgC1u
	in6a2rG2YoQkYHUOxaVUZRWcSoQdyfcArS4GuJib57qP7j0aWG0frKVdcyYqlCMf4ehUNvA1jIP
	bdWW8VQXMTuicyx0yd250A1ct6FEvmEbu0yvK5otZFmvwbGXF056g//zdCG3tTQimfbx8nDcmxW
	Uup1WDD23wZBLTbkkGVDKC+peTSdUy6uvc9P1cnO8/nVgPX8efNtbgGqhjBBdcL6Y+EnPV0YMtN
	baU/3mfMSsy7dI8M1dYJeDohdBfRPOIaZiwB+57Q9SBzvA1KDyOuSEcoYAuCrhl1trwnSuXTtWE
	2WpEG6/M6PWctExSATjHAAhzdJrF0qZiEtoH52l3xe6F4XaHtbhdVbnJNpJn2CFPotZIVlVOIMH
	2IuMXFUB3zkYq9LvLm/lnixtp3RtEXPANpPy00rm8Ml8kplH7y5GhjzTW9VHe7z4Yg==
X-Received: by 2002:a05:6102:a4e:b0:7cc:80ba:5e5c with SMTP id ada2fe7eead31-7d072bbdd54mr6902057137.6.1793781035261;
        Wed, 04 Nov 2026 00:30:35 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca889381asm1180348e0c.0.2026.11.04.00.30.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:30:34 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso218709137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 00:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxoJhPapbFyXq0HuWPq0qziQpI86u7G2+VmN1V3Y4g1wG2kIuK9erKt00qfPGIIZuLcP9z0k4w/6JyIOH1bWewmEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id
 ada2fe7eead31-7d072d59168mr6120354137.33.1793781034293; Wed, 04 Nov 2026
 00:30:34 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:30:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
X-Gm-Features: AclHuK8USmfzs7i7XtJ90bDmKjuz-weCg5Jo9uiJtfA3Xj-kpN0lb8TQTdngXvE
Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
Subject: Re: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
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

On Tue, 3 Nov 2026 at 15:53, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify mpfs_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.

and propagates errors.

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
