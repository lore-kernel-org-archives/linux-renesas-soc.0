Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E4E4A6CDE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440487; cv=none; b=A2+GF9/w/5JuOrpbJbHjLN9RLNk908yFN8r3gbV+bGqzbffNIzeGxazDRldsIY9i7mG3Klzl+kT6dvWrkJy6v4H0Y55QGu6f2iQKkDOUJCWCcpqiosyv/r+BhmrbjVcARqXGo+MshJoFo3KcH2jdepiHzHLZ5q0npvU4Q48q2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440487; c=relaxed/simple;
	bh=QdSZDC6nbucSRvb+H51c3hpweaq1ScB4H0zhCJ0m32U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3aqFgNr1As1L/C5xtkH+0GipQpu1aTzE9E0ofR/JXUE5BXoSsUvq1ddgD2tbg6/svvaTbIe2cOKhn3PEwZCDYD2h3C45Tqkb2VmbcpXdvuVzGEJqvd8H+Iws+NZY3U+x1DIefw7ZPqERakiMVQ9ih8M+wToweo1K36/Y3dqox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c252c7270faso332739966b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440481; x=1789045281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DtmhsVTou9YrVYaMYKkGwW6MPqYIC4z5a7l3vHTtMQg=;
        b=jxa1S/YG3ASAvtbKl/itog2w9R3ICkNmdLn0YLUgvaz+1AeUnuqNucUnG6Rn8xhnfB
         4fQOkiyjzdmWoYGowauQOGe5c+gZq6AZm7aboAtHTpXd5Npc4A4c6bAl6IT9b9vqsFq7
         CQ4KNSF81+QveOyJc3hLzwmwIw2Giy0NnH78bavYLFdScLzdC9iEaC7XeT4l5SZf/LYM
         olJ0/K7MjZZ9moWXW+QUHCqdhMNr3HHpjKqY+lLabff353eHPWlfjx2/zayX1R26lsqR
         t+vZQX6eI9EfV1p06ccha9PZplNWi8bcjWF8eALGAx9JtoMTNF1pQEoFm8geUHMLpWNG
         CFww==
X-Forwarded-Encrypted: i=1; AKwUvBykc22yRfy2vxVYsxhT5c+Cq+AP+6iHijziDOe5P7udfcU5MsWxPIhoS1bXyenO8OJDxCFg7v9BdowAxlLtlBIlhA==@vger.kernel.org
X-Gm-Message-State: AFuF++n5Hnvl9S+qrp5QTowr9iEV+nidUu1DC6T7snZ0wOT+m2uU23bS
	oKjDlrvqf08uFRxoQ1Tem1Zmv8QGn8eqpa6XEbnWdfIWPakHkxGnGPyubj6QVMRJgCs=
X-Gm-Gg: AYBFou0lAVLbd41VA/47AsrcjCjKlexuAB9D+yADhdS9nWYNb3Qi5uupZkXVLBRBlV4
	biAANbnKTK6dVlGVjdcVDkdKPO9k9oLbN+X4LGca9ZX3BdJS+FBkOvC6gPREab6CrS+b4PZ4yf1
	ZCEazjbGI33oj59Iub5SjKrcIDunKCBkZt83QbS5ZRbJ0ENyEV2cm57fq8D3UMRun/t/GBUWqKp
	4cA9w30TUj3gJqkDWI5IKX/hk/ZenjpCQbv8V9McOY8nnem1cHAe+sqLSv3X43bjolyIO5oJw5y
	I1TErFwaa/uWyca88JRD3DDwuxurFXZYH6Y3KskAFKK6en3qeehAERuSVM0RnfhLzfK1ZZ/eST9
	wmR+7fl38HbiRLXfuU5H/CmXwvSWV3hphPbgq/bZKYd2NR1HNwJ5gQMRTh/MLz3hcTXwFgDuTe+
	oCemoO9+05OE4wAR0V5xBtGr+027bLZ5p20jUwBnMZ6lTbSDIhdzUJlKhIY6FkZ7L+L4Dg9u+Hp
	R61hAIXmujVcd29WB4NVTnRMQ==
X-Received: by 2002:a17:907:1c13:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c25d54a6fbdmr847576466b.18.1788440480648;
        Thu, 03 Sep 2026 06:01:20 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm96021866b.25.2026.09.03.06.01.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:01:18 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so3684715a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSqtLWDFCGiURCtTMmVKy51j0GKodEYBUyN1jaBNfwivTZO1KAjVtPS0wMVapFmMcRZTqUlpHwzM5di8lvBoDiRw==@vger.kernel.org
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf4mr8204915a12.22.1788440476485; Thu, 03 Sep 2026
 06:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:01:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
X-Gm-Features: AcwNN1XdH538M7S69IlyE-ADj4jym5MH5kGATrABVVcF65dsXW8RQtGhu-Ybn34
Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a08g046: Add PCIe support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Populate the previously placeholder PCIe node for the RZ/G3L
> (R9A08G046) SoC with interrupts, clocks, resets, interrupt-map, and
> the PCIe root port's vendor/device ID, and enable it on the RZ/G3L
> SMARC board with the required pin control, CLKREQ# GPIO hog, and
> 100 MHz reference clock.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
