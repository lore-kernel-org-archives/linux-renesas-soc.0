Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC30A3E0C4C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372745; cv=none; b=PXpdVQNDd9GKdoaYk5cGxrmS1NvTU9LO4SzsWVd4UrmC70WA1Sn+qvhc+Xhn749cI5s3VLNSFzm02uBbFXVnkvHPqkbqfutF29deJY4cxo6HPVGuR8YfubDVF8/kzqV+PMeXbo9XvnRFVyJQKMqFj2cybNl6BEevcBW75t9/QNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372745; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCLZN4d6q1o4O/1/SFsDTWvvoNd1KkfGw20EDW48NueywKOSaw8lAix5eVkPK7ZnS9FW+3LXM2bGN1sxrburII2Kkik1xG1VdGFk3gMraTqjSZ/EDf5r6nTRcENSnbtaAkn1NGWsPBTEtxyG18TAVMyGubNgejFFub6HZXvWxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-73720e58dafso924708137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372742; x=1786977542;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=LZrNIhnwCLs7TndoRrILQ3WiI51npNKNYIeA88im0BZMPlsZVaE64WOip4mJY1lAAl
         dAl5LzubA9BDUWoTIFOOMy45C8S7xlMcp6IUjHyZ4orpz9qjYqgy1MyfoVf4aWRHl8EC
         WxDMFH1RxcLWW8dh4R/2iOhCm/bsns6gudTt1kiti7sMraERXmLV9wFqRvPtYNUFwYNq
         VrT76jAk7YnfKZCgxOaLbbR17mac8ERLvMUgV+ARSxad4pbDcSk+ywOiJys7YtcNXrdt
         fnZZ1EgsNRJi354VBGQV1Vj91nJAlghQJndhdJz92cq2B4bs/yCCw9qAHtMvMBLyDzDO
         xCgA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz2dqXDsV4zYiZ5twfxEzHkS6xFKz8LiXcJEFGeZL0G5Mm3LgSO0LRAYrLZuuo1m3dspsxLbsIhHXzeiyfDbCYRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwilqBo7EN4chsEIInqd/pSZxBCId9KAW3SuN051VDI6iGRfi4C
	c/UgOvlhFsfJrMe1GX+yhctZ+CnJ/XINqW803jwGA+dabnh6uU384q9CaS8/2ie1
X-Gm-Gg: AR+sD13wH6K2fqBBJNQoE9NC3qz7YyqLAgDsHUfJeODLUIugwZPIPBDJp5wAeniaJ/i
	Bt8TvbU93xP3I860W7bgoKQSHD4yFELvOqAx2ATsHBlAi21eNHmNSPhi7VagaPoFy59lBpZgTXl
	F/jLiYfehMahD7gtSRbzTK6ohwP/JaD61OLuPJPvOk26ixQKpxL+1sTa9Re2X9anFJxmKshG0VH
	IzcHG5xJyjtJX6a0mgTpfAkvCGa22UkV6n9SiAy2TlVV1RAeeAQ60kZYv4jPHR486UIaGH3VThn
	D1jNH5xZWr4Sl7K4zsaCH9Bbsuz3gLEJqMIAImo/koctzn2aT+TYLiQNk6tn21afov1KymrEpp/
	a1/B/TugkcTHHOZCc4CoNJNOAM66cxNvAvINErh35foy3vOl5Cq5YU+KJZs6tNTR6mLXCLUULgQ
	lrPUTlp/mbG/jsDH7Vx+V6k/STXHxkNC7FAnXh/HHgOrQHyveQNvHneg6w/GXsHPL1AHblSCIxb
	QKClMPD4iAejxCsMWy9wh+GEw==
X-Received: by 2002:a05:6102:f81:b0:752:757a:96f0 with SMTP id ada2fe7eead31-7634ac4a5c0mr9518383137.3.1786372742525;
        Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm4711216137.1.2026.08.10.07.39.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74dceb46291so720260137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrh/HOu3VtxbOzCajYEA/guC71NTrNYWngP9GB68wTbiPGV9hmMD1YnjE4dNYCPsj/iOF0Tjqzl1k9cyVlX8qO8Rw==@vger.kernel.org
X-Received: by 2002:a05:6102:2c88:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-7634b995627mr8426129137.7.1786372741848; Mon, 10 Aug 2026
 07:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
X-Gm-Features: AUfX_myvevmtR5joPePEVta7aMlmbyqquBFhSTNi5eja1FOfxEmgcMn8mxhnvEs
Message-ID: <CAMuHMdWAPHrycOqtYsAf6ui4mdGAv_tp=EhgeyiHzvJpuuxJPw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm: dts: renesas: sk-rzg1m: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
