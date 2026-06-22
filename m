Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8643AF667
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133241; cv=none; b=ZRZnz0wajBoS2G+7HisKsDjlwJ0AVAVrBUYnhdM6zdMw7+Bc+ghRKYC6eNO3pU1T/YqlhSkJy2PbF1xU111gtmNcBGm/OcCtwIb3eLKNj848Rp9wQn0kPaNm30U3NgcEd+E7wKVCifiKqP6xd92aPXiG3Lckvo63cWPRojruKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133241; c=relaxed/simple;
	bh=Ja7rWk0kCQqkDheHxLEOplvsTyShM6xX5CdHdSjeR8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iclBm+21FrAuKsNSi9AX16+2tJS2kdMlPQhW6NrPaetW42A8Two2YYKTb8rAJur9z/AMXoneXLNfKUMD+NAYeef/Z5eBFjoL/mwKZ7E80lrCVV9ZtDlX5TCMb1o6BHJPI0wUeIS+08XRZyqJ0NWUWCjny9/4dElJmCOtQT2dJ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6c3099b11a9so1535357137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133236; x=1782738036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XHozepz9cMj0FQe/9LKFDJUBs+Bmee9aT9l7VnUUd0=;
        b=r1DrG/p0z1HJ2iVFcIlJlgVlc7gSu+8hW+Rtc0feAWI2cqrYck8lq2u5qNmLEZfIhH
         8iTNHYsSczsm892Ntho0iAnrlBzqP/fY1B2S1gGbhfvWt2eda7xvxkuc5Z0hG9EcqVr8
         zOcg1pUwxCPbb0FkpccKL7p+AGJSt6R66KvuIR3+hXgNlB7oniIQ5NtOf1cRnI/hZdXg
         JRyv6i+OHbchxUU1U/du37DcnY6cmc3P+xAKjXxuTAdIRjS8YygTZ46wbQnNGffRG4Gr
         ks+tOZDxPpDMoEpFWkHFgFBtQdiWol2SeQ9XXLmubZJzHDOma/vo3A+iz5kgpvCj0Fd2
         kS9A==
X-Forwarded-Encrypted: i=1; AFNElJ/AJpmUtTB2zy3wQ/upnPO1eEbRKvJJqqNOa3ttSHVPcotEzOB8FoyFP4ZDopoxy/RKYu7wtOEa44e3by3Gbx+csw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3uw25J844+0nqgVJhJ9yxAg1A5nXh0jnV99KXyMiBGfvqHc5
	cxLF+4LNY0fD7+UIILInMJRNwtVvxYOC+nU+BL3SiBClRV4ctiDV3xbosLM4oMB5
X-Gm-Gg: AfdE7cnoYKxGAP0BAMDTASWoEwYwH5Su4kfyLa9vFJ2+G/rvURi1gmO4zflwSr4g6Qy
	2T7byMyYslX9I3c58KMxJBL6iTQJFnEuDKFESCSM+bpjkkSOmmYt0YznNy1GjmJZr+zvq7yRlPs
	3CGlyssGHCmgzYRuvY+YqBq0nTuxu+B3m7fHqX6X/vq049OJ6sl/hivMXj3DGytx1q1urzaxztR
	Re8mRChX6kVbeQdOMQ/8ccuDVYF6utTQTGJbYQsQKLmw4YoomoaTuuHRW0G/eCk0gBODQtBpktC
	A7FOFdA+LSVDljfBZ8+3cOfzh64haucLG+xyEdKBHLJ5qV07Zm3a006H/uhNhdJO8avjdXpz38D
	naumGJywPlq19qyj7X9WBv0BDidDYOjw4PHrHBzPRsJG1GCRJz0rwblQ2TiB3e5ByrwUkV7e+66
	wOYVHxmux2d1gblX3dELGs3ZtvYlQ57nnW2liNCWPjlvkXwck4ZQ==
X-Received: by 2002:a05:6102:6890:b0:729:8b73:42c6 with SMTP id ada2fe7eead31-72a1d82700bmr6062290137.11.1782133235397;
        Mon, 22 Jun 2026 06:00:35 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba4f2905csm6045574137.8.2026.06.22.06.00.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:00:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so937067241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HZLi2bPuq6FRLO29d7/rr8HrXht5h/e6CGMmPeQ/r+h4pMH5VVfEB1AdDsola3Ypk8LkohosHeL7WVsM88m/W+A==@vger.kernel.org
X-Received: by 2002:a05:6102:2906:b0:612:21f8:5afd with SMTP id
 ada2fe7eead31-72a1d8332cemr6436185137.12.1782133232462; Mon, 22 Jun 2026
 06:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:00:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
X-Gm-Features: AVVi8CcEKrlE5nTeAmO0YRJa0CgUPIQw3Lilj3_INcW21kOCcmviS8lE9_08Wos
Message-ID: <CAMuHMdWcxQDzLDcmHwG_1VEnqCWs6xpusgebVoE96xNH4Jrtig@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
