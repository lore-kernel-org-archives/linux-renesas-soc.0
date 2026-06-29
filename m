Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6894071C8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738206; cv=none; b=uaqzZmWZviWcHXD7ygzOomzuEUgvBDDxEuDzF0g7q6AFIa3CInIjNcTrsxwa5PrIckaz93Nh4fN8klV1LPFwTAJI6/1lXEGkFLL+ekOYFTQMbexrdur6SjsiHsIAwjHH/hFQIIvPVDVEwO/VdytMMr8k6PmPeIT8jpB7Fx6tYW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738206; c=relaxed/simple;
	bh=armCZ6kh6Mp+vil2b8961ACpmWrzy5c/C0CKvisFfuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRoSgkmLmr4YZEdWS1RaQTW2qa3sb1DFliTmqysWmwcOcb0u7gbWvT4l7BtDvKdhBJUlCOnlmn5r7Ngr9MwDnMH+327oXfwO8xzkLSKV11G0yx1rShg/cp068koyQHnvNIflXkQ18S4Z0b8fesSHP1eRZzIDnv5M+xQRW/KepAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59c9b666822so2659321e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738204; x=1783343004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da4qgY4Y4W5rhNhbnVcdDTNhOm56xWdt/s0F9hMNClU=;
        b=Nw4Ql3YRf+09VgXtjFx+/J5FbdVZIJIRV9AdFSEDSCcGPwEcdtDja+9X/qzM2haZcU
         toTjmt+jF2uv7xtQK3Lz6lPAAgwLJY6nJeP6RJ06VjwdMgn/rlaya9QVxX7LQGn+x/kI
         4c09PhBUzDX6sugREMd2Aix2C/wPrhHM0gv3lRamD4QH97xmXi3XoonSCx753XZGiV95
         vZmG+mF56KtUZPG1W69/jNiwObT/blekpRrAKF0I7ANEGwXqNwahUC+W+IGStHRAq/nf
         zk5Lbx7+bt/lxjtkqpkXfe7iYcy2mgoJIA31tRreH2K+dL7cyuc+5gGc5TL3pGLf+b/p
         NX3A==
X-Forwarded-Encrypted: i=1; AHgh+RrtIsloZhkbA/K4GEmzh6hsgjt4tqpk0DAAe6l7ts66fbpdbIk6qu36SulLbqe5s66Br8fFaPjg8BqQZB13CAJaPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRhXQykmFVeBUxgiFA3WkzAhIP7b3m2KsX6EkkA8Ee9xw3QHB
	uA7aalSj1TTSukVY4ux4LdBw0lyadbss7DWJu3FHILoST8xCyCbJ9Iihhoj0v1bo
X-Gm-Gg: AfdE7clGnn8O6hoXYvlmgYWfWQ8m+6EcquDbsLnpCFDbchBDmFXRSYTr7T+iPU55AfV
	knpMHW8GYvkS61doZ71b1SEZA+JwWcvgb6eO4ap/n+Zid4Eba8QNmOwItE1v6sBevJYEAkah9cN
	t+PDgd/OZr0sDon0YJ3NeCKDpc6ym40+llWHHlDFCQz/A35rSddC29AH0mFfnfMhj57LapEK+T/
	uHXwadBYyMVEyJQuDwOBuRLUcsQ9YvozkLQhTtvJa67Z8yt6NdUpc+rER82J5EHDiTu88BgM+Pj
	mPUfvGg2DU0QAkP+MS1be9kEHxdrSa5a4+9wD4aZTBrTCxcHIBecSRqzngddcujqrLCl+HNL8Sa
	QHEM3dcXZrxfjzTuGgedhRvRqWPOQZ0TENucjvW9uqUI+JtAwT8QsQKwwXEq4cUDW37GIXacyWD
	hvy8tCDjknTCPt37YpjwnEyB2ssjyXg3XuVkbx6c9tmXYwu9iqoNd15L5A7fiz
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7329515e0c.12.1782738203279;
        Mon, 29 Jun 2026 06:03:23 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd78eca00esm5726913e0c.8.2026.06.29.06.03.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:03:22 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-969524c1a63so431553241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpp29Phqb44LUmJ+pGOeD3Gflo9nbbaKKuQh2/drc77lrDuZD21pYuDgo+6obstcs3He2cxO0GCNyzigxlGUFZ5vQ==@vger.kernel.org
X-Received: by 2002:a05:6102:548b:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-73915ff17dfmr1144006137.5.1782738201875; Mon, 29 Jun 2026
 06:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
X-Gm-Features: AVVi8CcTCI6PZ2e5KazbcFsddx5bajf7aRu5XT8XCn9fL0mHlzsF1MtV9Nok0Ls
Message-ID: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Mon, 22 Jun 2026 at 19:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.
>
> These boards populate 8GB of DDR memory, which is exposed through two

GiB

> address ranges.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index 1f575ea23db4..a0e1e4b1f23d 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -30,6 +30,17 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       memory@c8000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */

MiB.

> +               reg = <0x0 0xc8000000 0x0 0x38000000>;
> +       };
> +
> +       memory@240000000 {
> +               device_type = "memory";
> +               reg = <0x2 0x40000000 0x1 0xc0000000>;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
