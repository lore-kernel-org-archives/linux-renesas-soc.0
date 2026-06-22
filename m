Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB63D3B14B5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134002; cv=none; b=q8cH/upm3Ako0lhst3B/JCXTspAMLsnx05cocnVEzcan1p/zIYwqY2kuXdOQxCXDsTQgNMb04TzA76fYqaJhTwmJwdXgffDOKCkYS7sH7I+SSHZd1EeBSqvJwh6R09uh0NbwXlRIPT4hr68LzeBMcDh7NVro0vcCqFW48A84NMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134002; c=relaxed/simple;
	bh=XcEOJh31PWonfR0DQ8W+3Ki764YdjB5fZsLG4UFUAQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHpl1IIcdWKkd7smzpa3VzYnfcDFSPg0Z3I/DVcY6XoI1mjXC/lrLwBaH2cPaSFmC6rP5HntqgiYIrE8HxDw3Z7TN0SZNcdk57OR00ZEPVCfwYQFB4M6/ePb4JERC0pvYyoz1H1sPAMAT1z7fZo4JEdLYySfj/ggZzJhNCXGJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso3395450a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133999; x=1782738799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cPiOkbmgHnl7iVDXe5O/aM/qhQ7nF1KGFxDUd/gPMA=;
        b=R0e0F9xLFOWBbOBguMc1FGUG3rXHPgkZJc2rnyg2fwpSZckgkEob5RI3xHAFAIgjto
         mO9WgDEpVQQXhMfmLN4YZt4aoKcLkvBXIOKxp/PdmPw05T4oFv4abpVSMfw9gaOENnxQ
         NEvScTLxP7umT5i5JGUuFVJK4A1hN0IlSzbqp8GW/ry9zlvZOxEK8f5A2FzESYDlf2Qb
         T7J2UnJ61tNA/YjAS4aXCLs8WHRSf9HyOcCzTDdhLJKodPCcFppuCI4YRkF9BCiENCdo
         gvcogQDlFEjA3UEHFdyuy14BY/IPHZGPjIJUtwNvyiWUlSmd6uLiQ68ABFiYYludrGxE
         jcTA==
X-Forwarded-Encrypted: i=1; AFNElJ+vBmawd1aFdLjMn8cfoYViQHvJG4k9MMsyNN1fci4nYCAVw5hN6ZL9/lsEjeHxfKVzrRV1kYkZJKPyX9V2Y0qZuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk87+v+99NXuWRE3Z4MtJcL9Ns+oUYmaLih2KDCtmMfC8hrSEZ
	OtSXohVgKYbBIz8uldnsLtk7TxmaPr1RxWl0nC0HYOhJDRxtGb7EmM3hWDs974q6xhw=
X-Gm-Gg: AfdE7cmK7OUMxmXsQ+J/JUeNKy6Ks6J02InhejCEvdMoolt5ubC+uyyzpw/2VEU2QZr
	1ikPaovkDz6l4+kFWqK/1d4lrJ853Yn5Sl4o6r3M30xD8+LPNF3zRy+uLcbMHnykPDBY/g9/1Wi
	OcWnO5kg2HWrnD17qTxm1X9oXKQUJmWrSs9HVMiD/jRo5My8gX96oc188LXvnTMRS7guwlaN7nf
	/QlbF/Pyh+txwRf3ctbFEQDAOkvaOFgzCNzD2Ky8JQOfsH4Fm4zKslGOdg/EQduAM4apN1jahHH
	RnLgCVp3uvBX948JOnXA38L58xwmZpwfs4W3IlxpCBJtrLa45zthuuag4xW00ZxhZHhDBn7Ld0A
	IvKQQZq2jrslmmc1EgMA0QC0Ea7emoy986Y0C9d26jHHTRZg6XeJIKdic39ngcjfWgvdoAyYW1V
	w52q+Ws8o/zlsAHs4D+5N+tXwoeReZbiYmJItIgjCX9tBPPaaKHw==
X-Received: by 2002:a05:6402:5253:b0:697:96c2:b591 with SMTP id 4fb4d7f45d1cf-69796c2c000mr2827242a12.11.1782133999064;
        Mon, 22 Jun 2026 06:13:19 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b856f92sm2998473a12.11.2026.06.22.06.13.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:13:17 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-695f6438518so5850372a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZW013NxJcbugIE/JfFceExFwPpOscqWC+F83wnmK2JPxDtSLzkMlOjrJMQdnHr8nFdym2OSCjcg8vXxEPtK67vA==@vger.kernel.org
X-Received: by 2002:a05:6402:3547:b0:697:ce0e:9243 with SMTP id
 4fb4d7f45d1cf-697ce0e9559mr540539a12.13.1782133996242; Mon, 22 Jun 2026
 06:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
X-Gm-Features: AVVi8CcUH8u1TOdYYuE-qFfJh-2q3W4LZYrwKknGe4DqOfHPr71m4gxhWY1vJh4
Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

> +       rate_millihz = mul_u32_u32(req->rate, MILLI);

The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
be larger than u32 on 64-bit) is valid, but I believe it can't happen
in practice.  Still, would be good to fix it in a subsequent patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
