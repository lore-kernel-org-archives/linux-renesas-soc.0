Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91531353EDF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206983; cv=none; b=j3sskub51nraTfOKq4151KYIFheqTgYGvPGZCVlWe48Ax05AC6NMxhKpBzqfxcbxDi4y+g61eEzULmyPg4IE78d6CHPbgo2cmQPz6/qpHN0jHw7hT7lpS68q6uH1A+DcF9iQgq8MtvN4kSlq5cH+d97UUJCM9EMjudHZgdmplXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206983; c=relaxed/simple;
	bh=cP8YSmhgi1YuGHKrhpk8W7JVu/It1uzDhcipHOHidYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wwtca3ROETGiMBvVs9UWRo3ecHbV8S3lgp10NXbDPno1kNN6s6nG3xPznBIeHx2KkKvjy+1UqPPfAtvHNTpDj+k7F6/PPa9z8G44Z0GboFz+bwFUTDBISCVqF6WWonoOhQAQKBEUd66ND5ikeMaNsTEEw9rUwyAGuH/Jt2wgwVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1088241241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206981; x=1775811781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeTldaeFKLb1jw+lVjLCkjUpuPTt3MmHsJN8YKLGAfM=;
        b=IhrINub8XBcIsIjjld6iCoGT0wCglZ/XYzqooDRlDtPeblQyW7Ba/NiKMAbv0xdaQ7
         xyGcspWHBqLOG7fywR3Yyi0KhtdO2weuHmlqogDBzeUB52pd6Nn7x4YmRc/CAqo/UlWo
         Hc3NIxYGeHUMPgI+YpEm4R9627LecgzUOE9skdOdX1YHnyEQuW++a6agg3opA8/nq01u
         jXlGDWGmVln51Nt3phTR06qyOTlaxxQMLLsv6RHpbbv7bRT0M/KpmBWFSLmL3QQGMyve
         pEVlI95u4AY1GapAJ90hAR6Il9VFtcEc3SyfUtrIN2QF1Gv5D5fxkLMqWOV/Sd+gebie
         w0CA==
X-Forwarded-Encrypted: i=1; AJvYcCU4RjIRfJbtQtnvr96vDW/6TBkzVe2C7hSyFOZv/QltZ3VT2i3BPYwljvvMzbdQDFCa6uiczxDAR9FUF9NyI7Dvhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHmQsL97C1BaV5LC8si8G9Uu4XsniZ41yPhn9bQrVpvouXoFg
	MSw7MD/NNh/eWWpXgZgt/x4ySmAV66Rbx0Wa6EIS4g6s0yxk+Cwk0vxYgXYX0xV6
X-Gm-Gg: AeBDiessMdECTApCgxl6Hi4SnXMXWfecHZTNjEJ4xzsutU/Tbab8acdvjljiUsDjtdi
	qosC4rC0G3XEMQiZVUrgN5mJlhqnJWcupfR33uXCxifrYP+LeROdtfCTnSlE1sVTMB6uIOOPJ0m
	4YlnaZ0qBHgaVvZuMUsj3W0p1zX1GG4ceV4VDy2Ou4XDnqrKYUS4O1N1Wl5YskbQ0U/iSaCwCBP
	cl905TeU9kH1pYg8H2FHm2CPGzKGVGH9oOS1Rg2h5FcVO6724XNiiycNEb+XectEi7F4cseAeE9
	a9TlAnRV/aswEKokik6uFTs0DN+K/QakzMZzo/ZmbR0x3iVWn4Qkp3sm/6AIjAy2tGGXDuBlmiY
	nAvBJPlQ6ENY+J+DCPYqmjkk+kdqoqd+1jHWw/OCq0TAIO61FXPlQtbVt4eyLhld4aM3sSVSp+T
	wPW68ceJTd8lK8nFA94JeUy9CjOufpVXnf6GpZainDZ5MIN1jLV2MeQsFn003W72Oqy86ZV0o=
X-Received: by 2002:a05:6102:f9a:b0:604:f29d:84be with SMTP id ada2fe7eead31-605a4d335fbmr781654137.3.1775206981304;
        Fri, 03 Apr 2026 02:03:01 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm6854996137.1.2026.04.03.02.03.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:00 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso1054087241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWK7wd0FDa3acVgqxR2aCLscbucWDLRhjBrMe5ByDcMlEjfPaDbSzPFruhw1tEj0f2XmN8xArRtV5c1dlZFkogew==@vger.kernel.org
X-Received: by 2002:a05:6102:801a:b0:605:8280:5e6b with SMTP id
 ada2fe7eead31-605a5006639mr842406137.16.1775206980479; Fri, 03 Apr 2026
 02:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:02:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
X-Gm-Features: AQROBzDCJPmdFGO3WLCOdZ77NkJ3IqtNsdBGX_ONT98Xal23qSXaiQziWiGG0kg
Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in
 Salvator-X panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Salvator-X panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
