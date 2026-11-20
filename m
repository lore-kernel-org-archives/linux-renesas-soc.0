Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172582;
	b=ytt4CK+hIfQQnCnSNijPQ0bKnCbRBE/YvY7F9reDrkQYuFTdD/Rij9Yl3OWE/JVB2FkX
	 f6MZQyjpP3EM167L/Xi0/Rh7GfxkexT2zIwcROdz9FvjXvZJ/MGwn6wJrRKQxB2NxFMmn
	 T+wNXbtdDM2TzRs4Fn+ZcFeFo4yI4IE2G1rkvvxla6KOS/1d1GFDX5Oz1tMXwJqmAAXkJ
	 W82yZdAMK/VJdGOBCQreI/N0pWccKKtE3Dm3Q2q35oexP76f1YatGjk+bnrSqxVrGVpcg
	 qcjPL2g68Z4I6KkYML0paU+ZMFeIibbizFieCu5viBuwGSTeyv4dgDPZoh4Y5nf8B6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172582;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
	b=ymtcXT9df+Ztn2jxkXyDReTJfFW78a7MDX227Nn1bhR1Ng0j9IMoCedjX4+FwTM+K8e2
	 wjWPhkBj2U/2G3IoG/lcir7ZT4PTQK04St5cnky1ffm3Qo2wOA/uFV2b2HJ/LA3mmlMwO
	 pcu9xkh7X5d9W32nsiuZ1eA37KtjTDAdv7c2sQaJCZRuFDiC+AdqzCu9G6ZiaXHIZLR8K
	 vRvRJS6xbpPeMmnSa/pE8RLJyXoybfZcK3vrDk/9GMm3/LNLMwszloAlEj54kFIlDlUbU
	 VvYBOVKjYSSuJHXDTdPlQyCPDX5GV/4BENhVSPbUfJQxOhjOgaU1AeyLgtna/fUG0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8DE606A33A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8DE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso234998241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172581; x=1795777381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
        b=N98xBEAszXoCHsLJHLAamX3+49tM3FRpjoG5wwvqlBMC3Vtgg1k3Qm3ed/S8fEgher
         JHFxuFqbTEBnthCC8aRlCmzkEeshufO3NjTWvgeywq1QLydwcteh9sWck+0uDnA+QqCA
         ZDwmfD8tzGUccB8FTglBMVOHHdYE0nOSbKUJcA93ChTbPh2NEq/UqdI/VsTeH3/pAnji
         Bd1cYdljRdw/F3bs+fvLOlpU1PI1Mo10z56dOxvG5YH6B27ptCi3VyGvJS+UijeihNE8
         3B1McSw/FFWNhpkWQPxS2yNv6Vz7q1+ctXfYUzlIBlH6mdDrSpGv0zq2ZIOSsW+D+Kvx
         cDgg==
X-Forwarded-Encrypted: i=1; AL+hErG2GV/n77Vi5fReytWYwTRhnVhUajUQrmx6LLnZe/ACSLop19uyjgL2i2K+5HQBYmfMjJuu9h7PcBSE7S14aFZlWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9hp9yOPX+wrhTxiPX8LaolsD4xKQIPF3pfZkcjfnXSLRg8B9kC
	jDx/9bqowVrFHg9XLqGxQBA6klT8UrdZGzHsCwp+NutlNgkMqu5mXs3gQSzOGAst
X-Gm-Gg: AZFdTZfHdmcWSDs7yqzhyXE0iYlYoNym84K/5hnxkozTp2uqiyN6H+lET06H1k1+0Le
	eV/xRetuPib//6/ugPW78Y3gRfaOWbg/rr4YtWAWUl2+iE9anuaXNCmC3FUEpyItgbUgL+xDtol
	wyWu6DYONGwqeYKv1qgF+0N6c+eKcdlbWN2e0NDsyoSlAJtdKCiBqetkBWWnhb2lY7khbhu0eQt
	pm3NNTq/SgJW9AYGDI3TG9Yb7AImoTNugJJFyjKNmue334nTIG9WsInTsMz6Dc7qUFXh2dGkfIk
	bz1FgkU4/bsLSZEwMYoTfIk0YFcpV+EtQ6flaTLLnHTBzlhelsEUepaTyreTevfPjJv8+ElsDTB
	Q1FsxPUNyz2fm3bmAfGPPhW3MBqYThHSnjhceQITHlVi7PhVvHGp9aqDsHek2vWiungtoa835MZ
	u47OFbCJZuIBXxq0isyF4HPsRTHaDTQZYnxY1DDBNg+FFxHMJ0V3G3l9NFc4iN9ffUj2gt4qjXU
	9S/ge1ZD8LMHLcHPEkUbYRsTRzpcLgwq+foTP++cJDDOZ+GgHXdyXAZKxAdl32boxJMXGR6u32o
	4TUZpHyD+BcM6GoxIvam4dKddX7WihEKDCkkrk9Wnqa7Iwt0kTwrHRPV46y58BzN99XzopHKjOq
	QYNTPGKiQ9zxM
X-Received: by 2002:a05:6122:181c:b0:5ea:d32a:16de with SMTP id 71dfb90a1353d-5ee8af2495bmr1352470e0c.15.1795172580778;
        Fri, 20 Nov 2026 03:03:00 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b609bc7sm2253890e0c.12.2026.11.20.03.02.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:03:00 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso234986241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:02:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE1hh1iYQQYmBIhh6xItUxOVvmILHizXpThvjhb46SPxkUqEXDp3a+qqNZ/4aGDpaHQEV2sBujOtkyKnJUhzEZl7Q==@vger.kernel.org
X-Received: by 2002:a05:6122:1307:b0:5ea:94cd:c5d7 with SMTP id
 71dfb90a1353d-5ee8af38b50mr1262670e0c.16.1795172579449; Fri, 20 Nov 2026
 03:02:59 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:02:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
X-Gm-Features: Aa3M54rengaq81sGnkGug22WDB8YugYyeSQm_WaDyvyTw8kAqbaCOVfSJpyWwN0
Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a08g045: Add CAN-FD node
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:16, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
