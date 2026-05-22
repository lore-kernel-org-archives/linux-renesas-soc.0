Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F713C4167
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443007; cv=none; b=aSgH7+8srj+UrDTRWgOCuzyn9pC6e4e0oDytlV0ZbyhP/zc0CkGjRg9r98iJQeEiXJ9845x+Hd8CH75P2SZiIsiwstvbvPBi+ZSlB6yEdyLSt8a5Q1Z381t9deLpRs5ziO3t7mvGcFDmM3Ezzx3Qq733PmV2RONbJvfbQG+jDsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443007; c=relaxed/simple;
	bh=WWEtEaWnPSoUz38J5bhitj1ZvX46/1ATRRXqbHDoPI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+YQU8MAP3gLY2tpiWY+srIvMygwLtco744ZDXZSaY4piYIXxIdwjmqkWjh0mR0AED3whOrdUZ7lwIch2krnqAmRKbJsuvp3NONEvKuSFtJP7pthakhfOsW93/v2iK5iGE57NbhPdG1ld0coPuoJt+fRFun8UL1Db4TfKIJ281c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so4785671241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443003; x=1780047803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3i0x6Dw91KEnwFgFVvCD8gYOb3EtZMh6gn0DwSlmRI=;
        b=NJMVt8Qvr4Q+Rvju+bFzEbRv6csxrL8VGrN1mz8T8LmTgfkZx6iTcp8SkBAxNaQI1P
         e1030XWeyYDSXmChgIFCyS8LJCW1BFik5rJNJzjP+PP82hp3ksAyBuIDwmWXxNcoUzHO
         7Lo6YysCjlKvW6asHx1jh05SLI9AFpb5sq3pVPZ1dWm5KOwuNwjZGouHMJC/d3tHtveV
         mCkqVBJRN0z4aPFzZGIXVFhppJNMw5iwbJQiE9agdtr2JmVM0Q3QU0bWPF4/0wasG1l+
         dlC44MAdTtpso3wgBE+WXxPq9L4ywd/kwZB230Exob7MMjDNVHJJbUB7+A1+tIlAAl/g
         REOg==
X-Forwarded-Encrypted: i=1; AFNElJ8f2oXWinqeojoTnCtVJh3Rq0NyKjZDYSZj4PKcVp6gPeT/kcBdqvFgac4r21hQZSrKvoJRqOEMd3+MqAscFNDOpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4jhkaqg12S+/WYW0BbxLTfZ2amF00qxqKi2mtCRcOD7QHRNm
	Vr3HVzb1FzCNqWesDJJVR/Wg01vQU0uMQ03edjZi7VWN+IkxQpadpmfkF5KLZeVk
X-Gm-Gg: Acq92OHFALsAimPqkR376Fsch6QHu7Z4lFZvRRRWXbheQ4wTS8aoATtrkXTfcaQG76h
	dMI73dkc21x90jUE5GV6z2y+Gpcj70382Vsa6gQOezMdR/qIkc+rXmmWble0x5gIB6UHq1Xkmvl
	7uzRgw8aCVyaNDw8BCb2std/HCyGPOns4jd1H9K5haPVJ8TMjVaI3asMgXPITD8P4RAQGQZh/iR
	jPICgp1+nq2DNpW/0q3dynKOiPizMVoj5xvvYpXyF3zixbm992ov639vTy2WsGv2CvMupUbq3F+
	j7g9n+6OdTCgjF62xljg18qLDaE7sEF5RtUUTgRFB4uRUDlKLZYPQTk71uVwZ5ZcF1XXu/L7hlA
	phKOuLTNpy335DwxVD8ZH10RS3rgrZHcVyrQEtTN3/1EvLUSv5OHLZqlBAb4Y9KMO7zEUk2uyvt
	TdxVMFIU1tJq+01Qmy1RPJa13B92f50MdcU2Jj8vpzTae0cLN2DRPA0JQtsVqF
X-Received: by 2002:a05:6102:580d:b0:604:f029:224c with SMTP id ada2fe7eead31-67c7300bc07mr1211293137.8.1779443002872;
        Fri, 22 May 2026 02:43:22 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e4b6easm700411137.9.2026.05.22.02.43.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:43:22 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95f61c1ace0so4395283241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NBQUa18MwWqZSZK/jZaHAQ0IH9QAiE1l2LLFsMashUmKrMDw8FIdBGKpv8BaC+FiZdHeSQjtnIIJrg152KHknMg==@vger.kernel.org
X-Received: by 2002:a05:6102:94d:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-67c6f73ecb0mr1205825137.3.1779443001825; Fri, 22 May 2026
 02:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260513115312.1574367-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:43:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9GKwH_n6eDm=K3o8Vv5qHbTsuufja1=QXGR0YTdK4cw@mail.gmail.com>
X-Gm-Features: AVHnY4JgAQJL9FtsqDDEsaZL1JjEWgiq5ZNLCDF1Wk-GYPHDFDyPNeoCEdmNPzI
Message-ID: <CAMuHMdV9GKwH_n6eDm=K3o8Vv5qHbTsuufja1=QXGR0YTdK4cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzt2h: Remove unused variable 'j'
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Variable 'j' in rzt2h_pinctrl_register() is incremented during pin
> descriptor initialization but never used afterwards.
>
> Remove the unused variable and the associated dead code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
